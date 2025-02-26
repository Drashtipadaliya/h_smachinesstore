using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class user_index : System.Web.UI.Page
{
    SqlConnection cn;
    string qry;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);
        if (!IsPostBack)
        {
            BindServices();
        }
    }

    private void BindServices()
    {
        // Your logic to bind data to the serviceRepeater
        // Example:
        using (cn)
        {
            qry = "SELECT * FROM service"; // Adjust the query as needed
            using (SqlCommand cmd = new SqlCommand(qry, cn))
            {
                cn.Open();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    serviceRepeater.DataSource = dt;
                    serviceRepeater.DataBind();
                }
            }
        }
    }
    private void BindCategories()
    {
        
        using (cn)
        {
            string query = "SELECT * FROM category"; // Adjust the query as needed
            using (SqlCommand cmd = new SqlCommand(query, cn))
            {
                cn.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                categoryRepeater.DataSource = dt;
                categoryRepeater.DataBind();
            }
        }
    }
    protected void serviceRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        // Handle the command here
        // Example: if (e.CommandName == "YourCommandName") { ... }
    }
}