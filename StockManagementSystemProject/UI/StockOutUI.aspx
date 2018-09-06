<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockOutUI.aspx.cs" Inherits="StockManagementSystemProject.UI.StockOutUI"  MasterPageFile="~/UI/MasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        height: 22px;
    }
    .auto-style2 {
        text-align: right;
    }
    .auto-style3 {
        height: 22px;
        text-align: right;
    }
    .auto-style4 {
        text-align: left;
    }
    .auto-style5 {
        height: 22px;
        text-align: left;
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div align="center">
            <h1>Stock Out</h1>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Company:</td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="companyDropDownList" runat="server" Height="20px" Width="240px" AutoPostBack="True" OnSelectedIndexChanged="companyDropDownList_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Item Name:</td>
                    <td class="auto-style4">
                        <asp:DropDownList ID="itemDropDownList" runat="server" Height="20px" Width="240px" AutoPostBack="True" OnSelectedIndexChanged="itemDropDownList_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">Reorder Lavel:</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="reorderLevelTextBox" runat="server" ReadOnly="True" Width="234px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                <td class="auto-style2">Available Quantity:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="availableQuantityTextBox" runat="server" ReadOnly="True" Width="234px"></asp:TextBox>
                </td>
                </tr>
                <tr>
                    <td class="auto-style2">Stock Out Quantity:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="stockOutQuantityTextBox" runat="server" Width="234px" CssClass="only-number" OnTextChanged="stockOutQuantityTextBox_TextChanged" AutoPostBack="True"></asp:TextBox>
                    &nbsp;<asp:Label ID="stockOutLabel" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="addButton" runat="server" Text="Add" OnClick="addButton_Click" />
                    </td>
                </tr>
            </table>
            <asp:GridView ID="stockOutGridView" runat="server" Width="685px" ShowHeaderWhenEmpty="True" EmptyDataText="No data found" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" >
                 <Columns>
                          <asp:TemplateField Visible="False">
                     <ItemTemplate>
                          <asp:Label runat="server" ID="categoryIdLabel" Text='<%#Eval("ItemId") %>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                         <asp:TemplateField HeaderText="SL">
                              <ItemTemplate>
                       
                        <%#Container.DataItemIndex+1 %>
                    </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Item">
                             <ItemTemplate>
                                 <%#Eval("ItemName") %>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Company">
                              <ItemTemplate>
                                 <%#Eval("CompanyName") %>
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="Quantity">
                              <ItemTemplate>
                                  <%#Eval("StockOutQuantity") %>
                             </ItemTemplate>
                         </asp:TemplateField>
                     </Columns>
                
                <AlternatingRowStyle BackColor="#DCDCDC" />
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
            <asp:HiddenField ID="IdHiddenField" runat="server" />
            <asp:HiddenField ID="companyHiddenField" runat="server" />
            <asp:HiddenField ID="HiddenField3" runat="server" />
            &nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="sellButton" runat="server" Text="Sell" OnClick="sellButton_Click" style="height: 26px" />
            &nbsp;
            <asp:Button ID="damageButton" runat="server" Text="Damage" OnClick="damageButton_Click" />
            &nbsp;
            <asp:Button ID="lostButton" runat="server" Text="Lost" OnClick="lostButton_Click" />
        &nbsp;<asp:Label ID="messageLabel" runat="server"></asp:Label>
        </div>
</asp:Content>
