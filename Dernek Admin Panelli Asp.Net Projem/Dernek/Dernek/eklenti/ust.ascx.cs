using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Data;
using System.Data.OleDb;

namespace Dernek.eklenti
{
    public partial class WebUserControl1 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OleDbConnection conn = new OleDbConnection();
            conn.ConnectionString = "Provider=Microsoft.Jet.OleDb.4.0; Data Source=" + Server.MapPath("~/dernek.mdb");
            conn.Open();
            DataSet ds = new DataSet();
            string sec = "select * from menuler";
            OleDbDataAdapter da = new OleDbDataAdapter(sec, conn);
            da.Fill(ds);
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
            conn.Close();
            if (Request.QueryString.ToString() == "1")
                Response.Redirect("index.aspx");
        }
    }
}