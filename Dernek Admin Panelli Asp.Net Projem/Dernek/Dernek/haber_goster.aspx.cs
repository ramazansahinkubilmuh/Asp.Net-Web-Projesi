﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace Dernek
{
    public partial class haber_goster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OleDbConnection baglanti = new OleDbConnection();
            baglanti.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("dernek.mdb");
            baglanti.Open();
            DataSet ds = new DataSet();
            string seckomutu = "select * from haberler where id=" + Request.QueryString["id"];
            OleDbDataAdapter da = new OleDbDataAdapter(seckomutu, baglanti);
            da.Fill(ds);
            Repeater4.DataSource = ds;
            Repeater4.DataBind();
            baglanti.Close();
        }
    }
}