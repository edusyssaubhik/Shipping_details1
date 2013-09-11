using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shipping_details1.QuoteWerks
{
    public partial class send_payment_report : System.Web.UI.Page
    {
       SqlConnection con = new SqlConnection("DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=fIw4VdokuY2Lb0;DATABASE=apmgstudy");
        //SqlConnection con = new SqlConnection("Data Source=SAUBHIK-PC;Initial Catalog=apmgstudy;Integrated Security=True");
       //   SqlConnection con = new SqlConnection("Data Source=saubhik-pc;Initial Catalog=apmgstudy;User ID=sa;Password=***********");
        DataTable dt1 = new DataTable();
        DataTable dt2 = new DataTable();
        public string[] mail;
        public string quoteid, po, fname,lname,email,sold_add,currency,mail_id;
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                quoteid = Request.QueryString["id"].ToString();
                po = Request.QueryString["id"].ToString();

                TextBox4.Text = po;
                // con.Close();
                SqlCommand cmd1 = new SqlCommand("select  a.firstname,a.lastname,a.officialemailid,b.soldtoAddress,c.currency  from users a,QW_QuoteOverview b,QW_CountryDetail c  where b.quoteId=@a and a.userid=b.userId and c.countryId=b.countryId", con);

                cmd1.Parameters.Add(new SqlParameter("@a", Int32.Parse(quoteid)));
                // con.Open();
                cmd1.Connection.Open();
                SqlDataReader dr = cmd1.ExecuteReader();

                if (dr.Read())
                {
                    fname = dr[0].ToString();
                    lname = dr[1].ToString();
                    email = dr[2].ToString();
                    sold_add = dr[3].ToString();
                    currency = dr[4].ToString();
                    Label19.Text = currency;
                }
                mail = sold_add.Split('!');
                mail_id = mail[1].ToString();
                dr.Close(); dr.Dispose();
                con.Close();

            }
            catch (Exception f) { }

            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            int f = 0;
            if (TextBox1.Text.Equals(""))
                Label20.Text = "Please enter payment";
            else if(TextBox2.Text.Equals(""))
                Label21.Text = "Please enter Mode";
            else if (TextBox3.Text.Equals(""))
                Label22.Text = "Please enter transaction ID";
            else if (TextBox4.Text.Equals(""))
                Label23.Text = "Please enter the PO number";
            else if (TextBox5.Text.Equals(""))
                Label24.Text = "Please enter the Date";
            else
            {
                f = 1;
                Panel1.Visible = true;
                Label6.Text = email;
                Label7.Text =Convert.ToString( mail[1]).ToString();
                Label14.Text = fname;
                Label15.Text = lname;
                Label18.Text =Convert.ToString( mail[3]);//mail id(to)
                Label16.Text = currency;//currency
                Label17.Text = TextBox1.Text;//payment
                Label12.Text = TextBox2.Text;//mode
                Label8.Text = TextBox3.Text;//transaction id
                Label9.Text = TextBox5.Text;//transaction date
                Label13.Text = TextBox4.Text;//po no
                Label10.Text = fname + " " + lname;
                    Label20.Text = "";
                    Label21.Text = "";
                    Label22.Text = "";
                    Label23.Text = "";
                    Label24.Text = "";
            
            }
            if (f == 0)
                Panel1.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (currency.Equals("&#163;"))
                currency = "pound";
            Response.Redirect("send_payment_mail.asp?dated=" + TextBox5.Text + "&id=" + quoteid + "&from_mail=" + email + "&name=" + fname + " " + lname + "&email=" + email + "&payment=" + Label17.Text + "&mode=" + Label12.Text + "&transaction=" + Label8.Text + "&po=" + Label13.Text + "&tomail=" + Label18.Text + "&toname=" + Label7.Text + "&currency=" + currency);
       
        }

    }
}