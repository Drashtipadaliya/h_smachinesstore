<%@ Page Title="" Language="C#" MasterPageFile="~/user/admin/MasterPage.master" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="user_admin_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="child" Runat="Server">
    <br />
    <br />
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-6 m-auto border border-primary">
                <asp:Panel ID="RegisterFormPanel" runat="server" CssClass="login-form">
                    <div class="mb-3">
                        <p class="text-center fw-bold fs-2 text-warning p-2 bg-secondary">ADD-PRODUCT</p>
                    </div>
                    <div class="mb-3">
                        <label for="pname" class="form-label">Product Name:</label>
                        <asp:TextBox ID="pname" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPName" runat="server" ControlToValidate="pname" ErrorMessage="Product Name is required." CssClass="text-danger" />
                    </div>
                    <div class="mb-3">
                        <label for="price" class="form-label">Product Price:</label>
                        <asp:TextBox ID="price" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="price" ErrorMessage="Product Price is required." CssClass="text-danger" />
                        <asp:RegularExpressionValidator ID="revPrice" runat="server" ControlToValidate="price" ErrorMessage="Invalid price format. Use a number with up to two decimal places." CssClass="text-danger" 
                            ValidationExpression="^\d+(\.\d{1,2})?$" />
                    </div>
                    <div class="mb-3">
                        <label for="pimage" class="form-label">Add Product Image:</label>
                        <asp:FileUpload ID="pimage" runat="server" CssClass="form-control" />
                        <asp:Image ID="imgProduct" runat="server" Width="100" Visible="false" />
                        <asp:RequiredFieldValidator ID="rfvPImage" runat="server" ControlToValidate="pimage" ErrorMessage="Product Image is required." CssClass="text-danger" 
                            InitialValue="" />
                    </div>
                    <div class="mb-3">
                        <label for="qnty" class="form-label">Add Product Quantity:</label>
                        <asp:TextBox ID="qnty" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvQnty" runat="server" ControlToValidate="qnty" ErrorMessage="Product Quantity is required." CssClass="text-danger" />
                        <asp:RegularExpressionValidator ID="revQnty" runat="server" ControlToValidate="qnty" ErrorMessage="Invalid quantity format. Must be a whole number." CssClass="text-danger" 
                            ValidationExpression="^\d+$" />
                    </div>
                    <div class="mb-3">
                        <label for="pages" class="form-label">Category:</label>
                        <asp:DropDownList ID="pages" runat="server" CssClass="form-select" DataSourceID="SqlDataSource1" DataTextField="category" DataValueField="category"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hns %>" SelectCommand="SELECT [category] FROM [category]"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="pages" ErrorMessage="Category is required." CssClass="text-danger" />
                    </div>
                    <div class="mb-3">
                        <label for="dec" class="form-label">Product Description:</label>
                        <asp:TextBox ID="dec" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDec" runat="server" ControlToValidate="dec" ErrorMessage="Product Description is required." CssClass="text-danger" />
                    </div>
                    <div class="mb-3">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-lg btn-block bg-danger my-4" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary btn-lg btn-block bg-danger my-4" OnClick="btnUpdate_Click" Visible="false" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
    <br />
    <br />
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" />
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder2" runat="server" />
<asp:Content ID="Content7" ContentPlaceHolderID="ContentPlaceHolder3" runat="server" />