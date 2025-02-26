using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;

public partial class user_login : System.Web.UI.Page
{
    SqlConnection cn;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Initialize the connection using the connection string from Web.config
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
   
        string username = email.Text;
        string password = pass.Text;

        string qry = "select * from register where email='" + username + "'and password='" + password + "'";


        SqlCommand cmd = new SqlCommand(qry, cn);
        cn.Open();
        SqlDataReader dr = cmd.ExecuteReader();


        //SqlDataAdapter dr = new SqlDataAdapter(qry, cn);
        //DataTable da = new DataTable();
        //dr.Fill(da);

       if (dr.Read()) // If user exists
            {
                string role = dr["role"].ToString(); // Get the role of the user

                if (role == "admin" && username == "tedvision17@gmail.com" && password == "@ted17")
                { 
                    // Admin login
                    Session["role"] = "admin";
                    Session["Username"] = dr["email"].ToString();
                    Response.Write("<script>alert('Admin login successful');</script>");
                    Response.Redirect("~/user/admin/index.aspx"); // Redirect to admin dashboard
                }
                else if (role == "user")
                {
                    // Regular user login
                    Session["role"] = "user";
                    Session["Username"] = dr["email"].ToString();
                Session["uid"] = dr[0];
                Session["fname"] = dr[1];
                Session["lname"] = dr[2];
                Session["mobile"] = dr[4];
                Session["pass"] = dr[5];
                Session["address"] = dr[6];
                Response.Write("<script>alert('User login successful');</script>");
                    Response.Redirect("~/user/index.aspx"); // Redirect to user dashboard
                }
                else
                {
                    // Unknown role
                    Response.Write("<script>alert('Invalid role');</script>");
                }
            }
            else
            {
                // Invalid credentials
                Response.Write("<script>alert('Invalid username or password');</script>");
            }
        }

}