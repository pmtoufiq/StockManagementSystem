<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CategoryUI.aspx.cs" Inherits="StockManagementSystemProject.UI.CategoryUI" MasterPageFile="~/UI/MasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }
        .auto-style2 {
            text-align: justify;
        }
    .auto-style3 {
        text-align: right;
    }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div  align="center">
        <div>
        <h1>Category Setup</h1>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">Category Name:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="categoryNameTextBox" runat="server" Width="176px" style="text-align: left"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredCategoryName" controltovalidate="categoryNameTextBox" runat="server" ErrorMessage="Category name field can't be empty." Style="Color: Red"></asp:RequiredFieldValidator>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:HiddenField ID="categoryIdHiddenField" runat="server" />
                </td>
                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="updateButton" runat="server" OnClick="updateButton_Click" Text="Update" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="saveButton" runat="server" OnClick="saveButton_Click" Style="text-align: left; height: 26px;" Text="Save" />
                    &nbsp;<asp:Label ID="messageLabel" runat="server"></asp:Label>
                </td>
            </tr>
        </table>

        <br />
        <asp:GridView ID="categoryGridView" runat="server" Height="304px" Width="401px" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" GridLines="None" OnSelectedIndexChanged="categoryGridView_SelectedIndexChanged" CellSpacing="1">
            <Columns>
                <asp:TemplateField HeaderText="S/L">
                    <HeaderStyle Width="50" />
                    <ItemStyle Width="50" />
                    <ItemTemplate>
                        <%#Container.DataItemIndex+1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                
                 <asp:TemplateField HeaderText="Id" Visible="False">
                    <ItemTemplate>
                        <asp:Label ID="categoryIdLevel" runat="server" Text='<%#Eval("categoryId") %>'>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Category Name">
                    <ItemTemplate>
                        <asp:Label ID="categoryNameLevel" runat="server" Text='<%#Eval("categoryName") %>'>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowSelectButton="True" SelectText="Edit" />
            </Columns>

            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />

        </asp:GridView>
    </div>
</asp:Content>
