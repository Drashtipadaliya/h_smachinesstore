<%@ Page Title="" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="user_feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="Childuser" Runat="Server">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

 


<section>
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.php">Home</a></span> <span>Contact</span></p>
            <h1 class="mb-0 bread">is this done!?</h1>
			<h4 class="text-secondary">WHATS NEW? CAN YOU SUGGESTION!</h4>
          </div>
        </div>
      </div>
    </div> 





    <br />

    </section>
    <section class="ftco-gallery ftco-section ftco-no-pb">
    	<div class="container">
    		<div class="row justify-content-center">
    			<div class="col-md-8 heading-section text-center mb-4 ftco-animate">
             <h2 class="mb-4">Follow Us On Instagram</h2>
            <p>Physical system that uses power to apply forces and control movement to perform an action.</p>
        		</div>
     		</div>
    	</div>
         <div class="contenter">
                <div class="row">
                    <div class="col-md-6 bg-white mt-5 m-auto shadow font-monospace border border-info">
                        <asp:Panel ID="ContactFormPanel" runat="server" CssClass="bg-white p-5 contact-form">
                            <h3 class="text-warning text-center fs-3 fw-bold my-3">Give Your Suggestion</h3>
                            <asp:Label ID="NameLabel" runat="server" Text="Name" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="NameTextBox" runat="server" CssClass="form-control" Placeholder="Your Name"  Required="true" ReadOnly="True"></asp:TextBox>
                            <asp:Label ID="EmailLabel" runat="server" Text="Email" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control" Placeholder="Your Email" Required="true" ReadOnly="True" TextMode="Email"></asp:TextBox>
                            <asp:Label ID="SubjectLabel" runat="server" Text="Subject" CssClass="form-label"></asp:Label>
                            <asp:DropDownList ID="SubjectDropDown" runat="server" CssClass="form-select" DataSourceID="SqlDataSource1" DataTextField="category" DataValueField="category">
                                <asp:ListItem Text="Select" Value="" />
                               
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hns %>" SelectCommand="SELECT [category] FROM [category]"></asp:SqlDataSource>
                            <br />
                            <asp:Label ID="MessageLabel" runat="server" Text="Message" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="MessageTextBox" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="7" Placeholder="Message"></asp:TextBox>
                            <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-danger w-100 mt-3" OnClick="SubmitButton_Click" />
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </section>
       	<div class="container-fluid px-0">
    		<div class="row no-gutters">
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-1.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-1.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-2.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-2.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-3.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-3.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-4.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-4.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-5.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-5.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-6.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-6.jpg);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
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


