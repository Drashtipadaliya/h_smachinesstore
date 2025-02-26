using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_admin_view_pdt : System.Web.UI.Page
{
    SqlConnection cn;
    string qry;
    private string connectionString = ConfigurationManager.ConnectionStrings["hns"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDropdown();
            BindGrid();
        }
    }

    // Method to bind categories to the dropdown
    void BindDropdown()
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            SqlDataAdapter adpt = new SqlDataAdapter("SELECT DISTINCT category FROM category", con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);

            ddlCategories.DataSource = dt;
            ddlCategories.DataTextField = "category";
            ddlCategories.DataValueField = "category";
            ddlCategories.DataBind();
        }
    }

    // Method to bind data to the GridView
    void BindGrid()
    {
        // No need to set DataSource here since we are using SqlDataSource1 in the ASPX
        // Just call DataBind() to refresh the GridView
        GridView1.DataBind();
    }

    // Event handler for category selection change
    protected void ddlCategories_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataSource1.SelectParameters["catgry"].DefaultValue = ddlCategories.SelectedValue;
        GridView1.DataBind();

    }

    // Event handler for updating a row in the GridView
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox t1 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");
        TextBox t2 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2");
        FileUpload f = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1");
        DropDownList dl = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList1");
        TextBox t3 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox3");
        TextBox t4 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox4");
        Label l = (Label)GridView1.Rows[e.RowIndex].FindControl("Label1");

        // Initialize the SqlConnection
        cn = new SqlConnection(connectionString);

        // Prepare the SQL query
        if (f.HasFile)
        {
            qry = "update product set pname='" + t1.Text + "',price=" + t2.Text + ",image='" + f.FileName + "',catgry='" + dl.SelectedItem.Text + "',qnty=" + t3.Text + ",dcn='" + t4.Text + "' where id=" + l.Text;
            f.SaveAs(Server.MapPath("~//img//" + "//" + f.FileName));
        }
        else
        {                   
            qry = "update product set pname='" + t1.Text + "',price=" + t2.Text + ",catgry='" + dl.SelectedItem.Text + "',qnty=" + t3.Text + ",dcn='" + t4.Text + "' where id=" + l.Text;
        }

        SqlCommand cmd = new SqlCommand(qry, cn);
        cn.Open();
        int result = cmd.ExecuteNonQuery();
        if (result > 0)
        {
            Response.Write("<script>alert('success')</script>");
        }
        else
        {
            Response.Write("<script>alert('failed')</script>");
        }
        cn.Close();
        Response.Redirect("~//user//admin//view-pdt.aspx");

        GridView1.DataBind();
        GridView1.EditIndex = -1; // Rebind data
    }
    // Event handler for deleting a row in the GridView
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        using (SqlConnection cn = new SqlConnection(connectionString))
        {
            string qry = "DELETE FROM product WHERE id=@id";
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
        }

        BindGrid(); // Rebind data
    }
}