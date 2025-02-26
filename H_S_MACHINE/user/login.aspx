<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="user_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    .custom-heading {
        font-size: 36px; /* Adjust the size as needed */
        font-weight: bold; /* Ensure the text is bold */
        color: #ffc107; /* This matches the Bootstrap warning color */
    }
</style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Childuser" Runat="Server">
    <br />
    <br />
    <div >
        <div class="row">
            <div class="col-md-6 bg-white mt-5 m-auto shadow font-monospace border border-info">
                <p class="text-center custom-heading my-3">User  Login</p>
                <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                <asp:Panel ID="RegisterFormPanel" runat="server" CssClass="login-form">
                    <div class="md-3">
                        <asp:label ID="emaillbl" runat="server">Email</asp:label>
                        <asp:TextBox ID="email" runat="server" CssClass="form-control w-100 fs-4 text-black" />
                    </div>
                    <div class="md-3">
                        <asp:label ID="passlbl" runat="server">User Password:</asp:label>
                        <asp:TextBox ID="pass" runat="server" CssClass="form-control" TextMode="Password"  />
                    </div>
                    <div class="col-auto">
                        <input type="checkbox" onclick="togglePassword()" />
                        <asp:label runat="server"   CssClass="form-check-label">Show Password</asp:label>
                    </div>
                    <div class="md-3">
                        <asp:Button ID="btnLogin" runat="server" CssClass="w-100 bg-danger fs-4 text-white"  Text="Login" OnClick="btnLogin_Click" />
                    </div>
                   <div class="md-3 bg-warning fs-4 text-white d-flex justify-content-center">
    <asp:LinkButton ID="LinkButton1" CssClass="text-decoration-none wd-100 text-white" Text="SIGN UP" runat="server" BorderWidth="1px" PostBackUrl="~/user/form.aspx" Font-Bold="True"></asp:LinkButton>      
</div>
                </asp:Panel>
            </div>
        </div>
    </div>
    <script>
        function togglePassword() {
            var passField = document.getElementById("<%= pass.ClientID %>");
            passField.type = passField.type === "password" ? "text" : "password";
        }
    </script>
    <br />
    <br />
</asp:Content>

<asp:Content ID="Content19" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content20" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content21" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>


