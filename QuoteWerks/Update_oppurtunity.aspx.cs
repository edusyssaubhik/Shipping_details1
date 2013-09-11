
using EDUsysVmqCrmIntegration;
using Microsoft.Xrm.Sdk;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shipping_details1.QuoteWerks
{
    public partial class Update_oppurtunity : System.Web.UI.Page
    {
        public string QuoteGUID,contact_GUID,  ownerUserGUID ;
        //SqlConnection con = new SqlConnection("DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=fIw4VdokuY2Lb0;DATABASE=apmgstudy");
        //  SqlConnection con = new SqlConnection("Data Source=SAVITA-PC;Initial Catalog=APMG;User ID=sa;Password=***********");
           SqlConnection con =null;// new SqlConnection("Data Source=saubhik-pc;Initial Catalog=apmgstudy;User ID=sa;Password=***********");
             public string qid;
            public string query;

          //  SqlConnection con = null;
            SqlConnection con1 = null;
            DataTable owener_list = null;
            DataTable get_Campaign = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection("DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=fIw4VdokuY2Lb0;DATABASE=apmgstudy");
            con1 = new SqlConnection("DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=fIw4VdokuY2Lb0;DATABASE=apmgstudy");
            query = Request.QueryString["query"];
            qid = Request.QueryString["qid"];
            //Session["username"] = null ;
            try
            {
                if (Request.QueryString["qid"] != "" && Request.QueryString["query"] != "")
                {
                    string user=Convert.ToString(Session["username"]);
                    if ( user.Equals(""))
                    {
                        string query2 = "qid=" + Request.QueryString["qid"] + "&query=" + Request.QueryString["query"];
               
                            Response.Redirect("~/QuoteWerks/login.aspx?query2=" + query2);
               
                    }
                    IOrganizationService service = connection_to_crm();
                    
                    string OwnerFullName = get_full_owner_name(qid);
                     owener_list = EDUsys.GetUsers(service, 0, "");
                     get_Campaign = EDUsys.GetSourceCampaign(service, 0, "");
                    string ownerUserGUID = EDUsys.ValidateOwnerWithCRMUser(service, OwnerFullName);
                    if (ownerUserGUID.Equals(""))
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('YOU ARE NOT AUTHORIZED TO ACCESS THE CRM')</script>");
                        if (query.Equals("V1"))
                        {
                            Response.Redirect("~/QuoteWerks/QuotegeneratedReport.asp");
                        }
                        else if (query.Equals("V2"))
                        {
                            Response.Redirect("~/QuoteWerks/edit_QuotegeneratedReport.asp");

                        }
                    
                    }
                   
                    if(!IsPostBack)
                    {
                        if (ownerUserGUID != "")
                        {
                            if (query.Equals("V1") || query.Equals("V2"))
                            {
                                if (qid != "")
                                {
                                    //bind user data
                                    DropDownList6.DataSource = owener_list;
                                   
                                    DropDownList6.DataTextField = "User Name";
                                    DropDownList6.DataValueField = "User GUID";
                                    DropDownList6.DataBind();
                                    DropDownList6.Items.Insert(0, new ListItem("Select", "Select"));
                                    if (!IsPostBack)
                                    {
                                        for (int j = 0; j < DropDownList6.Items.Count; j++)
                                        {
                                            if (DropDownList6.Items[j].Value.Equals(ownerUserGUID))
                                            {
                                                DropDownList6.Items[j].Selected = true;
                                                break;
                                            }
                                        }
                                    }
                                    //bind campayn data

                                    DropDownList7.DataSource = get_Campaign;
                                   

                                    DropDownList7.DataTextField = "Campaign Name";
                                    DropDownList7.DataValueField = "Campaign GUID";
                                    DropDownList7.DataBind();
                                    DropDownList7.Items.Insert(0, new ListItem("Select", "Select"));

                                    TextBox1.Text= get_info_VM_quoteno(qid)+"-";
                                   TextBox7.Text = get_info_VM_totalmargin(qid);
                                   TextBox7.Enabled = false;
                                }
                            }
                             if (query.Equals("V2"))
                            {
                                if (qid != "")
                                {
                                    
                                    SqlCommand cmd1 = new SqlCommand("select Topic,Est_Close_Date,Probability,Phase,Rating,Owner,Source_Campaign,Revenue,margin_total  from QW_QuoteOverview where quoteId=@a", con);

                                    cmd1.Parameters.Add(new SqlParameter("@a", Int32.Parse(qid)));
                                    // con.Open();
                                    cmd1.Connection.Open();
                                    SqlDataReader dr = cmd1.ExecuteReader();
                                    if (dr.Read())
                                    {
                                        TextBox6.Visible = false;
                                   string []date1=  dr[1].ToString().Split(' ');
                                 
                                   string[] dt1 = date1[0].Split('/');//mm/dd/yyyy
                                   DateTime dt = new DateTime();       
                                        //  DateTime dt = DateTime.ParseExact(dr[1].ToString(), "yyyy-MM-dd", CultureInfo.InvariantCulture);
                               //     DateTime dt=DateTime.ParseExact(dr[1].ToString(), "yyyy/MM/DD", CultureInfo.InvariantCulture);
                                        TextBox1.Text = dr[0].ToString();
                                        TextBox2.Text = dt1[0]+"/"+dt1[1]+"/"+dt1[2];//dd/mm/yyyy
                                        TextBox3.Text = dr[2].ToString();
                                        //dropdown bind 1 and 2
                                        DropDownList1.ClearSelection();
                                        DropDownList1.Items.FindByValue((dr[3].ToString())).Selected = true;
                                        //dropdown bind 1 and 2
                                        DropDownList2.ClearSelection();
                                        DropDownList2.Items.FindByValue((dr[4].ToString())).Selected = true;
                                      //  TextBox4.Text = dr[5].ToString();
                                        DropDownList6.DataSource = owener_list;
                                        DropDownList6.DataBind();
                                        DropDownList6.DataTextField = "User Name";
                                        DropDownList6.DataValueField = "User GUID";
                                        DropDownList6.Items.Insert(0, new ListItem("Select", "Select"));
                                        // selecting user
                                        for (int j = 0; j < DropDownList6.Items.Count; j++)
                                        {
                                            if (DropDownList6.Items[j].Value.Equals(dr[5].ToString()))
                                            {
                                                DropDownList6.Items[j].Selected = true;
                                                break;
                                            }
                                        }

                                        DropDownList7.DataSource = get_Campaign;
                                        DropDownList7.DataBind();

                                        DropDownList7.DataTextField = "Campaign Name";
                                        DropDownList7.DataValueField = "Campaign GUID";
                                        DropDownList7.Items.Insert(0, new ListItem("Select", "Select"));

                                        for (int j = 0; j < DropDownList7.Items.Count; j++)
                                        {
                                            if (DropDownList7.Items[j].Value.Equals(dr[6].ToString()))
                                            {
                                                DropDownList7.Items[j].Selected = true;
                                                break;
                                            }
                                        }

                                        //      TextBox6.Visible = true;
                                        TextBox6.Text = dr[7].ToString();
                                        TextBox7.Text = dr[8].ToString();
                                    }

                                      cmd1.Connection.Close();
                                    dr.Close(); dr.Dispose();
                                    con.Close();

                                }
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('You can not Access the page');</script>");
                        }
                        //edit option comes
                       // TextBox1.Text= ;

                    }
                }
            }
            catch (Exception m)
            {


            }
        }

        public IOrganizationService connection_to_crm()
         {
            IOrganizationService service=null;
            try
            {
                
   string userName =Convert.ToString(Session["username"]);//"quote@edusysglobalservices.onmicrosoft.com";
   string password = Convert.ToString(Session["password"]); //"Saxu0104";
   string orgUrl = "https://edusysglobalservices.api.crm5.dynamics.com/XRMServices/2011/Organization.svc";
    service = EDUsys.CreateService(userName, password, orgUrl);
    return service;
//dtTable = EDUsys.GetContacts(service, 3, search_key);// search by last name(3)
    /// Response.Write("The owner guid is "+ownerUserGUID);
//string QuoteGUID = EDUsys.CreateQuote(service, string topic, string ContactGUID, DateTime estCloseDate, int probabiliy, int Phase, int Rating, string OwnerUserGUID, bool Revenue, decimal EstRevenue, decimal DiscountPercent, decimal ProductTotal, decimal DiscountAmount, decimal PreFreightAmount, decimal TotalAmount, int Quantity, decimal PricePerUnit, decimal ExtendedAmount);
             } 
            catch(Exception v){
                Response.Write(v.Message);
            }
            return service;
        }
        public string get_full_owner_name(string qid)
        {
            string fullname = "";
            try
            {
               
                SqlCommand cmd = new SqlCommand("select a.firstname,a.lastname from users a,QW_QuoteOverview b where a.userid=b.userId and b.quoteId=@a", con);
                cmd.Parameters.Add(new SqlParameter("@a",Int32.Parse(qid)));

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    fullname = dr[0].ToString() + " " + dr[1].ToString();
                }
                con.Close();
            }catch(Exception f){
                Response.Write("error found "+f.Message);
            }
            return fullname;
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



        public ArrayList get_info_VM_qid(string qid)
        {
            con = new SqlConnection("DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=fIw4VdokuY2Lb0;DATABASE=apmgstudy");
            SqlDataReader dr = null;
            ArrayList a = new ArrayList(); //array of itemdescrption,priceperunit,quantity 

            con.Open();
            try
            {

                SqlCommand cmd = new SqlCommand("select discount_percent,totalDiscount from QW_QuoteOverview where quoteId=@a", con);
                cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(qid)));
                
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    a.Add(dr[0].ToString());
                    a.Add(dr[1].ToString());
                }
            }
            catch (Exception f)
            {
                Response.Write("error found " + f.Message);
            }
            con.Close();
            return a;
        }


        public ArrayList get_info_VM_qid1(string qid_edit)  // get information from previous quoteID
        {
            con = new SqlConnection("DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=fIw4VdokuY2Lb0;DATABASE=apmgstudy");

            SqlDataReader dr = null;
            ArrayList a = new ArrayList(); //array of itemdescrption,priceperunit,quantity 

            con.Open();
            try
            {

                SqlCommand cmd = new SqlCommand("select quote_GUID from QW_QuoteOverview where quoteId=@a", con);
                cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(qid_edit)));

                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    a.Add(dr[0].ToString());
                    
                }
            }
            catch (Exception f)
            {
                Response.Write("error found " + f.Message);
            }
            con.Close();
            return a;
        }

        public string get_info_VM_quoteno(string qid)  // get information from previous quoteID
        {
            con = new SqlConnection("DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=fIw4VdokuY2Lb0;DATABASE=apmgstudy");

            SqlDataReader dr = null;
            string quote_no = "";
            con.Open();
            try
            {

                SqlCommand cmd = new SqlCommand("select quoteno from QW_QuoteOverview where quoteId=@a", con);
                cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(qid)));

                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    quote_no = dr[0].ToString();
                }
            }
            catch (Exception f)
            {
                Response.Write("error found " + f.Message);
            }
            con.Close();
            return quote_no;
        }


        public string get_info_VM_totalmargin(string qid)  // get information from previous quoteID
        {
            con = new SqlConnection("DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=fIw4VdokuY2Lb0;DATABASE=apmgstudy");

            SqlDataReader dr = null;
            string margin = "";
            con.Open();
            try
            {

                SqlCommand cmd = new SqlCommand("select margin_total from QW_QuoteOverview where quoteId=@a", con);
                cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(qid)));

                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    margin = dr[0].ToString();
                }
            }
            catch (Exception f)
            {
                Response.Write("error found " + f.Message);
            }
            con.Close();
            return margin;
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if(query.Equals("V2"))
               
                {
                    
                 
                    //update 
                    //Update Write-In Product
                     IOrganizationService service= connection_to_crm();
                //find out QuoteGUID from unique qid....confusing!!!!!!shoud I match QuoteNo???????????
  bool isUpdated1 = true;
  if (TextBox1.Text != "" && TextBox2.Text != "" && TextBox3.Text != "" && DropDownList6.SelectedItem.Value != "Select" && DropDownList7.SelectedItem.Value != "Select" && TextBox6.Text != "" && TextBox7.Text != "" && DropDownList1.SelectedItem.Value != "Select" && DropDownList2.SelectedItem.Value != "Select")
  {
      IOrganizationService service1 = connection_to_crm();
      string OwnerFullName = get_full_owner_name(qid);

      string ownerUserGUID = EDUsys.ValidateOwnerWithCRMUser(service1, OwnerFullName);
      // //Price list GUID from VM Quote setup
      contact_GUID = Convert.ToString(Session["Contact_GUID"]);
  
   ArrayList d=      get_info_VM_qid1(qid);
   ArrayList dr1 = get_info_VM_qid(qid);
   decimal DiscountPercent = Convert.ToDecimal(dr1[0]);
   decimal discount_amount = Convert.ToDecimal(dr1[1]);
   if (DiscountPercent < 0)
       DiscountPercent = -DiscountPercent;
   if (discount_amount < 0)
       discount_amount = -discount_amount;


   bool Revenue = false;//always as writeline product
      string quote_guid = d[0].ToString();
   bool updated = EDUsys.UpdateQuote(service1, quote_guid, TextBox1.Text,Convert.ToDateTime(TextBox2.Text), Int32.Parse(TextBox3.Text), Int32.Parse(DropDownList1.SelectedItem.Value), Int32.Parse(DropDownList2.SelectedItem.Value), Revenue, Convert.ToDecimal(TextBox7.Text), DiscountPercent, discount_amount,DropDownList6.SelectedItem.Value,DropDownList7.SelectedItem.Value);
      SqlCommand cmd3 = new SqlCommand("update QW_QuoteOverview set Topic=@a,Est_Close_Date=@c,Probability=@d,Phase=@e,Rating=@f, Owner=@g, Source_Campaign=@h,Revenue=@i,Est_Revenue=@j,pricelist=@l,contact_GUID=@m where quoteId=@k", con);
      cmd3.Parameters.Add(new SqlParameter("@a", TextBox1.Text));
      cmd3.Parameters.Add(new SqlParameter("@c",Convert.ToDateTime(TextBox2.Text)));
      cmd3.Parameters.Add(new SqlParameter("@d", TextBox3.Text));
      cmd3.Parameters.Add(new SqlParameter("@e", DropDownList1.SelectedItem.Value));
      cmd3.Parameters.Add(new SqlParameter("@f", DropDownList2.SelectedItem.Value));
      cmd3.Parameters.Add(new SqlParameter("@g", DropDownList6.SelectedItem.Value));
      cmd3.Parameters.Add(new SqlParameter("@h", DropDownList7.SelectedItem.Value));
      cmd3.Parameters.Add(new SqlParameter("@i", DropDownList3.SelectedItem.Text));
      cmd3.Parameters.Add(new SqlParameter("@j", TextBox7.Text));

      cmd3.Parameters.Add(new SqlParameter("@l", pricelist.Text));
      cmd3.Parameters.Add(new SqlParameter("@m", contact_GUID));
      cmd3.Parameters.Add(new SqlParameter("@k", qid));
      con.Open();
      cmd3.ExecuteNonQuery();
      con.Close();
      cmd3.Dispose();
      Response.Redirect("~/QuoteWerks/edit_QuotegeneratedReport.asp");

         }                
                }
                if (query.Equals("V1"))
                {
                    if (qid != "")
                    {


                        // after button click,the code will be created in CRM             
                        bool Revenue = false;

                        if (TextBox1.Text != "" && TextBox2.Text != "" && TextBox3.Text != "" && DropDownList7.SelectedItem.Value != "Select" && TextBox6.Text != "" && TextBox7.Text != "" && DropDownList1.SelectedItem.Value != "Select" && DropDownList2.SelectedItem.Value != "Select")
                        {

                            // connection set with CRM
                            IOrganizationService service = connection_to_crm();
                            //To get the GUID of CRM user to map Opportunity owner in CRM
                            //to get owner or login guid 
                            // to fetch the owner id we have to match userid from qw_overview and userid from users and fetch the user full name-->should valid in crm database
                            // write sql query to fetch the data
                            // store full name to OwnerFullName
                            string OwnerFullName = get_full_owner_name(qid);

                            ArrayList dr1 = get_info_VM_qid(qid);

                            ownerUserGUID = EDUsys.ValidateOwnerWithCRMUser(service, OwnerFullName);
                            // //Price list GUID from VM Quote setup
                            contact_GUID = Convert.ToString(Session["Contact_GUID"]);
                            //contact_GUID = "";
                            if ((ownerUserGUID != "") && (pricelist.Text != ""))
                            {
                                if (DropDownList3.SelectedItem.Value.Equals("0"))
                                {
                                    Revenue = false;
                                }
                                else
                                {
                                    Revenue = true;
                                }
                                // day after tomo. we ll have discuss with Ayan about DiscountPercent and all

                                //a new quote is created
                                con.Open();


                                decimal DiscountPercent = Convert.ToDecimal(dr1[0]);
                                decimal discount_amount = Convert.ToDecimal(dr1[1]);
                                if (DiscountPercent < 0)
                                    DiscountPercent = -DiscountPercent;
                                if (discount_amount < 0)
                                    discount_amount = -discount_amount;
                                string owner = "";
                                if (DropDownList6.SelectedItem.Value != "Select")
                                {
                                    ownerUserGUID = DropDownList6.SelectedItem.Value;
                                }

                                QuoteGUID = EDUsys.CreateQuote(service, TextBox1.Text, contact_GUID, Convert.ToDateTime(TextBox2.Text), Int32.Parse(TextBox3.Text), Convert.ToInt32(DropDownList1.SelectedItem.Value), Int32.Parse(DropDownList2.SelectedItem.Value), ownerUserGUID, Revenue, Convert.ToDecimal(TextBox7.Text), DiscountPercent, discount_amount, "36722D1F-5A91-E211-BD26-984BE17313AB", "2AFFF2F0-065F-E211-9177-984BE17313D7", DropDownList7.SelectedItem.Value);

                                con.Close();
                                //dr1.Close();
                                //Add Write-In Product
                                //need to fetch data from QW_overview and try to iterate a while loop through and add all line items
                                con.Open();

                                SqlDataReader dr = null;// get_line_items_details(qid);
                                ArrayList a = new ArrayList();
                                con1.Open();
                                SqlCommand cmd = new SqlCommand("select orderid,itemName,price,quantity from QW_QuoteDetails where quoteId=@a", con1);
                                cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(qid)));
                                // con1.Open();
                                dr = cmd.ExecuteReader();
                                ArrayList product = new ArrayList();
                                ArrayList orderid = new ArrayList();

                                while (dr.Read())
                                {
                                    IOrganizationService service1 = connection_to_crm();
                                    // fullname = dr[0].ToString() + " " + dr[1].ToString();
                                    //added WriteInLine Items in loop through
                                    string AddedProductGUID = EDUsys.AddWriteInLineItem(service1, QuoteGUID, Convert.ToString(dr[1]), Convert.ToDecimal(dr[2]), Convert.ToDecimal(dr[3]));
                                    product.Add(AddedProductGUID);
                                    orderid.Add(dr[0].ToString());

                                    //product guid need to be added in QW_details after created by writein process update query

                                }
                                dr.Close();
                                con.Close();
                                for (int i = 0; i < product.Count; i++)
                                {
                                    //  con1.Open();
                                    SqlCommand cmd1 = new SqlCommand("update QW_QuoteDetails set product_GUID=@b,pricing=@c where orderid=@a", con1);
                                    cmd1.Parameters.Add(new SqlParameter("@a", Int32.Parse(orderid[i].ToString())));
                                    cmd1.Parameters.Add(new SqlParameter("@b", product[i].ToString()));
                                    cmd1.Parameters.Add(new SqlParameter("@c", Convert.ToInt32(DropDownList4.SelectedItem.Value)));

                                    cmd1.ExecuteNonQuery();
                                }
                                con1.Close();



                                SqlCommand cmd3 = new SqlCommand("update QW_QuoteOverview set Topic=@a,Est_Close_Date=@c,Probability=@d,Phase=@e,Rating=@f, Owner=@g, Source_Campaign=@h,Revenue=@i,Est_Revenue=@j,pricelist=@l,contact_GUID=@m,quote_GUID=@n where quoteId=@k", con);
                                cmd3.Parameters.Add(new SqlParameter("@a", TextBox1.Text));
                                cmd3.Parameters.Add(new SqlParameter("@c", Convert.ToDateTime(TextBox2.Text)));
                                cmd3.Parameters.Add(new SqlParameter("@d", TextBox3.Text));
                                cmd3.Parameters.Add(new SqlParameter("@e", DropDownList1.SelectedItem.Value));
                                cmd3.Parameters.Add(new SqlParameter("@f", DropDownList2.SelectedItem.Value));
                                cmd3.Parameters.Add(new SqlParameter("@g", ownerUserGUID));
                                cmd3.Parameters.Add(new SqlParameter("@h", DropDownList7.SelectedItem.Value));
                                cmd3.Parameters.Add(new SqlParameter("@i", DropDownList3.SelectedItem.Text));
                                cmd3.Parameters.Add(new SqlParameter("@j", TextBox7.Text));

                                cmd3.Parameters.Add(new SqlParameter("@l", pricelist.Text));
                                cmd3.Parameters.Add(new SqlParameter("@m", contact_GUID));
                                cmd3.Parameters.Add(new SqlParameter("@n", QuoteGUID));
                                cmd3.Parameters.Add(new SqlParameter("@k", qid));
                                con.Open();
                                cmd3.ExecuteNonQuery();
                                con.Close();
                                cmd3.Dispose();
                                Response.Redirect("~/QuoteWerks/QuotegeneratedReport.asp");
            
                            }
                        }
                        else
                        {
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please Fill all the oppurtunity form properly')</script>");
            
                        }
                    }



                    // discount % need to be added in different discount column not added till

                                    }
/*                    if (query.Equals("V1") )
                    {
                        Response.Redirect("~/QuoteWerks/QuotegeneratedReport.asp");
                    }
                    else if (query.Equals("V2"))
                    {
                        Response.Redirect("~/QuoteWerks/edit_QuotegeneratedReport.asp");

                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please Fill all the oppurtunity form properly')</script>");
                    }*/
                 
               // else
                //{
                  //  Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please Fill all the oppurtunity form properly')</script>");
                //}
            
            }
            catch (Exception l)
            {
                Response.Write(l.Message);
            }
        
        }

        protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList5.SelectedItem.Value.Equals("CRM Existing Product"))
            {
                DropDownList4.Visible = true;
                Label10.Visible = true;
            }
            else
            {
                DropDownList4.Visible = false;
                Label10.Visible = false; 
            }
        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public DateTime ParseDate(string date)
        {
            DateTimeFormatInfo dateFormatProvider = new DateTimeFormatInfo();
            dateFormatProvider.ShortDatePattern = "dd/MM/yyyy";

            return DateTime.Parse(date, dateFormatProvider);
        }

        protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}