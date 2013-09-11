using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO.Compression;
//using Microsoft.Office.Interop.Word;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
using System.Diagnostics;
using System.Text;
using iTextSharp.text.html.simpleparser;
using System.Net;
using System.Drawing;
using System.Windows.Forms;
using System.IO;
using System.Drawing.Imaging;
using System.Drawing;
using System.Threading;

namespace Shipping_details1.QuoteWerks
{
    public partial class create_pdf1 : System.Web.UI.Page
    {
      //  Thumbnail thumbnail = new Thumbnail(html, 800, 600, width, height, Thumbnail.ThumbnailMethod.Html);
        /*public Bitmap GenerateThumbnail()
        {
            Thread thread = new Thread(new ThreadStart(CaptureWebPage));
            thread.SetApartmentState(ApartmentState.STA);
            thread.Start();
            thread.Join();
            return ThumbnailImage;
        }*/
        public System.Drawing.Bitmap CaptureWebPage(string URL)
          {
       // create a hidden web browser, which will navigate to the page
       System.Windows.Forms.WebBrowser web = new System.Windows.Forms.WebBrowser();
       // we don't want scrollbars on our image
       web.ScrollBarsEnabled = false;
       // don't let any errors shine through
       web.ScriptErrorsSuppressed = true;
       // let's load up that page!
       web.Navigate(URL);

       // wait until the page is fully loaded
       while (web.ReadyState != WebBrowserReadyState.Complete)
           System.Windows.Forms.Application.DoEvents();
       System.Threading.Thread.Sleep(1500); // allow time for page scripts to update
       // the appearance of the page

       // set the size of our web browser to be the same size as the page
       int width = web.Document.Body.ScrollRectangle.Width;
       int height = web.Document.Body.ScrollRectangle.Height;
       web.Width = width;
       web.Height = height;
       // a bitmap that we will draw to
       System.Drawing.Bitmap bmp = new System.Drawing.Bitmap(width, height);
       // draw the web browser to the bitmap
       web.DrawToBitmap(bmp, new System.Drawing.Rectangle(0, 0, width, height));

       return bmp; // return the bitmap for processing
   }
   protected void btnConvert_Click()
   {
       Bitmap bitmap = new Bitmap(CaptureWebPage("http://46.183.10.241/Quotewerks/demo-certificate1.html"));
       Response.ContentType = "image/jpeg";
       bitmap.Save(Response.OutputStream, ImageFormat.Jpeg);
       bitmap.Dispose();
       bitmap.Dispose();
       Response.End();
   }
        /* private System.Drawing.Image StreamImageFromNet(string url)
        {
            System.Drawing.Image img = null;
            Stream str = null;

            //System.Console.WriteLine("Retreiving: " + url);

            HttpWebRequest webReq;
            webReq = (HttpWebRequest)HttpWebRequest.Create(url);

            try
            {
                HttpWebResponse webResp = (HttpWebResponse)webReq.GetResponse();
                str = webResp.GetResponseStream();

                img = System.Drawing.Image.FromStream(str);

                //System.Console.WriteLine("That went off
                //without a hitch");
            }
            catch (WebException ex)
            {
                // Do something more important here
                System.Console.WriteLine(ex.Message);
            }
            finally
            {
                if (str != null)
                    str.Close();
            }
            return img;

        }
        */
        protected void Page_Load(object sender, EventArgs e)
        {
   //  System.Drawing.Image d=           StreamImageFromNet("http://46.183.10.241/Quotewerks/demo-certificate1.html");
           // btnConvert_Click();   
    /*        System.Web.HttpResponse Response = System.Web.HttpContext.Current.Response;
            try
            {
                // create an API client instance
                pdfcrowd.Client client = new pdfcrowd.Client("Saubhik", "f66d1cc3e961d75dae6ceaae6733400e");

                // convert a web page and write the generated PDF to a memory stream
                MemoryStream Stream = new MemoryStream();
              //  client.convertFile(Server.MapPath("~/Quotewerks/demo-certificate2.html"),Stream);
                client.convertURI("http://46.183.10.241/Quotewerks/demo-certificate1.html", Stream);
                client.enableImages(true);
                // set HTTP response headers
                Response.Clear();
                Response.AddHeader("Content-Type", "application/pdf");
                Response.AddHeader("Cache-Control", "no-cache");
                Response.AddHeader("Accept-Ranges", "none");
                Response.AddHeader("Content-Disposition", "attachment; filename=file1.pdf");

                // send the generated PDF
                Stream.WriteTo(Response.OutputStream);
                Stream.Close();
                Response.Flush();
                Response.End();
            }
            catch (pdfcrowd.Error why)
            {
                Response.Write(why.ToString());
            }

            */


           // Bitmap thumbnail = GenerateScreenshot("http://pietschsoft.com", 1024, 768);

            // Generate thumbnail of a webpage at the webpage's full size (height and width)
            //thumbnail = GenerateScreenshot("http://pietschsoft.com");
            //humbnail.Save("C:\\1.jpg");
            // Display Thumbnail in PictureBox control
            // pictureBox1.Image = thumbnail;

            /*
            // Save Thumbnail to a File
            thumbnail.Save("thumbnail.png", System.Drawing.Imaging.ImageFormat.Png);
            */
                //        saveURLToImage("http://localhost:49170/QuoteWerks/demo-certificate2.html");
                   Document doc = new Document(PageSize.LETTER);
                   string path = Server.MapPath("~/Quotewerks/pdf_product/sample_certificate8.pdf");
                   StreamReader dr = new StreamReader(Server.MapPath("~/Quotewerks/ITIL1.html"), Encoding.Default);
                  
                   try
                   {
                      string p = Server.MapPath("~/");
                       var props = new Dictionary<string, object>();
                      // string pic = Server.MapPath("~/logo.jpg");

 
                      // string htmltext = "<div>I am here</div>ghhkugbkuh<img src='" + pic + "' name='dd'/>";
                       // HtmlTextWriter d=new HtmlTextWriter();
                       PdfWriter.GetInstance(doc, new FileStream(path, FileMode.Create));
                       doc.Open();
                       //doc.NewPage();
           

                
                
                        //doc.OpenDocument();
                    //   List<IElement> htmlarrlist = null;

                       string s = "<img src='D:/new file_Quotewerks/Shipping_details1/Thumbnail1.png' width='800px' ></img>";// dr.ReadToEnd();

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
                      dr.Close();

                   }
                   
                   catch (Exception g)
                   {
                       //error
                       doc.Close(); 
                       dr.Close();
                   }

                   var fileInfo = new System.IO.FileInfo(path);
                   //con.Close();          
                   Response.ContentType = "application/octet-stream";
                   Response.AddHeader("Content-Disposition", String.Format("attachment;filename=\"{0}\"", "sampley.pdf"));
                   Response.AddHeader("Content-Length", fileInfo.Length.ToString());
                   Response.WriteFile(path);
                   Response.End();
                 
            

        }
        public Bitmap GenerateScreenshot(string url)
        {
            // This method gets a screenshot of the webpage
            // rendered at its full size (height and width)
            return GenerateScreenshot(url, -1, -1);
        }

        public Bitmap GenerateScreenshot(string url, int width, int height)
        {
            // Load the webpage into a WebBrowser control
            WebBrowser wb = new WebBrowser();
            wb.ScrollBarsEnabled = false;
            wb.ScriptErrorsSuppressed = true;
            wb.Navigate(url);
            while (wb.ReadyState != WebBrowserReadyState.Complete) {// Application.DoEvents(); 
            }


            // Set the size of the WebBrowser control
            wb.Width = width;
            wb.Height = height;

            if (width == -1)
            {
                // Take Screenshot of the web pages full width
                wb.Width = wb.Document.Body.ScrollRectangle.Width;
            }

            if (height == -1)
            {
                // Take Screenshot of the web pages full height
                wb.Height = wb.Document.Body.ScrollRectangle.Height;
            }

            // Get a Bitmap representation of the webpage as it's rendered in the WebBrowser control
            Bitmap bitmap = new Bitmap(wb.Width, wb.Height);
            wb.DrawToBitmap(bitmap, new System.Drawing.Rectangle(0, 0, wb.Width, wb.Height));
            wb.Dispose();

            return bitmap;
        }

        public void saveURLToImage(string url)
        {
            if (!string.IsNullOrEmpty(url))
            {
                string content = "";


                System.Net.WebRequest webRequest = WebRequest.Create(url);
                System.Net.WebResponse webResponse = webRequest.GetResponse();
                System.IO.StreamReader sr = new StreamReader(webResponse.GetResponseStream(), System.Text.Encoding.GetEncoding("UTF-8"));
                content = sr.ReadToEnd();
                //save to file
             //   string converted = content.Replace('-', '+');
               // converted = converted.Replace('_', '/');
                //byte[] b = Encoding.ASCII.GetBytes(content); ;//.FromBase64String(content);
                byte[] b = Convert.FromBase64String(content);
           
                System.IO.MemoryStream ms = new System.IO.MemoryStream(b);
                ms.Seek(0, SeekOrigin.Begin);
                Bitmap bmp = new Bitmap(ms);
                bmp.Save(@"d:\pic.jpg", System.Drawing.Imaging.ImageFormat.Jpeg);
                //System.Drawing.Image img = System.Drawing.Image.FromStream(ms);
               // img.Save(@"d:\pic.jpg", System.Drawing.Imaging.ImageFormat.Jpeg);

             //   bmp.close();
               // img.Dispose();
                ms.Close();
            }
        }
        }
    }
