<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="team.aspx.cs" Inherits="user_team" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    .team-member-card {
        background: linear-gradient(135deg, #1e1e2f, #2a2a3e); /* Stylish gradient */
        border-radius: 16px; /* Slightly rounded corners */
        overflow: hidden;
        box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2); /* Softer shadow for depth */
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        position: relative;
        color: #ffffff; /* Ensure white text for readability */
        font-family: "Poppins", sans-serif; /* Modern font */
    }

    .team-member-card:hover {
        transform: translateY(-10px); /* Lift effect on hover */
        box-shadow: 0 15px 25px rgba(0, 0, 0, 0.3); /* Deeper shadow on hover */
    }

    .team-member-img-container {
        position: relative;
        overflow: hidden;
        border-bottom: 4px solid #ffffff; /* Divider between image and info */
    }

    .team-member-img {
        width: 100%;
        height: 250px;
        object-fit: cover;
        transition: transform 0.3s ease, filter 0.3s ease;
    }

    .team-member-card:hover .team-member-img {
        transform: scale(1.05); /* Slight zoom effect */
        filter: brightness(0.9); /* Dim effect for hover */
    }

    .team-member-info {
        padding: 20px;
        text-align: center;
    }

    .team-member-name {
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .team-member-qualification {
        font-size: 14px;
        margin-bottom: 8px;
        color: #cccccc; /* Lighter text for secondary details */
    }

    .team-member-experience {
        font-size: 16px;
        color: #ffffff; /* Bright text for key information */
    }

    .team-member-info::after {
        content: "";
        display: block;
        width: 50px;
        height: 2px;
        background: #ffffff;
        margin: 10px auto 0; /* Decorative separator */
    }
</style>

</asp:Content>

<asp:Content ID="Content9" ContentPlaceHolderID="Childuser" Runat="Server">
  
    <asp:Panel ID="Panel1" runat="server">
        <!-- Start Team Member Section -->
        <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
            <div class="container">
                <div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
                        <h1 class="mb-0 bread">OUR TEAM</h1>
                    </div>
                </div>
            </div>
        </div>

        <section id="team" class="team-member-section">
            <div class="container">
                <div class="row mb-5 text-center">
                    <div class="col-12">
                        <!-- You can add a title or description here -->
                    </div>
                </div>

                <div class="row">
                   <asp:Repeater ID="TeamRepeater" runat="server" DataSourceID="SqlDataSource1">
    <ItemTemplate>
        <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
            <div class="team-member-card">
                <div class="team-member-img-container">
                    <asp:Image ID="Image1" ImageUrl='<%# "../img/" + Eval("image") %>' runat="server" CssClass="img-fluid team-member-img" alt='<%# Eval("name") %>' />
                </div>
                <div class="team-member-info">
                    <h4 class="team-member-name"><%# Eval("name") %></h4>
                    <p class="team-member-qualification"><%# Eval("wrk") %></p>
                    <p class="team-member-experience">Experience: <%# Eval("exp") %></p>
                </div>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>
 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:hns %>" DeleteCommand="DELETE FROM [team] WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([image] = @original_image) OR ([image] IS NULL AND @original_image IS NULL)) AND (([wrk] = @original_wrk) OR ([wrk] IS NULL AND @original_wrk IS NULL)) AND (([exp] = @original_exp) OR ([exp] IS NULL AND @original_exp IS NULL))" InsertCommand="INSERT INTO [team] ([name], [image], [wrk], [exp]) VALUES (@name, @image, @wrk, @exp)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [team]" UpdateCommand="UPDATE [team] SET [name] = @name, [image] = @image, [wrk] = @wrk, [exp] = @exp WHERE [id] = @original_id AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([image] = @original_image) OR ([image] IS NULL AND @original_image IS NULL)) AND (([wrk] = @original_wrk) OR ([wrk] IS NULL AND @original_wrk IS NULL)) AND (([exp] = @original_exp) OR ([exp] IS NULL AND @original_exp IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="original_id" Type="Int32" />
                            <asp:Parameter Name="original_name" Type="String" />
                            <asp:Parameter Name="original_image" Type="String" />
                            <asp:Parameter Name="original_wrk" Type="String" />
                            <asp:Parameter Name="original_exp" Type="Int32" />
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
                            <asp:Parameter Name="original_name" Type="String" />
                            <asp:Parameter Name="original_image" Type="String" />
                            <asp:Parameter Name="original_wrk" Type="String" />
                            <asp:Parameter Name="original_exp" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </section>
        <!-- End Team Member Section -->
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content19" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content20" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content21" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>


