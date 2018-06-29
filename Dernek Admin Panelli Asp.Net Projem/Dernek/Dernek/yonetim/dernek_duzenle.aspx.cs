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
    public partial class dernek_duzenle : System.Web.UI.Page
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
                OleDbCommand cmd = new OleDbCommand("Select * from dernegimiz where id=" + sid, con);
                OleDbDataReader oku = cmd.ExecuteReader();
                if (oku.Read())
                {
                    tbbaslik.Text = oku["Ad"].ToString().Trim();
                    tbicerik.Text = oku["icerik"].ToString().Trim();
                }
                else
                {
                    Response.Redirect("dernek.aspx");
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
            sorgu.CommandText = "UPDATE dernegimiz SET Ad=@ad, icerik=@icerik WHERE id=" + sid;
            sorgu.Parameters.AddWithValue("@ad", tbbaslik.Text);
            sorgu.Parameters.AddWithValue("@icerik", tbicerik.Text);
            sorgu.ExecuteNonQuery();
            Response.Write("<script lang='JavaScript'>alert('Dernek Bilgileri başarıyla güncellendi...');</script>");
            baglanti.Close();
            tbbaslik.Text = "";
            tbicerik.Text = "";
        }
    }
}