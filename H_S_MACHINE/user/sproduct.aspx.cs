using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_sproduct : System.Web.UI.Page
{
    SqlConnection cn;
    String qry;

    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);

        if (Session["username"] != null)
        {
            string email = Session["username"].ToString();
            // FetchOrderDetails(email);
        }
        else
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void AddToCartButton_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("SELECT * FROM product WHERE id=@pid", cn);
        cmd.Parameters.AddWithValue("@pid", Request.QueryString["id"]);
        cn.Open();
        int qty = 0, price = 0, pid = 0;
        string img = "", name = "";
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            // Get product details
            pid = Convert.ToInt32(dr["id"]);
            img = dr["image"].ToString();
            name = dr["pname"].ToString();
            price = Convert.ToInt32(dr["price"]); // Use Int32 instead of Int16

            // Check the product quantity
            int productQty = Convert.ToInt32(dr["qnty"]);
            if (productQty <= 0)
            {
                Response.Write("<script>alert('This product is out of stock and cannot be purchased.');</script>");
                cn.Close();
                return; // Exit if product quantity is zero or less
            }

            // Find the TextBox control for quantity
            TextBox t1 = (TextBox)FormView1.FindControl("qnty");
            if (t1 != null)
            {
                qty = Convert.ToInt32(t1.Text); // Use Int32 instead of Int16
            }
        }
        dr.Close(); // Close the reader after use

        // Check if the quantity is zero or less
        if (qty <= 0)
        {
            Response.Write("<script>alert('Quantity must be greater than zero.');</script>");
            cn.Close();
            return; // Exit the method if quantity is zero
        }

        // Check if the product is already in the cart
        SqlCommand cmd1 = new SqlCommand("SELECT qnty FROM cart WHERE id=@pid AND uid=@uid AND status='no'", cn);
        cmd1.Parameters.AddWithValue("@pid", pid);
        cmd1.Parameters.AddWithValue("@uid", Session["uid"]); // Corrected line
        SqlDataReader dr1 = cmd1.ExecuteReader();

        if (dr1.Read())
        {
            // Product already in cart, update quantity
            int qty1 = Convert.ToInt32(dr1["qnty"]);
            dr1.Close();
            int q = qty1 + qty; // Use qty here
            qry = "UPDATE cart SET qnty=@qty WHERE id=@pid AND uid=@uid AND status='no'";
            SqlCommand cmd2 = new SqlCommand(qry, cn);
            cmd2.Parameters.AddWithValue("@qty", q);
            cmd2.Parameters.AddWithValue("@pid", pid);
            cmd2.Parameters.AddWithValue("@uid", Session["uid"]);
            int res1 = cmd2.ExecuteNonQuery();
            cn.Close();

            if (res1 > 0)
            {
                Response.Write("<script>alert('Product quantity updated in cart successfully');</script>");
                Response.Redirect("~/user/cart.aspx");
            }
            else
            {
                Response.Write("<script>alert('Failed to update product in cart');</script>");
            }
        }
        else
        {
            dr1.Close();
            // Product not in cart, insert new record
            qry = "INSERT INTO cart(pname, qnty, image, price, id, uid, status) VALUES(@name, @qty, @img, @price, @pid, @uid, 'no')";
            SqlCommand insertCmd = new SqlCommand(qry, cn);
            insertCmd.Parameters.AddWithValue("@name", name);
            insertCmd.Parameters.AddWithValue("@qty", qty); // Use qty here
            insertCmd.Parameters.AddWithValue("@img", img);
            insertCmd.Parameters.AddWithValue("@price", price);
            insertCmd.Parameters.AddWithValue("@pid", pid);
            insertCmd.Parameters.AddWithValue("@uid", Session["uid"]);
            int insertRes = insertCmd.ExecuteNonQuery();
            cn.Close();

            if (insertRes > 0)
            {
                Response.Write("<script>alert('Product added to cart successfully');</script>");
                Response.Redirect("~/user/cart.aspx");
            }
            else
            {
                Response.Write("<script>alert('Failed to add product to cart');</script>");
            }
        }

        cn.Close();
    }
}