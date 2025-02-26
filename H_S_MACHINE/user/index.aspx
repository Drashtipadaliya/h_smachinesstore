<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="user_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="Childuser" Runat="Server">
    <br />
    <br />
    <!-- Hero Section -->
    <section id="home-section" class="hero">
        <div class="home-slider owl-carousel">
            <div class="slider-item js-fullheight">
                <div class="overlay"></div>
                <div class="container-fluid p-0">
                    <div class="row d-md-flex no-gutters slider-text align-items-center justify-content-center">
                        <img class="one-third order-md-last img-fluid" src="images/bg_1.jpg" alt="">
                        <div class="col-md-6 text-center ftco-animate">
                            <div class="text">
                                <span class="subheading">#SOMETHING NEW ALWAYS</span>
                                <h1 class="mb-4 mt-3">Machines Collection 2024</h1>
                                <p class="mb-4">Discover the best machines of the year. High performance, reliability, and style.</p>
                                <p><a href="shop.aspx" class="btn btn-primary px-4 py-2">Discover Now</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="slider-item js-fullheight">
                <div class="overlay"></div>
                <div class="container-fluid p-0">
                    <div class="row d-md-flex no-gutters slider-text align-items-center justify-content-center">
                        <img class="one-third order-md-last img-fluid" src="images/bg_2.jpg" alt="">
                        <div class="col-md-6 text-center ftco-animate">
                            <div class="text">
                                <span class="subheading">#DISCOVER MORE</span>
                                <h1 class="mb-4 mt-3">Latest Arrivals</h1>
                                <p class="mb-4">Explore our new collection of products, crafted with precision and passion.</p>
                                <p><a href="shop.aspx" class="btn btn-primary px-4 py-2">Shop Now</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Services Section -->
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center mb-5">
                <div class="col-md-8 text-center">
                    <h2 class="mb-4">Our Services</h2>
                    <p>We provide a range of services tailored to meet your needs. Explore what we have to offer.</p>
                </div>
            </div>
          <div class="row g-4"> <!-- Adjusted gap between cards -->
    <asp:Repeater ID="serviceRepeater" runat="server" OnItemCommand="serviceRepeater_ItemCommand">
        <ItemTemplate>
            <div class="col-6 col-sm-4 col-md-3"> <!-- Adjusted column sizes for smaller cards -->
                <div class="card border-0 shadow text-center" style="height: 150px;"> <!-- Set a fixed height for the card -->
                    <div class="d-flex justify-content-center align-items-center" style="height: 100%;"> <!-- Centering the image -->
                        <asp:Image ID="ImageService" runat="server" 
                                   ImageUrl='<%# "~//img//" + Eval("image") %>' 
                                   CssClass="card-img-top img-fluid fixed-image-size" />
                    </div>
                    <div class="card-body p-1"> <!-- Reduced padding for a more compact look -->
                        <h5 class="card-title" style="font-size: 0.9rem; margin-bottom: 0;"> <%# Eval("name") %> </h5> <!-- Smaller font size -->
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>

<style>
    .fixed-image-size {
        max-height: 80px; /* Set a maximum height for the images */
        width: auto; /* Maintain aspect ratio */
        object-fit: contain; /* Ensure the image fits within the area */
    }

    .card {
        transition: transform 0.2s; /* Add a transition effect */
        height: 150px; /* Fixed height for the card */
    }

    .card:hover {
        transform: scale(1.05); /* Slightly enlarge the card on hover */
    }
</style>
        </div>
    </section>

    <style>
        .fixed-image-size {
            max-height: 100px; /* Set a maximum height for the images */
            width: auto; /* Maintain aspect ratio */
            object-fit: contain; /* Ensure the image fits within the area */
        }

        .card {
            transition: transform 0.2s; /* Add a transition effect */
            height: 100%; /* Ensure cards take full height */
        }

        .card:hover {
            transform: scale(1.05); /* Slightly enlarge the card on hover */
        }
    </style>

    <!-- Categories Section -->
  <!-- Categories Section -->
<section class="ftco-section bg-light">
    <div class="container">
        <div class="row justify-content-center mb-4">
            <div class="col-md-8 text-center">
                <h2>Shop by Category</h2>
                <p>Browse through our wide range of categories to find the perfect product for you.</p>
            </div>
        </div>
        <div class="row g-4"> <!-- Adjusted gap between cards -->
            <asp:Repeater ID="categoryRepeater" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="col-md-4 col-lg-3 mb-4"> <!-- Added mb-4 for margin-bottom -->
                        <div class="card border-0 shadow text-center d-flex flex-column" style="height: 250px;"> <!-- Set a fixed height for the card -->
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~//img//" + Eval("image") %>' CssClass="card-img-top img-fluid" style="max-height: 100px; object-fit: contain;" />
                            <div class="card-body d-flex flex-column justify-content-between"> <!-- Use flexbox to ensure equal height -->
                                <h5 class="card-title" style="min-height: 40px;"> <%# Eval("category") %> </h5> <!-- Set a minimum height for the title -->
                                <a href="shop.aspx?cat=<%# Eval("category") %>" class="btn btn-outline-primary btn-sm mt-auto">View All</a> <!-- Use mt-auto to push the button to the bottom -->
                            </div>
                        </div> 
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hns %>" SelectCommand="SELECT * FROM [category]"></asp:SqlDataSource>
        </div>
    </div>
</section>

    <!-- Featured Deal Section -->
    <section class="ftco-section ftco-deal bg-primary text-white">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <img src="images/prod-1.jpg" class="img-fluid rounded" alt="Deal of the Month">
                </div>
                <div class="col-md-6 text-center">
                    <h2 class="mb-3">Deal of the Month</h2>
                    <p class="mb-4">Don't miss out on this amazing deal!</p>
                    <h3>
                        <a href="#" class="text-white fw-bold">HP Laptop 15s</a>
                    </h3>
                    <p class="price">
                        <h2 class="text-decoration-line-through text-black-50 ">30% off</h2>                                                
                        <h1 class="text-warning fs-6">₹29000</h1>
                    </p>                                                                                                                                                                                                                            
                    <p>
                        <a href="display.aspx" class="btn btn-light btn-lg">Shop Now</a>                                                                                                           
                    </p>                                                    
                </div>
            </div>
        </div>
    </section>                                                                                                                                              
</asp:Content>

<asp:Content ID="Content19" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content20" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content21" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>