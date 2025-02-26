<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="form.aspx.cs" Inherits="user_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function togglePasswordVisibility() {
            var passField = document.getElementById("<%= pass.ClientID %>");
            passField.type = passField.type === "password" ? "text" : "password";
        }
    </script>
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
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 bg-white mt-5 m-auto shadow font-monospace border border-info">
               <p class="text-center custom-heading my-3">User Register</p>
                <asp:HiddenField ID="id" runat="server" />
                <asp:Panel ID="RegisterFormPanel" runat="server" CssClass="login-form">
                    <div class="md-3">
                        <asp:Label ID="Label3" runat="server" Text="Label">Firstname:</asp:Label>
                        <asp:TextBox ID="fnm" runat="server" CssClass="form-control" />
                    </div>

                    <div class="md-3">
                        <asp:Label ID="Label2" runat="server" Text="Label">Lastname:</asp:Label>
                        <asp:TextBox ID="lnm" runat="server" CssClass="form-control" />
                    </div>

                    <div class="md-3">
                        <asp:Label ID="Label1" runat="server" Text="Label">Email:</asp:Label>
                        <asp:TextBox ID="email" runat="server" CssClass="form-control" />
                        <asp:RegularExpressionValidator ID="emailValidator" runat="server" ControlToValidate="email" ValidationExpression="^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" ForeColor="Red" ErrorMessage="Invalid email format" />
                    </div>

                    <div class="md-3">
                        <asp:Label ID="mnolbl" runat="server" Text="Label">Mobile No</asp:Label>
                        <asp:TextBox ID="mno" runat="server" CssClass="form-control" />
                        <asp:RegularExpressionValidator ID="mnoValidator" runat="server" ControlToValidate="mno" ValidationExpression="^[0-9]{10}$" ForeColor="Red" ErrorMessage="Only 10 numeric digits are allowed" />
                    </div>

                    <div class="md-3">
                        <asp:Label ID="Label4" runat="server" Text="Label">Password:</asp:Label>
                        <asp:TextBox ID="pass" runat="server" TextMode="Password" CssClass="form-control" />
                    </div>

                    <div class="md-3">
                        <asp:Label ID="Label5" runat="server" Text="Label">Address:</asp:Label>
                        <asp:TextBox ID="adrs" runat="server" TextMode="MultiLine" CssClass="form-control" />
                    </div>

                    <div class="col-auto">
                        <input type="checkbox" onclick="togglePasswordVisibility()" /> 
                        <label class="form-check-label" for="autoSizingCheck2">Show Password</label>
                    </div>

                    <div class="md-3">
                        <asp:Button ID="btnSubmit" runat="server" Text="Sign Up" CssClass="w-100 bg-danger fs-4 text-white" OnClick="btnSubmit_Click" />
                    </div>
                    <div class="md-3">
                        <button class="w-100 bg-warning fs-4 text-white">
                            <a href="login.aspx" class="text-decoration-none text-white">Already have an account</a>
                        </button>
                    </div>
 </asp:Panel>
            </div>
        </div>
    </div>
    <br />
    <br />
</asp:Content>

<asp:Content ID="Content19" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content20" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content21" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>