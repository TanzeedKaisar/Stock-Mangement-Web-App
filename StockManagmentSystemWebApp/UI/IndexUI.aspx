<%@ Page Language="C#" MasterPageFile="~/UI/MasterUI.Master" AutoEventWireup="true" CodeBehind="IndexUI.aspx.cs" Inherits="StockManagmentSystemWebApp.UI.IndexUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="bodyContentPlaceHolder">
    <%--<div class="main-content ">--%>
		<div id="templatemo_content">

			<h2>Stock Management System</h2>

			<div class="product_box margin_r_10">
				<a href="CategoryUI.aspx"><img
					src="images/templatemo_image_01.jpg" alt="image" /></a>
				<h3>Category Setup</h3>
			</div>

			<div class="product_box margin_r_10">
				<a href="CompanyUI.aspx"><img
					src="images/templatemo_image_02.jpg" alt="image" /></a>
				<h3>Company Setup</h3>
			</div>

			<div class="product_box margin_r_10">

				<a href="ItemUI.aspx"><img
					src="images/templatemo_image_03.jpg" alt="image" /></a>
				<h3>Item Setup</h3>
			</div>

			<div class="product_box margin_r_10">

				<a href="StockInUI.aspx"><img
					src="images/templatemo_image_04.jpg" alt="image" /></a>
				<h3>Stock In</h3>
			</div>

			<div class="product_box margin_r_10">

				<a href="StockOutUI.aspx"> <img
					src="images/templatemo_image_05.jpg" alt="image" /></a>
				<h3>Stock Out</h3>
			</div>

			<div class="product_box margin_r_10">
				<a href="ReportUI.aspx"> <img src="images/templatemo_image_06.jpg"
					alt="image" />
				</a>
				<h3>Report</h3>
			</div>
			<div class="cleaner_h20"></div>

			<div class="cleaner"></div>
		</div>
	<%--</div>--%>
</asp:Content>
<asp:Content runat="server" ID="footerContent" ContentPlaceHolderID="footerContentPlaceHolder">
    
</asp:Content>
