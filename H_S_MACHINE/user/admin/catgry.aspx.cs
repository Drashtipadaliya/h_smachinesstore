using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
public partial class user_admin_catgry : System.Web.UI.Page
{
    SqlConnection cn;
    
    private int? categoryId;

    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                categoryId = Convert.ToInt32(Request.QueryString["id"]);
                LoadCategory(categoryId.Value);
                btnSubmit.Visible = false;
                btnUpdate.Visible = true;
            }
        }
    }

    private void LoadCategory(int id)
    {
        using (cn)
        {
            string qry = "SELECT * FROM category WHERE id=@id";
            SqlCommand cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@id", id);
            cn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                category.Text = reader["category"].ToString();
                if (!string.IsNullOrEmpty(reader["image"].ToString()))
                {
                    imgCategory.ImageUrl = "~/img/" + reader["image"].ToString();
                    imgCategory.Visible = true;
                }
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string cat = category.Text;
        string image = Path.GetFileName(imageUpload.PostedFile.FileName);

        if (imageUpload.HasFile)
        {
            imageUpload.SaveAs(Server.MapPath("~/img/" + image));
        }

        using (cn)
        {
            string qry = "INSERT INTO category (category, image) VALUES (@category, @image)";
            SqlCommand cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@category", cat);
            cmd.Parameters.AddWithValue("@image", image);

            cn.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Category inserted');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error inserting category.');", true);
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (!categoryId.HasValue)
        {
            return; // No category ID to update
        }

        string cat = category.Text;
        string image = Path.GetFileName(imageUpload.PostedFile.FileName);
        string qry;

        using (cn)
        {
            if (imageUpload.HasFile)
            {
                imageUpload.SaveAs(Server.MapPath("~/img/" + image));
                qry = "UPDATE category SET category=@category, image=@image WHERE id=@id";
            }
            else
            {
                qry = "UPDATE category SET category=@category WHERE id=@id";
            }

            SqlCommand cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@category", cat);
            cmd.Parameters.AddWithValue("@id", categoryId.Value);
            if (imageUpload.HasFile)
            {
                cmd.Parameters.AddWithValue("@image", image);
            }

            cn.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Category updated'); location.href='view-cty.aspx';", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error updating category.');", true);
            }
        }
    }
}