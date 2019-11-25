<%@ Page Title="" Language="C#" MasterPageFile="~/UI/MasterUI.Master" AutoEventWireup="true" CodeBehind="SearchByDateUI.aspx.cs" Inherits="StockManagmentSystemWebApp.UI.SearchByDateUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContentPlaceHolder" runat="server">
    <div class="itemsetup_area">
        <h1>Search Item By Date</h1>
        <div class="item_formdesign">
            <div>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="From Date"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <%--<input type="text" id="fromDate" name="fromDate"/>--%>
                            <asp:TextBox ID="fromDateTextBox" name="fromDateTextBox" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="To Date"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <%--<input type="text" id="toDate"/>--%>
                            <asp:TextBox ID="toDateTextBox" name="toDateTextBox" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_OnClick"/><br/>
                            <asp:Label ID="outputLabel" runat="server" Text="" style="text-align: right"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="width: 100%; height: 300px; overflow-y: hidden; text-align: center">
                <asp:GridView ID="itemsGridView" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" AllowSorting="True" Width="314px">
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

                        <asp:TemplateField HeaderText="Available Quantity">
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
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContentPlaceHolder" runat="server">
    <script>
        $('#bodyContentPlaceHolder_fromDateTextBox').datepicker({
            weekStart: 1,
            todayHighlight: true
        });

        $('#bodyContentPlaceHolder_toDateTextBox').datepicker({
            weekStart: 1,
            todayHighlight: true
        });
    </script>
</asp:Content>