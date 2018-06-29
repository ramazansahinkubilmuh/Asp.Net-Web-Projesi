using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Text;  

namespace Dernek
{
    public partial class sayfa : System.Web.UI.Page
    {
        public StringBuilder icerik = new StringBuilder();
        public string sayfabaslik;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == "")
                icerik.Append("Böyle bir sayfa bulunamadı.");
            else
            {
                int sid = Convert.ToInt32(Request.QueryString["id"]);
                string CS = "Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + Server.MapPath("~/dernek.mdb");
                OleDbConnection con = new OleDbConnection(CS);
                con.Open();
                string sec="";
                OleDbCommand cmd = new OleDbCommand();
                sec = "Select * from menuler where id=";
                cmd = new OleDbCommand(sec + sid, con);
                OleDbDataReader oku = cmd.ExecuteReader();
                if (oku.Read())
                {
                    icerik.Append(oku["icerik"].ToString());
                    sayfabaslik = oku["Ad"].ToString();
                }
                else
                {
                    icerik.Append("Böyle bir sayfa bulunamadı.");
                    sayfabaslik = "Sayfa Yok";
                }
                oku.Close();
                con.Close();
            }
        }
    }
}