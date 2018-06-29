<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fotograf.aspx.cs" Inherits="Dernek.yonetim.fotograf" %>

<%@ Register src="ust.ascx" tagname="ust" tagprefix="uc1" %>
<%@ Register Src="~/yonetim/alt.ascx" TagPrefix="uc1" TagName="alt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Paneli-Fotoğraf Galerisi Yönetimi</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:ust ID="ust1" runat="server" />
    
    </div>
        <div class="yanyana">Fotoğraflar</div>
        <div class="yanyana">
            <asp:FileUpload ID="FileUpload1" runat="server" />
        &nbsp;&nbsp;
            <asp:Button ID="tbyukle" runat="server" Text="Yükle" OnClick="tbyukle_Click" BorderStyle="Double" Width="71px" />
&nbsp;
        </div>
        <div class="yanyana">
           <asp:DataList ID="DataList1" runat="server" CssClass="font" RepeatColumns="5" RepeatDirection="Horizontal" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" RepeatLayout="Flow" Width="800px">
            <ItemStyle BorderWidth="0px" />
            <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="156px" Width="145px" ImageUrl="<%# Container.DataItem %>" />
                    <br /><center><asp:LinkButton ID="LinkButton1" runat="server" CommandName="select">Delete</asp:LinkButton></center>
            </ItemTemplate>
</asp:DataList>
        </div>
        <div class="yanyana">
            <uc1:alt runat="server" ID="alt" />
        </div>
    </form>
</body>
</html>
