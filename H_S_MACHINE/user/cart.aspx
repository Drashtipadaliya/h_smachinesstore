﻿<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="user_cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="Childuser" runat="server">
    <style>
        /* Centering the GridView within a div */
        .grid-container {
            display: flex;
            justify-content: center; /* Centers the GridView horizontally */
            align-items: flex-start; /* Aligns the GridView at the top */
            padding: 20px;           /* Optional padding */
        }

        /* Styling for the wrapper div around the GridView with light grey background */
        .view-wrapper {
            width: 80%;  /* Adjust the width of the div that wraps the GridView */
            background-color: #f9f9f9;  /* Light grey background color */
            padding: 20px;
            border-radius: 8px;   /* Optional rounded corners */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Optional shadow effect */
        }

        /* GridView styling */
        .custom-gridview {
            width: 100%; /* Full width of the container */
            border-collapse: collapse;
            text-align: left;
            border: 1px solid #ddd;
            background-color: #ffffff; /* White background for the grid */
        }

        .custom-gridview .grid-header {
            background-color: #4CAF50; /* Template color */
            color: white;
            font-weight: bold;
            text-align: center;
            padding: 8px; /* Increased padding for better header visibility */
        }

        .custom-gridview th, 
        .custom-gridview td {
            border: 1px solid #ddd;
            padding: 8px; /* Increased padding for better cell visibility */
            text-align: center;
            font-size: 14px; /* Slightly larger font size */
        }

        .custom-gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .custom-gridview tr:hover {
            background-color: #ddd;
        }

        .custom-gridview img {
            max-width: 60px; /* Smaller image size */
            max-height: 60px;
        }

        /* Cart Total styling */
        .cart-wrap {
            margin-top: 20px; /* Add margin for spacing */
            padding: 20px; /* Add padding for better layout */
        }

        .cart-total {
            background-color: #f1f1f1;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Optional shadow effect */
        }

        .cart-total h3 {
            margin-bottom: 15px; /* Space below the heading */
        }

        .cart-total p {
            font-size: 14px;
            margin: 5px 0; /* Space between paragraphs */
        }

        .cart-total .total-price {
            font-weight: bold;
            font-size: 16px;
        }

        .btn-proceed {
            margin-top: 20px; /* Space above the button */
            display: inline-block; /* Center the button */
        }
    </style>

    <br /><br />
    <div class="grid-container">
        <div class="view-wrapper">
            <%--<asp:GridView ID="GridView1" runat="server" CssClass="custom-gridview" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="cid" OnRow Updating the ASPX file to include the rate for each product in the cart, we will add a new column in the `GridView` and ensure the necessary calculations are performed. Here’s the continuation of the updated ASPX code:--%>

          <asp:GridView ID="GridView1" runat="server" CssClass="custom-gridview" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="cid" OnRowUpdating="GridView1_RowUpdating" OnRowDataBound="GridView1_RowDataBound" AutoGenerateDeleteButton="True">
    <Columns>
        <asp:BoundField DataField="pname" HeaderText="Product Name" />
        <asp:TemplateField HeaderText="Quantity">
            <ItemTemplate>
                <asp:Label ID="lblQuantity" runat="server" Text='<%# Bind("qnty") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="cqty" runat="server" Text='<%# Bind("qnty") %>'></asp:TextBox>
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="price" HeaderText="Price" DataFormatString="{0:C}" />
        <asp:TemplateField HeaderText="Rate">
            <ItemTemplate>
                <asp:Label ID="RateLabel" runat="server" Text="0.00"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowEditButton="True" />
    </Columns>
</asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:hns %>" 
                SelectCommand="SELECT [pname], [qnty], [image], [price], [cid] FROM [cart] WHERE [uid] = @uid AND [status] = 'no'" 
                DeleteCommand="DELETE FROM [cart] WHERE [cid] = @cid" 
                InsertCommand="INSERT INTO [cart] ([pname], [qnty], [image], [price]) VALUES (@pname, @qnty, @image, @price)" 
                UpdateCommand="UPDATE [cart] SET [qnty] = @qnty WHERE [cid] = @cid">
                <DeleteParameters>
                    <asp:Parameter Name="cid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="pname" Type="String" />
                    <asp:Parameter Name="qnty" Type="Int32" />
                    <asp:Parameter Name="image" Type="String" />
                    <asp:Parameter Name="price" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="qnty" Type="Int32" />
                    <asp:Parameter Name="cid" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="uid" SessionField="uid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:hns %>" 
                SelectCommand="SELECT cid, SUM(qnty * price) AS TotalPrice, price, qnty FROM cart WHERE uid = @uid AND ([status] = @status) GROUP BY cid, price, qnty">
                <SelectParameters>
                    <asp:SessionParameter Name="uid" SessionField="uid" Type="Int32" />
                    <asp:Parameter Name="status" Type="String" DefaultValue="no" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="cid" DataSourceID="SqlDataSource2" RenderOuterTable="false">
    <ItemTemplate>
        <div class="row justify-content-end">
            <div class="col-lg-4 mt-5 cart-wrap ftco-animate">
                <div class="cart-total mb-3">
                    <h3><b>Cart Totals</b></h3>
                    <hr />
                    <p class="d-flex">
                        <span>Subtotal</span>
                        <span><asp:Label ID="SubtotalLabel" runat="server" Text="0.00" /></span>
                    </p>
                    <p class="d-flex">
                        <span>Quantity</span>
                        <span><asp:Label ID="TotalQuantityLabel" runat="server" Text="0" /></span>
                    </p>
                    <p class="d-flex">
                        <span>Rate</span>
                        <span><asp:Label ID="Label1" runat="server" Text="0.00" /></span> <!-- Updated ID -->
                    </p>
                    <hr />
                    <p class="d-flex total-price">
                        <span>Total</span>
                        <span><asp:Label ID="TotalLabel" runat="server" Text="0.00" /></span>
                    </p>
                </div>
                <p class="btn-proceed">
                    <a href="display.aspx" class="btn btn-primary py-3 px-4">Shop Now</a>
                </p>
                <p class="btn-proceed">
                    <a href="checkout.aspx" class="btn btn-primary py-3 px-4">Proceed to Checkout</a>
                </p>
            </div>
        </div>
    </ItemTemplate>
</asp:FormView>        </div>
    </div>
</asp:Content>