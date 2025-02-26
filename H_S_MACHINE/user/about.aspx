<%@ Page Title="About Us" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="user_about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* Modern Style Updates */
        .hero-wrap {
            height: 70vh;
            position: relative;
            background-size: cover;
            background-position: center;
        }

        .hero-content {
            background: rgba(255, 255, 255, 0.9);
            padding: 3rem;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .about-section {
            padding: 5rem 0;
        }

        .video-play-btn {
            width: 80px;
            height: 80px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s;
        }

            .video-play-btn:hover {
                transform: scale(1.1);
                background: #fff;
            }

        .gallery-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            padding: 20px;
        }

        .gallery-item {
            position: relative;
            overflow: hidden;
            border-radius: 8px;
            transition: transform 0.3s;
        }

            .gallery-item img {
                width: 100%;
                height: 200px;
                object-fit: cover;
            }

            .gallery-item:hover {
                transform: translateY(-5px);
            }

        .instagram-icon {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            opacity: 0;
            transition: opacity 0.3s;
            color: #fff;
            font-size: 2rem;
        }

        .gallery-item:hover .instagram-icon {
            opacity: 1;
        }

        .stat-box {
            background: rgba(0,123,255,0.1);
            border-radius: 10px;
            padding: 1.5rem;
            margin: 1rem 0;
        }

        @@media (max-width: 768px) {
            .hero-wrap {
                height: 50vh;
            }
            
            .hero-content {
                padding: 2rem;
                margin: 0 15px;
            }
            
            .video-play-btn {
                width: 60px;
                height: 60px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content10" ContentPlaceHolderID="Childuser" Runat="Server">
    <!-- Hero Section -->
    <div class="hero-wrap" style="background-image: url('images/bg_6.jpg');">
        <div class="container h-100">
            <div class="row h-100 align-items-center justify-content-center">
                <div class="col-lg-8 text-center">
                    <div class="hero-content">
                        <h1 class="mb-3 display-4">About Our Company</h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center">
                                <li class="breadcrumb-item"><a href="index.aspx">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">About</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- About Content Section -->
    <section class="about-section">
        <div class="container">
            <div class="row align-items-center">
                <!-- Video Column -->
                <div class="col-lg-6 mb-5 mb-lg-0">
                    <div class="position-relative">
                         <div class="video-play-btn">
                        <img src="images/about.jpg" alt="About Us" class="img-fluid rounded-lg shadow-lg" />
                        
                        <a href="../img/your-video.mp4" class="position-absolute top-50 start-50 translate-middle popup-vimeo">
                           
                                <span class="icon-play" style="font-size: 2rem; color: #007bff;"></span>
                            </div>
                        </a>
                    </div>
                </div>

                <!-- Text Content Column -->
                <div class="col-lg-6">
                    <div class="ps-lg-5">
                        <h2 class="mb-4 display-5">Established Since 1975</h2>
                        <div class="mb-4">
                            <p class="lead">Pioneers in quality and innovation</p>
                            <p>We've been leading the industry with cutting-edge solutions and exceptional service for over four decades. Our commitment to excellence has made us a trusted partner for thousands of clients worldwide.</p>
                            <div class="row mt-4">
                                <div class="col-6">
                                    <div class="stat-box text-center p-3">
                                        <h3 class="text-primary">50+</h3>
                                        <p>Years Experience</p>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="stat-box text-center p-3">
                                        <h3 class="text-primary">10k+</h3>
                                        <p>Happy Clients</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a href="display.aspx" class="btn btn-primary btn-lg mt-3">Explore Products</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Instagram Gallery Section -->
    <section class="py-5 bg-light">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-8 mx-auto text-center">
                    <h2 class="mb-3">Follow Our Journey</h2>
                    <p class="lead">Discover our latest updates on Instagram</p>
                </div>
            </div>
            
            <div class="gallery-grid">
                <div class="gallery-item">
                    <img src="images/gallery-1.jpg" alt="Gallery" />
                    <span class="instagram-icon">
                        <i class="icon-instagram"></i>
                    </span>
                </div>
                <div class="gallery-item">
                    <img src="images/gallery-2.jpg" alt="Gallery" />
                    <span class="instagram-icon">
                        <i class="icon-instagram"></i>
                    </span>
                </div>
                <div class="gallery-item">
                    <img src="images/gallery-3.jpg" alt="Gallery" />
                    <span class="instagram-icon">
                        <i class="icon-instagram"></i>
                    </span>
                </div>
                <div class="gallery-item">
                    <img src="images/gallery-4.jpg" alt="Gallery" />
                    <span class="instagram-icon">
                        <i class="icon-instagram"></i>
                    </span>
                </div>
                <div class="gallery-item">
                    <img src="images/gallery-5.jpg" alt="Gallery" />
                    <span class="instagram-icon">
                        <i class="icon-instagram"></i>
                    </span>
                </div>
               
            </div>
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content20" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <!-- Magnific Popup Script -->
    <script>
        $(document).ready(function() {
            $('.popup-vimeo').magnificPopup({
                type: 'iframe',
                mainClass: 'mfp-fade',
                removalDelay: 160,
                preloader: false,
                fixedContentPos: false
            });
        });
    </script>
</asp:Content>