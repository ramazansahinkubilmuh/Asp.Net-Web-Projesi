<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="iletisim_duzenle.aspx.cs" Inherits="Dernek.yonetim.iletisim_duzenle" ValidateRequest="false"  EnableEventValidation="false"%>

<%@ Register src="ust.ascx" tagname="ust" tagprefix="uc1" %>
<%@ Register Src="~/yonetim/alt.ascx" TagPrefix="uc1" TagName="alt" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Paneli-İletişim Bilgi Güncelleme</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 166px;
        }
        .auto-style3 {
            width: 22px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:ust ID="ust1" runat="server" />
    
    </div>
        <div class="yanyana">İletişim Bilgileri Düzenleme</div>
        <div class="yanyana">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Telefon Numarası</td>
                    <td class="auto-style3">:</td>
                    <td>
                        <asp:TextBox ID="tbtelefon" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Fax Numarası</td>
                    <td class="auto-style3">:</td>
                    <td>
                        <asp:TextBox ID="tbfax" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Adres</td>
                    <td class="auto-style3">:</td>
                    <td>
                        <asp:TextBox ID="tbadres" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>Telefon ve Fax Numaralarını Aralarında Birer Boşluk Bırakarak Giriniz...(XXXX XXX XX XX)</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Kaydet" />
&nbsp;&nbsp;&nbsp;
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
