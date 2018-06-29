using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Dernek.yonetim
{
    public partial class fotograf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["giris"] != "evet")
                Response.Redirect("yonetici_giris.aspx");
            if (!IsPostBack)
                resimleri_goster();
        }

        protected void tbyukle_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string uzanti = FileUpload1.FileName.Substring(FileUpload1.FileName.Length - 3, 3);
                string dosyaadi = (Directory.GetFiles(Server.MapPath("~/galeri")).Count() + 1).ToString() + "." + uzanti;
                FileUpload1.SaveAs(Server.MapPath("~/galeri/") + dosyaadi);
                Response.Write("<script lang='JavaScript'>alert('Resim Yüklenmiştir...');</script>");
                resimleri_goster();
            }
            else
                Response.Write("<script lang='JavaScript'>alert('Lütfen Resim Seçin...');</script>");
        }
        void resimleri_goster()
        {
            string[] klasordekiler = Directory.GetFiles(Server.MapPath("~/galeri"));//resim klasorundeki dosyaları klasordekiler dizisine aktarıyor
            string[] resimler = new string[klasordekiler.Count()];
            for (int i = 0; i < klasordekiler.Count(); i++)
                resimler[i] = ("~/galeri/" + Path.GetFileName(klasordekiler[i]));//Path.GetFileName sadece dosya ismini alıyor
            DataList1.DataSource = resimler;
            DataList1.DataBind();
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataListItem item = DataList1.SelectedItem;
            Image name = ((Image)item.FindControl("Image1")) as Image;
            string imageurl = name.ImageUrl.ToString();
            File.Delete(Server.MapPath(imageurl));
            Response.Write("<script lang='JavaScript'>alert('Resim Silindi...');</script>");
            resimleri_goster();
        }
    }
}