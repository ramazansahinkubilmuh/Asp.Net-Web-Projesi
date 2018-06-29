using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace Dernek.yonetim
{
    public partial class yeni_kullanici : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["giris"] != "evet")
                Response.Redirect("yonetici_giris.aspx");
        }

        protected void btnkaydet_Click(object sender, EventArgs e)
        {
            if (tbad.Text == "" || tbparola.Text == "")
            {
                Response.Write("<script lang='JavaScript'>alert('Lütfen Boş Alanları Doldurunuz...');</script>");
            }
            else
            {
                DataSet ds=new DataSet();
                string CS = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/dernek.mdb");
                OleDbConnection con = new OleDbConnection(CS);
                con.Open();
                string sec = "select * from kullanici";
                OleDbDataAdapter da = new OleDbDataAdapter(sec,con);
                da.Fill(ds,"kullanici");
                int kayit_sayisi = 0;
                kayit_sayisi = ds.Tables["kullanici"].Rows.Count;
                bool deger = true; ;
                for (int i = 0; i < kayit_sayisi; i++)
                {
                    if (tbad.Text.ToLower() == ds.Tables["kullanici"].Rows[i]["kullanici_adi"].ToString().ToLower())
                    {
                        Response.Write("<script lang='JavaScript'>alert('Bu Kullanıcı adını alamazsınız! Lütfen başka bir kullanıcı adı seçin...');</script>");
                        tbad.Text = "";
                        tbparola.Text = "";
                        deger = false;
                        break;
                    }
                    else if (tbparola.Text.Length < 6 ||tbparola.Text.Length>10)
                    {
                        Response.Write("<script lang='JavaScript'>alert('Şifreniz Enaz 6 Enfazla 10 Karakterden Oluşmalıdır! Tekrar Deneyin...');</script>");
                        tbparola.Text = "";
                        deger = false;
                        break;
                    }
                }
                if (deger == true)
                {
                    OleDbCommand ekle = new OleDbCommand("insert into kullanici (kullanici_adi,parola) values (@ad,@parola)", con);
                    ekle.Parameters.AddWithValue("@ad", tbad.Text);
                    ekle.Parameters.AddWithValue("@parola", tbparola.Text);
                    ekle.ExecuteNonQuery();
                    Response.Write("<script lang='JavaScript'>alert('Kullanıcı Bilgileri başarıyla kaydedilmiştir...');</script>");
                    con.Close();
                    tbad.Text = "";
                    tbparola.Text = "";
                }
            }
        }

        protected void btniptal_Click(object sender, EventArgs e)
        {
            Response.Redirect("kullanici.aspx");
        }
    }
}