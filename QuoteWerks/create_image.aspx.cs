using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Shipping_details1.QuoteWerks
{
    public partial class create_image : System.Web.UI.Page
    {
        bool snap = false;
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

             protected void CreateThumbnailImage(object sender, EventArgs e)
             {
    
                   snap = true;
             }
    protected override void Render(HtmlTextWriter writer)
    {
        if (snap)
        {
            int width = Int32.Parse(txtWidth.Text);
            int height = Int32.Parse(txtHeight.Text);
            StringBuilder builder = new StringBuilder();
            HtmlTextWriter htw = new HtmlTextWriter(new StringWriter(builder));
            base.Render(htw);
            string html = builder.ToString();
            Thumbnail.Thumbnail thumbnail = new Thumbnail.Thumbnail(html, 800, 600, width, height, Thumbnail.Thumbnail.ThumbnailMethod.Html);
            Bitmap image = thumbnail.GenerateThumbnail();
            image.Save(Server.MapPath("~") + "/Thumbnail1.png");                
            writer.Write(html);
            writer.Write("<img src=\"Thumbnail1.jpg\" />");
        }
        else
            base.Render(writer);
    }
}

}
