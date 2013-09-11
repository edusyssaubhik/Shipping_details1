using EDUsysVmqCrmIntegration;
using Microsoft.Xrm.Sdk;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shipping_details1.QuoteWerks
{

    public partial class CRM_edit : System.Web.UI.Page
    {
       public string PREV_QUOTE_GUID;
    public string []prev_item_code;
        public string[]latest_item_code;
        ArrayList prev_info = new ArrayList();
        string[] ItemDescription_old, PricePerUnit_old, Quantity_old, itemCode_old;
        string[] ItemDescription_new, PricePerUnit_new, Quantity_new, itemCode_new;

        SqlConnection con = null;
        public string new_quoteId;
        protected void Page_Load(object sender, EventArgs e)
        {
            //code to connect to CRM and Get updated
            string qid_edit =Convert.ToString( Request.QueryString["query"].ToString());// get the prev requested quote
            string option = Convert.ToString(Request.QueryString["opt"].ToString());

            //find out the version and quoteno /items,quantity and quoteGUID
             
            con = new SqlConnection("Data Source=SAUBHIK-PC;Initial Catalog=apmgstudy;Integrated Security=True");
           prev_info = get_info_VM_qid(qid_edit);
           int version_no = Convert.ToInt32(prev_info[0]);
            version_no=version_no+1;
            PREV_QUOTE_GUID = prev_info[2];
            new_quoteId = get_new_quote_info(version_no, prev_info[1]);//versionNo,quoteno,quote_GUID 
           //still new Quote Guid is NOT created
            find_Quote_deatils_old(qid_edit);  //string ItemDescription, decimal PricePerUnit, decimal Quantity
            find_Quote_deatils_new(new_quoteId);
            //got new quoteID
            //now find out first array data

            if (option.Equals("R1"))
             {

                 //Replacement happens in CRM and add with update using previous Quote_guid
                //add new items 
                // call delete method and update method
                //  
                 DELETE_FROM_CRM(ItemDescription_old, ItemDescription_new);


            }
             else if (option.Equals("A1"))
             {
                 //add new items and update items while adding new items in CRM
                 // DO NOT CALL DELETE method
                 //CALL only update method
             }


        }


        public void find_Quote_deatils_new(string qid) //ItemDescription_old, PricePerUnit_old, Quantity_old, itemCode_old
        {
            SqlDataReader dr = null;
            ArrayList a = new ArrayList(); //array of itemdescrption,priceperunit,quantity 

            try
            {
                int i = 0;
                SqlCommand cmd = new SqlCommand("select orderid,itemName,price,quantity,itemCode from QW_QuoteDetails where quoteId=@a", con);
                cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(qid)));
                con.Open();
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    ItemDescription_new[i] = dr[1].toString();
                    PricePerUnit_new[i] = dr[2].toString();
                    Quantity_new[i] = dr[3].toString();
                    itemCode_new[i] = dr[4].toString();
                    i++;
                }
            }
            catch (Exception f)
            {
                Response.Write("error found " + f.Message);
            }
            con.Close();
           
        }


        public void find_Quote_deatils_old(string qid) //ItemDescription_old, PricePerUnit_old, Quantity_old, itemCode_old
        {
            SqlDataReader dr = null;
            ArrayList a = new ArrayList(); //array of itemdescrption,priceperunit,quantity 

            try
            {
                int i = 0;
                SqlCommand cmd = new SqlCommand("select orderid,itemName,price,quantity,itemCode from QW_QuoteDetails where quoteId=@a", con);
                cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(qid)));
                con.Open();
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    ItemDescription_old[i] = dr[1].toString();
                    PricePerUnit_old[i] = dr[2].toString();
                    Quantity_old[i] = dr[3].toString();
                    itemCode_old[i] = dr[4].toString();
                     i++;
                    }
            }
            catch (Exception f)
            {
                Response.Write("error found " + f.Message);
            }
            con.Close();
          
        }

       

        public int get_new_quote_info(int version,string quoteNo)  //find out latest quoteGUID
        {
            con = new SqlConnection("Data Source=SAUBHIK-PC;Initial Catalog=apmgstudy;Integrated Security=True");

            SqlDataReader dr = null;

            int new_qid=0;
            con.Open();
            try
            {

                SqlCommand cmd = new SqlCommand("select quoteId from QW_QuoteOverview where versionNo=@a and quoteno=@b", con);
                cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(version)));
                cmd.Parameters.Add(new SqlParameter("@b", quoteNo));

                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    new_qid =Int32.Parse( dr[0].toString());
                }
            }
            catch (Exception f)
            {
                Response.Write("error found " + f.Message);
            }
            con.Close();
            return new_qid;
       

        }

        public ArrayList get_info_VM_qid(string qid_edit)  // get information from previous quoteID
        {
            con = new SqlConnection("Data Source=SAUBHIK-PC;Initial Catalog=apmgstudy;Integrated Security=True");
     
            SqlDataReader dr = null;
            ArrayList a = new ArrayList(); //array of itemdescrption,priceperunit,quantity 

            con.Open();
            try
            {

                SqlCommand cmd = new SqlCommand("select versionNo,quoteno,quote_GUID from QW_QuoteOverview where quoteId=@a", con);
                cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(qid_edit)));

                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    a.Add(dr[0].ToString());
                    a.Add(dr[1].ToString());
                    a.Add(dr[2].ToString());

                }
            }
            catch (Exception f)
            {
                Response.Write("error found " + f.Message);
            }
            con.Close();
            return a;
        }
     

        public SqlDataReader get_line_items_details(string qid)
        {
            SqlDataReader dr = null;
            ArrayList a = new ArrayList(); //array of itemdescrption,priceperunit,quantity 

            try
            {

                SqlCommand cmd = new SqlCommand("select orderid,itemName,price,quantity from QW_QuoteDetails where quoteId=@a", con);
                cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(qid)));
                con.Open();
                dr = cmd.ExecuteReader();

            }
            catch (Exception f)
            {
                Response.Write("error found " + f.Message);
            }
            con.Close();
            return dr;
        }

       
        //algo to delete quote from CRM
        public void DELETE_FROM_CRM(string[] arr1, string[] arr2)
        //arr1 contains prev quote item code
        //arr1 contains latest quote item code
        {
            IOrganizationService service=connection_to_crm();
            int flag = 0;
            for (int i = 0; i < arr1.Length; i++)
            {
                flag = 0;
                for (int j = 0; j < arr2.Length; j++)
                {
                    if (arr1[i].Equals(arr2[j]))
                    {
                        flag = 1;
                        break;
                    }
                }
                if (flag == 0){
            QuoteGUID="";
            LineItemGUID = "";
                    bool isDeleted = EDUsys.DeleteLineItem(service,  QuoteGUID,  LineItemGUID);
            }
            }
        }

        //algo to write code to update and add new Quote with line items
        public void UPDATE_FROM_CRM(string[] arr1, string[] arr2)
        //arr1 contains prev quote item code
        //arr1 contains latest quote item code
        {
            IOrganizationService service = connection_to_crm();
            int flag = 0;
            for (int j = 0; j < arr2.Length; j++) // loop th 2 nd array contains latest Quote id
            {
                flag = 0;
                for (int i = 0; i < arr1.Length; i++)
                {
                    if (arr2[j].Equals(arr1[i]))
                    {
                    //update in crm
                    flag=1;
                    break;
                    }

                }
                if (flag == 1)
                {
                    //update line items with prev GUID
                
                    QuoteGUID = "";
                    LineItemGUID = "";
                  bool isUpdated1 = EDUsys.UpdateWriteInLineItem(service,  QuoteGUID,  LineItemGUID, ItemDescription,  PricePerUnit,  Quantity);
                //update in vmquotes also              
                }
                else if(flag==0)
                {
                      if (option.Equals("R1")){
                              // Add line items with prev QUOTE GUID
                    string AddedProductGUID = EDUsys. AddWriteInLineItem(service,  QuoteGUID,  ItemDescription,  PricePerUnit,  Quantity);
                // update in vmquotes also for next time
               
                      }
                      else if (option.Equals("A1")){
                    // create new Quote Guid n add line items in this id
                //    string QuoteGUID = EDUsys.CreateQuote(service, string topic, string ContactGUID, DateTime estCloseDate, int probabiliy, int Phase, int Rating, string OwnerUserGUID, bool Revenue, decimal EstRevenue, decimal DiscountPercent, decimal DiscountAmount, string PriceListGUID);
                  //  string AddedProductGUID = EDUsys. AddWriteInLineItem(service, string QuoteGUID, string ItemDescription, decimal PricePerUnit, decimal Quantity);
                // update in vmquotes also for next time
                }
                }
                }
            }
        






        public IOrganizationService connection_to_crm()
        {
            IOrganizationService service = null;
            try
            {

                string userName = "quote@edusysglobalservices.onmicrosoft.com";
                string password = "Saxu0104";
                string orgUrl = "https://edusysglobalservices.api.crm5.dynamics.com/XRMServices/2011/Organization.svc";
                service = EDUsys.CreateService(userName, password, orgUrl);
                return service;
                //dtTable = EDUsys.GetContacts(service, 3, search_key);// search by last name(3)
                /// Response.Write("The owner guid is "+ownerUserGUID);
                //string QuoteGUID = EDUsys.CreateQuote(service, string topic, string ContactGUID, DateTime estCloseDate, int probabiliy, int Phase, int Rating, string OwnerUserGUID, bool Revenue, decimal EstRevenue, decimal DiscountPercent, decimal ProductTotal, decimal DiscountAmount, decimal PreFreightAmount, decimal TotalAmount, int Quantity, decimal PricePerUnit, decimal ExtendedAmount);
            }
            catch (Exception v)
            {
                Response.Write(v.Message);
            }
            return service;
        }
       
    }
}
