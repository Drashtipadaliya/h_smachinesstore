using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

public partial class user_feedback : System.Web.UI.Page
{
    SqlConnection cn;
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);

        if (Session["username"] != null)
        {
            // Assuming Session["fname"] contains the user's name
            string email = Session["username"].ToString();
            string name = Session["fname"] != null ? Session["fname"].ToString() : string.Empty;

            // Populate the text boxes with the user's name and email
            if (!IsPostBack) // Ensure this runs only on the first load, not on postbacks
            {
                NameTextBox.Text = name;
                EmailTextBox.Text = email;
            }
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        string name = NameTextBox.Text.Trim();
        string email = EmailTextBox.Text.Trim();
        string subject = SubjectDropDown.SelectedValue;
        string message = MessageTextBox.Text.Trim();

        using (cn)
        {
            string query = "INSERT INTO contact (name, email, subject, message) VALUES (@Name, @Email, @Subject, @Message)";
            SqlCommand cmd = new SqlCommand(query, cn);
            cmd.Parameters.AddWithValue("@Name", name); // Use the name from the text box
            cmd.Parameters.AddWithValue("@Email", email); // Use the email from the text box
            cmd.Parameters.AddWithValue("@Subject", subject);
            cmd.Parameters.AddWithValue("@Message", message);

            cn.Open();
            int result = cmd.ExecuteNonQuery();

            if (result > 0)
            {
                Response.Write("<script>alert('Thanks for contacting us!');window.location='display.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('Please try again.');</script>");
            }
        }
    }
}