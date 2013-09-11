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
    public partial class crm_edit_Quote : System.Web.UI.Page
    {
       
            public string PREV_QUOTE_GUID;
            public string[] prev_item_code;
            public string[] latest_item_code;
            ArrayList prev_info = new ArrayList();
            public string[] ItemDescription_old = null, PricePerUnit_old = null, Quantity_old = null, itemCode_old = null, product_GUID_old = null;
            public string[] ItemDescription_new = null, PricePerUnit_new = null, Quantity_new = null, itemCode_new = null, product_GUID_new = null;
            public string option;
            SqlConnection con = null;
            public string new_quoteId;
            protected void Page_Load(object sender, EventArgs e)
            {
                //code to connect to CRM and Get updated
                string qid_edit = Convert.ToString(Request.QueryString["query"].ToString());// get the prev requested quote
                option = Convert.ToString(Request.QueryString["opt"].ToString());
                
                //find out the version and quoteno /items,quantity and quoteGUID

                con = new SqlConnection("DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=fIw4VdokuY2Lb0;DATABASE=apmgstudy");
                prev_info = get_info_VM_qid(qid_edit);
                int version_no = Int32.Parse((Convert.ToString( prev_info[0].ToString())));
                string quoteno=prev_info[1].ToString();
                version_no = version_no + 1;
                PREV_QUOTE_GUID = Convert.ToString(prev_info[2].ToString());
                int new_quoteid = 0;

                new_quoteid = get_new_quote_info(version_no, quoteno);
                //versionNo,quoteno,quote_GUID 
                //still new Quote Guid is NOT created
                find_Quote_deatils_old(qid_edit);  //string ItemDescription, decimal PricePerUnit, decimal Quantity
                find_Quote_deatils_new(Convert.ToString(new_quoteid));
                //got new quoteID
                //now find out first array data

                if (option.Equals("R1"))
                {

                    //Replacement happens in CRM and add with update using previous Quote_guid
                    //add new items 
                    // call delete method and update method
                    //  
                    DELETE_FROM_CRM(PREV_QUOTE_GUID, itemCode_old, itemCode_new);

                    UPDATE_FROM_CRM(PREV_QUOTE_GUID, qid_edit, new_quoteid, itemCode_old, itemCode_new);
                }
                else if (option.Equals("A1"))
                {
                    //add new items and update items while adding new items in CRM
                    // DO NOT CALL DELETE method
                    //CALL only update method
                    UPDATE_FROM_CRM(PREV_QUOTE_GUID, qid_edit, new_quoteid, itemCode_old, itemCode_new);
                }


            }


            public void find_Quote_deatils_new(string qid) //ItemDescription_old, PricePerUnit_old, Quantity_old, itemCode_old
            {
                try
                {

                    SqlDataReader dr = null;
                    ArrayList a = new ArrayList(); //array of itemdescrption,priceperunit,quantity 

                    int i = 0;
                    SqlCommand cmd = new SqlCommand("select orderid,itemName,price,quantity,itemCode from QW_QuoteDetails where quoteId=@a", con);
                    cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(qid)));
                    con.Open();
                    dr = cmd.ExecuteReader();
                    int count = find_count(qid);
                    ItemDescription_new = new string[count];
                    PricePerUnit_new = new string[count];
                    Quantity_new = new string[count];
                    itemCode_new = new string[count];
                    product_GUID_new = new string[count];
                 
                    while (dr.Read())
                    {
                        ItemDescription_new[i] = dr[1].ToString();
                        PricePerUnit_new[i] = dr[2].ToString();
                        Quantity_new[i] = dr[3].ToString();
                        itemCode_new[i] = dr[4].ToString();
                        i++;
                    }

                    dr.Close();
                    con.Close();
                }
                catch (Exception f)
                {
                    Response.Write("error found " + f.Message);
                }
               
            }
 
            public int find_count(string qid) //ItemDescription_old, PricePerUnit_old, Quantity_old, itemCode_old
            {
                SqlDataReader dr = null;
                ArrayList a = new ArrayList(); //array of itemdescrption,priceperunit,quantity 
                int i = 0;
                  SqlDataReader dr1 =null;
                try
                {

                    con = new SqlConnection("DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=fIw4VdokuY2Lb0;DATABASE=apmgstudy");
                    con.Open();
                    SqlCommand cmd1 = new SqlCommand("select count(*) from QW_QuoteDetails where quoteId=@a", con);
                    cmd1.Parameters.Add(new SqlParameter("@a", Int32.Parse(qid)));
                  //  con.Open();
               // dr.Close();
                dr1 = cmd1.ExecuteReader();
                    if (dr1.Read())
                    {
                        i =Convert.ToInt32(dr1[0].ToString());
                    }
                }
                catch (Exception f)
                {
                    Response.Write("error found " + f.Message);
                }
                dr1.Close();
                con.Close();

                return i;
            }


            public void find_Quote_deatils_old(string qid) //ItemDescription_old, PricePerUnit_old, Quantity_old, itemCode_old
            {
                SqlDataReader dr = null;
                ArrayList a = new ArrayList(); //array of itemdescrption,priceperunit,quantity 

                try
                {
                    int i = 0;
                    SqlCommand cmd = new SqlCommand("select orderid,itemName,price,quantity,itemCode,product_GUID from QW_QuoteDetails where quoteId=@a", con);
                    cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(qid)));
                    con.Open();
                    dr = cmd.ExecuteReader();
                    int count=find_count(qid);
                    ItemDescription_old=new string[count];
                    PricePerUnit_old = new string[count];
                    Quantity_old = new string[count];
                    itemCode_old = new string[count];
                    product_GUID_old = new string[count];
                 
                     while (dr.Read())
                    {
                        ItemDescription_old[i] = dr[1].ToString();
                        PricePerUnit_old[i] = dr[2].ToString();
                        Quantity_old[i] = dr[3].ToString();
                        itemCode_old[i] = dr[4].ToString();
                        product_GUID_old[i] = dr[5].ToString();
                        i++;
                    }
                }
                catch (Exception f)
                {
                    Response.Write("error found " + f.Message);
                }
                con.Close();
                dr.Close();

            }



            public int get_new_quote_info(int version, string quoteNo)  //find out latest quoteGUID
            {
                con = new SqlConnection("DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=fIw4VdokuY2Lb0;DATABASE=apmgstudy");

                SqlDataReader dr = null;

                int new_qid = 0;
                con.Open();
                try
                {

                    SqlCommand cmd = new SqlCommand("select quoteId from QW_QuoteOverview where versionNo=@a and quoteno=@b", con);
                    cmd.Parameters.Add(new SqlParameter("@a", version));
                    cmd.Parameters.Add(new SqlParameter("@b", quoteNo));

                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        new_qid = Convert.ToInt32((dr[0].ToString()));
                    }
                }
                catch (Exception f)
                {
                    Response.Write("error found " + f.Message);
                }
                con.Close();
                dr.Close();
                return new_qid;


            }

            public ArrayList get_info_VM_qid(string qid_edit)  // get information from previous quoteID
            {
                con = new SqlConnection("DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=fIw4VdokuY2Lb0;DATABASE=apmgstudy");

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
                dr.Close();
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
                dr.Close();
                con.Close();
                
                return dr;
            }


            //algo to delete quote from CRM
            public void DELETE_FROM_CRM(string guid,string[] arr1, string[] arr2)
            //arr1 contains prev quote item code
            //arr1 contains latest quote item code
            {
                IOrganizationService service = connection_to_crm();
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
                    if (flag == 0)
                    {
                
                        bool isDeleted = EDUsys.DeleteLineItem(service, guid, product_GUID_old[i]);
                    }
                }
            }

            //algo to write code to update and add new Quote with line items
            public void UPDATE_FROM_CRM(string guid,string qid_edit,int new_qid , string[] arr1, string[] arr2)
            //arr1 contains prev quote item code
            //arr1 contains latest quote item code
            {
              SqlConnection  con1 = new SqlConnection("DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=fIw4VdokuY2Lb0;DATABASE=apmgstudy");
              ArrayList q_info = new ArrayList();
              string new_QuoteGUID = "";
                IOrganizationService service = connection_to_crm();
                if (option.Equals("R1"))
                {
                    q_info = GET_INFO_VM_CRM(qid_edit);
                    decimal DiscountPercent = Convert.ToDecimal(q_info[9].ToString());
                    decimal discount_amount = Convert.ToDecimal(q_info[10].ToString());
                    if (DiscountPercent < 0)
                        DiscountPercent = -DiscountPercent;
                    if (discount_amount < 0)
                        discount_amount = -discount_amount;

                 //   new_QuoteGUID = EDUsys.CreateQuote(service, q_info[0].ToString(), q_info[1].ToString(), Convert.ToDateTime(q_info[2].ToString()), Convert.ToInt32(q_info[3].ToString()), Convert.ToInt32(q_info[4].ToString()), Convert.ToInt32(q_info[5].ToString()), q_info[6].ToString(), false, Convert.ToDecimal(q_info[8].ToString()), Convert.ToDecimal(DiscountPercent), Convert.ToDecimal(discount_amount), "36722D1F-5A91-E211-BD26-984BE17313AB", "2AFFF2F0-065F-E211-9177-984BE17313D7");
                    // new Quote Guid will be created  and apply it in A1 adding new Quote with line items
                    SqlCommand cmd3 = new SqlCommand("update QW_QuoteOverview set quote_GUID=@x,Topic=@a,Est_Close_Date=@c,Probability=@d,Phase=@e,Rating=@f, Owner=@g, Source_Campaign=@h,Revenue=@i,Est_Revenue=@j,contact_GUID=@m where quoteId=@b", con);
                    cmd3.Parameters.Add(new SqlParameter("@x", guid));
                    cmd3.Parameters.Add(new SqlParameter("@a", q_info[0].ToString()));
                    cmd3.Parameters.Add(new SqlParameter("@m", q_info[1].ToString()));
                    cmd3.Parameters.Add(new SqlParameter("@c", Convert.ToDateTime(q_info[2].ToString())));
                    cmd3.Parameters.Add(new SqlParameter("@d", Convert.ToInt32(q_info[3].ToString())));
                    cmd3.Parameters.Add(new SqlParameter("@e", Convert.ToInt32(q_info[4].ToString())));
                    cmd3.Parameters.Add(new SqlParameter("@f", Convert.ToInt32(q_info[5].ToString())));
                    cmd3.Parameters.Add(new SqlParameter("@g", q_info[6].ToString()));
                    cmd3.Parameters.Add(new SqlParameter("@h", q_info[11].ToString()));
                    cmd3.Parameters.Add(new SqlParameter("@i", q_info[7].ToString()));
                    cmd3.Parameters.Add(new SqlParameter("@j", q_info[8].ToString()));

                    cmd3.Parameters.Add(new SqlParameter("@b", new_qid));

                    // Convert.ToInt32(q_info[4].ToString()), 
                    //Convert.ToInt32(q_info[5].ToString()), q_info[6].ToString(), false, Convert.ToDecimal(q_info[8].ToString()), Convert.ToDecimal(DiscountPercent), Convert.ToDecimal(discount_amount),
                    //"36722D1F-5A91-E211-BD26-984BE17313AB", "2AFFF2F0-065F-E211-9177-984BE17313D7
                    con.Open();
                    cmd3.ExecuteNonQuery();
                    con.Close();
                      

                }
                if (option.Equals("A1"))
                {
                     q_info = GET_INFO_VM_CRM(qid_edit);
                     decimal DiscountPercent = Convert.ToDecimal(q_info[9].ToString());
                     decimal discount_amount = Convert.ToDecimal(q_info[10].ToString());
                     if (DiscountPercent < 0)
                         DiscountPercent = -DiscountPercent;
                     if (discount_amount < 0)
                         discount_amount = -discount_amount;

                     new_QuoteGUID = EDUsys.CreateQuote(service, q_info[0].ToString(), q_info[1].ToString(), Convert.ToDateTime(q_info[2].ToString()), Convert.ToInt32(q_info[3].ToString()), Convert.ToInt32(q_info[4].ToString()), Convert.ToInt32(q_info[5].ToString()), q_info[6].ToString(), false, Convert.ToDecimal(q_info[8].ToString()), Convert.ToDecimal(DiscountPercent), Convert.ToDecimal(discount_amount), "36722D1F-5A91-E211-BD26-984BE17313AB", "2AFFF2F0-065F-E211-9177-984BE17313D7", q_info[11].ToString());
                    // new Quote Guid will be created  and apply it in A1 adding new Quote with line items
                    SqlCommand cmd3 = new SqlCommand("update QW_QuoteOverview set quote_GUID=@x,Topic=@a,Est_Close_Date=@c,Probability=@d,Phase=@e,Rating=@f, Owner=@g, Source_Campaign=@h,Revenue=@i,Est_Revenue=@j,contact_GUID=@m where quoteId=@b", con);
                    cmd3.Parameters.Add(new SqlParameter("@x", new_QuoteGUID));
                    cmd3.Parameters.Add(new SqlParameter("@a", q_info[0].ToString()));
                    cmd3.Parameters.Add(new SqlParameter("@m", q_info[1].ToString()));
                    cmd3.Parameters.Add(new SqlParameter("@c", Convert.ToDateTime(q_info[2].ToString())));
                    cmd3.Parameters.Add(new SqlParameter("@d", Convert.ToInt32(q_info[3].ToString())));
                    cmd3.Parameters.Add(new SqlParameter("@e", Convert.ToInt32(q_info[4].ToString())));
                    cmd3.Parameters.Add(new SqlParameter("@f", Convert.ToInt32(q_info[5].ToString())));
                    cmd3.Parameters.Add(new SqlParameter("@g", q_info[6].ToString()));
                    cmd3.Parameters.Add(new SqlParameter("@h", q_info[11].ToString()));
                    cmd3.Parameters.Add(new SqlParameter("@i", q_info[7].ToString()));
                    cmd3.Parameters.Add(new SqlParameter("@j", q_info[8].ToString()));
               
                    cmd3.Parameters.Add(new SqlParameter("@b", new_qid));

                    // Convert.ToInt32(q_info[4].ToString()), 
                    //Convert.ToInt32(q_info[5].ToString()), q_info[6].ToString(), false, Convert.ToDecimal(q_info[8].ToString()), Convert.ToDecimal(DiscountPercent), Convert.ToDecimal(discount_amount),
                    //"36722D1F-5A91-E211-BD26-984BE17313AB", "2AFFF2F0-065F-E211-9177-984BE17313D7
                    con.Open();
                    cmd3.ExecuteNonQuery();
                    con.Close();
                      
                }
                int flag = 0;
                int i = 0;
                for (int j = 0; j < arr2.Length; j++) // loop th 2 nd array contains latest Quote id
                {
                    flag = 0;
                    for ( i = 0; i < arr1.Length; i++)
                    {
                        if (arr2[j].Equals(arr1[i]))
                        {
                            //update in crm
                            flag = 1;
                            break;
                        }

                    }
                    if (flag == 1)
                    {
                        //update line items with prev GUID

//                        QuoteGUID = "";
  //                      LineItemGUID = "";
                        if (option.Equals("R1"))
                        {

                            bool isUpdated1 = EDUsys.UpdateWriteInLineItem(service, guid, product_GUID_old[i], ItemDescription_new[j], Convert.ToDecimal(PricePerUnit_new[j]), Convert.ToDecimal(Quantity_new[j]));
                            //update in vmquotes also in new quoteid       
                            if (isUpdated1)
                            {
                                Response.Write("updated");
                            }
                            SqlCommand cmd3 = new SqlCommand("update QW_QuoteOverview set quote_GUID=@a where quoteId=@b", con);
                            cmd3.Parameters.Add(new SqlParameter("@a", guid));
                            cmd3.Parameters.Add(new SqlParameter("@b", new_qid));
                            con.Open();
                            cmd3.ExecuteNonQuery();
                            con.Close();
                            SqlCommand cmd4 = new SqlCommand("update  QW_QuoteDetails set product_GUID=@a where quoteId=@b and itemCode=@c", con);
                            cmd4.Parameters.Add(new SqlParameter("@a", product_GUID_old[j]));
                            cmd4.Parameters.Add(new SqlParameter("@b", new_qid));
                            cmd4.Parameters.Add(new SqlParameter("@c", arr2[j]));

                            con.Open();
                            cmd4.ExecuteNonQuery();
                            con.Close();
                        }
                        else if (option.Equals("A1"))
                        {
                            //Items will be added in new QuoteID
                            string AddedProductGUID = EDUsys.AddWriteInLineItem(service, new_QuoteGUID, ItemDescription_new[j], Convert.ToDecimal(PricePerUnit_new[j]), Convert.ToDecimal(Quantity_new[j]));
                            SqlCommand cmd4 = new SqlCommand("update  QW_QuoteDetails set product_GUID=@a where quoteId=@b and itemCode=@c", con);
                            cmd4.Parameters.Add(new SqlParameter("@a", AddedProductGUID));
                            cmd4.Parameters.Add(new SqlParameter("@b", new_qid));
                            cmd4.Parameters.Add(new SqlParameter("@c", arr2[j]));

                            con.Open();
                            cmd4.ExecuteNonQuery();
                            con.Close();
                      
                        }
                    }
                    else if (flag == 0)
                    {
                        if (option.Equals("R1"))
                        {
                            //no New Quote will be created
                            // Add line items with prev QUOTE GUID----------------------------->>>>>  guid
                         //   string AddedProductGUID = EDUsys.AddWriteInLineItem(service, QuoteGUID, ItemDescription, PricePerUnit, Quantity);
                            // update in vmquotes also for next time
                           string AddedProductGUID = EDUsys.AddWriteInLineItem(service, guid, ItemDescription_new[j], Convert.ToDecimal(PricePerUnit_new[j]), Convert.ToDecimal(Quantity_new[j]));
                            // update code in VMQuote AddedProductGUID with old Quote GUID

                      //confusing......after updating what shold be quote guid in quote overview
                            
                            SqlCommand cmd3 = new SqlCommand("update QW_QuoteOverview set quote_GUID=@a where quoteId=@b", con);
                           cmd3.Parameters.Add(new SqlParameter("@a", guid));
                           cmd3.Parameters.Add(new SqlParameter("@b", new_qid));
                           con.Open();
                           cmd3.ExecuteNonQuery();
                           con.Close();
                       
                            SqlCommand cmd4 = new SqlCommand("update  QW_QuoteDetails set product_GUID=@a where quoteId=@b and itemCode=@c", con);
                            cmd4.Parameters.Add(new SqlParameter("@a", AddedProductGUID));
                            cmd4.Parameters.Add(new SqlParameter("@b", new_qid));
                            cmd4.Parameters.Add(new SqlParameter("@c", arr2[j]));

                            con.Open();
                            cmd4.ExecuteNonQuery();
                            con.Close();
                   
                        }
                        else if (option.Equals("A1"))
                        {
                            // create new Quote Guid n add line items in this id
                     //get all extra field in arrayList
                         //update new quote in our VMQUOTE

                       
                            //"36722D1F-5A91-E211-BD26-984BE17313AB", "2AFFF2F0-065F-E211-9177-984BE17313D7" have to add while create new quote
                            //    string QuoteGUID = EDUsys.CreateQuote(service, string topic, string ContactGUID, DateTime estCloseDate, int probabiliy, int Phase, int Rating, string OwnerUserGUID, bool Revenue, decimal EstRevenue, decimal DiscountPercent, decimal DiscountAmount, string PriceListGUID);
                        string AddedProductGUID = EDUsys.AddWriteInLineItem(service, new_QuoteGUID, ItemDescription_new[j], Convert.ToDecimal(PricePerUnit_new[j]), Convert.ToDecimal(Quantity_new[j]));
                        SqlCommand cmd4 = new SqlCommand("update  QW_QuoteDetails set product_GUID=@a where quoteId=@b and itemCode=@c", con);
                        cmd4.Parameters.Add(new SqlParameter("@a", AddedProductGUID));
                        cmd4.Parameters.Add(new SqlParameter("@b", new_qid));
                        cmd4.Parameters.Add(new SqlParameter("@c", arr2[j]));

                        con.Open();
                        cmd4.ExecuteNonQuery();
                        con.Close();
                        AddedProductGUID = "";
                            // update in vmquotes also for next time
                            //update into quotedetails
                        }
                    }
                }
            }


            public ArrayList GET_INFO_VM_CRM(string guid)
            {
                ArrayList ls = new ArrayList();
                con = new SqlConnection("DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=fIw4VdokuY2Lb0;DATABASE=apmgstudy");
                SqlDataReader dr = null;
                ArrayList a = new ArrayList(); //array of itemdescrption,priceperunit,quantity 

                con.Open();
                try
                {

                    SqlCommand cmd = new SqlCommand("select Topic,contact_GUID,Est_Close_Date,Probability,Phase,Rating,Owner,Revenue,Est_Revenue,discount_percent,totalDiscount,Source_Campaign from QW_QuoteOverview where quoteId=@a", con);
                    cmd.Parameters.Add(new SqlParameter("@a",Convert.ToInt32(guid)));

                    dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        a.Add(dr[0].ToString());
                        a.Add(dr[1].ToString());
                        a.Add(dr[2].ToString());
                        a.Add(dr[3].ToString());
                        a.Add(dr[4].ToString());
                        a.Add(dr[5].ToString());
                        a.Add(dr[6].ToString());
                        a.Add(dr[7].ToString());
                        a.Add(dr[8].ToString());
                        a.Add(dr[9].ToString());
                        a.Add(dr[10].ToString());
                        a.Add(dr[11].ToString());

                    }
                }
                catch (Exception f)
                {
                    Response.Write("error found " + f.Message);
                }
                dr.Close();
                con.Close();
             
                return a;
       
               
            }




            public IOrganizationService connection_to_crm()
            {
                IOrganizationService service = null;
                try
                {
                    string userName = Convert.ToString(Session["username"]);//"quote@edusysglobalservices.onmicrosoft.com";
                    string password = Convert.ToString(Session["password"]); //"Saxu0104";
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