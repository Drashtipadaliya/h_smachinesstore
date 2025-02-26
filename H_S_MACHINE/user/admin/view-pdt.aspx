<%@ Page Title="View Products" Language="C#" MasterPageFile="~/user/admin/MasterPage.master" AutoEventWireup="true" CodeFile="view-pdt.aspx.cs" Inherits="user_admin_view_pdt" %>

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

        .table {
            width: 100%; /* Ensure table takes full width */
            table-layout: auto; /* Allow table to grow based on content */
        }

        .img-thumbnail {
            width: 100px;
            height: 100px;
            object-fit: cover;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="child" Runat="Server">
    <br /> <br /> <br />
    <asp:DropDownList ID="ddlCategories" runat="server" CssClass="form-control" AutoPostBack="True" 
        OnSelectedIndexChanged="ddlCategories_SelectedIndexChanged">
        <asp:ListItem Text="Select Category" Value="Select Category" />
    </asp:DropDownList>
    <div class="container my-5">
        <div class="row">
            <div class="col-md-10 m-auto">
                <h1 class="text-warning text-center fs-3 fw-bold my-3">View Products</h1>
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover"
                        AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnRowUpdating="GridView1_RowUpdating">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" EditText="Edit" DeleteText="Delete" />
                            <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="id">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product Name" SortExpression="pname">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Text='<%# Bind("pname") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("pname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price" SortExpression="price">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Bind("price") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Image" SortExpression="image">
                                <EditItemTemplate>
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" CssClass="img-thumbnail" ImageUrl='<%# "~/img/" + Eval("image") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Category" SortExpression="catgry">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("catgry") %>' 
                                        DataSourceID="SqlDataSource2" DataTextField="category" DataValueField="category" CssClass="form-control"></asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("catgry") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quantity" SortExpression="qnty">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Text='<%# Bind("qnty") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("qnty") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description" SortExpression="dcn">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Text='<%# Bind("dcn") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("dcn") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hns %>"
                        SelectCommand="SELECT * FROM [product] WHERE (@catgry IS NULL OR [catgry] = @catgry)" 
                        DeleteCommand="DELETE FROM [product] WHERE [id] = @id"
                        InsertCommand="INSERT INTO [product] ([pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (@pname, @price, @image, @catgry, @qnty, @dcn)"
                        UpdateCommand="UPDATE [product] SET [pname] = @pname, [price] = @price, [image] = @image, [catgry] = @catgry, [qnty] = @qnty, [dcn] = @dcn WHERE [id] = @id">
                        <SelectParameters>
                            <asp:Parameter Name="catgry" Type="String" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="pname" Type="String" />
                            <asp:Parameter Name="price" Type="Decimal" />
                            <asp:Parameter Name="image" Type="String" />
                            <asp:Parameter Name="catgry" Type="String" />
                            <asp:Parameter Name="qnty" Type="Int32" />
                            <asp:Parameter Name="dcn" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="pname" Type="String" />
                            <asp:Parameter Name="price" Type="Decimal" />
                            <asp:Parameter Name="image" Type="String" />
                            <asp:Parameter Name="catgry" Type="String" />
                            <asp:Parameter Name="qnty" Type="Int32" />
                            <asp:Parameter Name="dcn" Type="String" />
                            <asp:Parameter Name="id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:hns %>"
                        SelectCommand="SELECT [category] FROM [category]"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Additional content can be added here if needed -->
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <!-- Additional content can be added here if needed -->
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
</asp:Content>