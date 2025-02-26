using System;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

public partial class user_admin_service : System.Web.UI.Page
{
    private SqlConnection cn;
    private int? serviceId;

    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);

        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                serviceId = Convert.ToInt32(Request.QueryString["id"]);
                LoadService(serviceId.Value);
                btnSubmit.Visible = false;
                btnUpdate.Visible = true;
            }
        }
    }

    private void LoadService(int id)
    {
        using (cn)
        {
            string qry = "SELECT * FROM service WHERE id=@id";
            SqlCommand cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@id", id);
            cn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                sname.Text = reader["name"].ToString();
                dtil.Text = reader["details"].ToString();
                string imageUrl = reader["image"].ToString();
                if (!string.IsNullOrEmpty(imageUrl))
                {
                    imgService.ImageUrl = "~/img/" + imageUrl;
                    imgService.Visible = true;
                }
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string serviceName = sname.Text;
        string details = dtil.Text;
        string imageFileName = Path.GetFileName(imageUpload.PostedFile.FileName);

        if (imageUpload.HasFile)
        {
            imageUpload.SaveAs(Server.MapPath("~/img/" + imageFileName));
        }

        using (cn)
        {
            string qry = "INSERT INTO service (name, image, details) VALUES (@name, @image, @details)";
            SqlCommand cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@name", serviceName);
            cmd.Parameters.AddWithValue("@image", imageFileName);
            cmd.Parameters.AddWithValue("@details", details);
            cn.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Service inserted');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error inserting service.');", true);
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (serviceId.HasValue)
        {
            string serviceName = sname.Text;
            string details = dtil.Text;
            string imageFileName = Path.GetFileName(imageUpload.PostedFile.FileName);
            string qry;

            using (cn)
            {
                cn.Open();
                if (imageUpload.HasFile)
                {
                    imageUpload.SaveAs(Server.MapPath("~/img/" + imageFileName));
                    qry = "UPDATE service SET name=@name, image=@image, details=@details WHERE id=@id";
                    SqlCommand cmd = new SqlCommand(qry, cn);
                    cmd.Parameters.AddWithValue("@name", serviceName);
                    cmd.Parameters.AddWithValue("@image", imageFileName);
                    cmd.Parameters.AddWithValue("@details", details);
                    cmd.Parameters.AddWithValue("@id", serviceId.Value);
                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Service updated'); location.href='viewcategory.aspx';", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error updating service.');", true);
                    }
                }
                else
                {
                    qry = "UPDATE service SET name=@name, details=@details WHERE id=@id";
                    SqlCommand cmd = new SqlCommand(qry, cn);
                    cmd.Parameters.AddWithValue("@name", serviceName);
                    cmd.Parameters.AddWithValue("@details", details);
                    cmd.Parameters.AddWithValue("@id", serviceId.Value);
                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Service updated'); location.href='viewcategory.aspx';", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error updating service.');", true);
                    }
                }
            }
        }
    }
}