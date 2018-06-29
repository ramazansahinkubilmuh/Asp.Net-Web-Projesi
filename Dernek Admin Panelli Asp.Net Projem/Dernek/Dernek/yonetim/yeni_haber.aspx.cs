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
    public partial class yeni_haber : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["giris"] != "evet")
                Response.Redirect("yonetici_giris.aspx");
        }

        protected void btnkaydet_Click(object sender, EventArgs e)
        {
            if (tbbaslik.Text == "" || tbicerik.Text == "")
            {
                Response.Write("<script lang='JavaScript'>alert('Lütfen Boş Alanları Doldurunuz...');</script>");
            }
            else
            {
                string CS = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/dernek.mdb");
                OleDbConnection con = new OleDbConnection(CS);
                con.Open();
                OleDbCommand ekle = new OleDbCommand("insert into haberler (Ad,icerik) values (@ad,@icerik)", con);
                ekle.Parameters.AddWithValue("@ad", tbbaslik.Text);
                ekle.Parameters.AddWithValue("@icerik", tbicerik.Text);
                ekle.ExecuteNonQuery();
                Response.Write("<script lang='JavaScript'>alert('Haber Bilgileri başarıyla kaydedilmiştir...');</script>");
                con.Close();
                tbbaslik.Text = "";
                tbicerik.Text = "";
            }
        }

        protected void btniptal_Click(object sender, EventArgs e)
        {
            Response.Redirect("haber.aspx");
        }
    }
}