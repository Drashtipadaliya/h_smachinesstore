using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data.SqlClient;

public partial class user_shop : System.Web.UI.Page
{
    
    string connectionString = ConfigurationManager.ConnectionStrings["hns"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {string category = Request.QueryString["cat"];
        LoadProducts();

    }
    private void LoadProducts()
    {

    }

    protected void btnBuyNow_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("sproduct.aspx?id={productId}");
    }
}
