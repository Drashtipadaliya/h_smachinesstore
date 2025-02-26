<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="user_checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            font-family: Arial, sans-serif; /* Change the font family */
        }
        .billing-heading {
            font-size: 1.5rem; /* Increase heading size */
            font-weight: bold; /* Make headings bold */
            color: #333; /* Change heading color */
        }
        .table {
            width: 100%; /* Set table width to 100% */
            margin-top: 20px; /* Add space above the table */
            border-collapse: collapse; /* Collapse borders */
            table-layout: fixed; /* Set fixed layout */
        }
        .table th, .table td {
            padding: 12px; /* Add padding to table cells */
            text-align: left; /* Align text to the left */
            border: 1px solid #ddd; /* Add border to cells */
            overflow: hidden; /* Hide overflow */
            white-space: nowrap; /* Prevent text wrapping */
            text-overflow: ellipsis; /* Add ellipsis for overflow text */
        }
        .table th {
            background-color: #f8f9fa; /* Light background for headers */
            color: #495057; /* Darker text for headers */
        }
        .total-price {
            font-weight: bold; /* Make total price bold */
            font-size: 1.2rem; /* Increase font size for total price */
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Childuser" runat="server">
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
        <div class="container">
            <div class="row no-gutters slider-text align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Checkout</span></p>
                    <h1 class="mb-0 bread">Checkout</h1>
                </div>
            </div>
        </div>
    </div>

    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-7">
                    <div id="billingForm" runat="server" class="billing-form">
                        <h3 class="mb-4 billing-heading">Billing Details</h3>
                        <div class="row align-items-end">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="firstname">First Name<span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtFirstName" ReadOnly="True" CssClass="form-control" runat="server" Placeholder="" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="lastname">Last Name<span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtLastName" ReadOnly="True" CssClass="form-control" runat="server" Placeholder="" />
                                </div>
                            </div>
                            
                            <div class="w-100"></div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="phone">Phone<span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtPhone" ReadOnly="True" CssClass="form-control" runat="server" Placeholder="" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="emailaddress">Email Address<span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" Placeholder="" TextMode="Email" ReadOnly="true" />
                                </div>
                            </div>
                            <div class="w-100"></div>
                            <div class="col-md-12">
                              <div class="form-group">
    <label for="country">State / Country<span class="text-danger">*</span></label>
    <asp:DropDownList ID="ddlCountry" CssClass="form-control" runat="server">
        <asp:ListItem Text="Select" Value="" />
        <asp:ListItem Text="France" Value="France" />
        <asp:ListItem Text="Italy" Value="Italy" />
        <asp:ListItem Text="Philippines" Value="Philippines" />
        <asp:ListItem Text="South Korea" Value="South Korea" />
        <asp:ListItem Text="Hongkong" Value="Hongkong" />
        <asp:ListItem Text="Japan" Value="Japan" />
        <asp:ListItem Text="India" Value="India" />
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="rfvCountry" runat="server" 
        ControlToValidate="ddlCountry" 
        ErrorMessage="Please select a country." 
        InitialValue="" 
        CssClass="text-danger" 
        Display="Dynamic" />
</div>
                            </div>
                            <div class="w-100"></div>
                           
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="address">Address<span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtAddress" ReadOnly="True" CssClass="form-control" runat="server" Placeholder="" TextMode="MultiLine" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for ="towncity">Town / City<span class="text-danger">*</span></label>
                                    <asp:TextBox ID="txtCity" Text="INDIA" ReadOnly="true"  CssClass="form-control" runat="server" Placeholder="" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-5">
                    <div class="row mt-5 pt-3">
                         <h4 class="billing-heading mb-4"><b>Products Ordered</b></h4>
<div class="table-responsive">
    <table style="width: 100%;">
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Quantity</th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="rptProducts" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("pname") %></td> 
       
                        <td><%# Eval("qnty") %></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>
</div>
                        <div class="col-md-12 d-flex mb-5">
                            <div class="cart-detail cart-total p-3 p-md-4">
                                <h3 class="billing-heading mb-4"><b>Cart Total</b></h3>
                                <p class="d-flex">
                                    <span>Subtotal</span>
                                    <span><asp:Label ID="SubtotalLabel" runat="server" Text="0.00" /></span>
                                </p>
                                
                                <p class="d-flex">
                                    <span>Rate</span>
                                    <span><asp:Label ID="ratelabel" runat="server" Text="0.00" /></span>
                                </p>
                                <p class="d-flex">
                                    <span><b>total quantity:</b></span>
                                    <span><asp:Label ID="TotalQuantityLabel" runat="server" Text="0"></asp:Label></span>
                                </p>
                                <hr />
                                <p class="d-flex total-price">
                                    <span><b>Total:</b></span>
                                    <span><asp:Label ID="TotalLabel" runat="server" Text="0.00" /></span>
                                </p>
                                  
                           
                            </div>
                        </div>
                    </div>
                    <asp:Button ID="btnPlaceOrder" CssClass="btn btn-primary py-3 px-4" Text="Place an order" runat="server" OnClick="btnPlaceOrder_Click" />
                </div>
            </div>
        </div>
    </section>
</asp:Content>