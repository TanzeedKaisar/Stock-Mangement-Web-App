<%@ Page Title="" Language="C#" MasterPageFile="~/UI/MasterUI.Master" AutoEventWireup="true" CodeBehind="CategoryUI.aspx.cs" Inherits="StockManagmentSystemWebApp.UI.CategoryUI" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="bodyContent" ContentPlaceHolderID="bodyContentPlaceHolder" runat="server">
    <div class="contact-area">
        <h1>&nbsp;</h1>
        <h1>&nbsp;&nbsp;&nbsp; Category Setup</h1>
        <div class="formdesign">

            <div>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Category Name"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:HiddenField ID="idHiddenField" runat="server"/>
                            <asp:TextBox  onkeydown="return alphaOnly(event)" ID="categoryNameTextBox" name="categoryNameTextBox" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Button ID="categorySaveButton" runat="server" Text="Save" OnClick="categorySaveButton_OnClick"/><br/>
                            <asp:Label ID="categoryOutputLabel" runat="server" Text="" style="text-align: right"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>

            <div style="width: 100%; height: 300px; overflow-y: hidden; text-align: center">
                <asp:GridView ID="categoryNameGridView" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" AllowSorting="True" Width="307px">
                    <Columns>
                        <asp:TemplateField HeaderText="SL">
                            <ItemTemplate>
                                <asp:HiddenField ID="categoryIdHiddenField" runat="server" Value='<%#Eval("Id") %>'/>
                                <asp:Label runat="server" Text='<%#Eval("Sl") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Category">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%#Eval("Name") %>'></asp:TextBox>--%>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton Text="Edit" runat="server" OnClick="OnClick"/>
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
    <%--<script>
        function alphaOnly(event) {
            var key = event.keyCode;
            return ((key >= 65 && key <= 90) || key == 8);
        };
</script>--%>
</asp:Content>
