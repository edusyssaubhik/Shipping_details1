using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shipping_details1.QuoteWerks
{
    public partial class API_html_convert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string query = Request.QueryString["query"].ToString();
                string path = @"c:\API_html_convert.html";
                // This text is added only once to the file. 
                if (!File.Exists(path))
                {
                    // Create a file to write to. 
                    using (StreamWriter sw = File.CreateText(path))
                    {
                        sw.WriteLine(query);
                    }
                }
            }
        }
    }
}