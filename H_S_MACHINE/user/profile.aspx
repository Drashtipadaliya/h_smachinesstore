<%@ Page Title="User  Profile" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="user_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <!-- Additional content can go here -->
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <!-- Additional content can go here -->
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="Childuser" Runat="Server">
   <asp:Panel ID="RegisterFormPanel" runat="server" CssClass="login-form">
        <div class="container mt-5">
            <h2 class="text-center">User  Profile</h2>
            <div class="bg-light p-4 shadow rounded">
                <div class="mb-3">
                    <label for="txtFirstName" class="form-label">First Name:</label>
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtLastName" class="form-label">Last Name:</label>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtMobile" class="form-label">Mobile No:</label>
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"  MaxLength="10"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtAddress" class="form-label">Address:</label>
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="form-control" ></asp:TextBox>
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button type="button" class="btn btn-link"><a href="reset.aspx" class="text-danger">Forget Password?</a></button>
                </div>
                <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                <a href="logout.aspx" class="btn btn-danger">Logout</a>
            </div>
        </div>
  </asp:Panel>
</asp:Content>

