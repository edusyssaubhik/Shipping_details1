using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
namespace Shipping_details1
{
    public partial class javasc_editor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    StreamReader d = new StreamReader(Server.MapPath("~/QuoteWerks/datrix-pdf.html"));

                    Editor1.Content = d.ReadToEnd();
                    d.Close();
                    d.Dispose();
                }
                catch (Exception k) { }
            }
            }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                StreamWriter d = new StreamWriter(Server.MapPath("~/QuoteWerks/datrix-pdf.html"));
               d.Write(Editor1.Content);
                d.Close();
                d.Dispose();
            }
            catch (Exception k) { }
           
        }
    }
}