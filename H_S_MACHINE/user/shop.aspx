<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="shop.aspx.cs" Inherits="user_shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
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

        /* Card styling */
        .product-card {
            margin-bottom: 30px; /* Space between rows */
        }

        .card {
            transition: transform 0.2s; /* Animation for hover effect */
        }

        .card:hover {
            transform: scale(1.05); /* Slightly enlarge card on hover */
        }

        /* Centering the cards */
        .row {
            display: flex;
            flex-wrap: wrap;
            justify-content: center; /* Center the cards */
        }

        .col {
            flex: 1 1 300px; /* Allow cards to grow and shrink, with a minimum width */
            max-width: 300px; /* Set a maximum width for the cards */
            margin: 10px; /* Add some margin around the cards */
        }
    </style>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="Childuser" Runat="Server">
    <div class="container py-5">
        <div class="text-center mb-4">
            <h1 class="display-5">SHOPPING</h1>
            <p class="lead">Not only buying but it's a lifetime partner.</p>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hns %>" 
            SelectCommand="SELECT * FROM [product] WHERE ([catgry] = @catgry)  AND ([qnty]) > 0">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="mobile" Name="catgry" QueryStringField="cat" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <div class="row">
            <asp:DataList ID="DataList1" runat="server" DataKeyField="id" DataSourceID="SqlDataSource1" RepeatDirection="Vertical" RepeatColumns="3">
                <ItemTemplate>
                    <div class="col mb-4">
                        <div class="card shadow-lg h-100 product-card">
                            <asp:Image 
                                ID="Image1" 
                                runat="server" 
                                CssClass="card-img-top img-fluid product-image" 
                                AlternateText="Product Image"
                                ImageUrl='<%# "~/img/" + Eval("image") %>'
                                style="width:  100%; height: 200px; object-fit: contain; object-position: center top; background-color: #f8f9fa;" 
                                onclick='<%# "openModal(\"" + ResolveUrl("~/img/") + Eval("image") + "\")" %>' />

                            <div class="card-body text-center">
                                <h5 class="card-title text-dark fw-bold"><%# Eval("pname") %></h5>
                                <p class="text-success fw-bold mb-2">₹ <%# Eval("price") %></p>
                                <p class="text-muted">Available Quantity: <%# Eval("qnty") %></p>
                                <a href="sproduct.aspx?id=<%# Eval("id") %>" class="btn btn-primary mt-3">
                                    View Details <i class="fas fa-shopping-cart ms-2"></i>
                                </a>

                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>

    <div class="image-modal">
        <span class="image-modal-close" onclick="this.parentElement.style.display='none'">&times;</span>
        <img class="image-modal-content" id="img01">
    </div>

    <script>
        function openModal(imageUrl) {
            var modal = document.querySelector('.image-modal');
            var modalImg = document.querySelector('.image-modal-content');
            modal.style.display = "block";
            modalImg.src = imageUrl;
        }

        window.onclick = function(event) {
            var modal = document.querySelector('.image-modal');
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content19" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

<asp:Content ID="Content20" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
    
<asp:Content ID="Content21" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>  