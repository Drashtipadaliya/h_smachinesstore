using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class user_form : System.Web.UI.Page
{
    SqlConnection cn;
    string qry;
    string role = "user";
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Session["id"] = id;
        Session["fname"] = fnm.Text;
        Session["lname"] = lnm.Text;
        Session["email"] = email.Text;
        Session["mobile"] = mno.Text;
        Session["address"] = adrs.Text;
        Session["role"] = role;


        qry = "INSERT INTO register (fname, lname, email,mobile,password,address,role) " +
      "VALUES ('" + fnm.Text + "', '" + lnm.Text + "', '" + email.Text + "','" + mno.Text + "','" + pass.Text + "','" + adrs.Text + "','user')";

        //Response.Write(qry);
        SqlCommand cmd = new SqlCommand(qry, cn);
        cn.Open();
        int res = cmd.ExecuteNonQuery();
        if (res > 0)
        {
            Response.Write("<script>alert(' insert sucessfully') ;window.location='login.aspx';</script>");
        }
        else
        {
            Response.Write("<script> alert('not insert') </script>");
        }

        cn.Close();
    }
}
