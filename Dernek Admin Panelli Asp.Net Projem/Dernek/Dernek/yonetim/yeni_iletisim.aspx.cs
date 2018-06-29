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
    public partial class yeni_iletisim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["giris"] != "evet")
                Response.Redirect("yonetici_giris.aspx");
        }

        protected void btnkaydet_Click(object sender, EventArgs e)
        {
            if (tbtelefon.Text == "" || tbfax.Text == "" || tbadres.Text=="")
            {
                Response.Write("<script lang='JavaScript'>alert('Lütfen Boş Alanları Doldurunuz...');</script>");
            }
            else if (tbtelefon.Text.Length != 14 || tbfax.Text.Length != 14)
            {
                Response.Write("<script lang='JavaScript'>alert('Bilgileri Kontrol Edin!');</script>");
            }
            else
            {
                string CS = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/dernek.mdb");
                OleDbConnection con = new OleDbConnection(CS);
                con.Open();
                OleDbCommand ekle = new OleDbCommand("insert into iletisim (telefon,fax,adres) values (@telefon,@fax,@aadres)", con);
                ekle.Parameters.AddWithValue("@telefon", tbtelefon.Text);
                ekle.Parameters.AddWithValue("@fax", tbfax.Text);
                ekle.Parameters.AddWithValue("@adres", tbadres.Text);
                ekle.ExecuteNonQuery();
                Response.Write("<script lang='JavaScript'>alert('İletişim Bilgileri başarıyla kaydedilmiştir...');</script>");
                con.Close();
                tbadres.Text = "";
                tbfax.Text = "";
                tbtelefon.Text = "";
            }
        }

        protected void btniptal_Click(object sender, EventArgs e)
        {
            Response.Redirect("iletisim.aspx");
        }
    }
}