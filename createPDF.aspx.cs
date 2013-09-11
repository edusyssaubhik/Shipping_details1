using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Thumbnail;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Diagnostics;
using iTextSharp.text.html.simpleparser;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shipping_details1.QuoteWerks
{
    public partial class createPDF : System.Web.UI.Page
    {
        bool snap = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                make_pdf();

            }
        }
        public void make_pdf()
        {
            string file = Request.QueryString["file"];
            int width = 792; //Int32.Parse(200);
            int height = 612;//Int32.Parse(200);
            StringBuilder builder = new StringBuilder();
            HtmlTextWriter htw = new HtmlTextWriter(new StringWriter(builder));
            base.Render(htw);
            string html = builder.ToString();
            //send the URL
            string URL = "localhost:49170/backoffice/html/" + file + ".html"; ;
            Thumbnail.Thumbnail thumbnail = new Thumbnail.Thumbnail(URL, 1089, 860, width, height, Thumbnail.Thumbnail.ThumbnailMethod.Url);
            Bitmap image = thumbnail.GenerateThumbnail();
            image.Save(Server.MapPath("~") + "/backoffice/images/" + file + ".png", System.Drawing.Imaging.ImageFormat.Png);

            create_pdf(Server.MapPath("~") + "/backoffice/images/" + file + ".png", file);
            //  writer.Write(html);
            Response.Redirect("show_pdf.asp?name=" + file + ".pdf");

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
                string URL = "localhost:49170/backoffice/html/" + file + ".html"; ;
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
            Document doc = new Document(PageSize.LETTER, 0, 0, 0, 0);
            string path = Server.MapPath("~/backoffice/pdf/" + name + ".pdf");
            // StreamReader dr = new StreamReader(Server.MapPath("~/Quotewerks/ITIL1.html"), Encoding.Default);

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

                string s = "<img src='" + image + "' width='800px' ></img>";// dr.ReadToEnd();

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
    }
}