<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kullanici_duzenle.aspx.cs" Inherits="Dernek.yonetim.kullanici_duzenle" ValidateRequest="false" EnableEventValidation="false" %>

<%@ Register src="ust.ascx" tagname="ust" tagprefix="uc1" %>
<%@ Register Src="~/yonetim/alt.ascx" TagPrefix="uc1" TagName="alt" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Paneli-Kullanıcı Bilgi Güncelleme</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 171px;
        }
        .auto-style3 {
            width: 21px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:ust ID="ust1" runat="server" />
    
    </div>
        <div class="yanyana">Kullanıcı Bilgileri Düzenleme</div>
        <div class="yanyana">
           
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Kullanıcı Adı</td>
                    <td class="auto-style3">:</td>
                    <td>
                        <asp:TextBox ID="tbad" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Parola</td>
                    <td class="auto-style3">:</td>
                    <td>
                        <asp:TextBox ID="tbparola" runat="server"></asp:TextBox>
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
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" 
Text="Kaydet" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                </tr>
            </table>
           
        </div>
        <div class="yanyana">
            <uc1:alt runat="server" ID="alt" />
        </div>
    </form>
</body>
</html>
