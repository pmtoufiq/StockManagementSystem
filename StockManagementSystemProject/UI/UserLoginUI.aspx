<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLoginUI.aspx.cs" Inherits="StockManagementSystemProject.UI.UserLoginUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 92px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <strong>User Login:</strong><br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">User Id:</td>
                <td>
                    <asp:TextBox ID="userIdTextBox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Password</td>
                <td>
                    <asp:TextBox ID="passwordTextBox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="loginButton" runat="server" Text="Login" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:LinkButton ID="forgetPasswordLinkButton" runat="server">Forget Password?</asp:LinkButton>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
