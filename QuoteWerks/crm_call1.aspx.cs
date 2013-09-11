using EDUsysVmqCrmIntegration;
using Microsoft.Xrm.Sdk;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shipping_details1
{
    public partial class crm_call1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
                      
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           try
                            {
                                IOrganizationService service;
                                string userName = "quote@edusysglobalservices.onmicrosoft.com";
                                string password = "Saxu0104";
                                string orgUrl = "https://edusysglobalservices.api.crm5.dynamics.com/XRMServices/2011/Organization.svc";
                                service = RetrieveContacts.CreateService(userName, password, orgUrl);
                
                                DataTable dtTable = RetrieveContacts.GetContacts(service, 1, TextBox1.Text);
                           //     RetrieveContacts.GetContacts(service, 1, "Su");
                                if (dtTable.Rows.Count > 0)
                                {
                                    GridView1.DataSource = dtTable;
                                    GridView1.DataBind();
                                }
                                else
                                {
                                    Response.Write("No data found");
                                }

                             }

                            catch (Exception l) {
                                Response.Write(l.Message);
                            }
        }

        
        
    }
}