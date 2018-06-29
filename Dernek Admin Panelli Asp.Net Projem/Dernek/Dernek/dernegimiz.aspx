<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dernegimiz.aspx.cs" Inherits="Dernek.dernegimiz" %>

<%@ Register src="eklenti/ust.ascx" tagname="ust" tagprefix="uc2" %>

<%@ Register src="eklenti/alt.ascx" tagname="alt" tagprefix="uc1" %>
<%@ Register Src="~/eklenti/linkler.ascx" TagPrefix="uc1" TagName="linkler" %>
<%@ Register Src="~/eklenti/tarih-saat.ascx" TagPrefix="uc1" TagName="tarihsaat" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta http-equiv="Content-Type" content="text/HTML; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=9" />
        <title>Yeşiltepe</title>
         <script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js?ver=3.4.2'></script>
        <link href="css/stil.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery.js"></script>
        <script src="js/slayt.js" type="text/javascript"></script>
        <script type='text/javascript'>
            $(document).ready(function () {

                $(function () {
                    var repeat = 1;    //Tekrarlama Ayaro 0 veya 1 olabilir.
                    var ch = 0;       //Karakter sayısı, hangi karaktere gelince diğer satıra geçileceğini belirler. 0-100 gibi rakamsaldır.
                    var item = 0;     //Listenin hangisinden başlanapını belirler 0 ilk <li> den başlar.
                    var items = $('#caption li').length;
                    var time = 1000;  // Görünecek Süre (milisaniye)
                    var delay = 50;   // Gecikme (milisaniye)
                    var wait = 4000   // Bekleme Süresi (Başlama için (milisaniye))
                    $('#showCaption').css('width', ($('#caption').width() + 20));
                    function tickInterval() {
                        if (item < items) {
                            var text = $('#caption li:eq(' + item + ')').text();
                            type(text);
                            text = null;
                            var tick = setTimeout(tickInterval, time);
                        } else {
                            if (repeat == 1) {
                                ch = 0;
                                item = 0;
                                tickInterval();
                            } else {
                                clearTimeout(tick);
                            }
                        }
                    }
                    function type(text) {
                        time = delay;
                        $('#showCaption').html(text.substr(0, ch++));
                        if (ch > text.length) {
                            item++;
                            ch = 0;
                            time = wait;
                        }
                    }
                    var tick = setTimeout(tickInterval, time);
                });


                $('#menu li').hover(function () {
                    $('ul', this).slideDown(100).fadeIn(5000);
                }, function () {
                    $('ul', this).slideUp(100).fadeOut(1500);
                }
                );
            });
</script>
        <style type="text/css">
                #caption {
                    display: none;
                    font-size:16px;
                    font-weight:bold;
                }
                #showCaption{
                    font-family:Courier New;
                    font-size:20px;
                    color:#000;
                    font-weight:bold;
                    width:350px;
                    min-width:350px;
                }
                /* İhtiyaca göre düzenlenmiş css dosyasıdır. Kendinize göre düzenleyebilirsiniz */
            </style>
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
                <a id="A1" href='<%#Eval("id","~/dernek_goster.aspx?id={0}")%>' runat="server">   
                <div class="baslik"><%#Eval("Ad") %><br /></div>
                </a>              
                </div>                   
            </ItemTemplate>
        </asp:Repeater>
    </div>  
</div></div>
            <uc1:linkler runat="server" id="linkler" />
</div>
     <uc1:alt ID="alt1" runat="server" />     
</div>
    </form>
</body>
</html>
