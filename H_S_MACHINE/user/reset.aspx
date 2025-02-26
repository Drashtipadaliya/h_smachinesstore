<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="reset.aspx.cs" Inherits="user_reset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* Styling */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f8f9fa; /* Light background for the body */
        }

        .login-section {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh; /* Full height of the viewport */
            padding: 20px; /* Padding around the section */
        }

        .login-form-area {
            background-color: #b9c7d5; /* Darker background for the form */
            padding: 40px;
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3); /* Shadow for depth */
            width: 100%;
            max-width: 400px; /* Maximum width of the form */
            color: white; /* Text color */
        }

        .login-form input {
            background-color:#b9c7d5; /* Input background */
            color: white;
            border: 1px solid #666;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 4px;
            width: 100%;
            transition: border-color 0.3s; /* Smooth transition for border color */
        }

        .login-form input:focus {
            border-color: #889752; /* Change border color on focus */
            outline: none; /* Remove default outline */
        }

        .login-form button {
            background-color: #889752; /* Button background */
            color: white;
            padding: 10px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            text-align: center;
            transition: background-color 0.3s; /* Smooth transition for background color */
        }

        .login-form button:hover {
            background-color: #5e6937; /* Darker shade on hover */
        }

        .login-form-area h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #ffc107; /* Bright color for the heading */
        }

        .login-form-area .login-form label {
            color: white; /* Ensure labels are visible */
            font-weight: 600;
        }
    </style>
</asp:Content>

<asp:Content ID="Content18" ContentPlaceHolderID="Childuser" Runat="Server">
    <section class="login-section">
        <div class="login-form-area">
            <h2 class="mb-3">Reset Password</h2>
            <!-- ASP.NET Form Controls -->
            <asp:Panel ID="RegisterFormPanel" runat="server" CssClass="login-form">
                <div class="form-group">
                    <label class="fw-semibold">Email</label>
                    <asp:TextBox ID="rpemail" runat="server" CssClass="form-control" Placeholder="Enter email" ReadOnly="true"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="fw-semibold">Old Password</label>
                    <asp:TextBox ID="rpopwd" runat="server" CssClass="form-control" Placeholder="Enter old password" TextMode="Password"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="fw-semibold">New Password</label>
                    <asp:TextBox ID="rpnpwd" runat="server" CssClass="form-control" Placeholder="New password" TextMode="Password"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="fw-semibold">Confirm Password</label>
                    <asp:TextBox ID="rpcpwd" runat="server" CssClass="form-control" Placeholder="Confirm password" TextMode="Password"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Button ID="resetbtn" runat="server" CssClass="btn btn-primary" Text="Reset" OnClick="resetbtn_Click" />
                </div>
            </asp:Panel>
        </div>
    </section>
</asp:Content>