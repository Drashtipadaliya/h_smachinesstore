using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class user_display : System.Web.UI.Page
{
    SqlConnection cn;
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);

        if (!IsPostBack)
        {
            BindData("all");
        }
    }

    private void BindData(string price)
    {
        string l = PriceFilterStart.SelectedValue;
        string h = PriceFilterEnd.SelectedValue;
        string qry = "";

        if (price == "all")
        {
            qry = "SELECT * FROM product";
        }
        else
        {
            qry = "SELECT * FROM product WHERE price >= @minPrice AND price <= @maxPrice";
        }

        SqlCommand cmd = new SqlCommand(qry, cn);
        cmd.Parameters.AddWithValue("@minPrice", l);
        cmd.Parameters.AddWithValue("@maxPrice", h);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);

        DataList2.DataSource = ds.Tables[0];
        DataList2.DataBind();
    }

    protected string GetStockStatus(object qty)
    {
        int quantity = Convert.ToInt32(qty);
        if (quantity == 0)
        {
            return "Out of Stock";
        }
        else if (quantity > 0 && quantity <= 5)
        {
            return "Few Products Left";
        }
        else
        {
            return "In Stock";
        }
    }

    protected string GetStockClass(object qty)
    {
        int quantity = Convert.ToInt32(qty);
        if (quantity == 0)
        {
            return "out-of-stock";
        }
        else if (quantity > 0 && quantity <= 5)
        {
            return "few-products-left";
        }
        else
        {
            return "in-stock";
        }
    }

    protected void PriceFilterStart_SelectedIndexChanged1(object sender, EventArgs e)
    {
        SetFilter();
    }

    protected void PriceFilterEnd_SelectedIndexChanged1(object sender, EventArgs e)
    {
        SetFilter();
    }

    public void SetFilter()
    {
        string l = PriceFilterStart.SelectedValue;
        string h = PriceFilterEnd.SelectedValue;

        // Make sure price filters are valid
        if (string.IsNullOrEmpty(l) || string.IsNullOrEmpty(h))
        {
            l = "0"; // Default to 0 if no price filter selected
            h = "999999"; // Default to high number if no max price selected
        }

        // Build the query
        string qry1 = "SELECT * FROM product WHERE price >= @minPrice AND price <= @maxPrice";

        SqlCommand cmd = new SqlCommand(qry1, cn);
        cmd.Parameters.AddWithValue("@minPrice", l);
        cmd.Parameters.AddWithValue("@maxPrice", h);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);

        DataList2.DataSource = ds.Tables[0];
        DataList2.DataBind();
    }
}
