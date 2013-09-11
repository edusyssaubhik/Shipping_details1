using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Specialized;
using EDUsysVmqCrmIntegration;

using Microsoft.Xrm.Sdk;
namespace Shipping_details1
{
    public partial class new_ship : System.Web.UI.Page
    {

        public string sold_cname, sold_add, sold_name1, ship_cname, ship_add, ship_name1, bill_cname, bill_add, bill_name1, ph1, ph2, ph3, email1, email2, email3, fax1, fax2, fax3;
       //SqlConnection con = new SqlConnection("Data Source=SAUBHIK-PC;Initial Catalog=apmgstudy;Integrated Security=True");
      
        public string sold_comp;
       SqlConnection con = new SqlConnection("DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=fIw4VdokuY2Lb0;DATABASE=apmgstudy");
        //  SqlConnection con = new SqlConnection("Data Source=SAVITA-PC;Initial Catalog=APMG;User ID=sa;Password=***********");
      //    SqlConnection con = new SqlConnection("Data Source=saubhik-pc;Initial Catalog=apmgstudy;User ID=sa;Password=***********");
        DataTable dt1 = new DataTable();
        DataTable dt2 = new DataTable();
        DataTable dt3 = new DataTable();
        DataTable dt4 = new DataTable();
        DataTable dt5 = new DataTable();
        public string quoteid;
        public string query, login_user;
        protected void Page_Load(object sender, EventArgs e)
        {
             query = Request.QueryString["query"].ToString();
             login_user = Convert.ToString(Request.QueryString["que2"].ToString());
            Label143.Text = login_user.ToString();
            if (Session["username"] == null || Session["password"] == null)
            {
                if (query.Equals("V1")) //verify login for new shipping address
                {
                    string query2 ="query=" + Request.QueryString["query"] + "&que2=" + Convert.ToString(Request.QueryString["que2"].ToString())+"&que3=" + Convert.ToString(Request.QueryString["que3"].ToString());

                    Response.Redirect("~/QuoteWerks/login.aspx?query1=" + query2);
                }
                else
                {
                    string query2 = "query=" + Request.QueryString["query"] + "&qid=" + Request.QueryString["qid"] + "&que2=" + Convert.ToString(Request.QueryString["que2"].ToString()) + "&que3=" + Convert.ToString(Request.QueryString["que3"].ToString());

                    Response.Redirect("~/QuoteWerks/login.aspx?query4=" + query2);
               
                }

            }
                    
            if (!IsPostBack)
            {
                try
                {
                    if (query.Equals("V2") || query.Equals("V3"))     ///v3 same quote id edit need to know from which page it's coming 
                    {
                        TextBox5.Visible = true;
                        Label144.Visible = true;
                        DropDownList38.Items.Clear();
                        DropDownList38.Visible = false;
                       
                         DropDownList38.Items.Add(new ListItem("Search From CRM", "3"));
                        //DropDownList38.Items.Add(new ListItem("Select", "Select"));
                         DropDownList38.Items.FindByValue("3").Selected = true;
                       
                        //string []s1=new string,[]s2,[]s3;
                        string ship = "", sold = "", bill = "", cid = ""; int j = 0;
                        //                quoteid=Convert.ToString(Request.QueryString["qid"].ToString());
                        quoteid = Convert.ToString(Request.QueryString["qid"]);
                        if (quoteid.Equals(""))
                        {
                            Response.Redirect("home.asp");
                        }
                        else
                        {
                            //    con.Open();
                        /*    SqlCommand cmd = new SqlCommand("SELECT compId,CompName FROM QW_Company", con);
                            // cmd.ExecuteNonQuery();
                            SqlDataAdapter da = new SqlDataAdapter(cmd);
                            DataSet ds = new DataSet();
                            da.Fill(ds);

                            DropDownList18.DataSource = ds;

                            DropDownList18.DataTextField = "CompName";
                            DropDownList18.DataValueField = "compId";

                            DropDownList18.DataBind();
                            DropDownList18.Items.Insert(0, new ListItem("Select", "Select"));
                            */
                            // con.Close();
                            SqlCommand cmd1 = new SqlCommand("select soldtoAddress a ,shiptoAddress b ,billtoAddress c from QW_QuoteOverview where quoteId=@a", con);

                            cmd1.Parameters.Add(new SqlParameter("@a", Int32.Parse(quoteid)));
                            // con.Open();
                            cmd1.Connection.Open();
                            SqlDataReader dr = cmd1.ExecuteReader();



                            if (dr.Read())
                            {
                                sold = dr[0].ToString();
                                ship = dr[1].ToString();
                                bill = dr[2].ToString();
                            }


                            dr.Close(); dr.Dispose();
                            con.Close();
                            TextBox5.Enabled = false;
                            //splitting value from db
                            string[] sold1 = sold.Split('!');
                            string[] ship1 = ship.Split('!');
                            string[] bill1 = bill.Split('!');
                            if (sold1.Length > 0 && sold1.Length < 7)   // selected sold portion
                            {
                          /*      for (j = 0; j < DropDownList18.Items.Count; j++)
                                {
                                    if (DropDownList18.Items[j].Text.Equals(sold1[0]))
                                    {
                                        DropDownList18.Items[j].Selected = true;
                                        break;
                                    }
                                }*/
                                //  DropDownList18.SelectedItem.Text = sold1[0];
                                // int cid=get_comp_id(sold1[0]);
                            //    cid = DropDownList18.Items[j].Value;
                                find_sold_company(sold1[0], sold1[1], sold1[2], sold1[3], sold1[4], sold1[5].Trim(), cid);
                               
                                Session["Contact_GUID"] = sold1[0];
                                Button1_Click1(sender, e);
                  
                                if ( DropDownList35.SelectedItem.Value != "Select" && DropDownList36.SelectedItem.Value != "Select" && DropDownList37.SelectedItem.Value != "Select")
                                {
                                    // Label30.Text = TextBox1.Text;//comp name
                                    //Label28.Text = DropDownList19.SelectedItem.Text;//address
                                    Label31.Text = DropDownList35.SelectedItem.Text;//full name 35
                                    Label32.Text = DropDownList36.SelectedItem.Value.ToString();// email Id 36
                                    Label34.Text = DropDownList37.SelectedItem.Value.ToString();//pph no  37
                                    Label33.Text = DropDownList19.SelectedItem.Value.ToString();//pph no  37
                                  
                                    CheckBox1.Enabled = true;
                                    CheckBox2.Enabled = true;
                                    CheckBox3.Enabled = true;
                                    CheckBox4.Enabled = true;
                                    CheckBox5.Enabled = true;
                              
                                }
                                /*          if (TextBox1.Text != "" && DropDownList18.SelectedItem.Value != "Select" && DropDownList19.SelectedItem.Value != "Select" && DropDownList20.SelectedItem.Value != "Select" && DropDownList21.SelectedItem.Value != "Select" && DropDownList22.SelectedItem.Value != "Select" && DropDownList23.SelectedItem.Value != "Select")
                                {

                                    Label30.Text = TextBox1.Text;
                                    Label28.Text = DropDownList19.SelectedItem.Text;
                                    Label31.Text = DropDownList20.SelectedItem.Text;
                                    Label32.Text = DropDownList21.SelectedItem.Value.ToString();
                                    Label33.Text = DropDownList22.SelectedItem.Value.ToString();
                                    Label34.Text = DropDownList23.SelectedItem.Value.ToString();
                                   }*/
                                else
                                {
                                    Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please Fill Sold to address the form properly')</script>");

                                    //alert function add
                                }
               
                            }
                            if (ship1.Length > 0 && ship1.Length <= 7) // selected ship portion
                            {
                                if (ship1[6].Equals("sold"))
                                {
                                    CheckBox1.Checked = true;
                                    CheckBox1_CheckedChanged1(sender, e);
                                }
                                else if (ship1[6].Equals("new")) //////////////////////////////////////////////////////////////////
                                {
                                    Label145.Visible = true;
                                    TextBox6.Visible = true;
                                  
                                    DropDownList39.Items.FindByValue("3").Selected = true;
                                    DropDownList39.Visible = false;
                       
                                   // TextBox2.Visible = true;
                                 //   TextBox2.Text = TextBox1.Text;
                                    //  string cid = DropDownList.Items[j].Value;
                                    DropDownList40.Visible = true;
                                    DropDownList41.Visible = true;
                                    DropDownList42.Visible = true;
                                    DropDownList24.Visible = true;
                                    find_ship_company(ship1[0], ship1[1], ship1[2], ship1[3], ship1[4], ship1[5].Trim(), cid);
                                    Label56.Text = DropDownList40.SelectedItem.Text;
                                    Label57.Text = DropDownList41.SelectedItem.Value.ToString();
                                    Label58.Text = DropDownList24.SelectedItem.Value.ToString();
                                    Label59.Text = DropDownList42.SelectedItem.Value.ToString();
                                    
                                    Label15.Visible = true;
                                    Label16.Visible = true;
                                    Label17.Visible = true;
                                    Button2.Visible = true;
             
                                    Button2_Click(sender, e);
                                    CheckBox2.Checked = true;
                       

                                    // write code for taking from db
                                }
                            }
                            if (bill1.Length > 0 && bill1.Length <= 7) // selected ship portion
                            {
                                if (bill1[6].Equals("sold"))
                                {
                                    CheckBox3.Checked = true;
                                    CheckBox3_CheckedChanged(sender, e);
                                }
                                else if (bill1[6].Equals("ship"))
                                {
                                    CheckBox4.Checked = true;
                                    CheckBox4_CheckedChanged(sender, e);
                                }
                                else if (bill1[6].Equals("new"))
                                {
                                    TextBox7.Visible = true;
                                    CheckBox5.Checked = true;
                                  //  DropDownList39.Items.Clear();
                                  //  DropDownList39.Items.Add(new ListItem("Search by CRM", "Search by CRM"));
                                   // DropDownList39.Items.Add(new ListItem("Select", "Select"));
                                   // TextBox4.Text = TextBox1.Text;
                                    //  string cid = DropDownList.Items[j].Value;
                                    find_bill_company(bill1[0], bill1[1], bill1[2], bill1[3], bill1[4], bill1[5].Trim(), cid);
                                    Button3_Click1(sender, e);
                                    //auto button call to show below
                                    // write code for taking from db
                                }
                            }


                            //name
                            //address
                            //email id
                            //ph no 
                            //fax
                            //find_sold_name(sold1[1]);


                           // Response.Write(ship + " " + " " + sold + " " + bill);
                        }

                    }
                    else if (query.Equals("V1"))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("SELECT compId,CompName FROM QW_Company", con);
                        cmd.ExecuteNonQuery();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        DropDownList18.DataSource = ds;

                        DropDownList18.DataTextField = "CompName";
                        DropDownList18.DataValueField = "compId";

                        DropDownList18.DataBind();
                        DropDownList18.Items.Insert(0, new ListItem("Select", "Select"));
                        con.Close();

                    }
                    Session["query"] = query;
                }
                catch (Exception kpo)
                {
                    //Response.Redirect("");
                }
            }
        }

        public void find_bill_email_ph_fax(string email, string ph, string fax)
        {
            if (DropDownList30.SelectedValue.ToString() != "Select")
            {
                int j = 0;
                DropDownList31.Items.Clear();
                DropDownList32.Items.Clear();
                DropDownList33.Items.Clear();

                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT contName,contEmailId,contPhoneno,fax FROM QW_CompContactDet where compId=@a and contName=@b", con);

                cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(DropDownList18.SelectedValue.ToString())));
                cmd.Parameters.Add(new SqlParameter("@b", DropDownList30.SelectedValue.ToString()));

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                DropDownList31.DataSource = dt;
                DropDownList31.DataTextField = "contEmailId";
                DropDownList31.DataValueField = "contEmailId";
                DropDownList31.DataBind();
                DropDownList31.Items.Insert(0, new ListItem("Select", "Select"));

                // DropDownList21.SelectedItem.Text = email;// assign prev anme
                for (j = 0; j < DropDownList31.Items.Count; j++)
                {
                    if (DropDownList31.Items[j].Text.Equals(email))
                    {
                        DropDownList31.Items[j].Selected = true;
                        break;
                    }
                }

                DropDownList32.DataSource = dt;
                DropDownList32.DataTextField = "contPhoneno";
                DropDownList32.DataValueField = "contPhoneno";
                DropDownList32.DataBind();
                DropDownList32.Items.Insert(0, new ListItem("Select", "Select"));

                // DropDownList21.SelectedItem.Text = email;// assign prev anme
                for (j = 0; j < DropDownList32.Items.Count; j++)
                {
                    if (DropDownList32.Items[j].Text.Equals(ph))
                    {
                        DropDownList32.Items[j].Selected = true;
                        break;
                    }
                }
                //  DropDownList22.SelectedItem.Text = ph;// assign prev anme

                DropDownList33.DataSource = dt;
                DropDownList33.DataTextField = "fax";
                DropDownList33.DataValueField = "fax";
                DropDownList33.DataBind();
                DropDownList33.Items.Insert(0, new ListItem("Select", "Select"));

                // DropDownList21.SelectedItem.Text = email;// assign prev anme
                for (j = 0; j < DropDownList33.Items.Count; j++)
                {
                    if (DropDownList33.Items[j].Text.Equals(fax))
                    {
                        DropDownList33.Items[j].Selected = true;
                        break;
                    }
                }

                con.Close();
                //    drop_bind();
            }
            else
            {
                DropDownList31.Items.Clear();
                DropDownList32.Items.Clear();
                DropDownList33.Items.Clear();
            }

        }

        public void find_bill_company(string cname, string name, string address, string email, string ph, string fax, string cid) //call in post back false
        {
            int j = 0;
            if (cname != "" || name != "" || address != "")
            {
                Button1.Visible = true;
                DropDownList34.Visible = true;
                Label66.Visible = true;
                DropDownList43.Items.Add(new ListItem(name, cname));
                DropDownList43.Items.Add(new ListItem("Select", "Select"));
           
                DropDownList44.Items.Add(new ListItem(email, email));
                DropDownList44.Items.Add(new ListItem("Select", "Select"));
           
                DropDownList45.Items.Add(new ListItem(ph, ph));
                DropDownList45.Items.Add(new ListItem("Select", "Select"));

                DropDownList34.Items.Add(new ListItem(address, address));
                DropDownList34.Items.Add(new ListItem("Select", "Select"));
           
                DropDownList43.Visible = true;
                DropDownList44.Visible = true;
                DropDownList45.Visible = true;
                Label22.Visible = true;
                Label23.Visible = true;
                Label24.Visible = true;
                

                // assign it to edit
              /*  TextBox4.Text = cname;
                dt2 = fill_comp_address(cid);
                dt3 = fill_name(cid);


                DropDownList34.DataSource = dt2;
                DropDownList34.DataTextField = "CompAddress";
                DropDownList34.DataValueField = "CompAddress";
                DropDownList34.DataBind();
                DropDownList34.Items.Insert(0, new ListItem("Select", "Select"));
                for (j = 0; j < DropDownList34.Items.Count; j++)
                {
                    if (DropDownList34.Items[j].Text.Equals(address))
                    {
                        DropDownList34.Items[j].Selected = true;
                        break;
                    }
                }
                //   DropDownList.SelectedItem.Text = address;// assign prev address
                DropDownList30.DataSource = dt3;
                DropDownList30.DataTextField = "contName";
                DropDownList30.DataValueField = "contName";
                DropDownList30.DataBind();
                DropDownList30.Items.Insert(0, new ListItem("Select", "Select"));
                for (j = 0; j < DropDownList30.Items.Count; j++)
                {
                    if (DropDownList30.Items[j].Text.Equals(name))
                    {
                        DropDownList30.Items[j].Selected = true;
                        break;
                    }
                }


                //   DropDownList20.SelectedItem.Text = name;// assign prev anme

                TextBox4.Visible = true;
                DropDownList34.Visible = true;
                DropDownList30.Visible = true;
                DropDownList31.Visible = true;
                DropDownList32.Visible = true;
                DropDownList33.Visible = true;
                Button3.Visible = true;
                //  Label1.Visible = true;
                Label20.Visible = true;
                Label66.Visible = true;
                Label21.Visible = true;
                Label22.Visible = true;
                Label23.Visible = true;
                Label24.Visible = true;
                Label25.Visible = true;

                find_bill_email_ph_fax(email, ph, fax);
                ///Label1.Visible = true;
            */

               }

        }




        public void find_sold_email_ph_fax(string email, string ph, string fax)
        {
            if (DropDownList20.SelectedValue.ToString() != "Select")
            {
                int j = 0;
                DropDownList21.Items.Clear();
                DropDownList22.Items.Clear();
                DropDownList23.Items.Clear();

                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT contName,contEmailId,contPhoneno,fax FROM QW_CompContactDet where compId=@a and contName=@b", con);

                cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(DropDownList18.SelectedValue.ToString())));
                cmd.Parameters.Add(new SqlParameter("@b", DropDownList20.SelectedValue.ToString()));

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                DropDownList21.DataSource = dt;
                DropDownList21.DataTextField = "contEmailId";
                DropDownList21.DataValueField = "contEmailId";
                DropDownList21.DataBind();
                DropDownList21.Items.Insert(0, new ListItem("Select", "Select"));

                // DropDownList21.SelectedItem.Text = email;// assign prev anme
                for (j = 0; j < DropDownList21.Items.Count; j++)
                {
                    if (DropDownList21.Items[j].Text.Equals(email))
                    {
                        DropDownList21.Items[j].Selected = true;
                        break;
                    }
                }
                DropDownList22.DataSource = dt;
                DropDownList22.DataTextField = "contPhoneno";
                DropDownList22.DataValueField = "contPhoneno";
                DropDownList22.DataBind();
                DropDownList22.Items.Insert(0, new ListItem("Select", "Select"));

                // DropDownList21.SelectedItem.Text = email;// assign prev anme
                for (j = 0; j < DropDownList22.Items.Count; j++)
                {
                    if (DropDownList22.Items[j].Text.Equals(ph))
                    {
                        DropDownList22.Items[j].Selected = true;
                        break;
                    }
                }
                //  DropDownList22.SelectedItem.Text = ph;// assign prev anme

                DropDownList23.DataSource = dt;
                DropDownList23.DataTextField = "fax";
                DropDownList23.DataValueField = "fax";
                DropDownList23.DataBind();
                DropDownList23.Items.Insert(0, new ListItem("Select", "Select"));

                // DropDownList21.SelectedItem.Text = email;// assign prev anme
                for (j = 0; j < DropDownList23.Items.Count; j++)
                {
                    if (DropDownList23.Items[j].Text.Equals(fax.Trim()))
                    {
                        DropDownList23.Items[j].Selected = true;
                        break;
                    }
                }

                con.Close();
                //    drop_bind();
            }
            else
            {
                DropDownList21.Items.Clear();
                DropDownList22.Items.Clear();
                DropDownList23.Items.Clear();
            }

        }

        public void find_ship_company(string cname, string name, string address, string email, string ph, string fax, string cid) //call in post back false
        {
            int j = 0;
            if (cname != "" || name != "" || address != "")
            {
                if ( DropDownList40.SelectedItem.Value != "Select" && DropDownList41.SelectedItem.Value != "Select" && DropDownList42.SelectedItem.Value != "Select")
                {

                    //if()
                    //Label54.Text = TextBox1.Text;
                    //Label55.Text = DropDownList24.SelectedItem.Text;
                    DropDownList40.Items.Add(new ListItem(name, cname));
                  
                    DropDownList40.Items.Add( new ListItem("Select", "Select"));
                    DropDownList41.Items.Add(new ListItem(email, email));
                  
                    DropDownList41.Items.Add( new ListItem("Select", "Select"));
                    DropDownList42.Items.Add(new ListItem(ph, ph));
                  
                    DropDownList42.Items.Add( new ListItem("Select", "Select"));

                    DropDownList24.Items.Add(new ListItem(address, address));

                    DropDownList24.Items.Add(new ListItem("Select", "Select"));
                    DropDownList24.Visible = true;
                    Label41.Visible = true;
                                
             
                }
                // assign it to edit
                /*  TextBox1.Text = cname;
                  dt2 = fill_comp_address(cid);
                  dt3 = fill_name(cid);


                  DropDownList24.DataSource = dt2;
                  DropDownList24.DataTextField = "CompAddress";
                  DropDownList24.DataValueField = "CompAddress";
                  DropDownList24.DataBind();
                  DropDownList24.Items.Insert(0, new ListItem("Select", "Select"));
                  for (j = 0; j < DropDownList24.Items.Count; j++)
                  {
                      if (DropDownList24.Items[j].Text.Equals(address))
                      {
                          DropDownList24.Items[j].Selected = true;
                          break;
                      }
                  }
                  //   DropDownList.SelectedItem.Text = address;// assign prev address
                  DropDownList26.DataSource = dt3;
                  DropDownList26.DataTextField = "contName";
                  DropDownList26.DataValueField = "contName";
                  DropDownList26.DataBind();
                  DropDownList26.Items.Insert(0, new ListItem("Select", "Select"));
                  for (j = 0; j < DropDownList26.Items.Count; j++)
                  {
                      if (DropDownList26.Items[j].Text.Equals(name))
                      {
                          DropDownList26.Items[j].Selected = true;
                          break;
                      }
                  }


                  //   DropDownList20.SelectedItem.Text = name;// assign prev anme

                  TextBox1.Visible = true;
                  DropDownList24.Visible = true;
                  DropDownList26.Visible = true;
                  DropDownList27.Visible = true;
                  DropDownList28.Visible = true;
                  DropDownList29.Visible = true;
                  //  Label1.Visible = true;
                  Label13.Visible = true;
                  Label41.Visible = true;
                  Label14.Visible = true;
             
                  Label18.Visible = true;
                
                  find_ship_email_ph_fax(email, ph, fax);
                  ///Label1.Visible = true;
              */

            }

        }


        public void find_ship_email_ph_fax(string email, string ph, string fax)
        {
            if (DropDownList26.SelectedValue.ToString() != "Select")
            {
                int j = 0;
                DropDownList27.Items.Clear();
                DropDownList28.Items.Clear();
                DropDownList29.Items.Clear();

                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT contName,contEmailId,contPhoneno,fax FROM QW_CompContactDet where compId=@a and contName=@b", con);

                cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(DropDownList18.SelectedValue.ToString())));
                cmd.Parameters.Add(new SqlParameter("@b", DropDownList26.SelectedValue.ToString()));

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                DropDownList27.DataSource = dt;
                DropDownList27.DataTextField = "contEmailId";
                DropDownList27.DataValueField = "contEmailId";
                DropDownList27.DataBind();
                DropDownList27.Items.Insert(0, new ListItem("Select", "Select"));

                // DropDownList27.SelectedItem.Text = email;// assign prev anme
                for (j = 0; j < DropDownList27.Items.Count; j++)
                {
                    if (DropDownList27.Items[j].Text.Equals(email))
                    {
                        DropDownList27.Items[j].Selected = true;
                        break;
                    }
                }
                DropDownList28.DataSource = dt;
                DropDownList28.DataTextField = "contPhoneno";
                DropDownList28.DataValueField = "contPhoneno";
                DropDownList28.DataBind();
                DropDownList28.Items.Insert(0, new ListItem("Select", "Select"));

                // DropDownList21.SelectedItem.Text = email;// assign prev anme
                for (j = 0; j < DropDownList28.Items.Count; j++)
                {
                    if (DropDownList28.Items[j].Text.Equals(ph))
                    {
                        DropDownList28.Items[j].Selected = true;
                        break;
                    }
                }
                //  DropDownList22.SelectedItem.Text = ph;// assign prev anme

                DropDownList29.DataSource = dt;
                DropDownList29.DataTextField = "fax";
                DropDownList29.DataValueField = "fax";
                DropDownList29.DataBind();
                DropDownList29.Items.Insert(0, new ListItem("Select", "Select"));

                // DropDownList21.SelectedItem.Text = email;// assign prev anme
                for (j = 0; j < DropDownList29.Items.Count; j++)
                {
                    if (DropDownList29.Items[j].Text.Equals(fax.Trim()))
                    {
                        DropDownList29.Items[j].Selected = true;
                        break;
                    }
                }

                con.Close();
                //    drop_bind();
            }
            else
            {
                DropDownList27.Items.Clear();
                DropDownList28.Items.Clear();
                DropDownList29.Items.Clear();
            }

        }

        public void find_sold_company(string cname, string name, string address, string email, string ph, string fax, string cid) //call in post back false
        {
            int j = 0;
            if (name != "" || email != "" || ph != "")
            {
                DropDownList19.Visible = true;
                Label42.Visible = true;
                // assign it to edit
              //  TextBox1.Text = cname;
              //  dt2 = fill_comp_address(cid);
               // dt3 = fill_name(cid);


              /*  DropDownList19.DataSource = dt2;
                DropDownList19.DataTextField = "CompAddress";
                DropDownList19.DataValueField = "CompAddress";
                DropDownList19.DataBind();
                DropDownList19.Items.Insert(0, new ListItem("Select", "Select"));
                for (j = 0; j < DropDownList19.Items.Count; j++)
                {
                    if (DropDownList19.Items[j].Text.Equals(address))
                    {
                        DropDownList19.Items[j].Selected = true;
                        break;
                    }
                }*/
                //   DropDownList19.SelectedItem.Text = address;// assign prev address
             /*   DropDownList20.DataSource = dt3;
                DropDownList20.DataTextField = "contName";
                DropDownList20.DataValueField = "contName";
                DropDownList20.DataBind();
                DropDownList20.Items.Insert(0, new ListItem("Select", "Select"));
                for (j = 0; j < DropDownList20.Items.Count; j++)
                {
                    if (DropDownList20.Items[j].Text.Equals(name))
                    {
                        DropDownList20.Items[j].Selected = true;
                        break;
                    }
                }


                //   DropDownList20.SelectedItem.Text = name;// assign prev anme

                TextBox1.Visible = true;
                DropDownList19.Visible = true;
                DropDownList20.Visible = true;
                DropDownList21.Visible = true;
                DropDownList22.Visible = true;
                DropDownList23.Visible = true;*/
                Button1.Visible = true;
                DropDownList35.Items.Add(new ListItem( name,cname));
                DropDownList35.Items.Add(new ListItem("Select", "Select"));
             
                DropDownList36.Items.Add(new ListItem(email, email));
                DropDownList36.Items.Add(new ListItem("Select", "Select"));

                DropDownList19.Items.Add(new ListItem(address, address));
                DropDownList19.Items.Add(new ListItem("Select", "Select"));
             
                DropDownList37.Items.Add(new ListItem(ph, ph));
                DropDownList37.Items.Add(new ListItem("Select", "Select"));
               
                DropDownList35.Visible = true;
                DropDownList36.Visible = true;
                DropDownList37.Visible = true;
                //  Label1.Visible = true;
               // Label2.Visible = true;
               // Label4.Visible = true;
                Label4.Visible = true;
                Label5.Visible = true;
                Label6.Visible = true;
               // Label42.Visible = true;
                Label12.Visible = true;

            //    find_sold_email_ph_fax(email, ph, fax);
                ///Label1.Visible = true;
           
              }

        }

        public DataTable fill_comp_address(string x)
        {
            //con.Open();
            x = DropDownList18.SelectedItem.Value;
            SqlCommand cmd = new SqlCommand("SELECT CompAddress FROM QW_CompAddress where compId =@a", con);

            cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(x)));

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                return dt;
            }

            return dt;
            //con.Close();

        }

        public DataTable fill_name(string x)
        {
            //con.Open();
            x = DropDownList18.SelectedItem.Value;
            SqlCommand cmd = new SqlCommand("SELECT compId,contName FROM QW_CompContactDet where compId=@a", con);

            cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(x)));

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList17_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList18_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList18.SelectedItem.Text != "Select")
            {
                TextBox1.Text = DropDownList18.SelectedItem.Text;
                // TextBox1.Enabled = false;
                DropDownList19.Items.Clear();
                DropDownList20.Items.Clear();
                DropDownList21.Items.Clear();
                DropDownList22.Items.Clear();
                DropDownList23.Items.Clear();
                //                 DropDownList20.Items.Clear();
                DataTable dt1 = new DataTable();
                DataTable dt2 = new DataTable();

                dt1 = fill_comp_address(DropDownList18.SelectedItem.Value);
                dt2 = fill_name(DropDownList18.SelectedItem.Value);

                DropDownList19.DataSource = dt1;
                DropDownList19.DataTextField = "CompAddress";
                DropDownList19.DataValueField = "CompAddress";
                DropDownList19.DataBind();
                DropDownList19.Items.Insert(0, new ListItem("Select", "Select"));
                DropDownList20.DataSource = dt2;
                DropDownList20.DataTextField = "contName";
                DropDownList20.DataValueField = "contName";
                DropDownList20.DataBind();
                DropDownList20.Items.Insert(0, new ListItem("Select", "Select"));

                TextBox1.Visible = true;
                DropDownList19.Visible = true;
                DropDownList20.Visible = true;
                DropDownList21.Visible = true;
                DropDownList22.Visible = true;
                DropDownList23.Visible = true;
                Button1.Visible = true;
                //  Label1.Visible = true;
                Label2.Visible = true;
                Label4.Visible = true;
                Label5.Visible = true;
                Label6.Visible = true;
                Label7.Visible = true;
                Label42.Visible = true;
                Label12.Visible = true;
                ///Label1.Visible = true;
            }
            else
            {
                DropDownList19.Items.Clear();
                DropDownList20.Items.Clear();
                DropDownList21.Items.Clear();
                DropDownList22.Items.Clear();
                DropDownList23.Items.Clear();
            }
        }

        protected void DropDownList19_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList19.SelectedItem.Text != "Select")
            {

                /*    con.Open();

                    SqlCommand cmd = new SqlCommand("SELECT contName,contEmailId,contPhoneno,fax FROM QW_CompContactDet where compId=@a", con);

                    cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(DropDownList18.SelectedItem.Value)));

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    DropDownList21.DataSource = dt;
                    DropDownList21.DataTextField = "contEmailId";
                    DropDownList21.DataValueField = "contEmailId";
                    DropDownList21.DataBind();
                    DropDownList21.Items.Insert(0, new ListItem("Select", "Select"));

                    // DropDownList21.Items.Insert(0, new ListItem("Select Company", "Select Company"));
                    DropDownList22.DataSource = dt;
                    DropDownList22.DataTextField = "contPhoneno";
                    DropDownList22.DataValueField = "contPhoneno";
                    DropDownList22.DataBind();
                    DropDownList22.Items.Insert(0, new ListItem("Select", "Select"));



                    DropDownList23.DataSource = dt;
                    DropDownList23.DataTextField = "fax";
                    DropDownList23.DataValueField = "fax";
                    DropDownList23.DataBind();
                    DropDownList23.Items.Insert(0, new ListItem("Select", "Select"));

                    con.Close();*/
            }
            else
            {
                //Please select
            }
        }
        public void drop_bind()
        {

            fill_name(DropDownList18.SelectedItem.Text);
        }

        protected void DropDownList20_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList20.SelectedValue.ToString() != "Select")
            {
                DropDownList21.Items.Clear();
                DropDownList22.Items.Clear();
                DropDownList23.Items.Clear();

                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT contName,contEmailId,contPhoneno,fax FROM QW_CompContactDet where compId=@a and contName=@b", con);

                cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(DropDownList18.SelectedValue.ToString())));
                cmd.Parameters.Add(new SqlParameter("@b", DropDownList20.SelectedValue.ToString()));

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                DropDownList21.DataSource = dt;
                DropDownList21.DataTextField = "contEmailId";
                DropDownList21.DataValueField = "contEmailId";
                DropDownList21.DataBind();
                DropDownList21.Items.Insert(0, new ListItem("Select", "Select"));
                if(DropDownList21.Items.Count>1)
                DropDownList21.Items[1].Selected = true;
                DropDownList22.DataSource = dt;
                DropDownList22.DataTextField = "contPhoneno";
                DropDownList22.DataValueField = "contPhoneno";
                DropDownList22.DataBind();
                DropDownList22.Items.Insert(0, new ListItem("Select", "Select"));
                if (DropDownList22.Items.Count > 1)
                    DropDownList22.Items[1].Selected = true;
              

                DropDownList23.DataSource = dt;
                DropDownList23.DataTextField = "fax";
                DropDownList23.DataValueField = "fax";
                DropDownList23.DataBind();
                DropDownList23.Items.Insert(0, new ListItem("Select", "Select"));
                if (DropDownList23.Items.Count > 1)
                   DropDownList23.Items[1].Selected = true;
              
                con.Close();
                //    drop_bind();
            }
            else
            {
                DropDownList21.Items.Clear();
                DropDownList22.Items.Clear();
                DropDownList23.Items.Clear();
            }
        }

        protected void DropDownList22_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList23_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList24_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList26_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList26.SelectedValue.ToString() != "Select")
            {
                DropDownList27.Items.Clear();
                DropDownList28.Items.Clear();
                DropDownList29.Items.Clear();

                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT contName,contEmailId,contPhoneno,fax FROM QW_CompContactDet where compId=@a and contName=@b", con);

                cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(DropDownList18.SelectedValue.ToString())));
                cmd.Parameters.Add(new SqlParameter("@b", DropDownList26.SelectedValue.ToString()));

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                DropDownList27.DataSource = dt;
                DropDownList27.DataTextField = "contEmailId";
                DropDownList27.DataValueField = "contEmailId";
                DropDownList27.DataBind();
                DropDownList27.Items.Insert(0, new ListItem("Select", "Select"));

                DropDownList28.DataSource = dt;
                DropDownList28.DataTextField = "contPhoneno";
                DropDownList28.DataValueField = "contPhoneno";
                DropDownList28.DataBind();
                DropDownList28.Items.Insert(0, new ListItem("Select", "Select"));


                DropDownList29.DataSource = dt;
                DropDownList29.DataTextField = "fax";
                DropDownList29.DataValueField = "fax";
                DropDownList29.DataBind();
                DropDownList29.Items.Insert(0, new ListItem("Select", "Select"));

                con.Close();
                //    drop_bind();
            }
            else
            {
                DropDownList27.Items.Clear();
                DropDownList28.Items.Clear();
                DropDownList29.Items.Clear();
            }
        }

        protected void DropDownList27_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList28_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList29_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList30_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (DropDownList26.SelectedValue.ToString() != "Select")
            {
                DropDownList27.Items.Clear();
                DropDownList28.Items.Clear();
                DropDownList29.Items.Clear();

                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT contName,contEmailId,contPhoneno,fax FROM QW_CompContactDet where compId=@a and contName=@b", con);

                cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(DropDownList18.SelectedValue.ToString())));
                cmd.Parameters.Add(new SqlParameter("@b", DropDownList30.SelectedValue.ToString()));

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                DropDownList31.DataSource = dt;
                DropDownList31.DataTextField = "contEmailId";
                DropDownList31.DataValueField = "contEmailId";
                DropDownList31.DataBind();
                DropDownList31.Items.Insert(0, new ListItem("Select", "Select"));

                DropDownList32.DataSource = dt;
                DropDownList32.DataTextField = "contPhoneno";
                DropDownList32.DataValueField = "contPhoneno";
                DropDownList32.DataBind();
                DropDownList32.Items.Insert(0, new ListItem("Select", "Select"));


                DropDownList33.DataSource = dt;
                DropDownList33.DataTextField = "fax";
                DropDownList33.DataValueField = "fax";
                DropDownList33.DataBind();
                DropDownList33.Items.Insert(0, new ListItem("Select", "Select"));

                con.Close();
                //    drop_bind();
            }
            else
            {
                DropDownList27.Items.Clear();
                DropDownList28.Items.Clear();
                DropDownList29.Items.Clear();
            }


        }

        protected void DropDownList31_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList32_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList33_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
        //    if (TextBox2.Text != "" && DropDownList24.SelectedItem.Value != "Select" && DropDownList26.SelectedItem.Value != "Select" && DropDownList27.SelectedItem.Value != "Select" && DropDownList28.SelectedItem.Value != "Select" && DropDownList29.SelectedItem.Value != "Select")
            if (DropDownList38.SelectedItem.Value.Equals("3") || DropDownList38.SelectedItem.Value.Equals("6"))
            {
                if (TextBox6.Text != "" && DropDownList40.SelectedItem.Value != "Select" && DropDownList41.SelectedItem.Value != "Select" && DropDownList42.SelectedItem.Value != "Select")
                {

                    //if()
                    //Label54.Text = TextBox1.Text;
                    //Label55.Text = DropDownList24.SelectedItem.Text;
                    Label56.Text = DropDownList40.SelectedItem.Text;
                    Label57.Text = DropDownList41.SelectedItem.Value.ToString();
                    Label58.Text = DropDownList24.SelectedItem.Value.ToString();
           
                    Label59.Text = DropDownList42.SelectedItem.Value.ToString();
                    //CheckBox1.Enabled = true;
                    //CheckBox2.Enabled = true;
                    //CheckBox3.Enabled = true;
                    //CheckBox4.Enabled = true;
                    //CheckBox5.Enabled = true;
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please Fill Sold to address the form properly')</script>");

                //alert function add

            }


        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void CheckBox4_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox4.Checked == true)
            {
                make_invisible();
                CheckBox3.Checked = false;
                CheckBox3_CheckedChanged(sender, e);
                CheckBox5.Checked = false;
                CheckBox5_CheckedChanged(sender, e);

                if (CheckBox1.Checked == true)
                {
                    if (DropDownList38.SelectedItem.Value.Equals("3") || DropDownList38.SelectedItem.Value.Equals("6"))
                    {
                        Label45.Text = DropDownList35.SelectedItem.Text;
                        Label46.Text = DropDownList36.SelectedItem.Value;
                        Label48.Text = DropDownList37.SelectedItem.Value;
                        Label47.Text = DropDownList19.SelectedItem.Value;
              
                    }
                }
                else if (CheckBox2.Checked == true)
                {
                    if (DropDownList39.SelectedItem.Value.Equals("3") || DropDownList39.SelectedItem.Value.Equals("6"))
                    {
                        if (TextBox5.Text != "" && DropDownList40.SelectedItem.Value != "Select" && DropDownList41.SelectedItem.Value != "Select" && DropDownList42.SelectedItem.Value != "Select")
                        {

                            //                    if (TextBox2.Text != "" && DropDownList24.SelectedItem.Value != "Select" && DropDownList26.SelectedItem.Value != "Select" && DropDownList27.SelectedItem.Value != "Select" && DropDownList28.SelectedItem.Value != "Select" && DropDownList29.SelectedItem.Value != "Select")
                            //                  {

                            //Label43.Text = TextBox2.Text;
                            //Label44.Text = DropDownList24.SelectedItem.Value;
                            Label45.Text = DropDownList40.SelectedItem.Text;
                            Label46.Text = DropDownList41.SelectedItem.Value;
                            Label48.Text = DropDownList42.SelectedItem.Value;
                            Label47.Text = DropDownList24.SelectedItem.Value;

                        }


                        else
                        {
                            Label43.Text = "";// TextBox2.Text;
                            Label44.Text = "";// DropDownList24.SelectedItem.Value;
                            Label45.Text = "";// DropDownList26.SelectedItem.Text;
                            Label46.Text = "";// DropDownList27.SelectedItem.Value;
                            Label47.Text = "";// DropDownList28.SelectedItem.Value;
                            Label48.Text = "";// DropDownList29.SelectedItem.Value;
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please Fill Ship to address the form properly')</script>");
                            CheckBox4.Checked = false;
                            //alert function add

                        }
                    }
                }

                else
                {
                    Label43.Text = "";
                    Label44.Text = "";
                    Label45.Text = "";
                    Label46.Text = "";
                    Label47.Text = "";
                    Label48.Text = "";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please Fill Ship to address the form properly')</script>");
                    CheckBox4.Checked = false;

                }
            }
            else if (CheckBox4.Checked == false)
            {

                Label43.Text = "";
                Label44.Text = "";
                Label45.Text = "";
                Label46.Text = "";
                Label47.Text = "";
                Label48.Text = "";
            }

        }
        public void make_invisible()
        {
            CheckBox5.Checked = false;
            TextBox4.Visible = false;
            DropDownList30.Visible = false;
            DropDownList31.Visible = false;
            DropDownList32.Visible = false;
            DropDownList33.Visible = false;
            DropDownList34.Visible = false;
            DropDownList43.Visible = false;
            DropDownList44.Visible = false;
            DropDownList45.Visible = false;
           
            Button3.Visible = false;
            Label41.Visible = false;
            Label66.Visible = false;
            Label66.Visible = false; Label20.Visible = false; Label21.Visible = false; Label22.Visible = false; Label23.Visible = false;
            Label24.Visible = false;
            Label60.Visible = false;
            Label61.Visible = false;
            Label62.Visible = false;
            Label63.Visible = false;
            Label64.Visible = false;
            Label65.Visible = false;
            Label25.Visible = false;



        }
        protected void CheckBox3_CheckedChanged(object sender, EventArgs e)
        {

            if (CheckBox3.Checked == true)
            {
                make_invisible();
                CheckBox4.Checked = false;
                CheckBox5.Checked = false;

                Label43.Text = "";
                Label44.Text = "";
                Label45.Text = "";
                Label46.Text = "";
                Label47.Text = "";
                Label48.Text = "";
                /*    Label13.Visible = false;
                    Label14.Visible = false;
                    Label15.Visible = false;
                    Label16.Visible = false;
                    Label17.Visible = false;
                    Label18.Visible = false;
                    TextBox2.Visible = false;
                    DropDownList24.Visible = false;
                    DropDownList26.Visible = false;
                    DropDownList27.Visible = false;
                    DropDownList28.Visible = false;
                    DropDownList29.Visible = false;
                    */
                if (DropDownList38.SelectedItem.Value.Equals("3") || DropDownList38.SelectedItem.Value.Equals("6"))
                {

                    Label50.Text = DropDownList35.SelectedItem.Text;//full name 35
                    Label51.Text = DropDownList36.SelectedItem.Value.ToString();// email Id 36
                    Label52.Text = DropDownList19.SelectedItem.Value.ToString();//pph no  37
                    Label53.Text = DropDownList37.SelectedItem.Value.ToString();//pph no  37
                  
                }
                    /*
                Label27.Text = TextBox1.Text;
                Label49.Text = DropDownList19.SelectedItem.Value;
                Label50.Text = DropDownList20.SelectedItem.Text;
                Label51.Text = DropDownList21.SelectedItem.Value;
                Label52.Text = DropDownList22.SelectedItem.Value;
                Label53.Text = DropDownList23.SelectedItem.Value;
                */

            }
            else if (CheckBox3.Checked == false)
            {
                Label27.Text = "";
                Label49.Text = "";
                Label50.Text = "";
                Label51.Text = "";
                Label52.Text = "";
                Label53.Text = "";
            }
        }

        protected void CheckBox6_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {

        }

        protected void Button5_Click(object sender, EventArgs e)
        {

        }

        protected void Button6_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (DropDownList38.SelectedItem.Text.Equals("Search by Company"))
            {
                if ((TextBox1.Text != "" && DropDownList18.SelectedItem.Value != "Select" && DropDownList19.SelectedItem.Value != "Select" && DropDownList20.SelectedItem.Value != "Select" && DropDownList21.SelectedItem.Value != "Select" && DropDownList22.SelectedItem.Value != "Select" && DropDownList23.SelectedItem.Value != "Select"))
                {
                    //if()
                    Label30.Text = TextBox1.Text;
                    Label28.Text = DropDownList19.SelectedItem.Text;
                    Label31.Text = DropDownList20.SelectedItem.Text;
                    Label32.Text = DropDownList21.SelectedItem.Value.ToString();
                    Label33.Text = DropDownList22.SelectedItem.Value.ToString();
                    Label34.Text = DropDownList23.SelectedItem.Value.ToString();
                    CheckBox1.Enabled = true;
                    CheckBox2.Enabled = true;
                    CheckBox3.Enabled = true;
                    CheckBox4.Enabled = true;
                    CheckBox5.Enabled = true;
                    CheckBox1.Checked = true;
                    CheckBox3.Checked = true;
                    CheckBox1_CheckedChanged1(sender, e);  //by default its open 1 and 3
                    CheckBox3_CheckedChanged(sender, e);

                }
            }
            else if (DropDownList38.SelectedItem.Value.Equals("3") || DropDownList38.SelectedItem.Value.Equals("6"))
            {
                if ( DropDownList35.SelectedItem.Value != "Select" && DropDownList36.SelectedItem.Value != "Select" && DropDownList37.SelectedItem.Value != "Select")
                {
                    // Label30.Text = TextBox1.Text;//comp name
//Label28.Text = DropDownList19.SelectedItem.Text;//address
                    Label31.Text = DropDownList35.SelectedItem.Text;//full name 35
                    // take a session of the Contact GUID V.V.I to store in CRM Quote and Update_Oppurtunity DB
                    Session["Contact_GUID"] = DropDownList35.SelectedItem.Value;
                    Label32.Text = DropDownList36.SelectedItem.Value.ToString();// email Id 36
                   
                    Label33.Text = DropDownList19.SelectedItem.Value.ToString();//address 1
                    Label34.Text = DropDownList37.SelectedItem.Value.ToString();//pph no  37
                    CheckBox1.Enabled = true;
                    CheckBox2.Enabled = true;
                    CheckBox3.Enabled = true;
                    CheckBox4.Enabled = true;
                    CheckBox5.Enabled = true;
                    CheckBox1.Checked = true;
                    CheckBox3.Checked = true;
                    CheckBox1_CheckedChanged1(sender, e);  //by default its open 1 and 3
                    CheckBox3_CheckedChanged(sender, e);

                }
            }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please Fill Sold to address the form properly')</script>");

                    //alert function add


                }
            
            //Panel1.Controls.Add(new )
        }

        protected void CheckBox1_CheckedChanged1(object sender, EventArgs e)
        {

                if (CheckBox1.Checked == true)
                 {
                    CheckBox2.Checked = false;
                    CheckBox4.Checked = false;
                  
                    TextBox6.Visible = false;
                    Label145.Visible = false ;


                    DropDownList39.Visible = false;
                    Label54.Text = "";
                    Label55.Text = "";
                    Label56.Text = "";
                    Label57.Text = "";
                    Label58.Text = "";
                    Label59.Text = "";


                    Label43.Text = "";// Label35.Text;

                    Label44.Text = "";// Label36.Text;

                    Label45.Text = "";// Label37.Text;

                    Label46.Text = "";// Label38.Text;

                    Label47.Text = "";// Label39.Text;



                    Label13.Visible = false;
                    Label14.Visible = false;
                    Label15.Visible = false;
                    Label16.Visible = false;
                    Label17.Visible = false;
                    Label18.Visible = false;
                    TextBox2.Visible = false;
                
                    DropDownList24.Visible = false;
                    DropDownList26.Visible = false;
                    DropDownList27.Visible = false;
                    DropDownList28.Visible = false;
                    DropDownList29.Visible = false;
                    DropDownList40.Visible = false;
                    DropDownList41.Visible = false;
                    DropDownList42.Visible = false;
                
                    Button2.Visible = false;
                    Label41.Visible = false;

               /*     if (DropDownList38.SelectedItem.Text.Equals("Search by Company"))
                    {
               
                    Label35.Text = TextBox1.Text;
                    Label36.Text = DropDownList19.SelectedItem.Value;
                    Label37.Text = DropDownList20.SelectedItem.Text;
                    Label38.Text = DropDownList21.SelectedItem.Value;
                    Label39.Text = DropDownList22.SelectedItem.Value;
                    Label40.Text = DropDownList23.SelectedItem.Value;
                    }
                    
              else*/
                    if (DropDownList38.SelectedItem.Value.Equals("3") || DropDownList38.SelectedItem.Value.Equals("6"))
                   {
                    Label37.Text = DropDownList35.SelectedItem.Text;
                    Label38.Text = DropDownList36.SelectedItem.Value;
                    Label39.Text = DropDownList19.SelectedItem.Value;
                    Label40.Text = DropDownList37.SelectedItem.Value;
                     }
         

                }
                else if (CheckBox1.Checked == false)
                {
                    Label35.Text = "";
                    Label36.Text = "";
                    Label37.Text = "";
                    Label38.Text = "";
                    Label39.Text = "";
                    Label40.Text = "";
                    Label54.Text = "";
                    Label55.Text = "";
                    Label56.Text = "";
                    Label57.Text = "";
                    Label58.Text = "";
                    Label59.Text = "";
                    Label43.Text = "";// Label35.Text;

                    Label44.Text = "";// Label36.Text;

                    Label45.Text = "";// Label37.Text;

                    Label46.Text = "";// Label38.Text;

                    Label47.Text = "";// Label39.Text;
                    Label48.Text = "";
                    CheckBox4.Checked = false;
                }
                if (CheckBox4.Checked == true)  //35 to 40  43 48
                {
                    if (DropDownList38.SelectedItem.Text.Equals("Search by Company"))
                    {

                        Label43.Text = Label35.Text;

                        Label44.Text = Label36.Text;

                        Label45.Text = Label37.Text;

                        Label46.Text = Label38.Text;

                        Label47.Text = Label39.Text;
                        Label48.Text = Label40.Text;
             
                    }
                    else if (DropDownList38.SelectedItem.Value.Equals("3") || DropDownList38.SelectedItem.Value.Equals("6"))
                    {
                        Label45.Text = DropDownList35.SelectedItem.Text;
                        Label46.Text = DropDownList36.SelectedItem.Value;
                        Label47.Text = DropDownList19.SelectedItem.Value;
                        Label48.Text = DropDownList37.SelectedItem.Value;
                      
                    }
                 }
                else
                {

                }
            }
        




        protected void CheckBox22_CheckedChanged(object sender, EventArgs e)
        {

            if (CheckBox2.Checked == true)
            {
            
                DropDownList39.Visible = true;
                CheckBox1.Checked = false;
                Label37.Text = "";// false;
                Label38.Text = "";
                Label39.Text = "";
                Label40.Text = "";
                if (DropDownList39.SelectedItem.Value.Equals("3") || DropDownList39.SelectedItem.Value.Equals("6"))
                {
                    TextBox6.Visible = true;
                    Label145.Visible = true;
                    TextBox6.Text = "";// true;
             
                }

            }
           
            else if (CheckBox2.Checked == false)
            {
                TextBox2.Visible = false;
                DropDownList24.Visible = false;
                DropDownList26.Visible = false;
                DropDownList27.Visible = false;
                DropDownList28.Visible = false;
                DropDownList29.Visible = false;
                Label13.Visible = false;
                Label41.Visible = false;
                Label14.Visible = false;
                Label15.Visible = false;
                Label16.Visible = false;
                Label17.Visible = false;
                Label18.Visible = false;
                Label19.Visible = false;
                Button2.Visible = false;
            
                //  DropDownList24.Visible = false;
                //  DropDownList24.Visible = false;


            }
        }



        protected void CheckBox5_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox5.Checked == true)
            {
                CheckBox3.Checked = false;
                CheckBox4.Checked = false;

                Label27.Text = "";
                Label49.Text = ""; //DropDownList19.SelectedItem.Value;
                Label50.Text = "";// DropDownList20.SelectedItem.Text;
                Label51.Text = "";// DropDownList21.SelectedItem.Value;
                Label52.Text = "";// DropDownList22.SelectedItem.Value;
                Label53.Text = "";// DropDownList23.SelectedItem.Value;

                Label43.Text = "";
                Label44.Text = "";
                Label45.Text = "";
                Label46.Text = "";
                Label47.Text = "";
                Label48.Text = "";
                TextBox7.Visible = true;
                Label146.Visible = true;
                //   Label20.Visible = true;
               // Label21.Visible = true;
              //    DropDownList34.Visible = true;
             
                /*   TextBox4.Text = TextBox1.Text;
            
                DropDownList24.DataSource = DropDownList19.DataSource;
                DropDownList24.DataBind();

                DataTable dt1 = new DataTable();
                DataTable dt2 = new DataTable();

                dt1 = fill_comp_address(DropDownList18.SelectedItem.Value);
                dt2 = fill_name(DropDownList18.SelectedItem.Value);

                DropDownList34.DataSource = dt1;
                DropDownList34.DataTextField = "CompAddress";
                DropDownList34.DataValueField = "CompAddress";
                DropDownList34.DataBind();
                DropDownList34.Items.Insert(0, new ListItem("Select", "Select"));
                DropDownList30.DataSource = dt2;
                DropDownList30.DataTextField = "contName";
                DropDownList30.DataValueField = "contName";
                DropDownList30.DataBind();
                DropDownList30.Items.Insert(0, new ListItem("Select", "Select"));
                */
            }
            else if (CheckBox5.Checked == false)
            {
                DropDownList43.Visible = false;
                DropDownList44.Visible = false;
                DropDownList45.Visible = false;
            
                Button3.Visible = false;
                Label20.Visible = false;
                Label21.Visible = false;
                Label22.Visible = false;
                Label23.Visible = false;
                Label24.Visible = false;
                Label25.Visible = false;
                //  Label41.Visible = false;
                TextBox4.Visible = false;
                Label66.Visible = false;
                DropDownList30.Visible = false;
                DropDownList31.Visible = false;
                DropDownList32.Visible = false;
                DropDownList33.Visible = false;
                DropDownList34.Visible = false;

            }
        }

        protected void Button3_Click1(object sender, EventArgs e)
        {
            try
            {
            //    if (TextBox4.Text != "" && DropDownList30.SelectedItem.Value != "Select" && DropDownList31.SelectedItem.Value != "Select" && DropDownList32.SelectedItem.Value != "Select" && DropDownList33.SelectedItem.Value.ToString() != "Select" && DropDownList34.SelectedItem.Value.ToString() != "Select")
              //  {

                if (DropDownList43.SelectedItem.Value != "Select" && DropDownList34.SelectedItem.Value != "Select" && DropDownList44.SelectedItem.Value != "Select" && DropDownList45.SelectedItem.Value != "Select")
                    {

                        //if()
                        //Label60.Text = TextBox4.Text;
                     //   Label61.Text = DropDownList34.SelectedItem.Text;
                        Label62.Text = DropDownList43.SelectedItem.Text;
                        Label63.Text = DropDownList44.SelectedItem.Value.ToString();
                        Label64.Text = DropDownList34.SelectedItem.Value.ToString();
                        Label65.Text = DropDownList45.SelectedItem.Value.ToString();
                      
                    //  Label65.Text = DropDownList33.SelectedItem.Value.ToString();
                        Label60.Visible = true;
                        Label61.Visible = true;
                        Label62.Visible = true;
                        Label63.Visible = true;
                        Label64.Visible = true;
                        Label65.Visible = true;
                        Label25.Visible = true;
                        //CheckBox1.Enabled = true;
                        //CheckBox2.Enabled = true;
                        //CheckBox3.Enabled = true;
                        //CheckBox4.Enabled = true;
                        //CheckBox5.Enabled = true;
                    }
                
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please Fill billing to address the form properly')</script>");
                    Label60.Text = "";//  TextBox4.Text;
                    Label61.Text = ""; //DropDownList34.SelectedItem.Text;
                    Label62.Text = "";// DropDownList30.SelectedItem.Text;
                    Label63.Text = "";// DropDownList31.SelectedItem.Value.ToString();
                    Label64.Text = "";// DropDownList32.SelectedItem.Value.ToString();
                    Label65.Text = ""; //DropDownList33.SelectedItem.Value.ToString();

                    //alert function add

                }

            }
            catch (Exception b) { }
        }

       

       
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

            int i = 0;
            int j = 0;
            int k = 0;
            string f2 = "";
            // Session["quote_id"] = "abc";
            // Response.Redirect("take_session.asp?id=abc");
            //sold_cname,sold_add,sold_name1,ship_cname,ship_add,ship_name1,bill_cname,bill_add,bill_name1,ph1,ph2,ph3,email1,email2,email3,fax1,fax2,fax3;
            NameValueCollection data = new NameValueCollection();
            try
            {

            //    if (TextBox1.Text != "" && DropDownList18.SelectedItem.Value != "Select" && DropDownList19.SelectedItem.Value != "Select" && DropDownList20.SelectedItem.Value != "Select" && DropDownList21.SelectedItem.Value != "Select" && DropDownList22.SelectedItem.Value != "Select" && DropDownList23.SelectedItem.Value != "Select")
                if (DropDownList35.SelectedItem.Value != "Select" && DropDownList19.SelectedItem.Value != "Select" && DropDownList36.SelectedItem.Value != "Select" && DropDownList37.SelectedItem.Value != "Select")
                {
                            
                    i = 1;
                    sold_cname = DropDownList35.SelectedItem.Value; //TextBox1.Text;
                    sold_add = DropDownList19.SelectedItem.Text;// DropDownList19.SelectedItem.Value;
                    sold_name1 = DropDownList35.SelectedItem.Text;
                    email1 = DropDownList36.SelectedItem.Value;
                    ph1 = DropDownList37.SelectedItem.Value;
                    fax1 = DropDownList37.SelectedItem.Value;// DropDownList23.SelectedItem.Value.ToString();

                }
                else
                {
                    i = 0;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please Fill sold addresses  properly')</script>");

                }
            }
            catch (Exception l) { }

            if (CheckBox1.Checked == true)
            {
                j = 1;
                ship_cname = sold_cname;
                ship_add = sold_add;
                ship_name1 = sold_name1;
                email2 = email1;
                ph2 = ph1;
                f2 = fax2;
                fax2 = fax1 + " !sold";

            }
            else if (CheckBox2.Checked == true)
            {
                try
                {
            //        if (TextBox2.Text != "" && DropDownList24.SelectedItem.Value != "Select" && DropDownList26.SelectedItem.Value != "Select" && DropDownList27.SelectedItem.Value != "Select" && DropDownList28.SelectedItem.Value != "Select" && DropDownList29.SelectedItem.Value != "Select")
              //      {
                    if (DropDownList40.SelectedItem.Value != "Select" && DropDownList24.SelectedItem.Value != "Select" && DropDownList41.SelectedItem.Value != "Select" && DropDownList42.SelectedItem.Value != "Select")
                    {

                    j = 1;
                    ship_cname = DropDownList40.SelectedItem.Value; //TextBox6.Text;
                    ship_add =  DropDownList24.SelectedItem.Text;
                        ship_name1 = DropDownList40.SelectedItem.Text;
                        email2 = DropDownList41.SelectedItem.Value;
                        ph2 = DropDownList42.SelectedItem.Value;
                        fax2 = DropDownList42.SelectedItem.Value +"!new";
                    }
                    else
                    {
                        j = 0;
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please Fill shipping addresses  properly')</script>");
                    }
                }
                catch (Exception m)
                {

                }
            }
            else
            {
                j = 0;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please Fill shipping addresses  properly')</script>");
            }


            if (CheckBox3.Checked == true)
            {
                k = 1;
                bill_cname = sold_cname;
                bill_add = sold_add;
                bill_name1 = sold_name1;
                email3 = email1;
                ph3 = ph1;
                fax3 = fax1 + " !sold";
            }
            else if (CheckBox4.Checked == true)
            {
                k = 1;
                bill_cname = ship_cname;
                bill_add = ship_add;
                bill_name1 = ship_name1;
                email3 = email2;
                ph3 = ph2;
                fax3 = f2 + " !ship";
            }
            else if (CheckBox5.Checked == true)
            {

                if ( DropDownList43.SelectedItem.Value != "Select" && DropDownList44.SelectedItem.Value != "Select" && DropDownList45.SelectedItem.Value != "Select")
                {
                    k = 1;
                    bill_cname = DropDownList43.SelectedItem.Value; // TextBox4.Text;
                    bill_add  =  DropDownList34.SelectedItem.Value;
                    bill_name1 = DropDownList43.SelectedItem.Text;
                    email3 = DropDownList44.SelectedItem.Value;
                     ph3 = DropDownList45.SelectedItem.Value;
                     fax3 = DropDownList45.SelectedItem.Value +" !new";
                    //DropDownList33.SelectedItem.Value

                }
                else
                {
                    k = 0;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please Fill billing the addresses  properly')</script>");

                }


            }
            else
            {
                k = 0;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please Fill all the addresses  properly')</script>");

            }
            if (i == 1 && j == 1 && k == 1)
            {
                //s send data to asp page using POST method
                //sold_cname,sold_add,sold_name1,ship_cname,ship_add,ship_name1,bill_cname,bill_add,bill_name1,ph1,ph2,ph3,email1,email2,email3,fax1,fax2,fax3;
                string comp_id=DropDownList18.SelectedValue.ToString();
                data.Add("comp_id","1");
                data.Add("sold_cname", sold_cname);
                data.Add("sold_add", sold_add);
                data.Add("sold_name1", sold_name1);
                data.Add("ph", ph1);
                data.Add("email", email1);
                data.Add("fax", fax1);

                data.Add("ship_cname", ship_cname);
                data.Add("ship_add", ship_add);
                data.Add("ship_name1", ship_name1);
                data.Add("ph1", ph2);
                data.Add("email1", email2);
                data.Add("fax1", fax2);

                data.Add("bill_cname", bill_cname);
                data.Add("bill_add", bill_add);
                data.Add("bill_name1", bill_name1);
                data.Add("ph2", ph3);
                data.Add("email2", email3);
                data.Add("fax2", fax3);
                if (Convert.ToString(query).Equals("V2"))
                {

                    HttpHelper.RedirectAndPOST(this.Page, "addeditviewquote1.asp", data);

                }
                else if (Convert.ToString(query).Equals("V1") || Convert.ToString(query).Equals("V3"))
                {

                    HttpHelper.RedirectAndPOST(this.Page, "addeditviewquote.asp", data);

                }


                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please Fill all the addresses  properly')</script>");
                }
                //Response.Write(i + j +k);
                // data.Add("id", "val1");
                // data.Add("v2", "val2");
                // HttpHelper.RedirectAndPOST(this.Page, "addeditviewquote.asp", data);
            }

        }

        protected void DropDownList21_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button4_Click1(object sender, EventArgs e)
        {
            TextBox5.Visible = true;
            Label144.Text = "";
        }

        protected void TextBox5_TextChanged(object sender, EventArgs e)
        {
            Label4.Visible = true;
            Label5.Visible = true;
            Label6.Visible = true;
            Label42.Visible = true;
            DataTable dt = new DataTable();
            Button1.Visible = true;
            DropDownList19.Visible = true;
            DropDownList35.Visible = true;
            DropDownList36.Visible = true;
            DropDownList37.Visible = true;
            if (DropDownList38.SelectedItem.Value.Equals("6"))
            {
                dt = fetch_info_user(TextBox5.Text, 6);

                DropDownList35.DataSource = dt;//.Columns[1].Table;
                DropDownList35.DataTextField = "Full Name";
                DropDownList35.DataValueField = "Contact GUID";  //change to contact guid to take session 
                DropDownList36.DataSource = dt;//.Columns[1].Table;
                DropDownList36.DataTextField = "Email";
                DropDownList37.DataSource = dt;//.Columns[1].Table;
                DropDownList37.DataTextField = "Phone";
                DropDownList19.DataSource = dt;//.Columns[1].Table;
                DropDownList19.DataTextField = "Address 1";

                DropDownList35.DataBind();
                DropDownList36.DataBind();
                DropDownList37.DataBind();
                DropDownList19.DataBind();
            //    DropDownList35.Items.Insert(0, new ListItem("Select", "Select"));
              //  DropDownList36.Items.Insert(0, new ListItem("Select", "Select"));
                //DropDownList37.Items.Insert(0, new ListItem("Select", "Select"));
               // DropDownList19.Items.Insert(0, new ListItem("Select", "Select"));
            
            
            }
            else if (DropDownList38.SelectedItem.Value.Equals("3"))
            {
                dt = fetch_info_user(TextBox5.Text, 3);
                // create a new contacts
                DropDownList35.DataSource = dt;//.Columns[1].Table;
                DropDownList35.DataTextField = "Full Name";
                DropDownList35.DataValueField = "Contact GUID";  //change to contact guid to take session 
                DropDownList36.DataSource = dt;//.Columns[1].Table;
                DropDownList36.DataTextField = "Email";
                DropDownList37.DataSource = dt;//.Columns[1].Table;
                DropDownList37.DataTextField = "Phone";
                DropDownList19.DataSource = dt;//.Columns[1].Table;
                DropDownList19.DataTextField = "Address 1";

                DropDownList35.DataBind();
                DropDownList36.DataBind();
                DropDownList37.DataBind();
                DropDownList19.DataBind();
                DropDownList35.Items.Insert(0, new ListItem("Select", "Select"));
                DropDownList36.Items.Insert(0, new ListItem("Select", "Select"));
                DropDownList37.Items.Insert(0, new ListItem("Select", "Select"));
                DropDownList19.Items.Insert(0, new ListItem("Select", "Select"));
            
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please select the proper sold to address')</script>");

            }
                // create a new contacts
            /* for (int i = 0; i < dt.Rows.Count; i++)
            {
                for (int j = 1; j < dt.Rows.Count; j++)
                {
                    DropDownList35.
                }
            }*/
        }
        public DataTable fetch_info_user(string search_key,int key)
        {
             DataTable dtTable =new DataTable();
            try
            {
                IOrganizationService service;
                string userName = Convert.ToString(Session["username"]);//"quote@edusysglobalservices.onmicrosoft.com";
                string password = Convert.ToString(Session["password"]); //"Saxu0104";
                string orgUrl = "https://edusysglobalservices.api.crm5.dynamics.com/XRMServices/2011/Organization.svc";
                service = EDUsys.CreateService(userName, password, orgUrl);
                
                 dtTable = EDUsys.GetContacts(service, key, search_key);// search by last name(3)
   /*             1
    Full Name
2
First Name
3
Last Name
4
Phone*/
                //     EDUsys.GetContacts(service, 1, "Su");
                if (dtTable.Rows.Count > 0)
                {
                    ViewState["data"] = dtTable;
                    return dtTable;
                     GridView1.DataSource = dtTable;
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("No data found");
                }

            }

            catch (Exception l)
            {
             //   Response.Write(l.Message);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please select the proper contact Data!or please check your internet connection')</script>");

            }
            return dtTable;
        }

        protected void DropDownList35_SelectedIndexChanged(object sender, EventArgs e)
        {
            int get_index = DropDownList35.SelectedIndex;
            DataTable dt = null; 
            DataRow row = null;
             if (DropDownList35.SelectedItem.Text.Equals("Select"))
             {
                 Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please select name')</script>");

             }
             else
             {
                 dt = (DataTable)(ViewState["data"]);
            
                 DropDownList36.Items.Clear();
                 DropDownList37.Items.Clear();
                 DropDownList19.Items.Clear();
                 DropDownList36.Items.Add(new ListItem(dt.Rows[get_index - 1]["Email"].ToString(), dt.Rows[get_index - 1]["Email"].ToString()));
                 DropDownList37.Items.Add(new ListItem(dt.Rows[get_index - 1]["Phone"].ToString(), dt.Rows[get_index - 1]["Phone"].ToString()));
                 DropDownList19.Items.Add(new ListItem(dt.Rows[get_index - 1]["Address 1"].ToString(), dt.Rows[get_index - 1]["Address 1"].ToString()));
            
                 DropDownList36.Items.Add(new ListItem("Select", "Select"));
                   DropDownList37.Items.Add( new ListItem("Select", "Select"));
                   DropDownList19.Items.Add(new ListItem("Select", "Select"));
             
             }

        }

        protected void DropDownList38_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList38.SelectedItem.Value.Equals("Search by Company"))
            {
                TextBox5.Text = "";
                DropDownList18.Visible = true;
                Label1.Visible = true;
                TextBox5.Visible = false;
                Label144.Visible = false;
                DropDownList35.Visible = false;
                DropDownList36.Visible = false;
                DropDownList37.Visible = false;
                Label4.Visible = false;
                Label5.Visible = false;
                Label6.Visible = false;
            

            }
            else if (DropDownList38.SelectedItem.Value.Equals("6") || DropDownList38.SelectedItem.Value.Equals("3"))
            {
                if (DropDownList38.SelectedItem.Value.Equals("6"))
                    Label144.Text = "Search by Contact ID";
                else if (DropDownList38.SelectedItem.Value.Equals("3"))
                    Label144.Text = "Search by Last Name";

                TextBox5.Text = "";
                TextBox5.Visible = true;
                Label144.Visible = true;
                DropDownList18.Visible = false;
                Label1.Visible = false;
                TextBox1.Visible = false;
                DropDownList19.Visible = false;
                DropDownList20.Visible = false;
                DropDownList21.Visible = false;
                DropDownList22.Visible = false;
                DropDownList23.Visible = false;
                Button1.Visible = false;
                //  Label1.Visible = false;
                Label2.Visible = false;
                Label4.Visible = false;
                Label5.Visible = false;
                Label6.Visible = false;
                Label7.Visible = false;
                Label42.Visible = false;
                Label12.Visible = false;
            
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please select the proper sold to address')</script>");
           
            }
        }

        protected void DropDownList39_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*if (DropDownList39.SelectedItem.Text.Equals("Search by Company"))
            {
                CheckBox1.Checked = false;
                CheckBox4.Checked = false;
                CheckBox4_CheckedChanged(sender, e);

                Label35.Text = "";
                Label36.Text = "";
                Label37.Text = "";
                Label38.Text = "";
                Label39.Text = "";
                Label40.Text = "";
                Label43.Text = "";// Label35.Text;

                Label44.Text = "";// Label36.Text;

                Label45.Text = "";// Label37.Text;

                Label46.Text = "";// Label38.Text;

                Label47.Text = "";// Label39.Text;

                Label48.Text = "";// Labe;
                Button2.Visible = true;
                Label13.Visible = true;
                Label14.Visible = true;
                Label15.Visible = true;
                Label16.Visible = true;
                Label17.Visible = true;
                Label18.Visible = true;
                Label41.Visible = true;
                TextBox2.Visible = true;
                DropDownList24.Visible = true;
                DropDownList26.Visible = true;
                DropDownList27.Visible = true;
                DropDownList28.Visible = true;
                DropDownList29.Visible = true;
                TextBox2.Text = TextBox1.Text;
                DropDownList24.DataSource = DropDownList19.DataSource;
                DropDownList24.DataBind();

                DataTable dt1 = new DataTable();
                DataTable dt2 = new DataTable();

                dt1 = fill_comp_address(DropDownList18.SelectedItem.Value);
                dt2 = fill_name(DropDownList18.SelectedItem.Value);

                DropDownList24.DataSource = dt1;
                DropDownList24.DataTextField = "CompAddress";
                DropDownList24.DataValueField = "CompAddress";
                DropDownList24.DataBind();
                DropDownList24.Items.Insert(0, new ListItem("Select", "Select"));
                DropDownList26.DataSource = dt2;
                DropDownList26.DataTextField = "contName";
                DropDownList26.DataValueField = "contName";
                DropDownList26.DataBind();
                DropDownList26.Items.Insert(0, new ListItem("Select", "Select"));


                TextBox2.Text = "";
                DropDownList24.Visible = true;
                Label1.Visible = true;
                TextBox5.Visible = false;
                Label144.Visible = false;
                DropDownList26.Visible = false;
                DropDownList27.Visible = false;
                DropDownList28.Visible = false;
                Label4.Visible = false;
                Label5.Visible = false;
                Label6.Visible = false;


            }
            else */
            if (DropDownList39.SelectedItem.Value.Equals("3") || DropDownList39.SelectedItem.Value.Equals("6"))
            {
                Label145.Visible = true;
                TextBox6.Visible = true;
                if (DropDownList39.SelectedItem.Value.Equals("3"))
                {
                    Label145.Text = "Search by Last Name";
                    TextBox6.Text = "";
                }
                else if (DropDownList39.SelectedItem.Value.Equals("6"))
                {
                    Label145.Text = "Search by Contact ID";
                    TextBox6.Text = "";
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please select the proper sold to address')</script>");

            }

        }

        protected void TextBox6_TextChanged(object sender, EventArgs e)
        {
            Label15.Visible = true;
            Label16.Visible = true;
            Label17.Visible = true;
            DropDownList40.Visible = true;
            DropDownList41.Visible = true;
            DropDownList42.Visible = true;
            DropDownList24.Visible = true;
            Label41.Visible = true;
            /*TextBox6.Text = "";
            TextBox5.Visible = true;
            Label144.Visible = true;
            DropDownList18.Visible = false;
            Label1.Visible = false;
            TextBox1.Visible = false;
            DropDownList19.Visible = false;
            DropDownList20.Visible = false;
            DropDownList21.Visible = false;
            DropDownList22.Visible = false;
            DropDownList23.Visible = false;
            Button2.Visible = false;
            //  Label1.Visible = false;
            Label2.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            Label7.Visible = false;
            Label42.Visible = false;
            Label12.Visible = false;
            */
            DataTable dt = new DataTable();
            Button2.Visible = true;
            DropDownList40.Visible = true;
            DropDownList41.Visible = true;
            DropDownList42.Visible = true;
            if (DropDownList39.SelectedItem.Value.Equals("3"))
            {
                dt = fetch_info_user1(TextBox6.Text,3);
                DropDownList40.DataSource = dt;//.Columns[1].Table;
                DropDownList40.DataTextField = "Full Name";
                DropDownList40.DataValueField = "Contact GUID";
                DropDownList41.DataSource = dt;//.Columns[1].Table;
                DropDownList41.DataTextField = "Email";
                DropDownList42.DataSource = dt;//.Columns[1].Table;
                DropDownList42.DataTextField = "Phone";

                DropDownList24.DataSource = dt;//.Columns[1].Table;
                DropDownList24.DataTextField = "Address 1";


                DropDownList40.DataBind();
                DropDownList41.DataBind();

                DropDownList42.DataBind();

                DropDownList24.DataBind();

                DropDownList40.Items.Insert(0, new ListItem("Select", "Select"));
                DropDownList41.Items.Insert(0, new ListItem("Select", "Select"));
                DropDownList42.Items.Insert(0, new ListItem("Select", "Select"));
                DropDownList24.Items.Insert(0, new ListItem("Select", "Select"));

            }
            else if (DropDownList39.SelectedItem.Value.Equals("6"))
            {
                dt = fetch_info_user1(TextBox6.Text,6);
                DropDownList40.DataSource = dt;//.Columns[1].Table;
                DropDownList40.DataTextField = "Full Name";
                DropDownList40.DataValueField = "Contact GUID";
                DropDownList41.DataSource = dt;//.Columns[1].Table;
                DropDownList41.DataTextField = "Email";
                DropDownList42.DataSource = dt;//.Columns[1].Table;
                DropDownList42.DataTextField = "Phone";

                DropDownList24.DataSource = dt;//.Columns[1].Table;
                DropDownList24.DataTextField = "Address 1";


                DropDownList40.DataBind();
                DropDownList41.DataBind();

                DropDownList42.DataBind();

                DropDownList24.DataBind();

//                DropDownList40.Items.Insert(0, new ListItem("Select", "Select"));
  //              DropDownList41.Items.Insert(0, new ListItem("Select", "Select"));
    //            DropDownList42.Items.Insert(0, new ListItem("Select", "Select"));
      //          DropDownList24.Items.Insert(0, new ListItem("Select", "Select"));

            }
        }

        public DataTable fetch_info_user1(string search_key,int key)
        {
            DataTable dtTable = new DataTable();
            try
            {
                IOrganizationService service;
                string userName = Convert.ToString(Session["username"]);//"quote@edusysglobalservices.onmicrosoft.com";
                string password = Convert.ToString(Session["password"]); //"Saxu0104";
                string orgUrl = "https://edusysglobalservices.api.crm5.dynamics.com/XRMServices/2011/Organization.svc";
                service = EDUsys.CreateService(userName, password, orgUrl);

                dtTable = EDUsys.GetContacts(service, key, search_key);// search by last name(3)
                /*             1
                 Full Name
             2
             First Name
             3
             Last Name
             4
             Phone*/
                //     EDUsys.GetContacts(service, 1, "Su");
                if (dtTable.Rows.Count > 0)
                {
                    ViewState["data1"] = dtTable;
                    return dtTable;
                    // GridView1.DataSource = dtTable;
                    // GridView1.DataBind();
                }
                else
                {
                    Response.Write("No data found");
                }

            }

            catch (Exception l)
            {
                
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please search Ship to address by proper id or last name or please check your internet connection')</script>");

                //alert function add

            

                Response.Write(l.Message);
            }
            return dtTable;
        }


        public DataTable fetch_info_user2(string search_key)
        {
            DataTable dtTable = new DataTable();
            try
            {
                IOrganizationService service;
                string userName = Convert.ToString(Session["username"]);//"quote@edusysglobalservices.onmicrosoft.com";
                string password = Convert.ToString(Session["password"]); //"Saxu0104";
                string orgUrl = "https://edusysglobalservices.api.crm5.dynamics.com/XRMServices/2011/Organization.svc";
                service = EDUsys.CreateService(userName, password, orgUrl);

                dtTable = EDUsys.GetContacts(service, 3, search_key);// search by last name(3)
                /*             1
                 Full Name
             2
             First Name
             3
             Last Name
             4
             Phone*/
                //     EDUsys.GetContacts(service, 1, "Su");
                if (dtTable.Rows.Count > 0)
                {
                    ViewState["data2"] = dtTable;
                    return dtTable;
                    // GridView1.DataSource = dtTable;
                    // GridView1.DataBind();
                }
                else
                {
                    Response.Write("No data found");
                }

            }

            catch (Exception l)
            {
                Response.Write(l.Message);
            }
            return dtTable;
        }

        
        protected void DropDownList40_SelectedIndexChanged(object sender, EventArgs e)
        {
            int get_index = DropDownList40.SelectedIndex;
            DataTable dt = null;
            DataRow row = null;
            if (DropDownList40.SelectedItem.Text.Equals("Select"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please select name')</script>");

            }
            else
            {
                dt = (DataTable)(ViewState["data1"]);

                DropDownList41.Items.Clear();
                DropDownList42.Items.Clear();
                DropDownList24.Items.Clear();
 
                DropDownList41.Items.Add(new ListItem(dt.Rows[get_index - 1]["Email"].ToString(), dt.Rows[get_index - 1]["Email"].ToString()));
                DropDownList42.Items.Add(new ListItem(dt.Rows[get_index - 1]["Phone"].ToString(), dt.Rows[get_index - 1]["Phone"].ToString()));
                DropDownList24.Items.Add(new ListItem(dt.Rows[get_index - 1]["Address 1"].ToString(), dt.Rows[get_index - 1]["Address 1"].ToString()));
               
                DropDownList41.Items.Add(new ListItem("Select", "Select"));
                DropDownList42.Items.Add(new ListItem("Select", "Select"));
                DropDownList24.Items.Add(new ListItem("Select", "Select"));

            }

        }

        protected void TextBox7_TextChanged(object sender, EventArgs e)
        {
            Label22.Visible = true;
            Label23.Visible = true;
            Label24.Visible = true;
            //   Label.Visible = true;

            // Label25.Visible = true;
            //  Label41.Visible = true;
            // TextBox4.Visible = true;
            // Label66.Visible = true;
            // DropDownList30.Visible = true;
            DropDownList43.Visible = true;
            DropDownList44.Visible = true;
            DropDownList45.Visible = true;
           
            Label15.Visible = true;
            Label16.Visible = true;
            Label17.Visible = true;
            DropDownList40.Visible = true;
            DropDownList41.Visible = true;
            DropDownList42.Visible = true;
            DropDownList34.Visible = true;
            Label66.Visible = true;
            /*TextBox6.Text = "";
            TextBox5.Visible = true;
            Label144.Visible = true;
            DropDownList18.Visible = false;
            Label1.Visible = false;
            TextBox1.Visible = false;
            DropDownList19.Visible = false;
            DropDownList20.Visible = false;
            DropDownList21.Visible = false;
            DropDownList22.Visible = false;
            DropDownList23.Visible = false;
            Button2.Visible = false;
            //  Label1.Visible = false;
            Label2.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            Label7.Visible = false;
            Label42.Visible = false;
            Label12.Visible = false;
            */
            DataTable dt = new DataTable();
            Button3.Visible = true;
            DropDownList40.Visible = true;
            DropDownList41.Visible = true;
            DropDownList42.Visible = true;
            dt = fetch_info_user2(TextBox7.Text);
            DropDownList43.DataSource = dt;//.Columns[1].Table;
            DropDownList43.DataTextField = "Full Name";
            DropDownList43.DataValueField = "Contact GUID";
            DropDownList44.DataSource = dt;//.Columns[1].Table;
            DropDownList44.DataTextField = "Email";
            DropDownList45.DataSource = dt;//.Columns[1].Table;
            DropDownList45.DataTextField = "Phone";
            DropDownList34.DataSource = dt;//.Columns[1].Table;
            DropDownList34.DataTextField = "Address 1";

            DropDownList43.DataBind();
            DropDownList44.DataBind();
            DropDownList45.DataBind();
            DropDownList34.DataBind();
            DropDownList43.Items.Insert(0, new ListItem("Select", "Select"));
            DropDownList44.Items.Insert(0, new ListItem("Select", "Select"));
            DropDownList45.Items.Insert(0, new ListItem("Select", "Select"));
            DropDownList34.Items.Insert(0, new ListItem("Select", "Select"));

            
        }

        protected void DropDownList43_SelectedIndexChanged(object sender, EventArgs e)
        {
            int get_index = DropDownList43.SelectedIndex;
            DataTable dt = null;
            DataRow row = null;
            if (DropDownList43.SelectedItem.Text.Equals("Select"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please select name')</script>");

            }
            else
            {
                dt = (DataTable)(ViewState["data2"]);

                DropDownList44.Items.Clear();
                DropDownList45.Items.Clear();
                DropDownList34.Items.Clear();
                DropDownList44.Items.Add(new ListItem(dt.Rows[get_index - 1]["Email"].ToString(), dt.Rows[get_index - 1]["Email"].ToString()));
                DropDownList45.Items.Add(new ListItem(dt.Rows[get_index - 1]["Phone"].ToString(), dt.Rows[get_index - 1]["Phone"].ToString()));
                DropDownList34.Items.Add(new ListItem(dt.Rows[get_index - 1]["Address 1"].ToString(), dt.Rows[get_index - 1]["Address 1"].ToString()));
                
                DropDownList44.Items.Add(new ListItem("Select", "Select"));
                DropDownList45.Items.Add(new ListItem("Select", "Select"));
                DropDownList34.Items.Add(new ListItem("Select", "Select"));
            }
        }

        protected void DropDownList37_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
     
    }
}
    
