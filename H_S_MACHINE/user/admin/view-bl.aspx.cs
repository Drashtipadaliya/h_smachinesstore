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

public partial class user_admin_view_bl : System.Web.UI.Page
{
    SqlConnection cn;
    string qry;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);
        if (!IsPostBack)
        {
            LoadBillData();
        }
    }

    private void LoadBillData()
    {
        
        using (cn)
        {
            string sql = "SELECT * FROM bill";
            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}