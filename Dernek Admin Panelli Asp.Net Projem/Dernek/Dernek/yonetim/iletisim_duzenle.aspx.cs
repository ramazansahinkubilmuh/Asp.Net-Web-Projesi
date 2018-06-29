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
    public partial class iletisim_duzenle : System.Web.UI.Page
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
                OleDbCommand cmd = new OleDbCommand("Select * from iletisim where id=" + sid, con);
                OleDbDataReader oku = cmd.ExecuteReader();
                if (oku.Read())
                {
                    tbtelefon.Text = oku["telefon"].ToString().Trim();
                    tbfax.Text = oku["fax"].ToString().Trim();
                    tbadres.Text = oku["adres"].ToString().Trim();
                }
                else
                {
                    Response.Redirect("iletisim.aspx");
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
            if (tbtelefon.Text.Length != 14 || tbfax.Text.Length != 14 || tbadres.Text == "")
            {
                Response.Write("<script lang='JavaScript'>alert('Bilgileri Kontrol Edin!');</script>");
            }
            else
            {
                sorgu.CommandText = "UPDATE iletisim SET telefon=@telefon, fax=@fax,adres=@adres WHERE id=" + sid;
                sorgu.Parameters.AddWithValue("@telefon", tbtelefon.Text);
                sorgu.Parameters.AddWithValue("@fax", tbfax.Text);
                sorgu.Parameters.AddWithValue("@adres", tbadres.Text);
                sorgu.ExecuteNonQuery();
                Response.Write("<script lang='JavaScript'>alert('İletişim Bilgileri başarıyla güncellenmiştir...');</script>");
                baglanti.Close();
                tbtelefon.Text = "";
                tbfax.Text = "";
                tbadres.Text = "";
            }
        }
    }
}