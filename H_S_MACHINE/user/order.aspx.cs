using System;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using iTextSharp.text;
using iTextSharp.text.pdf;

public partial class user_order : System.Web.UI.Page
{
    SqlConnection cn;
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {
        cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString);

        if (Session["username"] != null)
        {
            string email = Session["username"].ToString();
            FetchOrderDetails(email);

            // Display total quantity from session
            int totalQuantity = (Session["TotalQuantity"] != null) ? Convert.ToInt32(Session["TotalQuantity"]) : 0;
            TotalQuantityLabel.Text = totalQuantity.ToString(); // Assuming you have a label for total quantity
        }
        else
        {
            Response.Redirect("~/user/login.aspx");
        }
    }

    private void FetchOrderDetails(string email)
    { qry ="select * from bill";
      //  qry = "SELECT fname, lname, mobile, address, city, date, SUM(CAST(total AS DECIMAL(18, 2))) AS TotalAmount " +
          //    "FROM bill WHERE email=@Email GROUP BY fname, lname, mobile, address, city, date";

        using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString))
        using (SqlCommand cmd = new SqlCommand(qry, cn))
        {
            cmd.Parameters.AddWithValue("@Email", email);

            cn.Open();
            using (SqlDataReader da = cmd.ExecuteReader())
            {
                if (da.HasRows)
                {
                    while (da.Read())
                    {
                        lblFirstName.Text = da["fname"].ToString();
                        lblLastName.Text = da["lname"].ToString();
                        lblEmail.Text = email.ToString();
                        lblPhone.Text = da["mobile"].ToString();
                        lblAddress.Text = da["address"].ToString();
                        lblCity.Text = da["city"].ToString(); // This should fetch the city name correctly
                        lblDate.Text = Convert.ToDateTime(da["date"]).ToString("MMMM dd, yyyy");

                        decimal total = (decimal)(Session["Total"] ?? 0);
                        lblTotalAmount.Text = total.ToString("F2");

                        lblpname.Text = Session["ProductNames"] != null ? Session["ProductNames"].ToString() : "No products found";
                    }

                    OrderReceiptPanel.Visible = true;
                }
                else
                {
                    Response.Write("<script>alert('No order details found!');</script>");
                }
            }
        }
    }

    protected void btnDownload_Click(object sender, EventArgs e)
    {
        // Update the cart status to 'yes' before generating the PDF
        if (!UpdateCartStatus())
        {
            Response.Write("<script>alert('Failed to update cart status.');</script>");
            return; // Exit if the update fails
        }

        Document pdfDoc = new Document(); // Initialize the Document object
        try
        {
            // Set the response headers
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=OrderReceipt.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            // Create a PdfWriter instance
            PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();

            // Define fonts
            Font titleFont = FontFactory.GetFont("Arial", 16, Font.BOLD, BaseColor.BLACK);
            Font headerFont = FontFactory.GetFont("Arial", 12, Font.BOLD, BaseColor.WHITE);
            Font bodyFont = FontFactory.GetFont("Arial", 12, Font.NORMAL, BaseColor.BLACK);
            Font dateFont = FontFactory.GetFont("Arial", 10, Font.NORMAL, BaseColor.DARK_GRAY);

            // Add logo at the top left
            string logoPath = Server.MapPath("~/img/logo.png");
            if (System.IO.File.Exists(logoPath))
            {
                iTextSharp.text.Image logo = iTextSharp.text.Image.GetInstance(logoPath);
                logo.ScaleToFit(140f, 120f); // Scale the logo to fit
                logo.Alignment = Element.ALIGN_LEFT;
                pdfDoc.Add(logo);
            }
            pdfDoc.Add(new Paragraph("NO EXCHANGE & NO BORROWED", titleFont) { Alignment = Element.ALIGN_RIGHT });
            pdfDoc.Add(new Paragraph(" ")); // Add a blank line

            pdfDoc.Add(new Paragraph("Order Receipt", titleFont) { Alignment = Element.ALIGN_CENTER });
            pdfDoc.Add(new Paragraph(" ")); // Add a blank line

            // Add current date and time
            string currentDateTime = DateTime.Now.ToString("MMMM dd, yyyy HH:mm:ss");
            pdfDoc.Add(new Paragraph("Date and Time: " + currentDateTime, dateFont) { Alignment = Element.ALIGN_RIGHT });
            pdfDoc.Add(new Paragraph(" ")); // Add a blank line

            // Create a table with 2 columns
            PdfPTable table = new PdfPTable(2);
            table.WidthPercentage = 100; // Set the table width to 100%
            table.DefaultCell.Border = Rectangle.NO_BORDER; // Remove default cell borders

            // Add table headers with background color
            PdfPCell headerCell1 = new PdfPCell(new Phrase("DETAILS", headerFont));
            headerCell1.BackgroundColor = new BaseColor(169, 169, 169); // Changed to a different blue
            headerCell1.Border = Rectangle.BOTTOM_BORDER; // Add bottom border
            headerCell1.Padding = 10;
            table.AddCell(headerCell1);

            PdfPCell headerCell2 = new PdfPCell(new Phrase("VALUES", headerFont));
            headerCell2.BackgroundColor = new BaseColor(169, 169, 169); // Changed to a different blue
            headerCell2.Border = Rectangle.BOTTOM_BORDER; // Add bottom border
            headerCell2.Padding = 10;
            table.AddCell(headerCell2);

            // Add data to the table
            AddTableRow(table, "First Name:", lblFirstName.Text, bodyFont);
            AddTableRow(table, "Last Name:", lblLastName.Text, bodyFont);
            AddTableRow(table, "Email:", lblEmail.Text, bodyFont);
            AddTableRow(table, "Product Name(s):", lblpname.Text, bodyFont);
            AddTableRow(table, "Quantity(s):", TotalQuantityLabel.Text, bodyFont);
            AddTableRow(table, "Phone:", lblPhone.Text, bodyFont);
            AddTableRow(table, "Address:", lblAddress.Text, bodyFont);
            AddTableRow(table, "City:", lblCity.Text, bodyFont);
            AddTableRow(table, "Order Date:", lblDate.Text, bodyFont);
            AddTableRow(table, "Total Amount:", lblTotalAmount.Text, bodyFont);

            // Add the table to the document
            pdfDoc.Add(table);

            // Create a thank you message
            string thankYouMessage = "THANK YOU FOR VISITING OUR SITE";

            // Use PdfContentByte to draw the text
            PdfContentByte cb = writer.DirectContent;
            cb.BeginText();
            cb.SetFontAndSize(BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, BaseFont.NOT_EMBEDDED), 16);
            float xPosition = pdfDoc.PageSize.Width / 2; // Center horizontally
            float yPosition = 30; // Set a small margin from the bottom
            cb.ShowTextAligned(PdfContentByte.ALIGN_CENTER, thankYouMessage, xPosition, yPosition, 0);
            cb.EndText();

            // Close the PDF document
            pdfDoc.Close();

            // Flush the response
            Response.Flush();
            Response.End();
        }
        catch (Exception ex)
        {
            // Log the exception or show an error message
            Response.Write("<script>alert('Error generating PDF: " + ex.Message + "');</script>");
        }
    }

    private bool UpdateCartStatus()
    {
        string status = "yes";
        string qry = "UPDATE cart SET status = @Status WHERE uid = @id"; // Corrected parameter name
        int res1 = 0;

        using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["hns"].ConnectionString))
        using (SqlCommand cmd = new SqlCommand(qry, cn))
        {
            cmd.Parameters.AddWithValue("@Status", status);

            // Ensure that Session["uid"] is not null and is of the expected type
            if (Session["uid"] != null)
            {
                cmd.Parameters.AddWithValue("@id", Session["uid"]); // Corrected parameter name
            }
            else
            {
                Response.Write("<script>alert('User  ID is not set in the session.');</script>");
                return false; // Indicate failure
            }

            cn.Open();
            res1 = cmd.ExecuteNonQuery();
        }

        if (res1 > 0)
        {
            Response.Write("<script>alert('Cart status updated successfully.');</script>");
            return true; // Indicate success
        }
        else
        {
            Response.Write("<script>alert('Failed to update cart status.');</script>");
            return false; // Indicate failure
        }
    }
    // Helper method to add a row to the table
    private void AddTableRow(PdfPTable table, string field, string value, Font bodyFont)
    {
        PdfPCell fieldCell = new PdfPCell(new Phrase(field, bodyFont));
        fieldCell.Border = Rectangle.NO_BORDER; // No border
        fieldCell.Padding = 5;
        table.AddCell(fieldCell);

        PdfPCell valueCell = new PdfPCell(new Phrase(value, bodyFont));
        valueCell.Border = Rectangle.NO_BORDER; // No border
        valueCell.Padding = 5;
        table.AddCell(valueCell);
    }
}