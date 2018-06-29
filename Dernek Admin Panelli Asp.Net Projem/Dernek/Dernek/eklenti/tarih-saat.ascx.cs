using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Dernek.eklenti
{
    public partial class tarih_saat : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string saat = DateTime.Now.ToLongTimeString();
            string tarih = DateTime.Now.Day.ToString() + ".0" + DateTime.Now.Month.ToString() + "." + DateTime.Now.Year.ToString();
            Label1.Text = tarih + "   " + saat;
        }
    }
}