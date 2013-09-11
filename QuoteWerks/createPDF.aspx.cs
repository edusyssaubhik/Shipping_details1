using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
 using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Diagnostics;
using iTextSharp.text.html.simpleparser;
using System.Windows.Forms;
using System.Threading;

namespace Shipping_details1.QuoteWerks
{
    public partial class createPDF : System.Web.UI.Page
    {

        bool snap = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
//                make_pdf();
                string file = Request.QueryString["file"];

                create_pdf(Server.MapPath("~") + "/backoffice/images/" + file + ".png", file);
                //  writer.Write(html);
                Response.Redirect("/Quotewerks/show_pdf.asp?name=" + file + ".pdf");
                
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
            // Thumbnail.ThumbnailMethod.Url = URL;

            Thumbnail1 thumbnail = new Thumbnail1(URL, 1089, 860, width, height, Thumbnail1.ThumbnailMethod.Url);
            Bitmap image = thumbnail.GenerateThumbnail();
            image.Save(Server.MapPath("~") + "/backoffice/images/" + file + ".png", System.Drawing.Imaging.ImageFormat.Png);

            create_pdf(Server.MapPath("~") + "/backoffice/images/" + file + ".png", file);
            //  writer.Write(html);
            Response.Redirect("/Quotewerks/show_pdf.asp?name=" + file + ".pdf");

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
            StreamReader dr = new StreamReader(Server.MapPath("~/backoffice/html/621.html"), Encoding.Default);

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
                string s = dr.ReadToEnd();
///                string s = "<img src='" + image + "' width='800px' ></img>";// dr.ReadToEnd();

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


    public class Thumbnail1
    {
        public enum ThumbnailMethod { Url, Html };
        public string Url { get; set; }
        public Bitmap ThumbnailImage { get; set; }
        public int Width { get; set; }
        public int Height { get; set; }
        public int BrowserWidth { get; set; }
        public int BrowserHeight { get; set; }
        public string Html { get; set; }
        public ThumbnailMethod Method { get; set; }

        public Thumbnail1(string data, int browserWidth, int browserHeight, int thumbnailWidth, int thumbnailHeight, ThumbnailMethod method)
        {
            this.Method = method;
            if (method == ThumbnailMethod.Url)
                this.Url = data;

            else if (method == ThumbnailMethod.Html)
                this.Html = data;
            this.BrowserWidth = 1089;// ;// browserWidth;
            this.BrowserHeight = 860;// browserHeight;

            this.Height = 2552;// thumbnailHeight;
            this.Width = 3302;// thumbnailWidth;
        }
        public Bitmap GenerateThumbnail()
        {
            Thread thread = new Thread(new ThreadStart(CaptureWebPage));//change the method
            thread.SetApartmentState(ApartmentState.STA);
            thread.Start();
            thread.Join();
            return ThumbnailImage;
        }

        public void CaptureWebPage()
        {

            // create a hidden web browser, which will navigate to the page
            System.Windows.Forms.WebBrowser web = new System.Windows.Forms.WebBrowser();
            web.Width = 1089;
            web.Height = 10;
            // we don't want scrollbars on our image
            web.ScrollBarsEnabled = false;
            // don't let any errors shine through
            web.ScriptErrorsSuppressed = true;
            // let's load up that page!
            if (this.Method == ThumbnailMethod.Url)
            {
                web.Navigate(this.Url);
                // web.Show();
            }
            else web.DocumentText = this.Html;
            web.DocumentCompleted += new WebBrowserDocumentCompletedEventHandler(WebBrowser_DocumentCompleted);
            while (web.ReadyState != WebBrowserReadyState.Complete) Application.DoEvents();
            // web.Dispose();

            // wait until the page is fully loaded
            //     while (web.ReadyState != WebBrowserReadyState.Complete)
            //       System.Windows.Forms.Application.DoEvents();
            //  System.Threading.Thread.Sleep(1500); // allow time for page scripts to update
            // the appearance of the page

            // set the size of our web browser to be the same size as the page
            //int width = web.Document.Body.ScrollRectangle.Width;
            //int height = web.Document.Body.ScrollRectangle.Height;
            //web.Width = width;
            //web.Height = height;
            // a bitmap that we will draw to
            //System.Drawing.Bitmap bmp = new System.Drawing.Bitmap(width, height);
            // draw the web browser to the bitmap
            //web.DrawToBitmap(bmp, new System.Drawing.Rectangle(0, 0, width, height));
            //Bitmap bitmap = new Bitmap(CaptureWebPage("http://46.183.10.241/Quotewerks/demo-certificate1.html"));
            //Response.ContentType = "image/jpeg";
            ///bitmap.Save(Response.OutputStream, ImageFormat.Jpeg);
            //bitmap.Dispose();
            //bitmap.Dispose();
            //Response.End();
            //return bmp; // return the bitmap for processing
            web.Dispose();
        }

        private void WebBrowser_DocumentCompleted(object sender, WebBrowserDocumentCompletedEventArgs e)
        {
            const int dotsPerInch = 700;    // define the quality in DPI
            const double widthInInch = 6;   // width of the bitmap in INCH
            const double heightInInch = 1;  // height of the bitmap in INCH
            WebBrowser webBrowser = (WebBrowser)sender;
            webBrowser.ClientSize = new Size(this.BrowserWidth, this.BrowserHeight);
            // webBrowser.ClientSize = new Size(  (int)(widthInInch * dotsPerInch), (int)(heightInInch * dotsPerInch));
            webBrowser.ScrollBarsEnabled = true;
            this.ThumbnailImage = new Bitmap(webBrowser.Bounds.Width, webBrowser.Bounds.Height);
            //   this.ThumbnailImage = new Bitmap( (int)(widthInInch * dotsPerInch), (int)(heightInInch * dotsPerInch) );
            this.ThumbnailImage.SetResolution(dotsPerInch, dotsPerInch);
            webBrowser.BringToFront();
            webBrowser.DrawToBitmap(ThumbnailImage, webBrowser.Bounds);
            this.ThumbnailImage = (Bitmap)ThumbnailImage.GetThumbnailImage(Width, Height, null, IntPtr.Zero);
        }
        /* private void GenerateThumbnailInteral()
        {
            WebBrowser webBrowser = new WebBrowser();
            webBrowser.ScrollBarsEnabled = false;
            if (this.Method == ThumbnailMethod.Url)
                webBrowser.Navigate(this.Url);
            else webBrowser.DocumentText = this.Html;
            webBrowser.DocumentCompleted += new WebBrowserDocumentCompletedEventHandler(WebBrowser_DocumentCompleted);
            while (webBrowser.ReadyState != WebBrowserReadyState.Complete) Application.DoEvents();
            webBrowser.Dispose();
        }*/
    }

}