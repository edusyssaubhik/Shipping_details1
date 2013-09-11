<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="create_image.aspx.cs" Inherits="Shipping_details1.QuoteWerks.create_image" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
 
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txtWebsiteAddress" runat="server" Text="www.google.com" /> 
        <asp:Button ID="btnCreateThumbnailImage" runat="server" 
            Text="Create Thumbnail Image" OnClick="CreateThumbnailImage" /></td>
        <asp:TextBox ID="txtWidth" runat="server" Text="200" />
        <asp:TextBox ID="txtHeight" runat="server" Text="200" />
        <asp:Image ID="imgThumbnailImage" runat="server" Visible="false" />
    </div>
    </form>

</body>
</html>
