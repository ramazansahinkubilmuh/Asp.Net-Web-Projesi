using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.IO;

namespace Dernek.yonetim
{
    public partial class slider : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["giris"] != "evet")
                Response.Redirect("yonetici_giris.aspx");
        }
        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                DataSet ds = new DataSet();
                ds.ReadXml(Server.MapPath("~/slider.xml"));
                File.Delete(Server.MapPath("~/" + ds.Tables[0].Rows[0]["resim"]));
                string uzanti = FileUpload1.FileName.Substring(FileUpload1.FileName.Length - 3, 3);
                string dosyaadi = "slider1" + "." + uzanti;
                FileUpload1.SaveAs(Server.MapPath("~/slider/") + dosyaadi);
                ds.Tables[0].Rows[0]["resim"] = "slider/" + dosyaadi;
                ds.WriteXml(Server.MapPath("~/slider.xml"));
                Response.Write("<script lang='JavaScript'>alert('Slider1 başarıyla güncellenmiştir...');</script>");
            }
            else
                Response.Write("<script lang='JavaScript'>alert('Resim Seçin!');</script>");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (FileUpload2.HasFile)
            {
                DataSet ds = new DataSet();
                ds.ReadXml(Server.MapPath("~/slider.xml"));
                File.Delete(Server.MapPath("~/" + ds.Tables[0].Rows[1]["resim"]));
                string uzanti = FileUpload2.FileName.Substring(FileUpload2.FileName.Length - 3, 3);
                string dosyaadi = "slider2" + "." + uzanti;
                FileUpload2.SaveAs(Server.MapPath("~/slider/") + dosyaadi);
                ds.Tables[0].Rows[1]["resim"] = "slider/" + dosyaadi;
                ds.WriteXml(Server.MapPath("~/slider.xml"));
                Response.Write("<script lang='JavaScript'>alert('Slider2 başarıyla güncellenmiştir...');</script>");
            }
            else
                Response.Write("<script lang='JavaScript'>alert('Resim Seçin!');</script>");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (FileUpload3.HasFile)
            {
                DataSet ds = new DataSet();
                ds.ReadXml(Server.MapPath("~/slider.xml"));
                File.Delete(Server.MapPath("~/" + ds.Tables[0].Rows[2]["resim"]));
                string uzanti = FileUpload3.FileName.Substring(FileUpload3.FileName.Length - 3, 3);
                string dosyaadi = "slider3" + "." + uzanti;
                FileUpload3.SaveAs(Server.MapPath("~/slider/") + dosyaadi);
                ds.Tables[0].Rows[2]["resim"] = "slider/" + dosyaadi;
                ds.WriteXml(Server.MapPath("~/slider.xml"));
                Response.Write("<script lang='JavaScript'>alert('Slider3 başarıyla güncellenmiştir...');</script>");
            }
            else
               Response.Write("<script lang='JavaScript'>alert('Resim Seçin!');</script>");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (FileUpload4.HasFile)
            {
                DataSet ds = new DataSet();
                ds.ReadXml(Server.MapPath("~/slider.xml"));
                File.Delete(Server.MapPath("~/" + ds.Tables[0].Rows[3]["resim"]));
                string uzanti = FileUpload4.FileName.Substring(FileUpload4.FileName.Length - 3, 3);
                string dosyaadi = "slider4" + "." + uzanti;
                FileUpload4.SaveAs(Server.MapPath("~/slider/") + dosyaadi);
                ds.Tables[0].Rows[3]["resim"] = "slider/" + dosyaadi;
                ds.WriteXml(Server.MapPath("~/slider.xml"));
                Response.Write("<script lang='JavaScript'>alert('Slider4 başarıyla güncellenmiştir...');</script>");
            }
            else
               Response.Write("<script lang='JavaScript'>alert('Resim Seçin!');</script>");
        }
    }
}