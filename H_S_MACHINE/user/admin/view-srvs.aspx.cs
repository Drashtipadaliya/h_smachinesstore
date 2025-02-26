using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class user_admin_view_srvs : System.Web.UI.Page
{
    SqlConnection cn;
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {

        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);

        //if (!IsPostBack)
        //{
        //    cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);
        //}
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox t1 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");
        FileUpload f = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1");
        TextBox t3 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox3");
        Label l = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");

        //   cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);
      
        if (f.HasFile)
        {
            // Save the uploaded file to the server



            qry = "update service set name='" + t1.Text + "',image='" + f.FileName + "',details='" + t3.Text + "'where id=" + l.Text;
            f.SaveAs(Server.MapPath("~//img//" + "//" + f.FileName));
            //  qry = "UPDATE product SET pname=@pname, image=@image, catgry=@catgry, qnty=@qnty, dcn=@dcn WHERE id=@id";
            //string filePath = Server.MapPath("~/img/" + f.FileName);
            //f.SaveAs(filePath);
          
        }
        else
        {
            qry = "update service set name='" + t1.Text + "',details='" + t3.Text + "'where id=" + l.Text;
           // Response.Write("else part");
            //qry = "UPDATE product SET pname=@pname, catgry=@catgry, qnty=@qnty, dcn=@dcn WHERE id=@id";
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
        Response.Redirect("~//user//admin//view-srvs.aspx");
        GridView1.EditIndex = -1; // Reset edit index
        GridView1.DataBind();

        //using (SqlCommand cmd = new SqlCommand(qry, cn))
        //{
        //    cmd.Parameters.AddWithValue("@pname", t1.Text);
        //    cmd.Parameters.AddWithValue("@catgry", dl.SelectedItem.Text);
        //    cmd.Parameters.AddWithValue("@qnty", ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox4")).Text);
        //    cmd.Parameters.AddWithValue("@dcn", ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox5")).Text);
        //    cmd.Parameters.AddWithValue("@id", l.Text);

        //    if (f.HasFile)
        //    {
        //        cmd.Parameters.AddWithValue("@image", f.FileName); // Store only the filename
        //    }

        //    cn.Open();
        //    int result = cmd.ExecuteNonQuery();
        //    cn.Close();

        //    if (result > 0)
        //    {
        //        Response.Write("<script>alert('Update successful')</script>");
        //    }
        //    else
        //    {
        //        Response.Write("<script>alert('Update failed')</script>");
        //    }
        //}

        //GridView1.EditIndex = -1; // Reset edit index
        //GridView1.DataBind(); // Rebind data
    }

    //protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
    //    cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);
    //    string qry = "DELETE FROM service WHERE id=@id";

    //    using (SqlCommand cmd = new SqlCommand(qry, cn))
    //    {
    //        cmd.Parameters.AddWithValue("@id", id);
    //        cn.Open();
    //        int result = cmd.ExecuteNonQuery();
    //        cn.Close();

    //        if (result > 0)
    //        {
    //            Response.Write("<script>alert('Delete successful')</script>");
    //        }
    //        else
    //        {
    //            Response.Write("<script>alert('Delete failed')</script>");
    //        }
    //    }

    //    GridView1.DataBind(); // Rebind data
    //}

    //protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    //{
    //    TextBox t1 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");
    //    FileUpload f = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1");
    //    TextBox t3 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox3");
    //    Label l = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");

    //    //   cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);
    //    Response.Write("<script>alert('success')</script>");
    //    // Prepare the SQL query
    //    if (f.HasFile)
    //    {
    //        // Save the uploaded file to the server



    //        qry = "update service set name='" + t1.Text + "',image='" + f.FileName + "',details='" + t3.Text + "'where id=" + l.Text;
    //        f.SaveAs(Server.MapPath("~//img//" + "//" + f.FileName));
    //        //  qry = "UPDATE product SET pname=@pname, image=@image, catgry=@catgry, qnty=@qnty, dcn=@dcn WHERE id=@id";
    //        //string filePath = Server.MapPath("~/img/" + f.FileName);
    //        //f.SaveAs(filePath);
    //        test.Text = qry;
    //        Response.Write(qry);
    //    }
    //    else
    //    {
    //        // qry = "update service set name='" + t1.Text + "',details='" + t3.Text + "'where id=" + l.Text;
    //        Response.Write("else part");
    //        //qry = "UPDATE product SET pname=@pname, catgry=@catgry, qnty=@qnty, dcn=@dcn WHERE id=@id";
    //    }


}
    