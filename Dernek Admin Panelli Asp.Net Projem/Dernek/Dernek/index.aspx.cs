using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Data.OleDb;
using System.IO;

namespace Dernek
{
    public partial class index : System.Web.UI.Page
    {
        public StringBuilder manset = new StringBuilder();
        public int sayac;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            OleDbConnection conn = new OleDbConnection();
            conn.ConnectionString = "Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + Server.MapPath("~/dernek.mdb");
            conn.Open();
            DataSet ds = new DataSet();
            DataSet ds2 = new DataSet();
            string sec = "select * from duyurular";
            string sec2 = "select * from haberler";
            OleDbDataAdapter da = new OleDbDataAdapter(sec, conn);
            OleDbDataAdapter da2 = new OleDbDataAdapter(sec2,conn);
            da.Fill(ds);
            da2.Fill(ds2);
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
            Repeater2.DataSource = ds2;
            Repeater2.DataBind();
            conn.Close();

            string[] klasordekiler = Directory.GetFiles(Server.MapPath("slider"));
            string[] resimler = new string[klasordekiler.Count()];
            for (int i = 0; i < klasordekiler.Count(); i++)
                manset.Append("<img src=\"slider/" + Path.GetFileName(klasordekiler[i]) + "\">");
        }
    }
}