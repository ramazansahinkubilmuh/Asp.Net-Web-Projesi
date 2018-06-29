<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="duyuru_goster.aspx.cs" Inherits="Dernek.duyuru_goster" %>

<%@ Register src="eklenti/alt.ascx" tagname="alt" tagprefix="uc1" %>
<%@ Register src="eklenti/ust.ascx" tagname="ust" tagprefix="uc2" %>
<%@ Register Src="~/eklenti/linkler.ascx" TagPrefix="uc1" TagName="linkler" %>
<%@ Register Src="~/eklenti/tarih-saat.ascx" TagPrefix="uc1" TagName="tarihsaat" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/HTML; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<title>Yeşiltepe</title>
<link href="css/stil.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script src="js/slayt.js" type="text/javascript"></script>
<script type='text/javascript'>
    $(document).ready(function () {
        $('#menu li').hover(function () {
            $('ul', this).slideDown(100).fadeIn(10000);
        }, function () {
            $('ul', this).slideUp(100).fadeOut(3000);
        }
        );
    });
</script>
</head>
<body>
    <form id="form2" runat="server">
<div id="site">
    <uc2:ust ID="ust1" runat="server" />
    <div>
        <uc1:tarihsaat runat="server" ID="tarihsaat" />
    </div>
<div class="govde">
<div>
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <div class="bosluk">
                <div class="baslik">Duyuru Başlığı : <%#Eval("Ad") %></div>
                <div class="font"><%#Eval("icerik") %></div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
<div>
</div>
    <uc1:linkler runat="server" ID="linkler" />
</div>
     <uc1:alt ID="alt1" runat="server" />
        
</div>
    </form>
</body>
</html>

