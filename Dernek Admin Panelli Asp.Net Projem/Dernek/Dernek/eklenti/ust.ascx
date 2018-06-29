<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ust.ascx.cs" Inherits="Dernek.eklenti.WebUserControl1" %>
<div id="ust">
<div id="ustgovde"></div>
<div id="altgovde">
<div id="menu">
<ul>
    <li><a href="index.aspx">Anasayfa</a></li>
    <li><a href="fotograflarimiz.aspx">Fotoğraf Galerisi</a></li>
    <li><a href="dernegimiz.aspx">Derneğimiz</a></li>
    <li><a href="duyurular.aspx">Duyurular</a></li>
    <li><a href="haberler.aspx">Haberler</a></li>
    <li><a href="iletisim.aspx">İletişim</a></li>
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <li><a href="sayfa.aspx?id=<%#Eval("id") %>"><%#Eval("ad") %></a></li>
        </ItemTemplate>
    </asp:Repeater>
</ul>
    
</div>
</div>
</div>