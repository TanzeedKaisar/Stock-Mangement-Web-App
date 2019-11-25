<%@ Page Language="C#" MasterPageFile="MasterUI.Master" AutoEventWireup="true" CodeBehind="StockOutUI.aspx.cs" Inherits="StockManagmentSystemWebApp.UI.StockOutUI" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="server">
    <%--<link href="../StyleSheet.css" rel="stylesheet"/>--%>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="bodyContentPlaceHolder">
    <div class="stockout-area">
        <h1>Stock Out</h1>
        <div class="formdesign">

            <div>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Company"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:DropDownList ID="companyDropDownList" runat="server" OnSelectedIndexChanged="companyDropDownList_OnSelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Item"></asp:Label>
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
                            <asp:Label ID="Label2" runat="server" Text="Stock Out Quantity"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox step="1" onkeypress='return event.charCode >= 48 && event.charCode <= 57' ID="stockOutQuantityTextBox" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Button ID="addButton" runat="server" Text="Add" OnClick="addButton_Click"/><br/>
                            <asp:Label ID="outputLabel" runat="server" Text="" style="text-align: right"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>

            <div style="width: 97%; height: 201px; overflow-y: scroll; overflow: auto; text-align: center">
                <asp:GridView ID="stockOutGridView" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" AllowSorting="True" Width="386px">
                    <Columns>
                        <asp:TemplateField HeaderText="SL">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Item">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("ItemName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Company">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("CompanyName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("Quantity") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                    <FooterStyle BackColor="#CCCCCC"/>
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White"/>
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left"/>
                    <RowStyle BackColor="White"/>
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"/>
                    <SortedAscendingCellStyle BackColor="#F1F1F1"/>
                    <SortedAscendingHeaderStyle BackColor="#808080"/>
                    <SortedDescendingCellStyle BackColor="#CAC9C9"/>
                    <SortedDescendingHeaderStyle BackColor="#383838"/>
                </asp:GridView>

            </div>
            <div>
               
                            <asp:Button ID="sellButton" runat="server" Text="Sell" OnClick="sellButton_OnClick" style="margin: auto" PostBackUrl="~/UI/StockOutUI.aspx"/>
                            <asp:Button ID="damageButton" runat="server" Text="Damage" OnClick="damageButton_OnClick" style="margin: auto"/>
                            <asp:Button ID="lostButton" runat="server" Text="Lost" OnClick="lostButton_OnClick" style="margin: auto"/>
                       
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content runat="server" ID="footerContent" ContentPlaceHolderID="footerContentPlaceHolder">

</asp:Content>