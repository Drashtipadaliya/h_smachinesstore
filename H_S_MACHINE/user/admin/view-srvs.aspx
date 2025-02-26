<%@ Page Title="View Services" Language="C#" MasterPageFile="~/user/admin/MasterPage.master" AutoEventWireup="true" CodeFile="view-srvs.aspx.cs" Inherits="user_admin_view_srvs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/css/bootstrap.min.css" integrity="sha512-e76D7zcd0ejTlbx/UwULM/+36/HslB8R1i4h2VZ5kFY6iZmU6QDQ5E5X6bkO3JhUJ6Kbx/g6WmlGs4108dXg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .table th, .table td {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .table th {
            background-color: #495057; /* Match Products page header color */
            color: white;
        }

        .btn-outline-warning {
            color: #c0a26b;
            border-color: #c0a26b;
        }

        .btn-outline-warning:hover {
            color: #fff;
            background-color: #c0a26b;
            border-color: #c0a26b;
        }

        .table-bordered th,
        .table-bordered td {
            border: 1px solid #c0a26b !important; /* Match the border color */
        }

        .table-hover tbody tr:hover {
            background-color: #e2e6ea; /* Adjust hover color if needed */
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
    <asp:Panel ID="Panel1" runat="server" class="container">
        <div class="row">
            <div class="col-md-10 m-auto"> <!-- Adjusted column size -->
                <h1 class="text-warning text-center fs-3 fw-bold my-3">View Services</h1>
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover"
                        AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" 
                        OnRowUpdating="GridView1_RowUpdating">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-outline-warning" ShowEditButton="True">
                                <ControlStyle CssClass="btn btn-outline-warning" />
                            </asp:CommandField>
                            <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="id">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name" SortExpression="name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Image" SortExpression="image">
                                <EditItemTemplate>
                                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/img/" + Eval("image") %>' CssClass="img-thumbnail" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Details" SortExpression="details">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("details") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("details") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                   
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:hns %>" 
                        DeleteCommand="DELETE FROM [service] WHERE [id] = @original_id" 
                        InsertCommand="INSERT INTO [service] ([name], [image], [details]) VALUES (@name, @image, @details)" 
                        OldValuesParameterFormatString="original_{0}" 
                        SelectCommand="SELECT * FROM [service]" 
                        UpdateCommand="UPDATE [service] SET [name] = @name, [image] = @image, [details] = @details WHERE [id] = @original_id">
                        <DeleteParameters>
                            <asp:Parameter Name="original_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="image" Type="String" />
                            <asp:Parameter Name="details" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="image" Type="String" />
                            <asp:Parameter Name="details" Type="String" />
                            <asp:Parameter Name="original_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
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