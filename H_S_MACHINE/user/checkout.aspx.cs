using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Linq;
using System.Collections.Generic;

public partial class user_checkout : System.Web.UI.Page
{
    SqlConnection cn;

    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);
        if (Session["username"] != null)
        {
            txtEmail.Text = Session["username"].ToString();

            // Safely cast the session values to decimal
            decimal subtotal = (Session["Subtotal"] != null) ? Convert.ToDecimal(Session["Subtotal"]) : 0;
            decimal rate = (Session["TotalRate"] != null) ? Convert.ToDecimal(Session["TotalRate"]) : 0;

            // Set the labels with formatted values
            SubtotalLabel.Text = subtotal.ToString("F2");
            ratelabel.Text = rate.ToString("F2"); // Retrieve rate from session

            // Calculate total based on subtotal and rate
            decimal total = subtotal + rate;
            TotalLabel.Text = total.ToString("F2"); // Display total

            txtFirstName.Text = (Session["fname"] != null) ? Session["fname"].ToString() : string.Empty;
            txtLastName.Text = (Session["lname"] != null) ? Session["lname"].ToString() : string.Empty;
            txtPhone.Text = (Session["mobile"] != null) ? Session["mobile"].ToString() : string.Empty;
            txtAddress.Text = (Session["address"] != null) ? Session["address"].ToString() : string.Empty;

            // Load products ordered
            LoadOrderedProducts();

            // Display total quantity
            int totalQuantity = (Session["TotalQuantity"] != null) ? Convert.ToInt32(Session["TotalQuantity"]) : 0;
            TotalQuantityLabel.Text = totalQuantity.ToString(); // Assuming you have a label for total quantity
        }
    }

    private void LoadOrderedProducts()
    {
        string qry = "SELECT pname, qnty FROM cart WHERE uid = @UId AND status = 'no'"; // Ensure status is 'no'
        using (SqlCommand cmd = new SqlCommand(qry, cn))
        {
            cmd.Parameters.AddWithValue("@UId", Session["uid"]);
            cn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);
            rptProducts.DataSource = dt;
            rptProducts.DataBind();
            cn.Close();

            // Calculate total quantity and store in session
            int totalQuantity = dt.AsEnumerable().Sum(row => row.Field<int>("qnty"));
            Session["TotalQuantity"] = totalQuantity; // Store total quantity in session
        }
    }

    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
        // Check if the uid session variable is set
        if (Session["uid"] == null)
        {
            Response.Write("<script>alert('User  is not logged in. Please log in to place an order.');</script>");
            Response.Redirect("~/user/login.aspx"); // Redirect to login page or handle as needed
            return; // Exit the method
        }

        // Server-side validation for the dropdown
        if (string.IsNullOrEmpty(ddlCountry.SelectedValue))
        {
            Response.Write("<script>alert('Please select a state or country.');</script>");
            return; // Exit the method without proceeding
        }

        string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"); // Use full date and time
        decimal total = (decimal)(Session["Total"] ?? 0); // Ensure total is not null

        using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString))
        {
            cn.Open();

            // Load ordered products from the cart
            string cartQuery = "SELECT id, pname, qnty FROM cart WHERE uid = @UId AND status = 'no'";
            using (SqlCommand cartCmd = new SqlCommand(cartQuery, cn))
            {
                cartCmd.Parameters.AddWithValue("@UId", Session["uid"]); // Ensure this is set

                SqlDataAdapter da = new SqlDataAdapter(cartCmd);
                DataTable cartItems = new DataTable();
                da.Fill(cartItems);

                // Store product names in a list
                List<string> productNames = new List<string>();

                foreach (DataRow row in cartItems.Rows)
                {
                    int productId = Convert.ToInt32(row["id"]); // Ensure you have this column in your cart table
                    int quantity = Convert.ToInt32(row["qnty"]);
                    string productName = row["pname"].ToString(); // Get product name

                    // Add product name to the list
                    productNames.Add(productName);

                    // Update product quantity in the product table
                    string updateProductQuery = "UPDATE product SET qnty = qnty - @Quantity WHERE id = @ProductID";
                    using (SqlCommand updateProductCmd = new SqlCommand(updateProductQuery, cn))
                    {
                        updateProductCmd.Parameters.AddWithValue("@Quantity", quantity);
                        updateProductCmd.Parameters.AddWithValue("@ProductID", productId); // Corrected parameter name

                        // Execute the query for product update
                        updateProductCmd.ExecuteNonQuery();
                    }

                    // Insert product into bill
                    InsertProductIntoBill(cn, productName, quantity, total);
                }

                // Store the product names in the session
                Session["ProductNames"] = string.Join(", ", productNames);
            }

            // Set session variables for order confirmation
            Session["OrderDate"] = date; // Store the order date
            Session["Total"] = total; // Store the total amount

            Response.Write("<script>alert('Order placed successfully!'); </script>");
            Response.Redirect("~/user/order.aspx");
        }
    }
    string date = System.DateTime.Now.ToShortDateString();
    private void InsertProductIntoBill(SqlConnection cn, string productName, int quantity, decimal total)
    {
        string qry = "INSERT INTO bill (fname, lname, mobile, pname, qnty, email, state, address, city, date, total) " +
                      "VALUES (@FirstName, @LastName, @Mobile, @Pname, @qnty, @Email, @State, @Address, @City, @Date, @Total)";

        using (SqlCommand cmd = new SqlCommand(qry, cn))
        {
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
            cmd.Parameters.AddWithValue("@Mobile", txtPhone.Text);
            cmd.Parameters.AddWithValue("@Pname", productName);
            cmd.Parameters.AddWithValue("@qnty", quantity);
            cmd.Parameters.AddWithValue("@Email", Session["username"].ToString());
            cmd.Parameters.AddWithValue("@State", ddlCountry.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@City", txtCity.Text); // Ensure this is populated correctly

            // Use the current system date and time
            cmd.Parameters.AddWithValue("@Date", DateTime.Now); // Insert current date and time

            cmd.Parameters.AddWithValue("@Total", total);

            cmd.ExecuteNonQuery();
        }
    }
}