using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;


public partial class user_admin_view_cty : System.Web.UI.Page
{
    SqlConnection cn;
    string qry;
    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox t1 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");
        FileUpload f = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1");
        Label l = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");

        if (f.HasFile)
        {

            //qry = "update product set pname='" + t1.Text + "',price=" + t2.Text + ",image='" + f.FileName + "',catgry='" + dl.SelectedItem + "',qnty=" + t4.Text + ",dcn='" + t5.Text + "'where id=" + l.Text;
            qry = "update category set category='" + t1.Text + "',image='" + f.FileName + "'where id=" + l.Text;
            f.SaveAs(Server.MapPath("~//img//" + "//" + f.FileName));
        }
        else
        {
            qry = "update team set name='" + t1.Text + "'where id=" + l.Text;
        }
        SqlCommand cmd = new SqlCommand(qry, cn);
        cn.Open();
        int result = cmd.ExecuteNonQuery();
        if (result > 0)
        {

            Response.Write("<script>alert('success')</script>");
            // f.SaveAs(Server.MapPath("~//img//" + "//" + f.FileName));
        }
        else
        {
            Response.Write("<script>alert('failed')</script>");

        }
        cn.Close();
        Response.Redirect("~//user//admin//view-cty.aspx");


    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);
        string qry = "DELETE FROM category WHERE id=@id";

        using (SqlCommand cmd = new SqlCommand(qry, cn))
        {
            cmd.Parameters.AddWithValue("@id", id);
            cn.Open();
            int result = cmd.ExecuteNonQuery();
            cn.Close();

            if (result > 0)
            {
                Response.Write("<script>alert('Delete successful')</script>");
            }
            else
            {
                Response.Write("<script>alert('Delete failed')</script>");
            }
        }

        GridView1.DataBind(); // Rebind data
    }
}
