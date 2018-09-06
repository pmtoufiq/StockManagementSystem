<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSalesReportUI.aspx.cs" Inherits="StockManagementSystemProject.UI.ViewSalesReportUI" MasterPageFile="~/UI/MasterPage.Master" %>

<%@ Import Namespace="System.Drawing" %>
<%@ Import Namespace="System.Net.Mime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }

        .auto-style2 {
            text-align: left;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div align="center">
        <h1>Search and View Item Summary</h1>
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style1">From Date:</td>
                    <td class="auto-style2">
                         <%--<asp:TextBox ID="fromDateTextBox" runat="server" TextMode="Date"></asp:TextBox>--%>
                        <input type="text" id="from" name="start" readonly/>
                    </td>

                </tr>
                <tr>
                    <td class="auto-style1">To Date:</td>
                    <td class="auto-style2">
                        <%--<asp:TextBox ID="toDateTextBox" runat="server" TextMode="Date"></asp:TextBox>--%>
                        
                        <input type="text" id="to" name="end" readonly/>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" Style="height: 26px" />
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <asp:GridView ID="showGridView" runat="server" Width="559px" BackColor="White" EmptyDataText="No Data Found" ShowHeaderWhenEmpty="True" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="S/L">
                        <HeaderStyle Width="50" />
                        <ItemStyle Width="50" />
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Item">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("itemName") %>'>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Sale Quantity">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("stockOutQuantity") %>'>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
