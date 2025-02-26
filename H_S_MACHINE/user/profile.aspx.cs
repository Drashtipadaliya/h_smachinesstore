using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

public partial class user_profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("~/user/login.aspx");
        }

        if (!IsPostBack)
        {
            LoadUser_Data(); // Call the corrected method name
        }
    }

    private void LoadUser_Data() // Corrected method name
    {
        string email = Session["username"].ToString(); // Ensure this matches the session key used for username

        using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString))
        {
            string qry = "SELECT * FROM register WHERE email=@Email";
            SqlCommand cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@Email", email);
            cn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                txtFirstName.Text = reader["fname"].ToString();
                txtLastName.Text = reader["lname"].ToString();
                txtMobile.Text = reader["mobile"].ToString();
                txtAddress.Text = reader["address"].ToString();
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string email = Session["username"].ToString(); // Ensure this matches the session key used for username
        string fname = txtFirstName.Text;
        string lname = txtLastName.Text;
        string mobile = txtMobile.Text;
        string address = txtAddress.Text;

        using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString))
        {
            string updateQry = "UPDATE register SET fname=@FirstName, lname=@LastName, mobile=@Mobile, address=@Address WHERE email=@Email";
            SqlCommand cmd = new SqlCommand(updateQry, cn);
            cmd.Parameters.AddWithValue("@FirstName", fname);
            cmd.Parameters.AddWithValue("@LastName", lname);
            cmd.Parameters.AddWithValue("@Mobile", mobile);
            cmd.Parameters.AddWithValue("@Address", address);
            cmd.Parameters.AddWithValue("@Email", email);

            cn.Open();
            int result = cmd.ExecuteNonQuery();

            if (result > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Profile updated successfully'); window.location.href='index.aspx';", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Failed to update profile');", true);
            }
        }
    }
}