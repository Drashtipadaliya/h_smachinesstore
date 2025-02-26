<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="display.aspx.cs" Inherits="user_display" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .h4 {
    font-family: 'Arial', sans-serif; /* Change font to Arial */
    font-weight: bold; /* Make it bold */
    font-size: 1.5rem; /* Adjust font size */
    color: #007bff; /* Set color to a blue tone */
    text-transform: uppercase; /* Make the text uppercase */
    letter-spacing: 2px; /* Increase letter spacing */
    margin-bottom: 20px; /* Add some space below */
    padding: 10px 0; /* Add padding to the top and bottom */
    border-bottom: 2px solid #007bff; /* Add a blue bottom border */
    display: inline-block; /* Prevent the tag from taking full width */
    background-color: #f8f9fa; /* Set background color */
    border-radius: 5px; /* Rounded corners */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Subtle shadow */
    padding-left: 15px; /* Padding to the left for spacing */
    padding-right: 15px; /* Padding to the right for spacing */
}/* Center the h4 element */
.h4.text-xl-center {
    text-align: center; /* Center the text horizontally */
    width: 100%; /* Ensure the element takes up the full width */
    margin: 0 auto; /* Auto margin to center it in its parent container */
    font-family: 'Arial', sans-serif; /* Font style */
    font-weight: bold; /* Bold font weight */
    font-size: 1.5rem; /* Adjust font size */
    color: #007bff; /* Blue color */
    text-transform: uppercase; /* Make the text uppercase */
    letter-spacing: 2px; /* Increase letter spacing */
    margin-bottom: 20px; /* Add space below the element */
    padding: 10px 0; /* Padding to the top and bottom */
    border-bottom: 2px solid #007bff; /* Add a blue bottom border */
}


        /* Modal container styling */
        .image-modal {
            display: none;
            position: fixed;
            z-index: 1050;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.8);
        }

        /* Modal content styling */
        .image-modal-content {
            margin: auto;
            display: block;
            max-width: 90%;
            max-height: 90%;
            animation: zoomIn 0.3s;
        }

        /* Zoom animation */
        @keyframes zoomIn {
            from {
                transform: scale(0.5);
            }
            to {
                transform: scale(1);
            }
        }

        /* Close button styling */
        .image-modal-close {
            position: absolute;
            top: 20px;
            right: 35px;
            color: #fff;
            font-size: 30px;
            font-weight: bold;
            cursor: pointer;
        }

        .image-modal-close:hover,
        .image-modal-close:focus {
            color: #bbb;
            text-decoration: none;
            cursor: pointer;
        }

        .filter-container {
            margin-bottom: 20px;
            padding: 20px;
            background-color: #f8f9fa;
            border-radius: 8px;
        }

        .filter-item {
            margin-bottom: 15px;
        }

        .card {
            transition: transform 0.3s ease;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .card:hover {
            transform: scale(1.05);
        }

        .clear-button {
            background-color: #dc3545;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .clear-button:hover {
            background-color: #c82333;
        }

        /* Product Image */
        .product-image {
            width: 100%;
            height: 200px;
            object-fit: contain;
            object-position: center top;
            background-color: #f8f9fa;
            border-radius: 8px;
        }

        .card-body {
            padding: 15px;
        }

        .card-title {
            font-size: 1.2rem;
            font-weight: bold;
            color: #333;
        }

        .price {
            color: #28a745;
            font-weight: bold;
        }

        .quantity {
            font-size: 0.9rem;
            color: #6c757d;
        }

        .buy-now-btn {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            margin-top: 10px;
        }

        .buy-now-btn:hover {
            background-color: #0056b3;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }

        .col-md-3 {
            flex: 1 1 calc(25% - 15px);
            max-width: calc(25% - 15px);
        }/* Add these styles inside the <style> section of your page */

.filter-item {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    align-items: center;
    justify-content: space-between;
}

.price-range-container {
    display: flex;
    align-items: center;
    width: 100%;
}

.price-range-left {
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 5px;
}

.price-filter-dropdowns {
    flex: 0;
    display: flex;
    align-items: center;
    gap: 10px;
}

.range-output {
    margin-left: 10px;
    font-size: 1.1rem;
    font-weight: bold;
}

.clear-button {
    background-color: #dc3545;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.clear-button:hover {
    background-color: #c82333;
}

/* Responsive Design */
@media (max-width: 768px) {
    .filter-item {
        flex-direction: column;
        gap: 15px;
    }

    .price-range-container {
        flex-direction: column;
    }

    .price-filter-dropdowns {
        flex-direction: column;
        align-items: flex-start;
    }
    
}

    </style>
</asp:Content>





<asp:Content ID="Content8" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <script>
        function UpdatePriceRange(rangeInput) {
            // Update the displayed value based on the range input
            document.getElementById('RangeOutput').innerText = "₹" + rangeInput.value;

            // Get the PriceFilterStart dropdown to match its selected value based on the range
            let startPriceDropdown = document.getElementById('<%= PriceFilterStart.ClientID %>');
            let endPriceDropdown = document.getElementById('<%= PriceFilterEnd.ClientID %>');

            // Logic to match the dropdown options with the range value
            if (rangeInput.value <= 500) {
                startPriceDropdown.selectedIndex = 0; // ₹500
                endPriceDropdown.selectedIndex = 0;   // ₹5000
            } else if (rangeInput.value > 500 && rangeInput.value <= 2000) {
                startPriceDropdown.selectedIndex = 1; // ₹2000
                endPriceDropdown.selectedIndex = 0;   // ₹5000
            } else if (rangeInput.value > 20000 && rangeInput.value <= 50000) {
                startPriceDropdown.selectedIndex = 2; // ₹25000
                endPriceDropdown.selectedIndex = 1;   // ₹40000
            } else if (rangeInput.value > 100000 && rangeInput.value <= 200000) {
                startPriceDropdown.selectedIndex = 3; // ₹30000
                endPriceDropdown.selectedIndex = 3;   // ₹500000
            } else {
                startPriceDropdown.selectedIndex = -1; // Reset dropdown
                endPriceDropdown.selectedIndex = -1;   // Reset dropdown
            }
        }

        function ClearFilters() {
            document.getElementById("<%= PriceFilterStart.ClientID %>").selectedIndex = 0;
            document.getElementById("<%= PriceFilterEnd.ClientID %>").selectedIndex = 0;
            document.getElementById('PriceRange').value = 500;
            document.getElementById('RangeOutput').innerText = "₹500";
            // Trigger a postback to update products after clearing
            __doPostBack('<%= PriceFilterStart.ClientID %>', '');
            __doPostBack('<%= PriceFilterEnd.ClientID %>', '');
        }
    </script>
</asp:Content>

<asp:Content ID="Content9" ContentPlaceHolderID="Childuser" Runat="Server">
    <br />
    <br />

    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="PriceFilterStart" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="PriceFilterEnd" EventName="SelectedIndexChanged" />
        </Triggers>

        <ContentTemplate>
            <!-- Filter Section -->
            <div class="container">
                <div class="filter-container">
                    <h4 class="h4 text-xl-center">Filters</h4>
                    <!-- Price Filter Section -->
                    <div class="filter-item">
                        <label for="PriceRange">Price:</label>
                        <div class="price-range-container">
                            <!-- Price Range Input -->
                            <div class="price-range-left">
                                <input id="PriceRange" type="range" min="500" max="400000" step="5" value="500" class="price-slider" oninput="UpdatePriceRange(this)">
                                <label class="range-output" id="RangeOutput">₹500</label>
                            </div>

                            <!-- Price Filter Dropdowns -->
                            <div class="price-filter-dropdowns">
                                <asp:DropDownList ID="PriceFilterStart" runat="server" OnSelectedIndexChanged="PriceFilterStart_SelectedIndexChanged1" AutoPostBack="True">
                                    <asp:ListItem Value="500" Text="₹500" />
                                    <asp:ListItem Value="2000" Text="₹2000" />
                                    <asp:ListItem Value="25000" Text="₹25000" />
                                    <asp:ListItem Value="30000" Text="₹30000" />
                                </asp:DropDownList>
                                <span>to</span>
                                <asp:DropDownList ID="PriceFilterEnd" runat="server" OnSelectedIndexChanged="PriceFilterEnd_SelectedIndexChanged1" AutoPostBack="True">
                                    <asp:ListItem Value="5000" Text="₹5000" />
                                    <asp:ListItem Value="40000" Text="₹40000" />
                                    <asp:ListItem Value="45000" Text="₹45000" />
                                    <asp:ListItem Value="400000" Text="₹400000" />
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <!-- Clear Filters Button -->
                    <button class="clear-button" onclick="ClearFilters()">Clear Filters</button>
                </div>
            </div>

            <!-- Product Display Section -->
            <div class="container py-5">
                <div class="text-center mb-4">
                    <h1 class="display-5">Shop</h1>
                    <p class="lead">Not only buying but it's a lifetime partner.</p>
                </div>

                <div class="row">
                    <asp:Repeater ID="DataList2" runat="server">
                        <ItemTemplate>
                            <div class="col-md-3 mb-4">
                                <div class="card shadow-lg h-100">
                                    <asp:Image ID="productImage" runat="server" CssClass="card-img-top img-fluid product-image" AlternateText="Product Image" ImageUrl='<%# "~/img/" + Eval("image") %>' />
                                    <div class="card-body text-center">
                                        <h5 class="card-title text-dark fw-bold"><%# Eval("pname") %></h5>
                                        <p class="price">₹ <%# Eval("price") %></p>
                                        <p class="quantity">Available Quantity: <%# Eval("qnty") %></p>
                                        <a href="sproduct.aspx?id=<%# Eval("id") %>" class="buy-now-btn">
                                            Buy Now <i class="fas fa-shopping-cart ms-2"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

<script>
        function UpdatePriceRange(rangeInput) {
            // Update the displayed value based on the range input
            document.getElementById('RangeOutput').innerText = "₹" + rangeInput.value;

            // Get the PriceFilterStart dropdown to match its selected value based on the range
            let startPriceDropdown = document.getElementById('<%= PriceFilterStart.ClientID %>');
            let endPriceDropdown = document.getElementById('<%= PriceFilterEnd.ClientID %>');

            // Logic to match the dropdown options with the range value
            if (rangeInput.value <= 500) {
                startPriceDropdown.selectedIndex = 0; // ₹500
                endPriceDropdown.selectedIndex = 0;   // ₹5000
            } else if (rangeInput.value > 500 && rangeInput.value <= 2000) {
                startPriceDropdown.selectedIndex = 1; // ₹2000
                endPriceDropdown.selectedIndex = 0;   // ₹5000
            } else if (rangeInput.value > 20000 && rangeInput.value <= 50000) {
                startPriceDropdown.selectedIndex = 2; // ₹25000
                endPriceDropdown.selectedIndex = 1;   // ₹40000
            } else if (rangeInput.value > 100000 && rangeInput.value <= 200000) {
                startPriceDropdown.selectedIndex = 3; // ₹30000
                endPriceDropdown.selectedIndex = 3;   // ₹500000
            } else {
                startPriceDropdown.selectedIndex = -1; // Reset dropdown
                endPriceDropdown.selectedIndex = -1;   // Reset dropdown
            }
        }

        function ClearFilters() {
            document.getElementById("<%= PriceFilterStart.ClientID %>").selectedIndex = 0;
            document.getElementById("<%= PriceFilterEnd.ClientID %>").selectedIndex = 0;
            document.getElementById('PriceRange').value = 1500;
            document.getElementById('RangeOutput').innerText = "₹1500";
        }
    </script>

</asp:Content>

