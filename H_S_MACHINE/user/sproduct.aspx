<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="sproduct.aspx.cs" Inherits="user_sproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            background-color: #f7f8fa;
        }

        .product-detail {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }

        .product-detail:hover {
            transform: translateY(-10px);
        }

        .product-image {
            max-width: 100%;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        }

        .add-to-cart-btn {
            background-color: #3498db;
            color: white;
            transition: background-color 0.3s ease;
        }

        .add-to-cart-btn:hover {
            background-color: #2980b9;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="Childuser" runat="server">
    <br /><br />

    <div class="container mt-5">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="row">
                    <!-- Product Image -->
                    <div class="col-md-6 mb-4">
                        <div class="product-detail">
                            <asp:Image ID="Image1" runat="server" CssClass="product-image" ImageUrl='<%# "~/img/" + Eval("image") %>' AlternateText="Product Image" />
                        </div>
                    </div>

                    <!-- Product Details -->
                    <div class="col-md-6">
                        <div class="product-detail">
                            <h2 class="product-name">
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Bind("pname") %>' />
                            </h2>
                            <h4 class="product-price">
                                Price: <asp:Label ID="priceLabel" runat="server" Text='<%# Bind("price") %>' />
                            </h4>
                            <p class="product-info">
                                <asp:Label ID="detailLabel" runat="server" Text='<%# Bind("dcn") %>' />
                            </p>
                           
                            <!-- Quantity Control -->
                          <div class="form-group">
    <label for="qnty">Quantity:</label>
    <div class="input-group mb-3">
        <asp:TextBox ID="qnty" runat="server" CssClass="form-control" Text="1" TextMode="Number" 
                     Width="20px" Height="10px" AutoCompleteType="None" 
                     BorderColor="#999999" BackColor="Silver" Wrap="False" 
                     Min="1" />
    </div>
</div>

                            <!-- Add to Cart Button -->
                            <asp:Button runat="server" CssClass="btn add-to-cart-btn btn-block " ID="AddToCartButton" Text="Add to Cart" OnClick="AddToCartButton_Click" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:FormView>

        <!-- SQL Data Source for fetching product details -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hns %>" SelectCommand="SELECT * FROM [product] WHERE id = @id AND qnty > 0 ">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />
</asp:Content>