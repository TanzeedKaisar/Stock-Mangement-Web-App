<%@ Page Title="" Language="C#" MasterPageFile="~/UI/MasterUI.Master" AutoEventWireup="true" CodeBehind="StockInUI.aspx.cs" Inherits="StockManagmentSystemWebApp.UI.StockInUI" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="bodyContent" ContentPlaceHolderID="bodyContentPlaceHolder" runat="server">
    <div class="itemsetup_area">
        <h1>Stock In</h1>
        <div class="item_formdesign">
            <div>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Company"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:DropDownList ID="companyDropDownList" OnSelectedIndexChanged="companyDropDownList_OnSelectedIndexChanged" runat="server" AutoPostBack="True"></asp:DropDownList>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Item"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:DropDownList ID="itemDropDownList" runat="server" OnSelectedIndexChanged="itemDropDownList_OnSelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label runat="server" Text="Reorder Level"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox ID="reorderLevelTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Available Quantity"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox ID="availableQuantityTextBox" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Stock In Quantity"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox step="1" onkeypress='return event.charCode >= 48 && event.charCode <= 57' ID="stockInQuantityTextBox" runat="server"></asp:TextBox>
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