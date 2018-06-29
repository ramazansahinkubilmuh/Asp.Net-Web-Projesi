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
    public partial class kullanici_duzenle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["giris"] != "evet")
                Response.Redirect("yonetici_giris.aspx");
            if (!IsPostBack)
            {
                int sid = Convert.ToInt32(Request.QueryString["id"]);
                string CS = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/dernek.mdb");
                OleDbConnection con = new OleDbConnection(CS);
                con.Open();
                OleDbCommand cmd = new OleDbCommand("Select * from kullanici where id=" + sid, con);
                OleDbDataReader oku = cmd.ExecuteReader();
                if (oku.Read())
                {
                    tbad.Text = oku["kullanici_adi"].ToString().Trim();
                    tbparola.Text = oku["parola"].ToString().Trim();
                }
                else
                {
                    Response.Redirect("kullanici.aspx");
                }
                oku.Close();
                con.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int sid = Convert.ToInt32(Request.QueryString["id"]);
            // Veritabanımızın yolu...
            string veritabani = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/dernek.mdb");
            // Bağlantı nesnemizi tanımlıyoruz.
            OleDbConnection baglanti = new OleDbConnection(veritabani);
            // Sorgu nesnemizi tanımlıyoruz.
            OleDbCommand sorgu = new OleDbCommand();
            // Sorgumuzu baglanti nesnesine bağlıyoruz.
            sorgu.Connection = baglanti;
            baglanti.Open();
            // Güncelleme işlemini bu sorgudaki gibi gerçekleştiriyoruz.
            DataSet ds = new DataSet();
            string sec = "select * from kullanici";
            OleDbDataAdapter da = new OleDbDataAdapter(sec, baglanti);
            da.Fill(ds, "kullanici");
            int kayit_sayisi = 0;
            kayit_sayisi = ds.Tables["kullanici"].Rows.Count;
            bool deger = true;
            for (int i = 0; i < kayit_sayisi; i++)
            {
                if (tbad.Text.ToLower() == ds.Tables["kullanici"].Rows[i]["kullanici_adi"].ToString().ToLower())
                {
                    Response.Write("<script lang='JavaScript'>alert('Bu Kullanıcı Var! Lütfen başka bir kullanıcı adı seçin...');</script>");
                    tbad.Text = "";
                    tbparola.Text = "";
                    deger = false;
                    break;
                }
                else if (tbparola.Text.Length < 6 || tbparola.Text.Length > 10)
                {
                    Response.Write("<script lang='JavaScript'>alert('Şifreniz Enaz 6 Enfazla 10 Karakterden Oluşmalıdır! Tekrar Deneyin...');</script>");
                    tbparola.Text = "";
                    deger = false;
                    break;
                }
            }
            if (deger == true)
            {
                sorgu.CommandText = "UPDATE kullanici SET kullanici_adi=@ad, parola=@parola WHERE id=" + sid;
                sorgu.Parameters.AddWithValue("@ad", tbad.Text);
                sorgu.Parameters.AddWithValue("@parola", tbparola.Text);
                sorgu.ExecuteNonQuery();
                Response.Write("<script lang='JavaScript'>alert('Kullanıcı Bilgileri Başarıyla Güncellenmiştir...');</script>");
                baglanti.Close();
                tbad.Text = "";
                tbparola.Text = "";
            }
        }
    }
}