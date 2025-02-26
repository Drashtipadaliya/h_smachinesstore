                    <%@ Page Title="View Categories" Language="C#" MasterPageFile="~/user/admin/MasterPage.master" AutoEventWireup="true" CodeFile="view-cty.aspx.cs" Inherits="user_admin_view_cty" %>

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

                            .table-bordered th,
                            .table-bordered td {
                                border: 1px solid #c0a26b !important; /* Match the border color */
                            }

                            .table-hover tbody tr:hover {
                                background-color: #e2e6ea; /* Adjust hover color if needed */
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

                            .img-thumbnail {
                                width: 80px; /* Adjusted image size for consistency */
                                height: 80px;
                                object-fit: cover;
                            }
                        </style>
                    </asp:Content>

                    <asp:Content ID="Content3" ContentPlaceHolderID="child" Runat="Server">
                        <br />
                        <asp:Panel ID="Panel1" runat="server" class="container">
                            <div class="row">
                                <div class="col-md-10 m-auto"> <!-- Adjusted column size -->
                                    <h1 class="text-warning text-center fs-3 fw-bold my-3">View Categories</h1>
                                    <div class="table-responsive">
                                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover"
                                            AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" 
                                            OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
                                            <Columns>
                                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button" 
                                                                  ControlStyle-CssClass="btn btn-outline-warning" />
                                                <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="id">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Category" SortExpression="category">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("category") %>' CssClass="form-control"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("category") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Image" SortExpression="image">
                                                    <EditItemTemplate>
                                                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Image ID="Image1" runat="server" 
                                                                   ImageUrl='<%# "~/img/" + Eval("image") %>' CssClass="img-thumbnail" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                            ConflictDetection="CompareAllValues" 
                                            ConnectionString="<%$ ConnectionStrings:hns %>" 
                                            DeleteCommand="DELETE FROM [category] WHERE [id] = @original_id AND (([category] = @original_category) OR ([category] IS NULL AND @original_category IS NULL)) AND (([image] = @original_image) OR ([image] IS NULL AND @original_image IS NULL))" 
                                            InsertCommand="INSERT INTO [category] ([category], [image]) VALUES (@category, @image)" 
                                            OldValuesParameterFormatString="original_{0}" 
                                            SelectCommand="SELECT * FROM [category]" 
                                            UpdateCommand="UPDATE [category] SET [category] = @category, [image] = @image WHERE [id] = @original_id AND (([category] = @original_category) OR ([category] IS NULL AND @original_category IS NULL)) AND (([image] = @original_image) OR ([image] IS NULL AND @original_image IS NULL))">
                                            <DeleteParameters>
                                                <asp:Parameter Name="original_id" Type="Int32" />
                                                <asp:Parameter Name="original_category" Type="String" />
                                                <asp:Parameter Name="original_image" Type="String" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="category" Type="String" />
                                                <asp:Parameter Name="image" Type="String" />
                                            </InsertParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="category" Type="String" />
                                                <asp:Parameter Name="image" Type="String" />
                                                <asp:Parameter Name="original_id" Type="Int32" />
                                                <asp:Parameter Name="original_category" Type="String" />
                                                <asp:Parameter Name="original_image" Type="String" />
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