<%@ Page Title="" Language="C#" MasterPageFile="~/UI/MasterUI.Master" AutoEventWireup="true" CodeBehind="CompanyUI.aspx.cs" Inherits="StockManagmentSystemWebApp.UI.CompanyUI" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="server">
    <title>Company Setup</title>
</asp:Content>
<asp:Content ID="bodyContent" ContentPlaceHolderID="bodyContentPlaceHolder" runat="server">
    <div class="contact-area">
        <h1>Company Setup</h1>
        <div class="formdesign">

            <div>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Company Name"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox ID="companyNameTextBox" onkeydown="return alphaOnly(event)" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Button ID="companySaveButton" runat="server" Text="Save" OnClick="companySaveButton_OnClick"/><br/>
                            <asp:Label ID="companyOutputLabel" runat="server" Text="" style="text-align: right"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>

            <div style="width: 100%; height: 300px; overflow-y: hidden; text-align: center">
                <asp:GridView ID="companyNameGridView" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" AllowSorting="True" Width="314px">
                    <Columns>
                        <asp:TemplateField HeaderText="SL">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("SL") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Company">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("Name") %>'></asp:Label>
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
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ID="footerContent" ContentPlaceHolderID="footerContentPlaceHolder">
    
</asp:Content>
