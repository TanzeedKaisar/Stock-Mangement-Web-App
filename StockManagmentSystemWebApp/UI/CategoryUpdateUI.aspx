<%@ Page Title="" Language="C#" MasterPageFile="~/UI/MasterUI.Master" AutoEventWireup="true" CodeBehind="CategoryUpdateUI.aspx.cs" Inherits="StockManagmentSystemWebApp.UI.CategoryUpdateUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContentPlaceHolder" runat="server">
    <div class="contact-area">
        <h1>&nbsp;</h1>
        <h1>&nbsp;&nbsp;&nbsp; Category Update</h1>
        <div class="formdesign">

            <div>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Category Name"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:HiddenField ID="idHiddenField" runat="server"/>
                            <asp:TextBox ID="categoryNameTextBox" onkeydown="return alphaOnly(event)" name="categoryNameTextBox" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Button ID="categoryUpdateButton" runat="server" Text="Update" OnClick="categoryUpdateButton_OnClick"/><br/>
                            <asp:Label ID="categoryOutputLabel" runat="server" Text="" style="text-align: right"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContentPlaceHolder" runat="server">
</asp:Content>