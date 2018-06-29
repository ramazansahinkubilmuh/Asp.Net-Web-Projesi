using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Dernek
{
    public partial class fotograflarimiz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                resimleri_goster();
        }
        void resimleri_goster()
        {
            string[] klasordekiler = Directory.GetFiles(Server.MapPath("galeri"));//resim klasorundeki dosyaları klasordekiler dizisine aktarıyor
            string[] resimler = new string[klasordekiler.Count()];
            for (int i = 0; i < klasordekiler.Count(); i++)
                resimler[i] = ("galeri/" + Path.GetFileName(klasordekiler[i]));//Path.GetFileName sadece dosya ismini alıyor
            DataList1.DataSource = resimler;
            DataList1.DataBind();
        }
    }
}