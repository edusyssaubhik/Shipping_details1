using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net;
using System.Collections.Specialized;
using System.Text;


public static class HttpHelper1
{
    
    private static String PreparePOSTForm(string url, NameValueCollection data)
    {
        //Set a name for the form
        string formID = "PostForm";

        //Build the form using the specified data to be posted.
        StringBuilder strForm = new StringBuilder();
        strForm.Append("<form id=\"" + formID + "\" name=\"" + formID + "\" action=\"" + url + "\" method=\"POST\">");
        foreach (string key in data)
        {
            strForm.Append("<input type=\"hidden\" name=\"" + key + "\" value=\"" + data[key] + "\">");
        }
        strForm.Append("</form>");

        //Build the JavaScript which will do the Posting operation.
        StringBuilder strScript = new StringBuilder();
        strScript.Append("<script language='javascript'>");
        strScript.Append("var v" + formID + " = document." + formID + ";");
        strScript.Append("v" + formID + ".submit();");
        strScript.Append("</script>");

        //Return the form and the script concatenated. (The order is important, Form then JavaScript)
        return strForm.ToString() + strScript.ToString();
    }
   
    public static void RedirectAndPOST(Page page, string destinationUrl, NameValueCollection data)
    {
        //Prepare the Posting form
        string strForm = PreparePOSTForm(destinationUrl, data);

        //Add a literal control the specified page holding the Post Form, this is to submit the Posting form with the request.
        page.Controls.Add(new LiteralControl(strForm));
    }
}
