<%@ Page Title="" Language="C#" MasterPageFile="~/user/admin/MasterPage.master" AutoEventWireup="true" CodeFile="view-bl.aspx.cs" Inherits="user_admin_view_bl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="child" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">
        <div class="container border-dark">
            <div class="row">
                <div class="col-md-10 m-auto">
                    <h1 class="text-warning text-center fs-3 fw-bold my-3"> VIEW BILL </h1>
                   <asp:GridView ID="GridView1" runat="server" CssClass="table border border-yellow table-hover border my-5" AutoGenerateColumns="False" DataKeyNames="id">
    <Columns>
        <asp:BoundField DataField="id" HeaderText="id" HeaderStyle-CssClass="fw-bold" InsertVisible="False" ReadOnly="True" SortExpression="id" />
        <asp:BoundField DataField="fname" HeaderText="fname" HeaderStyle-CssClass="fw-bold" SortExpression="fname" />
        <asp:BoundField DataField="lname" HeaderText="lname" HeaderStyle-CssClass="fw-bold" SortExpression="lname" />
        <asp:BoundField DataField="mobile" HeaderText="mobile" HeaderStyle-CssClass="fw-bold" SortExpression="mobile" />
        <asp:BoundField DataField="email" HeaderText="email" HeaderStyle-CssClass="fw-bold" SortExpression="email" />
        <asp:BoundField DataField="state" HeaderText="state" HeaderStyle-CssClass="fw-bold" SortExpression="state" />
        <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
        <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
        <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
        <asp:BoundField DataField="total" HeaderText="total" SortExpression="total" />
    </Columns>
</asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:hns %>" DeleteCommand="DELETE FROM [bill] WHERE [id] = @original_id AND (([fname] = @original_fname) OR ([fname] IS NULL AND @original_fname IS NULL)) AND (([lname] = @original_lname) OR ([lname] IS NULL AND @original_lname IS NULL)) AND (([mobile] = @original_mobile) OR ([mobile] IS NULL AND @original_mobile IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([state] = @original_state) OR ([state] IS NULL AND @original_state IS NULL)) AND (([address] = @original_address) OR ([address] IS NULL AND @original_address IS NULL)) AND (([city] = @original_city) OR ([city] IS NULL AND @original_city IS NULL)) AND (([date] = @original_date) OR ([date] IS NULL AND @original_date IS NULL)) AND (([total] = @original_total) OR ([total] IS NULL AND @original_total IS NULL))" InsertCommand="INSERT INTO [bill] ([fname], [lname], [mobile], [email], [state], [address], [city], [date], [total]) VALUES (@fname, @lname, @mobile, @email, @state, @address, @city, @date, @total)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [bill]" UpdateCommand="UPDATE [bill] SET [fname] = @fname, [lname] = @lname, [mobile] = @mobile, [email] = @email, [state] = @state, [address] = @address, [city] = @city, [date] = @date, [total] = @total WHERE [id] = @original_id AND (([fname] = @original_fname) OR ([fname] IS NULL AND @original_fname IS NULL)) AND (([lname] = @original_lname) OR ([lname] IS NULL AND @original_lname IS NULL)) AND (([mobile] = @original_mobile) OR ([mobile] IS NULL AND @original_mobile IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND (([state] = @original_state) OR ([state] IS NULL AND @original_state IS NULL)) AND (([address] = @original_address) OR ([address] IS NULL AND @original_address IS NULL)) AND (([city] = @original_city) OR ([city] IS NULL AND @original_city IS NULL)) AND (([date] = @original_date) OR ([date] IS NULL AND @original_date IS NULL)) AND (([total] = @original_total) OR ([total] IS NULL AND @original_total IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="original_id" Type="Int32" />
                            <asp:Parameter Name="original_fname" Type="String" />
                            <asp:Parameter Name="original_lname" Type="String" />
                            <asp:Parameter Name="original_mobile" Type="Decimal" />
                            <asp:Parameter Name="original_email" Type="String" />
                            <asp:Parameter Name="original_state" Type="String" />
                            <asp:Parameter Name="original_address" Type="String" />
                            <asp:Parameter Name="original_city" Type="String" />
                            <asp:Parameter DbType="Date" Name="original_date" />
                            <asp:Parameter Name="original_total" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="fname" Type="String" />
                            <asp:Parameter Name="lname" Type="String" />
                            <asp:Parameter Name="mobile" Type="Decimal" />
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Name="state" Type="String" />
                            <asp:Parameter Name="address" Type="String" />
                            <asp:Parameter Name="city" Type="String" />
                            <asp:Parameter DbType="Date" Name="date" />
                            <asp:Parameter Name="total" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="fname" Type="String" />
                            <asp:Parameter Name="lname" Type="String" />
                            <asp:Parameter Name="mobile" Type="Decimal" />
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Name="state" Type="String" />
                            <asp:Parameter Name="address" Type="String" />
                            <asp:Parameter Name="city" Type="String" />
                            <asp:Parameter DbType="Date" Name="date" />
                            <asp:Parameter Name="total" Type="String" />
                            <asp:Parameter Name="original_id" Type="Int32" />
                            <asp:Parameter Name="original_fname" Type="String" />
                            <asp:Parameter Name="original_lname" Type="String" />
                            <asp:Parameter Name="original_mobile" Type="Decimal" />
                            <asp:Parameter Name="original_email" Type="String" />
                            <asp:Parameter Name="original_state" Type="String" />
                            <asp:Parameter Name="original_address" Type="String" />
                            <asp:Parameter Name="original_city" Type="String" />
                            <asp:Parameter DbType="Date" Name="original_date" />
                            <asp:Parameter Name="original_total" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>


