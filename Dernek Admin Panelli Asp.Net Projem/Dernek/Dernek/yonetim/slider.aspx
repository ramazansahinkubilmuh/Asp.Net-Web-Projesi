<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="slider.aspx.cs" Inherits="Dernek.yonetim.slider" %>

<%@ Register src="ust.ascx" tagname="ust" tagprefix="uc1" %>
<%@ Register Src="~/yonetim/alt.ascx" TagPrefix="uc1" TagName="alt" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Paneli-Slider Yönetimi</title>
    </head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div>
    
        <uc1:ust ID="ust1" runat="server" />
    
    </div>
        <div class="yanyana">
            Slider 1 :&nbsp;&nbsp;&nbsp;
            <asp:FileUpload ID="FileUpload1" runat="server" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Yükle" OnClick="Button1_Click1" />
        </div>
        <div class="yanyana">
            Slider 2 :&nbsp;&nbsp;&nbsp;
            <asp:FileUpload ID="FileUpload2" runat="server" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Yükle" OnClick="Button2_Click" />
        </div>
        <div class="yanyana">
            Slider 3 :&nbsp;&nbsp;&nbsp;
            <asp:FileUpload ID="FileUpload3" runat="server" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" Text="Yükle" OnClick="Button3_Click" />
        </div>
        <div class="yanyana">
            Slider 4 :&nbsp;&nbsp;&nbsp;
            <asp:FileUpload ID="FileUpload4" runat="server" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" Text="Yükle" OnClick="Button4_Click" />
        </div>
        <div class="yanyana">
            <uc1:alt runat="server" ID="alt" />
        </div>
    </form>
</body>
</html>
