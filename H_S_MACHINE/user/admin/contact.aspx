<%@ Page Title="" Language="C#" MasterPageFile="~/user/admin/MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="user_admin_contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="child" Runat="Server">
     <br />
    <br />
    <asp:Panel ID="RegisterFormPanel" runat="server" CssClass="login-form">
    <div class="contenter">
            <div class="row">
                <div class="col-md-6 bg-white mt-5 m-auto shadow font-monospace border border-info">
                    <div class="mb-3">
                        <p class="text-center fw-bold fs-2 text-warning p-2 bg-secondary">CONTACT US DETAIL</p>
                    </div>
                    <div class="md-3">
                        <label for="cunm">COMPANY NAME:</label>
                        <asp:TextBox ID="cunm" runat="server" CssClass="form-control" placeholder="Enter company name"></asp:TextBox>
                    </div>
                    <div class="md-3">
                        <label for="dtil">ADDRESS:</label>
                        <asp:TextBox ID="dtil" runat="server" CssClass="form-control" placeholder="Enter company address"></asp:TextBox>
                    </div>
                    <div class="md-3">
                        <label for="mn">MOBILE NO:</label>
                        <asp:TextBox ID="mn" runat="server" CssClass="form-control" placeholder="Enter company mobile no"></asp:TextBox>
                    </div>
                    <div class="md-3">
                        <label for="eml">EMAIL ID:</label>
                        <asp:TextBox ID="eml" runat="server" CssClass="form-control" placeholder="Enter company emailID"></asp:TextBox>
                    </div>
                    <div class="md-3">
                        <asp:Button runat="server" ID="btnSubmit" CssClass="btn btn-primary btn-lg btn-block bg-danger my-4" Text="ADD" ></asp:Button>
                        <asp:Button runat="server" ID="btnUpdate" CssClass="btn btn-primary btn-lg btn-block bg-danger my-4" Text="EDIT" Visible="false"></asp:Button>
                    
                    </div>
                </div>
            </div>
        </div>
        </asp:Panel>
    <br />
    <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>


