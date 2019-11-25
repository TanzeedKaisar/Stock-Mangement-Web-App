<%@ Page Title="" Language="C#" MasterPageFile="~/UI/MasterUI.Master" AutoEventWireup="true" CodeBehind="ReportUI.aspx.cs" Inherits="StockManagmentSystemWebApp.UI.ReportUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContentPlaceHolder" runat="server">
    <div id="templatemo_content">
<div id="report">
			<h2>Reports</h2>

			<div class="product_box margin_r_10">
				<a href="ItemsSummaryUI.aspx"><img
					src="images/templatemo_image_01.jpg" alt="image" /></a>
				<h3>Iteam's Summary</h3>
			</div>

			<div class="product_box margin_r_10">
				<a href="SearchByDateUI.aspx"><img
					src="images/templatemo_image_02.jpg" alt="image" /></a>
				<h3>Search By Date</h3>
			</div>

			<div class="cleaner_h20"></div>

			<div class="cleaner"></div>
		</div></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContentPlaceHolder" runat="server">
</asp:Content>
