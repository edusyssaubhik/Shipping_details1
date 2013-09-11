using EDUsysVmqCrmIntegration;
using Microsoft.Xrm.Sdk;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shipping_details1.QuoteWerks
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             if (!IsPostBack)
            {

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable dt = null;
            try
            {
                IOrganizationService service = connection_to_crm();
                dt = EDUsys.GetUsers(service, 1, "");
        

                if (dt.Rows.Count>0)    
               {

              //check whether login is perfect or not......or else check with getusers()
             //EDUsys.GetUsers(service,1,"");
                Session["username"] = TextBox1.Text;
                Session["password"] = TextBox2.Text;
                try
                {

                    if (Request.QueryString["query1"] != null) //verify login for new shipping address V1
                    {
                        string query1 = Request.QueryString["query1"];
                        string que2 = Request.QueryString["que2"];
                        string que3 = Request.QueryString["que2"];
                        
                        Response.Redirect("new_ship_edit.aspx?" + query1 + "&que2=" + que2+"&que3="+que3+"&nat=AQQQQQQQQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQQQQQQQQQQQQQQ");
                    }
                    else if (Request.QueryString["query2"] != null)  // checking while fill update oppurtunity
                    {
                        string query2 = Request.QueryString["query2"];
                        string version = Request.QueryString["query"];
                        Response.Redirect("Update_oppurtunity.aspx?" + query2+"&query="+version);
                    }
                    else if (Request.QueryString["query3"] != null) // checking in edit time
                    {
                        string query3 = Request.QueryString["query3"];
                        string option = Request.QueryString["option"];
                        Response.Redirect("Edit-Category-Item.asp?" + query3 + "&opt=" + option);
                    }
                    else if (Request.QueryString["query4"] != null) ////verify login for new shipping address V2,V3
                    {
                        string query4 = Request.QueryString["query4"];
                        string que2 = Request.QueryString["que2"];
                        string que3 = Request.QueryString["que2"];
                        string qid = Request.QueryString["qid"];
                        Response.Redirect("new_ship_edit.aspx?" + query4 + "&qid=" + qid + "&que2=" + que2 + "&que3=" + que3 + "&nat=AQQQQQQQQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAQQQQQQQQQQQQQQ");
                    }
                   
                    else
                    {
                        Response.Redirect("home.asp");

                    }
                }
                catch (Exception k)
                {

                }
           
                         }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('CRM Login is incorrect,please try again')</script>");

            }
            }
            catch (Exception k)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('CRM Login is incorrect,please try again')</script>");

            }
        }


        public IOrganizationService connection_to_crm()
        {
            IOrganizationService service = null;
            try
            {

                string userName = TextBox1.Text;//"quote@edusysglobalservices.onmicrosoft.com";
                string password = TextBox2.Text;//"Saxu0104";
                string orgUrl = "https://edusysglobalservices.api.crm5.dynamics.com/XRMServices/2011/Organization.svc";
                service = EDUsys.CreateService(userName, password, orgUrl);
             
                return service;
            }
            catch (Exception v)
            {
                Response.Write(v.Message);
            }
            return service;
        }
      
    }
}