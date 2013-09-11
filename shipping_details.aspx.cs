using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace Shipping_details1
{
    public partial class shipping_details : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=UpIwnfBKPP2aNv9a;DATABASE=apmgstudy");
        protected void Page_Load(object sender, EventArgs e)
        {
            
        if (!IsPostBack)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT compId,CompName FROM QW_Company", con);
            cmd.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            DropDownList1.DataSource = ds;
            DropDownList1.DataTextField = "CompName";
            DropDownList1.DataValueField = "compId";
            DropDownList1.DataBind();
            con.Close();
        
         }
            
        }
        public void fill_comp_address(string x)
        {
            con.Open();
          
            SqlCommand cmd = new SqlCommand("SELECT CompAddress FROM QW_CompAddress where compId =@a", con);
          
            cmd.Parameters.Add(new SqlParameter("@a", DropDownList1.SelectedItem.Value));

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            DropDownList17.DataSource = dt;
            DropDownList17.DataTextField = "CompAddress";
            DropDownList17.DataValueField = "CompAddress";
            DropDownList17.DataBind();

            con.Close();

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            TextBox1.Text = DropDownList1.SelectedItem.Text;
            fill_comp_address(DropDownList1.SelectedItem.Value);
/*
            DataSet ds = new DataSet();
       */
            Response.Write(DropDownList1.SelectedItem.Text);
           

        }

        public void abc()
        {
         /*   if (((LinkButton)GridView1.Rows[0].Cells[0].Controls[0]).Text == "insert")
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into emp(emp_id,emp_name,emp_location) values(@id,@name,@location)", con);
            cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            cmd.Parameters.Add("@location", SqlDbType.VarChar).Value = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            cmd.ExecuteNonQuery();
            con.Close();
        }
        else
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update emp set emp_name=@name,emp_location=@location where emp_id=@emp_id", con);
            cmd.Parameters.Add("name", SqlDbType.VarChar).Value = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            cmd.Parameters.Add("location", SqlDbType.VarChar).Value = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            cmd.Parameters.Add("emp_id", SqlDbType.VarChar).Value = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[1].Controls[0])).Text;
            cmd.ExecuteNonQuery();
            con.Close();
        }*/
    
        
        
        }

        protected void CheckBox3_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList15_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void DropDownList17_SelectedIndexChanged(object sender, EventArgs e)
        {
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT contName FROM QW_CompContactDet where compId=@a", con);

            cmd.Parameters.Add(new SqlParameter("@a", DropDownList1.SelectedItem.Value));

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            DropDownList3.DataSource = dt;
            DropDownList3.DataTextField = "contName";
            DropDownList3.DataValueField = "contName";
            DropDownList3.DataBind();

            con.Close();
        }
        }
    }
