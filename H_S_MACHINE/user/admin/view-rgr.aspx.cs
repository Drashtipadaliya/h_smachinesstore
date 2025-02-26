using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;

public partial class user_admin_view_rgr : System.Web.UI.Page
{
    SqlConnection cn;
    string qry;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);
    
        if (!IsPostBack)
        {
           LoadUserData();
        }
    }

    private void LoadUserData()
    {

        using (cn)
        {
            string sql = "SELECT * FROM register";
            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
           
        }
    }
}