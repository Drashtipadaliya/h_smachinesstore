using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class user_admin_MasterPage : System.Web.UI.MasterPage
{
    private SqlConnection cn;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);
        if (login == null || logout == null || lblUsername == null)
        {
            throw new Exception("Login, Logout, or Username control is not initialized.");
        }

        if (Session["username"] != null)
        {
            logout.Visible = true;
            login.Visible = false;
            lblUsername.Text = "Welcome" +"ted".ToString(); // Display the username

            if (Session["uid"] != null)
            {
                string qry = "SELECT COUNT(*) FROM cart WHERE uid=@uid";
                using (SqlCommand cmd = new SqlCommand(qry, cn))
                {
                    cmd.Parameters.AddWithValue("@uid", Session["uid"]);
                    cn.Open();
                    int itemCount = (int)cmd.ExecuteScalar();
                    // Use itemCount as needed
                }
            }
        }
        else
        {
            logout.Visible = false;
            login.Visible = true;
            lblUsername.Text = ""; // Clear the label if not logged in
        }
    }
}

