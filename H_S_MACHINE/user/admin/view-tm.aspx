<%@ Page Title="View Team Members" Language="C#" MasterPageFile="~/user/admin/MasterPage.master" AutoEventWireup="true" CodeFile="view-tm.aspx.cs" Inherits="user_admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.2/css/bootstrap.min.css" integrity="sha512-e76D7zcd0ejTlbx/UwULM/+36/HslB8R1i4h2VZ5kFY6iZmU6QDQ5E5X6bkO3JhUJ6Kbx/g6WmlGs4108dXg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .table th, .table td {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            text-align: center; /* Center text horizontally */
        }

        .table th {
            background-color: #495057; /* Header color */
            color: white; /* Text color for header */
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
            border: 1px solid #c0a26b !important; /* Border color */
        }

        .table-hover tbody tr:hover {
            background-color: #e2e6ea; /* Hover color */
        }

        .img-thumbnail {
            width: 80px; /* Consistent thumbnail size */
            height: 80px;
            object-fit: cover;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="child" Runat="Server">
    <br />
    <asp:Panel ID="Panel1" runat="server" class="container">
        <div class="row">
            <div class="col-md-10 m-auto"> <!-- Center column -->
                <h1 class="text-warning text-center fs-3 fw-bold my-3">View Team Members</h1>
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnRowUpdating="GridView1_RowUpdating" CssClass="table table-bordered table-hover">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-outline-warning" />
                            <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="id">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name" SortExpression="name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
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
                            <asp:TemplateField HeaderText="Work" SortExpression="wrk">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("wrk") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("wrk") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Experience" SortExpression="exp">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("exp") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("exp") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:hns %>" 
                        DeleteCommand="DELETE FROM [team] WHERE [id] = @original_id" 
                        InsertCommand="INSERT INTO [team] ([name], [image], [wrk], [exp]) VALUES (@name, @image, @wrk, @exp)" 
                        SelectCommand="SELECT * FROM [team]" 
                        UpdateCommand="UPDATE [team] SET [name] = @name, [image] = @image, [wrk] = @wrk, [exp] = @exp WHERE [id] = @original_id" 
                        OldValuesParameterFormatString="original_{0}">
                        <DeleteParameters>
                            <asp:Parameter Name="original_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="image" Type="String" />
                            <asp:Parameter Name="wrk" Type="String" />
                            <asp:Parameter Name="exp" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="image" Type="String" />
                            <asp:Parameter Name="wrk" Type="String" />
                            <asp:Parameter Name="exp" Type="Int32" />
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