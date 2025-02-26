<%@ Page Title="View Registered Users" Language="C#" MasterPageFile="~/user/admin/MasterPage.master" AutoEventWireup="true" CodeFile="view-rgr.aspx.cs" Inherits="user_admin_view_rgr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .table th, .table td {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .table th {
            background-color: #495057;
            color: white;
        }

        .btn-primary, .btn-danger {
            font-size: 0.9rem;
        }
        .img-thumbnail {
            width: 100px;
            height: 100px;
            object-fit: cover;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="child" Runat="Server">
    <br />
   <div class="container my-5">
       
        <div class="table-responsive">
              <h1 class="text-warning text-center fs-3 fw-bold my-3">View Registered user</h1>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered text-center" DataKeyNames="id" DataSourceID="SqlDataSource1">
                <Columns>
                  
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" EditText="Edit" DeleteText="Delete" />

                  
                    <asp:TemplateField HeaderText="User ID">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                  
                    <asp:TemplateField HeaderText="First Name">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("fname") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("fname") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                   
                    <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("lname") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Bind("lname") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                   
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Text='<%# Bind("email") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    
                    <asp:TemplateField HeaderText="Mobile">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("mobile") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Text='<%# Bind("mobile") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                   
                    <asp:TemplateField HeaderText="Role">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("role") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" Text='<%# Bind("role") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hns %>" 
        SelectCommand="SELECT * FROM [register]" 
        DeleteCommand="DELETE FROM [register] WHERE [id] = @id" 
        UpdateCommand="UPDATE [register] SET [fname] = @fname, [lname] = @lname, [email] = @email, [mobile] = @mobile, [role] = @role WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="fname" Type="String" />
            <asp:Parameter Name="lname" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="mobile" Type="String" />
            <asp:Parameter Name="role" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource></asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Additional content can be added here if needed -->
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <!-- Additional content can be added here if needed -->
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
   </asp:Content>