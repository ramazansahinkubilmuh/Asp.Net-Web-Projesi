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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["giris"] == "evet")
                Response.Redirect("yonetici_giris.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (tbad.Text == "")
                Response.Write("<script lang='JavaScript'>alert('Lütfen Kullanıcı Adını Gir!');</script>");
            else if (tbparola.Text == "")
                Response.Write("<script lang='JavaScript'>alert('Lütfen Parolayı Gir!');</script>");
            else
            {
                string CS = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/dernek.mdb");
                OleDbConnection con = new OleDbConnection(CS);
                con.Open();
                OleDbCommand cmd = new OleDbCommand("Select * from kullanici where kullanici_adi='" + tbad.Text + "' and parola='" + tbparola.Text + "'", con);
                OleDbDataReader oku = cmd.ExecuteReader();
                if (oku.Read())
                {
                    Session["giris"] = "evet";
                    Session["kid"] = oku["kullanici_adi"];
                    Response.Redirect("index.aspx");
                }
                else
                {
                    Response.Write("<script lang='JavaScript'>alert('Girilen Bilgiler Yanlış!');</script>");
                    tbad.Text = "";
                    tbparola.Text = "";
                }
                oku.Close();
                con.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/index.aspx");
        }
    }
}