using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

public partial class user_admin_product : System.Web.UI.Page
{ SqlConnection cn;


    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                LoadProduct(id);
                btnSubmit.Visible = false;
                btnUpdate.Visible = true;
            }
            LoadCategories();
        }

        // Check for the session variable here
        if (Session["pname"] != null)
        {
            string productName = Session["pname"].ToString();
            // Use productName as needed, e.g., display it on the page
            Response.Write(productName); // Assuming you have a label to display the product name
        }
    }
    private void LoadProduct(int id)
    {
        using (cn)
        {
            string qry = "SELECT * FROM product WHERE id=@id";
            SqlCommand cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@id", id);
            cn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                string productName = reader[1].ToString();
                Session["pname"] = productName;
                pname.Text = reader["pname"].ToString();
                price.Text = reader["price"].ToString();
                qnty.Text = reader["qnty"].ToString();
                Session["qnty"] =qnty.Text;
                dec.Text = reader["dcn"].ToString();
                pages.SelectedValue = reader["catgry"].ToString();
                imgProduct.ImageUrl = "~/img/" + reader["image"].ToString();
                imgProduct.Visible = true;
            }
            if (Session["pname"] != null)
            {
                string productName = Session["pname"].ToString();
                // Use productName as needed
            }
        }
    }

    private void LoadCategories()
    {
        using (cn)
        {
            string query = "SELECT * FROM category";
            SqlCommand cmd = new SqlCommand(query, cn);
            cn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                pages.Items.Add(new ListItem(reader["category"].ToString(), reader["category"].ToString()));
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // Check if the page is valid before proceeding
        if (!Page.IsValid)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please fill in all required fields correctly.');", true);
            return; // Exit if validation fails
        }

        string pnameValue = pname.Text;
        string priceValue = price.Text;
        string catValue = pages.SelectedValue;
        string qnyValue = qnty.Text;
        string dnValue = dec.Text;

        string image = Path.GetFileName(pimage.PostedFile.FileName);
        if (pimage.HasFile)
        {
            pimage.SaveAs(Server.MapPath("~/img/" + image));
        }
        else
        {
            image = "default_image.jpg"; // Use a default image if none is uploaded
        }

        using (cn)
        {
            string qry = "INSERT INTO product (pname, price, image, catgry, qnty, dcn) VALUES (@pname, @price, @image, @cat, @qny, @dn)";
            SqlCommand cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@pname", pnameValue);
            cmd.Parameters.AddWithValue("@price", priceValue);
            cmd.Parameters.AddWithValue("@image", image);
            cmd.Parameters.AddWithValue("@cat", catValue);
            cmd.Parameters.AddWithValue("@qny", qnyValue);
            cmd.Parameters.AddWithValue("@dn", dnValue);

            cn.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Successfully inserted.'); window.location = 'view-pdt.aspx';", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Insertion failed.');", true);
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        // Check if the page is valid before proceeding
        if (!Page.IsValid)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please fill in all required fields correctly.');", true);
            return; // Exit if validation fails
        }

        // Check for the session variable here
        if (Session["pname"] != null)
        {
            string productName = Session["pname"].ToString();
            // Use productName as needed, e.g., log it or display it
        }

        int id = Convert.ToInt32(Request.QueryString["id"]);
        string pnameValue = pname.Text;
        string priceValue = price.Text;
        string catValue = pages.SelectedValue;
        string qnyValue = qnty.Text;
        string dnValue = dec.Text;

        string image = Path.GetFileName(pimage.PostedFile.FileName);
        string qry;

        using (cn)
        {
            if (pimage.HasFile)
            {
                pimage.SaveAs(Server.MapPath("~/img/" + image));
                qry = "UPDATE product SET pname=@pname, price=@price, image=@image, catgry=@cat, qnty=@qny, dcn=@dn WHERE id=@id";
            }
            else
            {
                qry = "UPDATE product SET pname=@pname, price=@price, catgry=@cat, qnty=@qny, dcn=@dn WHERE id=@id";
            }

            SqlCommand cmd = new SqlCommand(qry, cn);
            cmd.Parameters.AddWithValue("@pname", pnameValue);
            cmd.Parameters.AddWithValue("@price", priceValue);
            cmd.Parameters.AddWithValue("@cat", catValue);
            cmd.Parameters.AddWithValue("@qny", qnyValue);
            cmd.Parameters.AddWithValue("@dn", dnValue);
            cmd.Parameters.AddWithValue("@id", id);

            cn.Open();
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Product updated successfully.'); window.location = 'view-pdt.aspx';", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Update failed.');", true);
            }
        }
    }
    //protected void btnUpdate_Click(object sender, EventArgs e)
    //{
    //    // Ensure that the page is valid before proceeding
    //    if (!Page.IsValid)
    //    {
    //        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please fill in all required fields correctly.');", true);
    //        return; // Exit if validation fails
    //    }

    //    int id = Convert.ToInt32(Request.QueryString["id"]);
    //    string pnameValue = pname.Text;
    //    string priceValue = price.Text;
    //    string catValue = pages.SelectedValue;
    //    string qnyValue = qnty.Text;
    //    string dnValue = dec.Text;

    //    string image = Path.GetFileName(pimage.PostedFile.FileName);
    //    string qry;

    //    using (cn)
    //    {
    //        if (pimage.HasFile)
    //        {
    //            pimage.SaveAs(Server.MapPath("~/img/" + image));
    //            qry = "UPDATE product SET pname=@pname, price=@price, image=@image, catgry=@cat, qnty=@qny, dcn=@dn WHERE id=@id";
    //        }
    //        else
    //        {
    //            qry = "UPDATE product SET pname=@pname, price=@price, catgry=@cat, qnty=@qny, dcn=@dn WHERE id=@id";
    //        }

    //        SqlCommand cmd = new SqlCommand(qry, cn);
    //        cmd.Parameters.AddWithValue("@pname", pnameValue);
    //        cmd.Parameters.AddWithValue("@price", priceValue);
    //        cmd.Parameters.AddWithValue("@cat", catValue);
    //        cmd.Parameters.AddWithValue("@qny", qnyValue);
    //        cmd.Parameters.AddWithValue("@dn", dnValue);
    //        cmd.Parameters.AddWithValue("@id", id);

    //        cn.Open();
    //        int result = cmd.ExecuteNonQuery();
    //        if (result > 0)
    //        {
    //            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Product updated successfully.'); location.href='view-pdt.aspx';", true);
    //        }
    //        else
    //        {
    //            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Update failed.');", true);
    //        }
    //    }
}
