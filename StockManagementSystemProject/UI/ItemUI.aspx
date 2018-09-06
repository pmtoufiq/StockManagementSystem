<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemUI.aspx.cs" Inherits="StockManagementSystemProject.UI.ItemUI" MasterPageFile="~/UI/MasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
        .auto-style2 {
            text-align: left;
        }
        .auto-style3 {
            text-align: right;
            height: 22px;
        }
        .auto-style4 {
            text-align: left;
            height: 22px;
        }
    </style>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div align="center">
        <h1>Item Setup</h1>
        <table class="auto-style1" align="center">
            <tr>
                <td class="auto-style3">Category:</td>
                <td class="auto-style4">
                    <asp:DropDownList ID="categoryDropDownList" runat="server" Height="20px" Width="230px" OnSelectedIndexChanged="categoryDropDownList_SelectedIndexChanged">
                       
                    </asp:DropDownList>
                     <%--<asp:RequiredFieldValidator ID="requiredReorderLevel" controltovalidate="reorderLavelTextBox" runat="server" ErrorMessage="Reorder Level field can't be empty." Style="Color: Red"></asp:RequiredFieldValidator>--%>
                    <asp:Label ID="categoryMessageLabel" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Company:</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="companyDropDownList" runat="server" Height="20px" Width="230px" OnSelectedIndexChanged="companyDropDownList_SelectedIndexChanged">
                        
                    </asp:DropDownList>
                    <%--<HeaderStyle Width="50" />
                    <ItemStyle Width="50" />--%>
                    <asp:Label ID="companyMessageLabel" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Item Name:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="itemNameTextBox" runat="server" Width="221px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredItemName" controltovalidate="itemNameTextBox" runat="server" ErrorMessage="Item name field can't be empty." Style="Color: Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Reorder Lavel:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="reorderLavelTextBox" runat="server" Width="221px" CssClass="only-number"></asp:TextBox>
                    <%--<HeaderStyle Width="50" />
                    <ItemStyle Width="50" />--%>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click" Style="height: 26px" />
                    <asp:Label ID="messageLabel" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            </tr>
        </table>

        <br />
        <asp:GridView ID="itemGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <Columns>
                <asp:TemplateField HeaderText="S/L">
                    <%--<HeaderStyle Width="50" />
                    <ItemStyle Width="50" />--%>
                    <ItemTemplate>
                        <%#Container.DataItemIndex+1 %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Item Name">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("itemName") %>'>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Category Name">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("categoryName") %>'>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Company Name">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("companyName") %>'>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Reorder Level">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("reorderLevel") %>'>'></asp:Label>
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

    </div>
</asp:Content>
