using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shipping_details1.QuoteWerks
{
    public partial class verifylogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string qid=Request.Params["qid"];
          //  Session["username"] = null;
            //Session["password"] = null;
            string option = Request.QueryString["opt"];
            if (Session["username"] != null && Session["password"] != null)
            {
                   Response.Redirect("/Quotewerks/Edit-Category-Item.asp?qid=" + qid + "&opt=" + option);
            }
            else
            {
                   string query2 = "qid=" + qid + "&option=" + Request.QueryString["opt"];
                   Response.Redirect("login.aspx?query3="+query2);
            }
        }
    }
}