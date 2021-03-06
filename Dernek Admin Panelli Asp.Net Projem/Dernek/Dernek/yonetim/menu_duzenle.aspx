﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu_duzenle.aspx.cs" Inherits="Dernek.yonetim.menu_duzenle" ValidateRequest="false" EnableEventValidation="false"%>

<%@ Register src="ust.ascx" tagname="ust" tagprefix="uc1" %>
<%@ Register Src="~/yonetim/alt.ascx" TagPrefix="uc1" TagName="alt" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Paneli-Menü Bilgi Güncelleme</title>
    <script type="text/javascript" src="../ckfinder/ckfinder.js"></script>
    <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            var editor = CKEDITOR.replace('<%=tbicerik.ClientID%>');
            CKFinder.setupCKEditor(editor, '../ckfinder/');//CKFinder Resim yüklerken sürücüyü gezmeyi sağlıyor
        };
    </script>

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
        <div class="yanyana">Menü Bilgileri Düzenleme</div>
        <div class="yanyana">
           
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Menü Başlığı</td>
                    <td class="auto-style3">:</td>
                    <td>
                        <asp:TextBox ID="tbbaslik" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Menü İçeriği</td>
                    <td class="auto-style3">:</td>
                    <td>
                        <asp:TextBox ID="tbicerik" runat="server" 
TextMode="MultiLine"></asp:TextBox>
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
