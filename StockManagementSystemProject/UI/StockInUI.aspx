<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockInUI.aspx.cs" Inherits="StockManagementSystemProject.UI.StockInUI" MasterPageFile="~/UI/MasterPage.Master" %>
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
    <h1>Stock In</h1>
        <table class="auto-style1">
            <tr>
                <td class="auto-style1">Company:</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="companyDropDownList" runat="server" Height="20px" Width="240px" AutoPostBack="True" OnSelectedIndexChanged="companyDropDownList_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Item:</td>
                <td class="auto-style2">
                    <asp:DropDownList ID="itemDropDownList" runat="server" Height="20px" Width="240px" OnSelectedIndexChanged="itemDropDownList_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
                &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">Reorder Lavel:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="reorderLevelTextBox" runat="server" ReadOnly="True" Width="232px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Available Quantity</td>
                <td class="auto-style2">
                    <asp:TextBox ID="availableQuantityTextBox" runat="server" ReadOnly="True" Width="232px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Stock in Quantity</td>
                <td class="auto-style2">
                    <asp:TextBox ID="stockInQuantityTextBox" runat="server" Width="232px" CssClass="only-number"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click" style="height: 26px" />
                &nbsp;<asp:Label ID="messageLabel" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
</asp:Content>
