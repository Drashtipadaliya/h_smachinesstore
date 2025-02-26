using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

public partial class user_admin_team : System.Web.UI.Page

{
    private SqlConnection con;
    private int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);

        if (!IsPostBack)
        {
            id = Request.QueryString["id"] != null ? Convert.ToInt32(Request.QueryString["id"]) : 0;

            if (id > 0)
            {
                LoadTeamMember(id);
                btnSubmit.Visible = false;
                btnUpdate.Visible = true;
            }
        }
    }

    private void LoadTeamMember(int id)
    {
        using (con)
        {
            string qry = "SELECT * FROM team WHERE id=@id";
            SqlCommand cmd = new SqlCommand(qry, con);
            cmd.Parameters.AddWithValue("@id", id);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                tnm.Text = reader["name"].ToString();
                work.Text = reader["work"].ToString();
                exp.Text = reader["exp"].ToString();
                string imageUrl = reader["image"].ToString();
                if (!string.IsNullOrEmpty(imageUrl))
                {
                    imgCurrent.ImageUrl = "~/img/" + imageUrl;
                    imgCurrent.Visible = true;
                }
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string name = tnm.Text;
        string qualification = work.Text;
        string experience = exp.Text;

        string image = imgUpload.HasFile ? imgUpload.FileName : "default_image.jpg"; // Default image if none uploaded
        string imagePath = Server.MapPath("~/img/") + image;

        if (imgUpload.HasFile)
        {
            imgUpload.SaveAs(imagePath);
        }

        string qry = "INSERT INTO team (name, image, wrk, exp) VALUES (@name, @image, @wrk, @exp)";
        using (con)
        {
            SqlCommand cmd = new SqlCommand(qry, con);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@image", image);
            cmd.Parameters.AddWithValue("@wrk", qualification);
            cmd.Parameters.AddWithValue("@exp", experience);
            con.Open();

            if (cmd.ExecuteNonQuery() > 0)
            {
                Response.Write("<script>alert('Successfully inserted.');</script>");
            }
            else
            {
                Response.Write("<script>alert('Insertion failed.');</script>");
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string name = tnm.Text;
        string qualification = work.Text;
        string experience = exp.Text;

        string qry;
        if (imgUpload.HasFile)
        {
            string image = imgUpload.FileName;
            string imagePath = Server.MapPath("~/img/") + image;
            imgUpload.SaveAs(imagePath);
            qry = "UPDATE team SET name=@name, image=@image, wrk=@wrk, exp=@exp WHERE id=@id";
            using (con)
            {
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@image", image);
                cmd.Parameters.AddWithValue("@wrk", qualification);
                cmd.Parameters.AddWithValue("@exp", experience);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();

                if (cmd.ExecuteNonQuery() > 0)
                {
                    Response.Write("<script>alert('Successfully updated.'); location.href='view-tm.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('Update failed.');</script>");
                }
            }
        }
        else
        {
            qry = "UPDATE team SET name=@name, wrk=@wrk, exp=@exp WHERE id=@id";
            using (con)
            {
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@wrk", qualification);
                cmd.Parameters.AddWithValue("@exp", experience);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();

                if (cmd.ExecuteNonQuery() > 0)
                {
                    Response.Write("<script>alert('Successfully updated.'); location.href='view-t m.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('Update failed.');</script>");
                }
            }
        }
    }
}
