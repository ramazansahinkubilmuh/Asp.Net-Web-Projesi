<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="tarih-saat.ascx.cs" Inherits="Dernek.eklenti.tarih_saat" %>
<div align="right">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
       <ContentTemplate>
           <asp:Timer ID="Timer1" runat="server" Interval="1000">
           </asp:Timer>
           
           <asp:Label ID="Label1" runat="server" Text="Label" BackColor="White"
               Font-Bold="True" Font-Names="DigifaceWide" Font-Size="25px"
               ForeColor="#4da1ad"></asp:Label>
       </ContentTemplate>
       </asp:UpdatePanel>
 </div>