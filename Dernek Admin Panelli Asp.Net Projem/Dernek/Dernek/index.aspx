<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Dernek.index" %>



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
    <form id="form1" runat="server">
<div id="site">
    <uc2:ust ID="ust1" runat="server" />
    <div>
        <uc1:tarihsaat runat="server" id="tarihsaat" />
    </div>
    
<div class="govde">
<div id="sliderFrame"><div id="slider">
<%Response.Write(manset); %>
</div></div>
<div>
<div class="duyurular">
    <marquee onmouseover=this.stop() onmouseout=this.start() align="left" scrollamount="2" direction="up"scrolldelay="1" style="width: 420px; heigth=224px;">   
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <a id="A2" href='<%#Eval("id","~/duyuru_goster.aspx?id={0}")%>' runat="server">
                    <p style="text-align:left"><%#Eval("Ad") %>
                        </a>
        </ItemTemplate>
    </asp:Repeater></marquee>
</div>
<div class="haberler">
    <marquee onmouseover=this.stop() onmouseout=this.start() align="left" scrollamount="2" direction="up"scrolldelay="1" style="width: 420px; heigth=224px;">
    <asp:Repeater ID="Repeater2" runat="server">
        <ItemTemplate>
            <a id="A1" href='<%#Eval("id","~/haber_goster.aspx?id={0}")%>' runat="server">
                    <p style="text-align:left"><%#Eval("Ad") %>
                        </a>
        </ItemTemplate>
    </asp:Repeater></marquee>
</div>
<div class="tmz"></div>
</div></div>
    <uc1:linkler runat="server" ID="linkler" />
</div>
     <uc1:alt ID="alt1" runat="server" />
        

    </form>
</body>
</html>
