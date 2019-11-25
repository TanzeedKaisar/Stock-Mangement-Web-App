<%@ Page Title="" Language="C#" MasterPageFile="~/UI/MasterUI.Master" AutoEventWireup="true" CodeBehind="ItemUI.aspx.cs" Inherits="StockManagmentSystemWebApp.UI.ItemUI" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="server">
    <link href="../StyleSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="bodyContent" ContentPlaceHolderID="bodyContentPlaceHolder" runat="server">
    <div class="itemsetup_area">
        <h1>Item Setup</h1>
        <div class="item_formdesign">
            <div>
                <table>
                    
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Company"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:DropDownList ID="companyDropDownList" runat="server"></asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Category"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:DropDownList ID="categoryDropDownList" runat="server"></asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label runat="server" Text="Item Name"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox ID="itemNameTextBox"  onkeydown="return alphaOnly(event)" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Reorder Level"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox step="1" onkeypress='return event.charCode >= 48 && event.charCode <= 57' ID="reorderLevelTextBox" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_OnClick"/><br/>
                            <asp:Label ID="outputLabel" runat="server" Text="" style="text-align: right"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ID="footerContent" ContentPlaceHolderID="footerContentPlaceHolder">
    
</asp:Content>