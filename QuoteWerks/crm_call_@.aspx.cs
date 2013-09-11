
using Microsoft.Xrm.Sdk;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDUsysVmqCrmIntegration;
namespace Shipping_details1.QuoteWerks
{
    public partial class crm_call__ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            connection_to_crm();

        }
        public void connection_to_crm()
        {
            try
            {
                IOrganizationService service;
                string userName = "quote@edusysglobalservices.onmicrosoft.com";
                string password = "Saxu0104";
                string OwnerFullName = "Quote VMEdu";
                string orgUrl = "https://edusysglobalservices.api.crm5.dynamics.com/XRMServices/2011/Organization.svc";
                service = EDUsys.CreateService(userName, password, orgUrl);
                string ownerUserGUID = EDUsys.ValidateOwnerWithCRMUser(service, OwnerFullName);
                Response.Write("The owner guid is " + ownerUserGUID);
                //string QuoteGUID = EDUsys.CreateQuote(service, string topic, string ContactGUID, DateTime estCloseDate, int probabiliy, int Phase, int Rating, string OwnerUserGUID, bool Revenue, decimal EstRevenue, decimal DiscountPercent, decimal ProductTotal, decimal DiscountAmount, decimal PreFreightAmount, decimal TotalAmount, int Quantity, decimal PricePerUnit, decimal ExtendedAmount);
            }
            catch (Exception v)
            {
                Response.Write(v.Message);
            }
        }
    
    }
}