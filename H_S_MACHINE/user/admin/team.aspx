<%@ Page Title="" Language="C#" MasterPageFile="~/user/admin/MasterPage.master" AutoEventWireup="true" CodeFile="team.aspx.cs" Inherits="user_admin_team" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="child" Runat="Server">
    <br />
    <br />
    <asp:Panel ID="RegisterFormPanel" runat="server" CssClass="login-form">
      
           <div class="container">
            <div class="row">
                <div class="col-md-6 bg-white mt-5 m-auto shadow font-monospace border border-info">
                    <div class="mb-3">
                        <p class="text-center fw-bold fs-2 text-warning p-2 bg-secondary">TEAM DETAIL</p>
                    </div>
                    <div class="md-3">
                        <label for="tnm">Team Member Name:</label>
                        <asp:TextBox ID="tnm" runat="server" CssClass="form-control" placeholder="Enter your name" ></asp:TextBox>
                    </div>
                    <div class="md-3">
                        <label for="img">Image:</label>
                        <asp:FileUpload ID="imgUpload" runat="server" CssClass="form-control" />
                        <asp:Image ID="imgCurrent" runat="server" Width="100" Visible="false" />
                    </div>
                    <div class="md-3">
                        <label for="work">Qualification:</label>
                        <asp:TextBox ID="work" runat="server" CssClass="form-control" placeholder="Enter your qualification" ></asp:TextBox>
                    </div>
                    <div class="md-3">
                        <label for="exp">Experience:</label>
                        <asp:TextBox ID="exp" runat="server" CssClass="form-control"  placeholder="Enter experience" TextMode="Number"></asp:TextBox>
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


