﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fotograflarimiz.aspx.cs" Inherits="Dernek.fotograflarimiz" %>

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
<script type="text/javascript" src="lib/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="lib/jquery.mousewheel-3.0.6.pack.js"></script>
	<script type="text/javascript" src="source/jquery.fancybox.js?v=2.1.5"></script>
	<link rel="stylesheet" type="text/css" href="source/jquery.fancybox.css?v=2.1.5" media="screen" />
    <link rel="stylesheet" type="text/css" href="source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
	<script type="text/javascript" src="source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
	<script type="text/javascript">
	    $(document).ready(function () {
	        /*
			 *  Simple image gallery. Uses default settings
			 */

	        $('.fancybox').fancybox();

	        /*
			 *  Different effects
			 */

	        // Change title type, overlay closing speed
	        $(".fancybox-effects-a").fancybox({
	            helpers: {
	                title: {
	                    type: 'outside'
	                },
	                overlay: {
	                    speedOut: 0
	                }
	            }
	        });

	        // Disable opening and closing animations, change title type
	        $(".fancybox-effects-b").fancybox({
	            openEffect: 'none',
	            closeEffect: 'none',

	            helpers: {
	                title: {
	                    type: 'over'
	                }
	            }
	        });

	        // Set custom style, close if clicked, change title type and overlay color
	        $(".fancybox-effects-c").fancybox({
	            wrapCSS: 'fancybox-custom',
	            closeClick: true,

	            openEffect: 'none',

	            helpers: {
	                title: {
	                    type: 'inside'
	                },
	                overlay: {
	                    css: {
	                        'background': 'rgba(238,238,238,0.85)'
	                    }
	                }
	            }
	        });

	        // Remove padding, set opening and closing animations, close if clicked and disable overlay
	        $(".fancybox-effects-d").fancybox({
	            padding: 0,

	            openEffect: 'elastic',
	            openSpeed: 150,

	            closeEffect: 'elastic',
	            closeSpeed: 150,

	            closeClick: true,

	            helpers: {
	                overlay: null
	            }
	        });

	        /*
			 *  Button helper. Disable animations, hide close button, change title type and content
			 */

	        $('.fancybox-buttons').fancybox({
	            openEffect: 'none',
	            closeEffect: 'none',

	            prevEffect: 'none',
	            nextEffect: 'none',

	            closeBtn: false,

	            helpers: {
	                title: {
	                    type: 'inside'
	                },
	                buttons: {}
	            },

	            afterLoad: function () {
	                this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + (this.title ? ' - ' + this.title : '');
	            }
	        });


	        /*
			 *  Thumbnail helper. Disable animations, hide close button, arrows and slide to next gallery item if clicked
			 */

	        $('.fancybox-thumbs').fancybox({
	            prevEffect: 'none',
	            nextEffect: 'none',

	            closeBtn: false,
	            arrows: false,
	            nextClick: true,

	            helpers: {
	                thumbs: {
	                    width: 50,
	                    height: 50
	                }
	            }
	        });

	        /*
			 *  Media helper. Group items, disable animations, hide arrows, enable media and button helpers.
			*/
	        $('.fancybox-media')
				.attr('rel', 'media-gallery')
				.fancybox({
				    openEffect: 'none',
				    closeEffect: 'none',
				    prevEffect: 'none',
				    nextEffect: 'none',

				    arrows: false,
				    helpers: {
				        media: {},
				        buttons: {}
				    }
				});

	        /*
			 *  Open manually
			 */

	        $("#fancybox-manual-a").click(function () {
	            $.fancybox.open('1_b.jpg');
	        });

	        $("#fancybox-manual-b").click(function () {
	            $.fancybox.open({
	                href: 'iframe.html',
	                type: 'iframe',
	                padding: 5
	            });
	        });

	        $("#fancybox-manual-c").click(function () {
	            $.fancybox.open([
					{
					    href: '1_b.jpg',
					    title: 'My title'
					}, {
					    href: '2_b.jpg',
					    title: '2nd title'
					}, {
					    href: '3_b.jpg'
					}
	            ], {
	                helpers: {
	                    thumbs: {
	                    }
	                }
	            });
	        });


	    });
	</script>

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
    <div class="baslik">Fotoğraf Galerisi</div>
<div class="font">
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" RepeatLayout="Flow" Width="800px">
        <ItemTemplate>
                <a class="fancybox-buttons" data-fancybox-group="button" href="<%#Container.DataItem%>">
                    <asp:Image ID="Image1" runat="server" Height="156px" Width="156px" ImageUrl="<%# Container.DataItem %>" />
                </a>
            </ItemTemplate>
    </asp:DataList>
</div>
</div></div>
        <uc1:linkler runat="server" ID="linkler" />
</div>
     <uc1:alt ID="alt1" runat="server" />
        
</div>
    </form>
</body>
</html>
