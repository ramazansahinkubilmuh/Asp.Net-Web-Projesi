<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cikis.aspx.cs" Inherits="Dernek.yonetim.cikis" %>

<%@ Register src="ust.ascx" tagname="ust" tagprefix="uc1" %>
<%@ Register Src="~/yonetim/alt.ascx" TagPrefix="uc1" TagName="alt" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:ust ID="ust1" runat="server" />
    
    </div>
        <div class="yanyana">
            icerik
        </div>
        <div>
            <uc1:alt runat="server" ID="alt" />
        </div>
    </form>
</body>
</html>
