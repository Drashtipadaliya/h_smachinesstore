using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_cart : System.Web.UI.Page
{
    SqlConnection cn;
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);
        if (!IsPostBack)
        {
            Label subtotalLabel = (Label)FormView1.FindControl("SubtotalLabel");
            Label totalQuantityLabel = (Label)FormView1.FindControl("TotalQuantityLabel");

            if (subtotalLabel != null && totalQuantityLabel != null)
            {
                CalculateAndDisplaySubtotal(subtotalLabel, totalQuantityLabel);
            }
            else
            {
                Response.Write("<script>alert('Labels not found')</script>");
            }
        }
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox t1 = (TextBox)GridView1.Rows[e.RowIndex].FindControl("cqty");
        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

        qry = "UPDATE cart SET qnty=@qnty WHERE cid=@cid";

        using (SqlCommand cmd = new SqlCommand(qry, cn))
        {
            cmd.Parameters.AddWithValue("@qnty", t1.Text);
            cmd.Parameters.AddWithValue("@cid", id);

            cn.Open();
            int result = cmd.ExecuteNonQuery();
            cn.Close();

            if (result > 0)
            {
                Response.Write("<script>alert('Update successful')</script>");
            }
            else
            {
                Response.Write("<script>alert('Update failed')</script>");
            }
        }

        GridView1.EditIndex = -1;
        GridView1.DataBind();
        Label subtotalLabel = (Label)FormView1.FindControl("SubtotalLabel");
        Label totalQuantityLabel = (Label)FormView1.FindControl("TotalQuantityLabel");
        CalculateAndDisplaySubtotal(subtotalLabel, totalQuantityLabel);
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            decimal price = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "price"));
            int qty = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "qnty"));
            decimal productTotal = price * qty;
            decimal rate = GetRate(productTotal);

            Label rateLabel = (Label)e.Row.FindControl("RateLabel");
            if (rateLabel != null)
            {
                rateLabel.Text = rate.ToString("F2");
            }
        }
    }

    protected decimal GetRate(decimal price)
    {
        if (price >= 100 && price <= 5000)
            return 49;
        else if (price > 5000 && price <= 10000)
            return 99;
        else if (price > 10000 && price <= 50000)
            return 149;
        else if (price > 50000 && price <= 100000)
            return 199;
        else if (price > 100000 && price <= 1000000)
            return 249;
        else
            return 0;
    }

    private void CalculateAndDisplaySubtotal(Label subtotalLabel, Label totalQuantityLabel)
    {
        decimal subtotal = 0;
        int totalQuantity = 0;
        decimal totalRate = 0;

        DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);

        foreach (DataRowView row in dv)
        {
            decimal price = Convert.ToDecimal(row["price"]);
            int qty = Convert.ToInt32(row["qnty"]);

            decimal productTotal = price * qty;
            subtotal += productTotal;
            totalQuantity += qty;

            totalRate += GetRate(productTotal);
        }

        decimal total = subtotal + totalRate;

        if (subtotalLabel != null)
        {
            subtotalLabel.Text = subtotal.ToString("F2");
        }

        if (totalQuantityLabel != null)
        {
            totalQuantityLabel.Text = totalQuantity.ToString();
        }

        Label rateLabel = (Label)FormView1.FindControl("Label1"); // Updated ID for total rate
        if (rateLabel != null)
        {
            rateLabel.Text = totalRate.ToString("F2");
        }

        Label totalLabel = (Label)FormView1.FindControl("TotalLabel");
        if (totalLabel != null)
        {
            totalLabel.Text = total.ToString("F2");
        }

        Session["Subtotal"] = subtotal;
        Session["TotalRate"] = totalRate;
        Session["Total"] = total;
        Session["TotalQuantity"] = totalQuantity;
    }
}