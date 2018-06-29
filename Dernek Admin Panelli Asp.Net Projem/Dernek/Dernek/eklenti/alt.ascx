<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="alt.ascx.cs" Inherits="Dernek.eklenti.WebUserControl2" %>
<div class="govde">
    <div class="copyright">
        <font size="5px" align="center" color="#4da1ad">Copyright © 2015  | Desing Ramazan Şahin</font><br />
        <table class="auto-style1" align="center" style="width: 307px">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
            <div>
            
            <tr>
                <td><font size="3px" align="center" color="red"><%Response.Write("Online Ziyaretçi Sayısı  "); %></font></td>
                <td><font size="3px" align="center" color="black"><%Response.Write(Application["online"]); %></font></td>
            </tr>
            <tr>
                <td> <font size="3px" align="center" color="red">Bugun Giren Ziyaretçi Sayısı</font> </td>
                <td><font size="3px" align="center" color="black"><%#Eval("gunluk") %><br /></font></td>
            </tr>
            <tr>
                <td><font size="3px" align="center" color="red">Bu Ay Giren Ziyaretçi Sayısı</font> </td>
                <td><font size="3px" align="center" color="black"><%#Eval("aylik") %><br /></font></td>
            </tr>
            <tr>
                <td><font size="3px" align="center" color="red">Bu Yıl Giren Ziyaretçi Sayısı</font> </td>
                <td><font size="3px" align="center" color="black"><%#Eval("yillik") %><br /></font></td>
            </tr>
            <tr>
                <td><font size="3px" align="center" color="red">Toplam Giren Ziyaretçi Sayısı </font></td>
                <td><font size="3px" align="center" color="black"><%#Eval("toplam") %><br /></font></td>
            </tr>
                </div>
        </ItemTemplate>
        </asp:Repeater>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dernekConnectionString %>" ProviderName="<%$ ConnectionStrings:dernekConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [sayac]"></asp:SqlDataSource>
    </div>
</div>