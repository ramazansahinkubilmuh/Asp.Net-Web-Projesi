<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Dernek.yonetim.index" %>

<%@ Register Src="~/yonetim/ust.ascx" TagPrefix="uc1" TagName="ust" %>
<%@ Register Src="~/yonetim/alt.ascx" TagPrefix="uc1" TagName="alt" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<uc1:ust runat="server" id="ust" />

<div class="yanyana">
<div class="sirala">
<a href="fotograf.aspx"><div class="nav"><img src="images/icon/fotograf.png" width="48" height="48">
<li class="">Fotoğraf Yönetimi</li></div></a>
</div>

<div class="sirala">
<a href="dernek.aspx"><div class="nav"><img src="images/icon/dernek.png" width="48" height="48">
<li class="">Dernek Bilgileri</li></div></a>
</div>

<div class="sirala">
<a href="duyuru.aspx"><div class="nav"><img src="images/icon/duyuru.jpg" width="48" height="48">
<li class="">Duyuru Yönetimi</li></div></a>
</div>

<div class="sirala">
<a href="haber.aspx"><div class="nav"><img src="images/icon/haber.png" width="48" height="48">
<li class="">Haber Yönetimi</li></div></a>
</div>

<div class="sirala">
<a href="iletisim.aspx"><div class="nav"><img src="images/icon/iletisim.jpg" width="48" height="48">
<li class="">İletişim Bilgileri</li></div></a>
</div>

<div class="sirala">
<a href="menu.aspx"><div class="nav"><img src="images/icon/menu.png" width="48" height="48">
<li class="">Menü Yönetimi</li></div></a>
</div>

 <div class="sirala">
<a href="kullanici.aspx"><div class="nav"><img src="images/icon/kullanici.jpg" width="48" height="48">
<li class="">Kullanıcı Yönetimi</li></div></a>
</div>

<div class="sirala">
<a href="slider.aspx"><div class="nav"><img src="images/icon/slider.png" width="48" height="48">
<li class="">Slider Yönetimi</li></div></a>
</div>

</div>

<div class="temizle"></div>
<div class="yanyana">
    <uc1:alt runat="server" ID="alt" />
    </div>

