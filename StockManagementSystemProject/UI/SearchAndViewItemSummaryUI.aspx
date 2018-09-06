<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchAndViewItemSummaryUI.aspx.cs" Inherits="StockManagementSystemProject.UI.SearchAndViewItemSummaryUI" MasterPageFile="~/UI/MasterPage.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <h1>Search and View Item Summary</h1>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Company:</td>
                    <td>
                        <asp:DropDownList ID="companyDropDownList" runat="server" Height="20px" Width="184px" OnSelectedIndexChanged="companyDropDownList_SelectedIndexChanged1">
                           
                        
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Category</td>
                    <td>
                        <asp:DropDownList ID="categoryDropDownList"  runat="server" Height="20px" Width="182px" OnSelectedIndexChanged="categoryDropDownList_SelectedIndexChanged">
                          
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" style="height: 26px" />
                    </td>
                </tr>
            </table>
            <asp:GridView ID="showGridView" runat="server" Width="484px" AutoGenerateColumns="False" EmptyDataText="No Data Found" ShowHeaderWhenEmpty="True" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
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
                    
                <asp:TemplateField HeaderText="Company">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("companyName") %>'>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                    
                <asp:TemplateField HeaderText="Category">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("categoryName") %>'>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                    
                <asp:TemplateField HeaderText="Available Quantity">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("AvailableQuantity") %>'>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                    
                <asp:TemplateField HeaderText="Reorder Level">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("reorderLevel") %>'>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <%--<asp:CommandField ShowSelectButton="True" />--%>
            </Columns>
                
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
                
            </asp:GridView>
            <br />
        </div>
</asp:Content>
