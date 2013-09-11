using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shipping_details1.QuoteWerks
{
    public partial class User_upload : System.Web.UI.Page
    {
          public string upload_image1,upload_image2,action,path1,path2;
        SqlConnection con=null;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection("DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=fIw4VdokuY2Lb0;DATABASE=apmgstudy");
            
            upload_image1=Request.QueryString["id"];
            
            action = Request.QueryString["action"];
           
        }

        
        public string get_userid(string id)  // get information from previous quoteID
        {
            con = new SqlConnection("DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=fIw4VdokuY2Lb0;DATABASE=apmgstudy");

            SqlDataReader dr = null;
            string userid = "";
            con.Open();
            try
            {

                SqlCommand cmd = new SqlCommand("select userid from users where id=@a", con);
                cmd.Parameters.Add(new SqlParameter("@a", Int32.Parse(id)));

                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    userid = dr[0].ToString();
                }
            }
            catch (Exception f)
            {
                Response.Write("error found " + f.Message);
            }
            con.Close();
            return userid;
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            string userid="";
            if (FileUpload1.PostedFile.ContentLength > 0 || FileUpload2.PostedFile.ContentLength > 0)
            {
            con = new SqlConnection("DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=fIw4VdokuY2Lb0;DATABASE=apmgstudy");
                if(action.Equals("V1"))
                {
                    userid=upload_image1;
                path1 = Server.MapPath("~/Quotewerks/UserImage/" + userid+"/"+userid+"_image.jpg");
                path2 = Server.MapPath("~/Quotewerks/UserSign/" + userid+"/"+userid+"_sign.jpg");
               
                }
                if(action.Equals("V2")){
               userid= get_userid(upload_image1);
                path1 = Server.MapPath("~/Quotewerks/UserImage/" + userid+"/"+userid+"_image.jpg");
             
                    path2= Server.MapPath("~/Quotewerks/UserSign/" + userid+"/"+userid+"_sign.jpg");
         
         }
                if (action.Equals("V1"))
               {
                   if (File.Exists(path1))
                   {
                       if (FileUpload1.PostedFile.ContentLength > 0)
                           FileUpload1.SaveAs(path1);
                   }
                   else
                   {
                       if (FileUpload1.PostedFile.ContentLength > 0)
                       {
                           Directory.CreateDirectory(Server.MapPath(@"~/QuoteWerks/UserImage/" + userid));
                           // File.Create(path1);
                           FileUpload1.SaveAs(path1);
                       }
                   }
                    if (File.Exists(path2))
                {
                    if (FileUpload2.PostedFile.ContentLength > 0)
                        FileUpload2.SaveAs(path2);
                }
                else
                {
                 //   Directory.CreateDirectory(Server.MapPath("~/Quotewerks/UserSign/" + userid + "/"));

                    Directory.CreateDirectory(Server.MapPath("~/QuoteWerks/UserSign/" + userid ));
                  
                     //   File.Create(path2);
                    if (FileUpload2.PostedFile.ContentLength > 0)
                    
                    FileUpload2.SaveAs(path2);
                }
                    // update sql to user
             //       con.Open();
                    if (FileUpload1.PostedFile.ContentLength > 0 && FileUpload2.PostedFile.ContentLength > 0)
                    {
                        SqlCommand cmd3 = new SqlCommand("update users set UserImage=@a,UserSign=@b where userid=@c", con);
                        cmd3.Parameters.Add(new SqlParameter("@a", "UserImage/" + userid + "/" + userid + "_image.jpg"));
                        cmd3.Parameters.Add(new SqlParameter("@b", "UserSign/" + userid + "/" + userid + "_sign.jpg"));
                        cmd3.Parameters.Add(new SqlParameter("@c", userid));
                        con.Open();
                        cmd3.ExecuteNonQuery();
                        con.Close();
                        cmd3.Dispose();
                        Response.Redirect("users.asp");

                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please upload images properly')</script>");
             
                    }
                }
            
            
            else if(action.Equals("V2"))
            {
                if (File.Exists(path1))
                {
                    if (FileUpload1.PostedFile.ContentLength > 0)

                        FileUpload1.SaveAs(path1);
                }
                else
                {
                    if (FileUpload1.PostedFile.ContentLength > 0)
                    {
                        Directory.CreateDirectory(Server.MapPath(@"~/QuoteWerks/UserImage/" + userid));
                        // File.Create(path1);
                        FileUpload1.SaveAs(path1);
                    }
                }
                if (File.Exists(path2))
                {
                    if (FileUpload2.PostedFile.ContentLength > 0)

                        FileUpload2.SaveAs(path2);
                }
                else
                {
                    //   Directory.CreateDirectory(Server.MapPath("~/Quotewerks/UserSign/" + userid + "/"));
                    if (FileUpload2.PostedFile.ContentLength > 0)
                    {
                        Directory.CreateDirectory(Server.MapPath("~/QuoteWerks/UserSign/" + userid));

                        //   File.Create(path2);
                        FileUpload2.SaveAs(path2);
                    }
                }
                SqlCommand cmd3 = new SqlCommand("update users set UserImage=@a,UserSign=@b where userid=@c", con);
      cmd3.Parameters.Add(new SqlParameter("@a", "UserImage/" + userid+"/"+userid+"_image.jpg"));
      cmd3.Parameters.Add(new SqlParameter("@b", "UserSign/" + userid+"/"+userid+"_sign.jpg"));
      cmd3.Parameters.Add(new SqlParameter("@c", userid));
      con.Open();
      cmd3.ExecuteNonQuery();
      con.Close();
      cmd3.Dispose();
      Response.Redirect("users.asp"); 
   
            }
              
            }
            else{
                           Page.ClientScript.RegisterStartupScript(this.GetType(), "hello", "<script>alert('Please upload images properly')</script>");
             
            }
              }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("users.asp");
        }
        }
    }

