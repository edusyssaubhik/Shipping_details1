<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_pics.aspx.cs" Inherits="Shipping_details1.User_pics" %>

<!DOCTYPE html>
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Quotewerks</title>
<link href="/QuoteWerks/css/leftNavi.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/form.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/mainContent.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .auto-style3 {
            width: 125px;
        }
    </style>

</head>
<body style="margin-top:0px;font-size:12px;">
<!--[if lte IE 7]><div style="background-color:#FF9; border-bottom:solid 1px #FC0; color:#333; text-align:center; height:20px !important; font-family:Verdana, Geneva, sans-serif; padding-top:6px;display:block; font-size:12px;">Some of UI elements may not work properly in this browser, so kindly upgrade your browser or use other browser</div><![endif]-->


<table border="0" style="border-bottom:1px solid #ccc;" cellspacing="0" cellpadding="0" width="100%" align="center">
  <tr style="background-color:#fbfcf8;">
 
  <td height="100px" colspan="2" align="right" valign="middle" style="border-bottom:#CCC thin solid;">
  <img src="/Quotewerks/images/logotop.png" width="170" height="54"  align="left" style="padding-left:20px"/>
    <p style="padding-right:20px; font-family:Verdana, Geneva, sans-serif; font-size:20px; color:#556018; display:inline">
	Welcome to Datrix QuoteWerks</p><br /><br /><br />
	<span class="welcome_user">Welcome&nbsp; <asp:Label ID="Label143" runat="server" Text=""></asp:Label>| <label id="header"> <a href="/Quotewerks/logout.asp">Logout</a></label>&nbsp; &nbsp;&nbsp;&nbsp;</span>
	</td>
  </tr>

<form id="form2" runat="server">
    <div>
    
        
<tr>
  <td align="left" valign="top" style=" border-right:#CCC thin solid;" class="auto-style3">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftNavigation" >
      
<td width="2%">&nbsp;</td>
<td width="25%" class="general-body">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" >
  
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/home.asp">Home &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    <% 
        String que3 = "";
        try
        {

            que3 = Request.QueryString["que3"].ToString();
        }
        catch (Exception r) { }
          if(que3.Equals("Admin")) 
            {
        %>
    
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/companyDetails.asp">Add Company Details &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/category.asp">Add Item &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/ViewEditcategory.asp">View/Edit Item &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
     <tr>
      <td class="LeftLinks"><a href="/Quotewerks/Category-Items.asp">Create Quote &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
     <tr>
      <td class="LeftLinks"><a href="/Quotewerks/ViewEditQuote.asp">view/Edit Qoute &nbsp;&nbsp;&nbsp;</a></td>
    </tr> 
     <tr>
      <td class="LeftLinks"><a href="/Quotewerks/generateReport.asp">Generate Report &nbsp;&nbsp;&nbsp;</a></td>
    </tr> 
    
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/users.asp">Users &nbsp;&nbsp;&nbsp;</a></td>
    </tr>   
     <% 
     }
     else
         {
         %>
     
        <tr>
      <td class="LeftLinks"><a href="/Quotewerks/companyDetails.asp">Add Company Details &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
   <!-- 
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/category.asp">Add Item &nbsp;&nbsp;&nbsp;</a></td>
    </tr>-->
    
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/ViewEditcategory.asp">View Item &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
     <tr>
      <td class="LeftLinks"><a href="/Quotewerks/Category-Items.asp">Create Quote &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
     <tr>
      <td class="LeftLinks"><a href="/Quotewerks/ViewEditQuote.asp">view/Edit Qoute &nbsp;&nbsp;&nbsp;</a></td>
    </tr> 
     <tr>
      <td class="LeftLinks"><a href="/Quotewerks/generateReport.asp">Generate Report &nbsp;&nbsp;&nbsp;</a></td>
    </tr> 
    
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/users.asp">Account Details &nbsp;&nbsp;&nbsp;</a></td>
    </tr>  
    <%    }
            %>
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/changepassword.asp">Change Password &nbsp;&nbsp;&nbsp;</a></td>
    </tr>   
     <tr>
      <td class="LeftLinks"><a href="/Quotewerks/logout.asp">Log Out &nbsp;&nbsp;&nbsp;</a></td>
    </tr>    
  </table>
</td>


    </table></td>
   <td align="center" valign="top" height="450px">
 
  <div class="myform" id="shipMain">
  

      <br />
      <br />
      <br />
      <table>
          <tr><td>
              <asp:Label ID="Label145" runat="server" Text="Upload User Photo"></asp:Label>
              </td>
              <td> <asp:FileUpload ID="FileUpload1" runat="server" />
                  <br />
                  <br /></td>
          </tr>
          <tr><td>
              <asp:Label ID="Label144" runat="server" Text="Upload Signature image"></asp:Label>
              <br />
              </td>
              <td> <asp:FileUpload ID="FileUpload2" runat="server" /><br /></td>
          </tr>

      </table>
     
      <br />
      <br />
      <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload" Width="80px" />
      <br />
  
      </div></td></tr>
    </form>
</body>
</html>
