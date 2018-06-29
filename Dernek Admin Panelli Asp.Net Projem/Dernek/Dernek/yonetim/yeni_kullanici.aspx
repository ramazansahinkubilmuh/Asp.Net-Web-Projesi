<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="yeni_kullanici.aspx.cs" Inherits="Dernek.yonetim.yeni_kullanici" ValidateRequest="false" EnableEventValidation="false" %>

<%@ Register src="ust.ascx" tagname="ust" tagprefix="uc1" %>
<%@ Register Src="~/yonetim/alt.ascx" TagPrefix="uc1" TagName="alt" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Paneli-Yeni Kullanıcı</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 166px;
        }
        .auto-style3 {
            width: 23px;
        }
        .auto-style4 {
            width: 166px;
            height: 23px;
        }
        .auto-style5 {
            width: 23px;
            height: 23px;
        }
        .auto-style6 {
            height: 23px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:ust ID="ust1" runat="server" />
    
    </div>
        <div class="yanyana">Kullanıcı Yeni Bilgi Ekleme</div>
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
                    <td class="auto-style4">Parola</td>
                    <td class="auto-style5">:</td>
                    <td class="auto-style6">
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
                        <asp:Button ID="btnkaydet" runat="server" OnClick="btnkaydet_Click" Text="Kaydet" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btniptal" runat="server" OnClick="btniptal_Click" Text="İptal" Width="61px" />
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
