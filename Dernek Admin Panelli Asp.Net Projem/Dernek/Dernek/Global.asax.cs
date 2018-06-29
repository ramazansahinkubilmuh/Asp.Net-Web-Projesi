using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Data;
using System.Data.OleDb;

namespace Dernek
{
    public class online : System.Web.HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {
            Application["online"] = 0;
        }

        void Application_End(object sender, EventArgs e)
        {
            Application.Remove("OnlineZiyaretci"); //Burada uygulama sonlandırılmıştır ve OnlineZiyaretci State'imizi siliyoruz.
        }
        void Session_Start(object sender, EventArgs e)
        {
            Application.Lock();
            Application["online"] = (int)Application["online"] + 1;
            Application.UnLock();

            string baglanti = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("~/dernek.mdb") + "; Persist Security Info=False;";
            OleDbConnection bg = new OleDbConnection(baglanti);
            OleDbDataAdapter adp = new OleDbDataAdapter("select * from sayac", bg);
            DataTable tablo = new DataTable();
            adp.Fill(tablo);
            string komut = "";
            if (((DateTime)tablo.Rows[0]["tarih"]).Day == DateTime.Now.Day)
            {
                //Gün değişmemiş. Tüm değerleri artırıyoruz.
                //Gün içinde bu komut çalışır.
                komut = "update sayac set gunluk=gunluk+1, aylik=aylik+1, yillik=yillik+1, toplam=toplam+1";
            }
            else
            {
                //Gün değişmiş ise kontrollerimizi yapıyoruz.
                if (((DateTime)tablo.Rows[0]["tarih"]).Month == DateTime.Now.Month)
                {
                    //Gün değişmiş, Ay değişmemiş ise.
                    //Hergün bir defa bu komut çalışır.
                    komut = "update sayac set tarih='" + DateTime.Now.ToString("dd.MM.yyyy") + "', gunluk=1, aylik=aylik+1, yillik=yillik+1, toplam=toplam+1";
                }
                else
                {
                    //Gün, Ay değişmiş ise.
                    if (((DateTime)tablo.Rows[0]["tarih"]).Year == DateTime.Now.Year)
                    {
                        //Gün, Ay değişmiş, ama Yıl aynı ise.
                        //Ayda bir defa bu komut çalışır.
                        komut = "update sayac set tarih='" + DateTime.Now.ToString("dd.MM.yyyy") + "', gunluk=1, aylik=1, yillik=yillik+1, toplam=toplam+1";
                    }
                    else
                    {
                        //Gün, Ay, Yıl değişmiş ise tüm değerleri sıfırlıyoruz.
                        //Yılda bir defa bu komut çalışır.
                        komut = "update sayac set tarih='" + DateTime.Now.ToString("dd.MM.yyyy") + "', gunluk=1, aylik=1, yillik=1, toplam=toplam+1";
                    }
                }
            }
            OleDbCommand cmd = new OleDbCommand(komut, bg);
            bg.Open();
            cmd.ExecuteNonQuery();
            bg.Close();
        }
        void Session_End(object sender, EventArgs e)
        {
            Application.Lock();
            Application["online"] = (int)Application["online"] - 1;
            Application.UnLock();
        }
    }
}