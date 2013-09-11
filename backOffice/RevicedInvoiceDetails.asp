<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<!--#include virtual="/includes/connection.asp"-->


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Invoice Details</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body class="popupbody">
<div style="margin-top:30px;">


<%
'Declare The Variables'
Dim strQueryVenue
Dim rqCourseID 
Dim rsVenueDetails

Set rsinvoiceDetails = Server.CreateObject("ADODB.Recordset")

Sno = 0

'Retrive The CourseID Using QueryString From dates_location.asp Page'
rqenrollUserId = Request.QueryString("enrollUserId")

strQueryVenue = "SELECT * FROM reviced_invoice_details WHERE enrollid = '"& rqenrollUserId &"'"

rsinvoiceDetails.Open strQueryVenue,ConnObj


If Not rsinvoiceDetails.EOF Then
%>



   <table border="0" width="100%" class="btext">
    <tr>
      <td><b>Invoice Details</b></td>
	  </tr>
	  <tr>
      <td>&nbsp;</td>
	  </tr>
	  <tr><td>	  
	  <table  align="center" border="1" cellpadding="0" cellspacing="0">
	  
	  <tr>
	  <th width="10%">Sno</th>
	  <th width="20%">EnrollID</th>
	  <th width="35%">Reviced By</th>
	  <th width="35%">Reviced Date</th>
	  </tr>
	  
          <% Do Until rsinvoiceDetails.EOF  %>
		  
		  <% Sno = Sno + 1 %>
		  <tr>
          	<td><% = Sno %></td>
			<td><% = rsinvoiceDetails("enrollid") %></td>
			<td><% = rsinvoiceDetails("invoice_sentby") %></td>
			<td><% = rsinvoiceDetails("invoice_sentdate") %></td>
    </tr>
    <% rsinvoiceDetails.Movenext
     Loop
	 rsinvoiceDetails.Close
	 Set rsinvoiceDetails = Nothing
	 ConnObj.Close
	 Set ConnObj = Nothing  %>
  </table>
<% Else %>
No revised invoice details
<% End if %>  
</div>
</body>
</html>


