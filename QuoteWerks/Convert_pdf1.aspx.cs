using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Thumbnail;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Diagnostics;
using iTextSharp.text.html.simpleparser;

public partial class Convert_pdf1 : System.Web.UI.Page
{
    bool snap = false;
    public string file;
    public string action, quoteid, user;
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
         
            action=Convert.ToString(Request.QueryString["action"]);
            quoteid = Convert.ToString(Request.QueryString["id"]);
            user = Convert.ToString(Request.QueryString["req"]);

        //    action=View_IS&id=142&req=Ayan
            //call Make_image() to create image
            Make_image(action, quoteid, user);
        }
    }

    public void Make_image(string action,string quoteid,string user)
    {
       // string file = Request.QueryString["file"];
      //  string custid = Request.QueryString["custId"];
        //string invoiceno = Request.QueryString["invoiceno"];
   //     file =custid +"_"+ Request.QueryString["d"];
        file = quoteid+"_"+action;
        int width = 792; //Int32.Parse(200);
        int height = 612;//Int32.Parse(200);
        StringBuilder builder = new StringBuilder();
        HtmlTextWriter htw = new HtmlTextWriter(new StringWriter(builder));
        //base.Render(htw);
        string html = builder.ToString();
        //send the URL
       // string URL = "http://www.projstudy.com/onlineCoursesBO/html/" + file + ".html";
      //  string URL = "http://localhost:82/onlineCoursesBO/html/" + file + ".html"; ;
    //    string URL = "http://www.vmedu.com/onlinecoursesBO/showTransaction.asp?invoiceno="+invoiceno+"&CustID="+custid;
        string URL = "http://46.183.10.241/Quotewerks/viewquotepdf.asp?action=" + action + "&id=" + quoteid + "&req=" + user;
     //   string URL = "http://localhost:49170/Quotewerks/viewquotepdf.asp?action=" + action + "&id=" + quoteid + "&req=" + user;
       
        Thumbnail.Thumbnail thumbnail = new Thumbnail.Thumbnail(URL, 1089, 860, width, height, Thumbnail.Thumbnail.ThumbnailMethod.Url);
        Bitmap image = thumbnail.GenerateThumbnail();
        image.Save(Server.MapPath("~") + "/QuoteWerks/CerImages/" + file + ".png", System.Drawing.Imaging.ImageFormat.Png);
        //call create_pdf to create the pdf
        create_pdf(Server.MapPath("~") + "/QuoteWerks/CerImages/" + file + ".png", file);
//        Response.Redirect("/Quotewerks/show_pdf.asp?name=" + file + ".pdf");
           
    }
    
    /*protected override void Render(HtmlTextWriter writer)
    {
        if (snap)
        {
            string file = Request.QueryString["file"];
            int width = 792; //Int32.Parse(200);
            int height = 612;//Int32.Parse(200);
            StringBuilder builder = new StringBuilder();
            HtmlTextWriter htw = new HtmlTextWriter(new StringWriter(builder));
            base.Render(htw);
            string html = builder.ToString();
            //send the URL
            string URL = "http://localhost:49170/onlineCoursesBO/html/" + file + ".html"; 
            //string URL = "http://localhost:58491/" + file + ".html"; ;
            Thumbnail.Thumbnail thumbnail = new Thumbnail.Thumbnail(URL, 1089, 860, width, height, Thumbnail.Thumbnail.ThumbnailMethod.Url);
            Bitmap image = thumbnail.GenerateThumbnail();
            image.Save(Server.MapPath("~") + "/images/" + file + ".png", System.Drawing.Imaging.ImageFormat.Png);

            create_pdf(Server.MapPath("~") + "/images/" + file + ".png", file);
            writer.Write(html);
            Response.Redirect("show_pdf.asp?name=" + file + ".pdf");
            // writer.Write("<img src=\"Thumbnail1.jpg\" />");
        }
        else
            base.Render(writer);
    }*/

    public void create_pdf(string image, string name)
    {
     //   Document doc = new Document(PageSize.LETTER.Rotate(), 0f, 0f, 0f, 0f);
        //doc.SetPageSize(new iTextSharp.text.Rectangle(791.87f, 629.1f));//888 888 615f,797f, 629.24
     
        Document doc = new Document(PageSize.LETTER.Rotate(),0,0,0,0);
        doc.SetPageSize(new iTextSharp.text.Rectangle(791.87f, 629.1f));//888 888 615f,797f, 629.24
     
        string path = Server.MapPath("~/Quotewerks/Cerpdf/" + name + ".pdf");
      //   StreamReader dr = new StreamReader(Server.MapPath("~/621.html"), Encoding.Default);
        // StreamReader dr = new StreamReader("C://Quotewerks/ITIL1.html"), Encoding.Default);

        try
        {
            //            string p = Server.MapPath("~/");
            //          var props = new Dictionary<string, object>();
            // string pic = Server.MapPath("~/logo.jpg");


            // string htmltext = "<div>I am here</div>ghhkugbkuh<img src='" + pic + "' name='dd'/>";
            // HtmlTextWriter d=new HtmlTextWriter();
            PdfWriter.GetInstance(doc, new FileStream(path, FileMode.Create));
            doc.Open();
            //doc.NewPage();




            //doc.OpenDocument();
            //   List<IElement> htmlarrlist = null;

            string s = "<img src='" + image + "'></img>";// dr.ReadToEnd();
        //    string s = dr.ReadToEnd();
            StringReader dd = new StringReader(s);
            iTextSharp.text.html.simpleparser.HTMLWorker obj = new iTextSharp.text.html.simpleparser.HTMLWorker(doc);

            obj.Parse(dd);

            //   doc.OpenDocument();
            /*  htmlarrlist = iTextSharp.text.html.simpleparser.HTMLWorker.ParseToList(new StringReader(s),null);
                htmlarrlist =iTextSharp.text.html.simpleparser.HTMLWorker.ParseToList(dr, null);

                 for (int k = 0; k < htmlarrlist.Count; k++)
                  {
                      doc.Add((IElement)htmlarrlist[k]);
                  }*/
            doc.Close();
            //   dr.Close();

        }

        catch (Exception g)
        {
            //error
            doc.Close();
            //  dr.Close();
        }

        /*    var fileInfo = new System.IO.FileInfo(path);
            //con.Close();          
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", String.Format("attachment;filename=\"{0}\"", "sample_certificate.pdf"));
            Response.AddHeader("Content-Length", fileInfo.Length.ToString());
            Response.WriteFile(path);
            Response.End();
                     */

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        snap = true;
    }
}