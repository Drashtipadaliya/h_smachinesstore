using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class user_reset : System.Web.UI.Page
{
    SqlConnection cn;
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);

        if (!IsPostBack)
        {
            if (Session["username"] != null)
            {
                string email = Session["username"].ToString();
                rpemail.Text = email;

                // Assuming you have the old password stored in the session (not recommended)
                if (Session["pass"] != null)
                {
                    string oldPassword = Session["pass"].ToString();
                    rpopwd.Text = oldPassword; // Set the old password (not secure)
                }
            }
            else
            {
                Response.Redirect("~/user/login.aspx");
            }
        }
    }

    protected void resetbtn_Click(object sender, EventArgs e)
    {
        // Check if new password and confirm password match
        if (rpnpwd.Text == rpcpwd.Text)
        {
            // Verify the old password before updating
            string oldPassword = rpopwd.Text; // Get the old password entered by the user
            qry = "SELECT COUNT(*) FROM register WHERE email = @email AND password = @oldPassword";

            using (SqlCommand cmd = new SqlCommand(qry, cn))
            {
                cmd.Parameters.AddWithValue("@oldPassword", oldPassword); // Use the entered old password
                cmd.Parameters.AddWithValue("@email", rpemail.Text);

                try
                {
                    cn.Open();
                    int count = (int)cmd.ExecuteScalar();
                    if (count > 0)
                    {
                        // Old password is correct, proceed to update the password
                        qry = "UPDATE register SET password = @password WHERE email = @email";

                        using (SqlCommand updateCmd = new SqlCommand(qry, cn))
                        {
                            updateCmd.Parameters.AddWithValue("@password", rpnpwd.Text); // You should hash this before saving
                            updateCmd.Parameters.AddWithValue("@email", rpemail.Text);

                            int res = updateCmd.ExecuteNonQuery();
                            if (res > 0)
                            {
                                Response.Write("<script>alert('Password reset successfully');</script>");
                            }
                            else
                            {
                                Response.Write("<script>alert('Password reset failed.');</script>");
                            }
                        }
                    }
                    else
                    {
                        // Old password is incorrect
                        Response.Write("<script>alert('Old password is incorrect. Please try again.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
                finally
                {
                    cn.Close();
                }
            }
        }
        else
        {
            // Passwords do not match
            Response.Write("<script>alert('New Password and Confirm Password do not match. Please try again.');</script>");
        }
    }
}