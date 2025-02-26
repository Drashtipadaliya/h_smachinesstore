<%@ Page Title="View Feedback" Language="C#" MasterPageFile="~/user/admin/MasterPage.master" AutoEventWireup="true" CodeFile="view-fb.aspx.cs" Inherits="user_admin_view_fb" %>

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
            <div class="col-md-10 m-auto"> <!-- Centered column -->
                <h1 class="text-warning text-center fs-3 fw-bold my-3">View Feedback</h1>
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
                        <asp:TemplateField HeaderText="Email" SortExpression="email">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("email") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Subject" SortExpression="subject">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("subject") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("subject") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Message" SortExpression="message">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("message") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("message") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConflictDetection="CompareAllValues" 
                    ConnectionString="<%$ ConnectionStrings:hns %>" 
                    DeleteCommand="DELETE FROM [contact] WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([subject] = @original_subject) OR ([subject] IS NULL AND @original_subject IS NULL)) AND (([message] = @original_message) OR ([message] IS NULL AND @original_message IS NULL))" 
                    InsertCommand="INSERT INTO [contact] ([name], [email], [subject], [message]) VALUES (@name, @email, @subject, @message)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT * FROM [contact]" 
                    UpdateCommand="UPDATE [contact] SET [name] = @name, [email] = @email, [subject] = @subject, [message] = @message WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([subject] = @original_subject) OR ([subject] IS NULL AND @original_subject IS NULL)) AND (([message] = @original_message) OR ([message] IS NULL AND @original_message IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_id" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_email" Type="String" />
                        <asp:Parameter Name="original_subject" Type="String" />
                        <asp:Parameter Name="original_message" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="subject" Type="String" />
                        <asp:Parameter Name="message" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="subject" Type="String" />
                        <asp:Parameter Name="message" Type="String" />
                        <asp:Parameter Name="original_id" Type="Int32" />
                        <asp:Parameter Name="original_name" Type="String" />
                        <asp:Parameter Name="original_email" Type="String" />
                        <asp:Parameter Name="original_subject" Type="String" />
                        <asp:Parameter Name="original_message" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
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