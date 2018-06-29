<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="menu.aspx.cs" Inherits="Dernek.yonetim.menu" ValidateRequest="false" EnableEventValidation="false" %>

<%@ Register src="ust.ascx" tagname="ust" tagprefix="uc1" %>
<%@ Register Src="~/yonetim/alt.ascx" TagPrefix="uc1" TagName="alt" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Paneli-Menü Yönetimi</title>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:ust ID="ust1" runat="server" />
    
    </div>
        <div class="yanyana">Menüler</div>
        <a href="yeni_menu.aspx"><div class="yanyana">Yeni Menü Ekle</div></a>
        <div class="yanyana">
                   
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnRowDeleting="GridView1_RowDeleting1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" Width="800px">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="Ad" HeaderText="Menü Başlığı" SortExpression="Ad" />
                    <asp:CommandField SelectText="Düzenle" ShowSelectButton="True" />
                    <asp:CommandField DeleteText="Sil" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dernekConnectionString %>" ProviderName="<%$ ConnectionStrings:dernekConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [menuler]"></asp:SqlDataSource>
        </div>
        <div class="yanyana">
            <uc1:alt runat="server" ID="alt" />
        </div>
    </form>
</body>
</html>

