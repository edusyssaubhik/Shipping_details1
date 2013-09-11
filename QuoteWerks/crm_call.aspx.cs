using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Xrm.Sdk;
using System.Data;
using EDUsysVmqCrmIntegration;
using System.ServiceModel.Description;
using Microsoft.Xrm.Sdk.Client;
using Microsoft.Xrm.Sdk.Query;
namespace Shipping_details1.QuoteWerks
{
    public partial class crm_call : System.Web.UI.Page
    {
        Uri DiscoveryUri = new Uri("https://edusysglobalservices.api.crm5.dynamics.com/XRMServices/2011/Organization.svc");
        //Authenticate using credentials of the logged in user;   
        Uri OrganizationUri = new Uri("https://edusysglobalservices.api.crm5.dynamics.com/XRMServices/2011/Organization.svc");
        Uri HomeRealmUri = null;


        protected void Page_Load(object sender, EventArgs e)
        {
            ClientCredentials Credentials = new ClientCredentials();
            //        string userName = "quote@edusysglobalservices.onmicrosoft.com";
            //       string password = "Saxu0104";
            Credentials.UserName.UserName = "quote@edusysglobalservices.onmicrosoft.com";
            Credentials.UserName.Password = "Saxu0104";
            ClientCredentials DeviceCredentials = new ClientCredentials();
            DeviceCredentials.UserName.UserName = "quote@edusysglobalservices.onmicrosoft.com";
            DeviceCredentials.UserName.Password = "Saxu0104";
            //Credentials.Windows.ClientCredential = CredentialCache.DefaultNetworkCredentials;
            //OrganizationServiceProxy serviceProxy;       
            using (OrganizationServiceProxy serviceProxy = new OrganizationServiceProxy(OrganizationUri, HomeRealmUri, Credentials, DeviceCredentials))
            {
                IOrganizationService service = (IOrganizationService)serviceProxy;
                QueryExpression query = new QueryExpression
                {
                    EntityName = "contact",
                    ColumnSet = new ColumnSet("firstname", "lastname", "emailaddress1", "telephone1"),
                    Criteria =
                    {
                        FilterOperator = LogicalOperator.And,
                        Conditions = 
                              {
                                  new ConditionExpression 
                                  {
                                      AttributeName = "statecode",
                                      Operator = ConditionOperator.Equal,
                                      Values = {0}
                                  }
                             }
                    }
                };
                DataTable dt = new DataTable();
                dt.Columns.Add("First Name", typeof(string));
                dt.Columns.Add("Last Name", typeof(string));
                dt.Columns.Add("E-mail", typeof(string));
                dt.Columns.Add("Telephone", typeof(string));

                foreach (Entity Details in service.RetrieveMultiple(query).Entities)
                {
                    dt.Rows.Add(Details.Attributes.Contains("firstname") ? Details.Attributes["firstname"].ToString() : string.Empty, Details.Attributes.Contains("lastname") ? Details.Attributes["lastname"].ToString() : string.Empty, Details.Attributes.Contains("emailaddress1") ? Details.Attributes["emailaddress1"].ToString() : string.Empty, Details.Attributes.Contains("telephone1") ? Details.Attributes["telephone1"].ToString() : string.Empty);
                }
                GridView1.DataSource = dt;
                GridView1.DataBind();

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // string userName = "quote@edusysglobalservices.onmicrosoft.com";
            //       string password = "Saxu0104";

            ClientCredentials Credentials = new ClientCredentials();
            Credentials.UserName.UserName = "quote@edusysglobalservices.onmicrosoft.com";
            Credentials.UserName.Password = "Saxu0104";
            ClientCredentials DeviceCredentials = new ClientCredentials();
            DeviceCredentials.UserName.UserName = "quote@edusysglobalservices.onmicrosoft.com";
            DeviceCredentials.UserName.Password = "Saxu0104";
            using (OrganizationServiceProxy serviceProxy = new OrganizationServiceProxy(OrganizationUri, HomeRealmUri, Credentials, DeviceCredentials))
            {
                IOrganizationService service = (IOrganizationService)serviceProxy;

                //Instantiate the contact object and populate the attributes.
                Entity contact = new Entity("contact");
                contact["firstname"] = TextBox1.Text.ToString();
                contact["lastname"] = TextBox2.Text.ToString();
                contact["emailaddress1"] = TextBox3.Text.ToString();
                contact["telephone1"] = TextBox4.Text.ToString();
                Guid newContactId = service.Create(contact);
                Response.Redirect("CRMonlineDataEntry.aspx");
                //This code will clear the textboxes after the contact is created.
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";

                /*            try
                            {
                                IOrganizationService service;
                                string userName = "quote@edusysglobalservices.onmicrosoft.com";
                                string password = "Saxu0104";
                                string orgUrl = "https://edusysglobalservices.api.crm5.dynamics.com/XRMServices/2011/Organization.svc";
                                service = RetrieveContacts.CreateService(userName, password, orgUrl);
                
                                DataTable dtTable = RetrieveContacts.GetContacts(service, 1, "Sau");
                           //     RetrieveContacts.GetContacts(service, 1, "Su");
                                GridView1.DataSource = dtTable;
                                GridView1.DataBind();
                                if (dtTable.Rows.Count > 0)
                                {
                              //      GridView1.DataSource = dtTable;
                                //    GridView1.DataBind();
                                }
                                else
                                {
                                    Response.Write("No data found");
                                }
                                }

                            catch (Exception l) {
                                Response.Write(l.Message);
                            }*/
            }

        }
    }
}