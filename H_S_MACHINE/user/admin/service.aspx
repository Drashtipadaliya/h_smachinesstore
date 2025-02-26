<%@ Page Title="" Language="C#" MasterPageFile="~/user/admin/MasterPage.master" AutoEventWireup="true" CodeFile="service.aspx.cs" Inherits="user_admin_service" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="child" Runat="Server">
   <br />
    <br />
     <asp:Panel ID="ctgryFormPanel" runat="server" CssClass="ctgry-form">
    <div class="container">
            <div class="row">
                <div class="col-md-6 bg-white mt-5 m-auto shadow font-monospace border border-info">
                    <div class="mb-3">
                        <p class="text-center fw-bold fs-2 text-warning p-2 bg-secondary">SERVICE</p>
                    </div>
                    <div class="md-3">
                        <label for="sname">Service Name:</label>
                        <asp:TextBox ID="sname" runat="server" CssClass="form-control" placeholder="Enter Service"></asp:TextBox>
                    </div>
                    <div class="md-3">
                        <label for="imageUpload">Image:</label>
                        <asp:FileUpload ID="imageUpload" runat="server" CssClass="form-control" />
                        <asp:Image ID="imgService" runat="server" CssClass="img-preview" Visible="false" />
                    </div>
                    <div class="md-3">
                        <label for="dtil">Service Detail:</label>
                        <asp:TextBox ID="dtil" runat="server" CssClass="form-control" placeholder="Enter details"></asp:TextBox>
                    </div>
                    <div class="md-3">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary btn-lg btn-block bg-danger my-4" Text="ADD" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary btn-lg btn-block bg-danger my-4" Text="EDIT" OnClick="btnUpdate_Click" Visible="false" />
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


