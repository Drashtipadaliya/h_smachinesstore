<%@ Page Title="" Language="C#" MasterPageFile="~/user/admin/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="user_admin_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="child" Runat="Server">
    <section id="home-section" class="hero">
		  <div class="home-slider owl-carousel">
	      <div class="slider-item js-fullheight">
	      	<div class="overlay"></div>
	        <div class="container-fluid p-0">
	          <div class="row d-md-flex no-gutters slider-text align-items-center justify-content-end" data-scrollax-parent="true">
	          	<img class="one-third order-md-last img-fluid" src="images/bg_1.jpg" alt=""/>
		          <div class="one-forth d-flex align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
		          	<div class="text">
		          		<span class="subheading">SOMTHING NEW ALWAYS</span>
		          		<div class="horizontal">
				            <h2 class="w-100 fs-4 text-white">WELCOME TO ADMIN</h2>
            <p class="w-100 text-gry">SOMTHING ADDED NEW AND VIEW DEFERNT TO YOUR WEBSITE SHOWEN USERS </p>
				            
				            <p><a href="addp.php" class="btn-custom">Discover Now</a></p>
				          </div>
		            </div>
		          </div>
	        	
	        </div>
	      </div></div>
	      </div>
	        </section>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" />
    <asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder2" runat="server"/>
        <asp:Content ID="Content7" ContentPlaceHolderID="ContentPlaceHolder3" runat="server"/>


