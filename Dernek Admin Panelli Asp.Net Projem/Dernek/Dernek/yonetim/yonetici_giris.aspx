<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="yonetici_giris.aspx.cs" Inherits="Dernek.yonetim.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yönetim Paneli Giriş</title>
    <link href="~/css/stil.css" rel="stylesheet" type="text/css" />
    
    </style>
    <style>
    #container
    {
        width: 462px;
        height: 200px;
        background-color: #567;
        position: absolute;
        left: 30%;
        right:20%;
        top: 40%;
        margin-left: -50px;
        margin-top: -50px;
    }
        .auto-style1 {
            width: 462px;
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" a>
    
        <div id="container">
            <div><font size="6" face="Arial" color="red">Yönetim Paneli Giriş</font></div>
       &nbsp;<table class="auto-style1">
            <tr>
                <td class="auto-style2">Kullanıcı Adı</td>
                <td class="auto-style3">:</td>
                <td>
                    <asp:TextBox ID="tbad" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Parola</td>
                <td class="auto-style3">:</td>
                <td>
                    <asp:TextBox ID="tbparola" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td style="text-align: left">
                    <asp:Button ID="Button1" runat="server" Text="Giriş" Width="100px" style="text-align: center" Height="35px" OnClick="Button1_Click" />
                    <asp:Button ID="Button2" runat="server" Height="35px" OnClick="Button2_Click" Text="İptal" Width="100px" />
                </td>
            </tr>
        </table>
        </div>
    </form>
</body>
</html>
