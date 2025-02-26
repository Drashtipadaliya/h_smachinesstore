<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="order.aspx.cs" Inherits="user_order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* Overall styling for the order receipt panel */
        .order-receipt-panel {
            border: none;
            padding: 30px;
            border-radius: 15px;
            background-color: #f9f9f9;
            width: 100%; /* Full width */
            max-width: 650px; /* Limit max width */
            margin: 50px auto; /* Center the panel */
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1); /* Soft shadow */
            font-family: 'Arial', sans-serif;
            color: #333;
        }

        /* Title style */
        .order-receipt-panel h3 {
            font-size: 28px;
            color: #444;
            margin-bottom: 25px;
            text-align: center;
            font-weight: 700;
        }

        /* Labels and values */
        .order-receipt-panel .row {
            margin-bottom: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .order-receipt-panel .label {
            font-weight: 600;
            color: #555;
            font-size: 16px;
        }

        .order-receipt-panel .value {
            font-size: 16px;
            color: #777;
            font-weight: 400;
        }

        /* Custom line break for larger viewports */
        .order-receipt-panel hr {
            border: none;
            height: 2px;
            background-color: #FF5722;
            margin: 20px 0;
        }

        /* Download button styles */
        .btn-download {
            background-color: #FF5722;
            color: #fff;
            border: none;
            padding: 14px 30px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
            font-size: 18px;
            font-weight: bold;
            margin-top: 30px;
            display: inline-block;
        }

        .btn-download:hover {
            background-color: #e64a19;
            transform: scale(1.05);
        }

        /* Responsive styles */
        @media (max-width: 768px) {
            .order-receipt-panel {
                padding: 20px;
                margin: 20px;
            }

            .order-receipt-panel h3 {
                font-size: 24px;
            }

            .order-receipt-panel .label {
                font-size: 14px;
            }

            .order-receipt-panel .value {
                font-size: 14px;
            }

            .btn-download {
                width: 100%;
                padding: 12px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="Childuser" Runat="Server">
    <div class="row justify-content-center">
        <div class="col-lg-12">
            <asp:Panel ID="OrderReceiptPanel" runat="server" Visible="false" CssClass="order-receipt-panel">
                <h3>Order Receipt</h3>
                <hr>

                <div class="row">
                    <span class="label">First Name:</span>
                    <span class="value"><asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label></span>
                </div>

                <div class="row">
                    <span class="label">Last Name:</span>
                    <span class="value"><asp:Label ID="lblLastName" runat="server" Text=""></asp:Label></span>
                </div>

                <div class="row">
                    <span class="label">Product Name(s):</span>
                    <span class="value"><asp:Literal ID="lblpname" runat="server" Text=""></asp:Literal></span>
                </div>

                <div class="row">
                    <span class="label">Quantity(s):</span>
                    <span class="value"><asp:Label ID="TotalQuantityLabel" runat="server" Text="0"></asp:Label></span>
                </div>

                <div class="row">
                    <span class="label">Email:</span>
                    <span class="value"><asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></span>
                </div>

                <div class="row">
                    <span class="label">Phone No:</span>
                    <span class="value"><asp:Label ID="lblPhone" runat="server" Text=""></asp:Label></span>
                </div>

                <div class="row">
                    <span class="label">Address:</span>
                    <span class="value"><asp:Label ID="lblAddress" runat="server" Text=""></asp:Label></span>
                </div>

                <div class="row">
                    <span class="label">City:</span>
                    <span class="value"><asp:Label ID="lblCity" runat="server"></asp:Label></span>
                </div>

                <div class="row">
                    <span class="label">Date:</span>
                    <span class="value"><asp:Label ID="lblDate" runat="server" Text=""></asp:Label></span>
                </div>

                <div class="row">
                    <span class="label">Total Amount:</span>
                    <span class="value">Rs. <b><asp:Label ID="lblTotalAmount" runat="server" Text=""></asp:Label> /-</b></span>
                </div>

                <div class="row">
                    <span class="label">Payment Method:</span>
                    <span class="value"><b>Cash on delivery</b></span>
                </div>

                <div class="text-center">
                    <asp:Button ID="btnDownload" runat="server" Text="Download Receipt" CssClass="btn-download" OnClick="btnDownload_Click" />
                </div>

            </asp:Panel>
        </div>
    </div>
</asp:Content>
