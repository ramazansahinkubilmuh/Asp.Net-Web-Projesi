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
    public partial class menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["giris"] != "evet")
                Response.Redirect("yonetici_giris.aspx");
        }

        protected void GridView1_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            int selectedRowIndex;
            selectedRowIndex = e.RowIndex;
            GridViewRow row = GridView1.Rows[selectedRowIndex];
            string sid = row.Cells[0].Text.ToString();
            string veritabani = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/dernek.mdb");
            // Bağlantı nesnemizi tanımlıyoruz.
            OleDbConnection baglanti = new OleDbConnection(veritabani);
            // Sorgu nesnemizi tanımlıyoruz.
            OleDbCommand sorgu = new OleDbCommand();
            // Sorgumuzu baglanti nesnesine bağlıyoruz.
            sorgu.Connection = baglanti;
            baglanti.Open();
            // Güncelleme işlemini bu sorgudaki gibi gerçekleştiriyoruz.
            sorgu.CommandText = "delete from menuler WHERE id=" + sid;
            sorgu.ExecuteNonQuery();
            baglanti.Close();
            Response.Redirect("menu.aspx");
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int selectedRowIndex;
            selectedRowIndex = GridView1.SelectedIndex;
            GridViewRow row = GridView1.Rows[selectedRowIndex];
            string id = row.Cells[0].Text.ToString();
            Response.Redirect("menu_duzenle.aspx?id=" + id);
        }
    }
}