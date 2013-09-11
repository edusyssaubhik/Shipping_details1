using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shipping_details1.QuoteWerks
{
    public partial class generate_invoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string qid=Request.QueryString["id"].ToString();
            string po=Request.QueryString["pono"].ToString();
            string quoteStatus = Request.QueryString["quoteStatus"];
            string user = Request.QueryString["user"];
            int invoice_max=0;
            // generate Invoice autometicatically
            SqlConnection con = new SqlConnection("DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=fIw4VdokuY2Lb0;DATABASE=apmgstudy");
            con.Open();

            SqlCommand cmd = new SqlCommand("select max(convert(int,substring(Invoiceno,6, 10000000)))+1 a from QW_QuoteOverview", con);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                if (Convert.ToString(dr[0]).Equals(""))
                    invoice_max = 1;
                else
                invoice_max =Convert.ToInt32(dr[0].ToString());
            }
            con.Close();
            dr.Close();
            string iv = "IV000" + invoice_max;
            Response.Write("IV000"+invoice_max);
            SqlCommand cmd1 = new SqlCommand("UPDATE QW_QuoteOverview SET Invoiceno=@x,status=@a,PONumber=@b,InvoiceSendDate=@y WHERE quoteid =@c", con);

            if(qid!=""){
            cmd1.Parameters.Add(new SqlParameter("@a", "Invoice Sent"));
            cmd1.Parameters.Add(new SqlParameter("@b", po));
            cmd1.Parameters.Add(new SqlParameter("@c", Convert.ToInt32(qid)));
            cmd1.Parameters.Add(new SqlParameter("@x", iv));
            cmd1.Parameters.Add(new SqlParameter("@y", DateTime.Now));
                con.Open();
                cmd1.ExecuteNonQuery();
                con.Close();
                SqlCommand cmd2 = new SqlCommand("INSERT INTO QW_QuoteOverviewHistory (comment, comm_addedby, quoteid, comm_date) VALUES (@a,@b,@c,@d)",con);
                cmd2.Parameters.Add(new SqlParameter("@a", quoteStatus));
                cmd2.Parameters.Add(new SqlParameter("@b", user));
                cmd2.Parameters.Add(new SqlParameter("@c", qid));
                cmd2.Parameters.Add(new SqlParameter("@d", DateTime.Now));
                con.Open();
                cmd2.ExecuteNonQuery();
                con.Close();

                Response.Redirect("generateReport.asp?action=Invoice Sent");
                //comment to be updated
            }
        }
    }
}