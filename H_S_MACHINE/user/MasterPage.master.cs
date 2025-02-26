using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class user_MasterPage : System.Web.UI.MasterPage
{
    private SqlConnection cn;

    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);
        try
        {
            if (!IsPostBack)
            {
                BindCategories();
                BindCartItems(); // Bind cart items on initial load
            }

            if (login == null || logout == null || lblUsername == null)
            {
                throw new Exception("Login, Logout, or Username control is not initialized.");
            }

            if (Session["username"] != null)
            {
                logout.Visible = true;
                login.Visible = false;
                lblUsername.Text = "Welcome " + Session["fname"].ToString(); // Display the username

                if (Session["uid"] != null)
                {
                    // You can also retrieve the item count here if needed
                    string qry = "SELECT COUNT(*) FROM cart WHERE uid=@uid";
                    using (SqlCommand cmd = new SqlCommand(qry, cn))
                    {
                        cmd.Parameters.AddWithValue("@uid", Session["uid"]);
                        cn.Open();
                        int itemCount = (int)cmd.ExecuteScalar();
                        // Use itemCount as needed, e.g., display it in a label
                        lblCartItemCount.Text = itemCount.ToString(); // Assuming you have a label for item count
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
        catch (Exception ex)
        {
            // Handle the exception (e.g., log it or show a message)
            Response.Write("Error: " + ex.Message);
        }
        finally
        {
            // Ensure the connection is closed
            if (cn != null && cn.State == ConnectionState.Open)
            {
                cn.Close();
            }
        }
    }

    private void BindCategories()
    {
        try
        {
            // Open the connection
            cn.Open();

            string query = "SELECT * FROM category"; // Ensure this query is correct
            using (SqlCommand cmd = new SqlCommand(query, cn))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    CategoryRepeater.DataSource = dt;
                    CategoryRepeater.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            // Handle the exception
            Response.Write("Error: " + ex.Message);
        }
        finally
        {
            // Ensure the connection is closed
            if (cn != null && cn.State == ConnectionState.Open)
            {
                cn.Close();
            }
        }
    }

    private void BindCartItems()
    {
        if (Session["uid"] != null)
        {
            try
            {
                // Open the connection
                cn.Open();

                string query = "SELECT pname, qnty FROM cart WHERE uid = @uid"; // Adjust the query as needed
                using (SqlCommand cmd = new SqlCommand(query, cn))
                {
                    cmd.Parameters.AddWithValue("@uid", Session["uid"]);
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        CartRepeater.DataSource = dt; // Assuming you have a Repeater for cart items
                        CartRepeater.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle the exception
                Response.Write("Error: " + ex.Message);
            }
            finally
            {
                // Ensure the connection is closed
                if (cn != null && cn.State == ConnectionState.Open)
                {
                    cn.Close();
                }
            }
        }
    }
}