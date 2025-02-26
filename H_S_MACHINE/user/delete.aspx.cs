using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class user_delete : System.Web.UI.Page
{
    SqlConnection cn;
    string qry;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);

        if (Session["username"] != null)
        {
            string email = Session["username"].ToString();

            qry = "delete from register where email='" + email + "'";

            SqlCommand cmd = new SqlCommand(qry, cn);
            cn.Open();
            int res = cmd.ExecuteNonQuery();
            if (res > 0)
            {
                Response.Write("<script>alert('sucess');</script>");
                Response.Redirect("~/user/index.aspx");
            }
            cn.Close();

        }
        else
        {
            Response.Redirect("~/user/login.aspx");
        }



    }
}