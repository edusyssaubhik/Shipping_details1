   <!--#include virtual="/QuoteWerks/includes/connection.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<% 
'If not Session("userName") then redirect to  login page'
	If Session("QWUserName") = "" Then 
		Response.Redirect("default.asp")
	Else
	
%>
<%
'======================================================='
'Written By : savita'
'Created Date : 28/02/2013'
'Description :'
'This page is for generating the quote '
'======================================================='
%>
<%
'Declaring variables
Dim rqAction ,rqCountry,rqWebsite,quoteno
Dim rqId,arrAllcountries,objRs2,objRs3,objRs4
Dim arrAllEmpDet, firstRow, lastRow, numRows, rqRow, rqPage
Dim message,strquery1
Dim hb_website

message = Session("message")
Session("message") = ""
   
'Creating the Recordset objects'
SET objRs1 = Server.CreateObject("ADODB.Recordset")
SET objRs2 = Server.CreateObject("ADODB.Recordset")
	
'Retrive the values from this page'
rqAction = Request.QueryString("action")
rqRow  = Request.QueryString("row")
rqPage = Request.QueryString("page")

'updating query with status omplete'
strEmpDet= "UPDATE QW_QuoteOverview  SET "
		  strEmpDet= strEmpDet& "sentDate = '"& now() &"',"
		  strEmpDet= strEmpDet& "status = 'Qoute Sent'"
		  strEmpDet= strEmpDet& " WHERE quoteId = '"& Session("quote") &"'"
					
ConnObj.Execute strEmpDet

strEmpDet1= "UPDATE QW_QuoteDetails  SET "
		  strEmpDet1= strEmpDet1& "addedDate = '"& now() &"',"
		  strEmpDet1= strEmpDet1& "status = 'Quote Sent'"
		  strEmpDet1= strEmpDet1& " WHERE quoteId = '"& Session("quote") &"'"
					
ConnObj.Execute strEmpDet1

										  

if Session("quote") <>"" then
strEmpDet = "SELECT * FROM QW_QuoteOverview  where userId = '"&Session("QWUserName")&"' and quoteId = '"&Session("quote")&"' "

strEmpDet1 = "SELECT * FROM QW_QuoteDetails where quoteId = '"&Session("quote")&"' Order By orderid desc "

else
strEmpDet ="select top 1 * from QW_QuoteOverview  where  userId = '"&Session("QWUserName")&"' Order By quoteId desc"

strEmpDet1 = "SELECT * FROM QW_QuoteDetails a where a.quoteId =(select top 1 b.quoteId from QW_QuoteOverview b  where  b.userId = '"&Session("QWUserName")&"' Order By b.quoteId desc) Order By orderid desc "

'response.Write(strEmpDet)
end if
objRs2.Open strEmpDet, ConnObj

  Do Until objRs2.EOF
      quoteno=objRs2("quoteno")

	  		quoteid=objRs2("quoteId") 
          rqtotalAmount = objRs2("totalAmount") 
		  rqtax = objRs2("tax")
		  rqtotalsellingPrice = objRs2("totalsellingPrice")
		  rqtotalActualPrice =objRs2("totalActualPrice")
          rqtotalDiscount=objRs2("totalDiscount")
          objRs2.Movenext
		   Loop
		   objRs2.Close 


strEmpDet = "SELECT * FROM QW_Users where userId = '"&Session("QWUserName")&"' "

'response.Write(strEmpDet)
objRs2.Open strEmpDet, ConnObj

  Do Until objRs2.EOF 

          rqfirstname = objRs2("firstname") 
		  rqlastname = objRs2("lastname")
		  rqphoneno = objRs2("phoneno")
		  rqofficialemailid = objRs2("officialemailid") 
          
          objRs2.Movenext
		   Loop
		   objRs2.Close 

'strEmpDet = "SELECT * FROM QW_QuoteDetails where quoteId = '"&Session("quote")&"' Order By orderid desc "
'strEmpDet = "SELECT * FROM QW_QuoteDetails where quoteId = '1' Order By orderid desc "

'response.Write(strEmpDet)
objRs1.Open strEmpDet1, ConnObj

 If Not objRs1.EOF Then
	   arrAllUsers = objRs1.getrows
	  cnt = 1
     End If

objRs1.Close
'getting values for pagination
If cnt = 1 Then

 If Request.QueryString("page") = "" Then
	 iPageCurrent = 1
	  	
	numRows = Ubound(arrAllUsers,2)
 firstRow = 0  
	 If numRows > 9 Then
	    lastRow = 9  
	 Else
	 	lastRow = numRows
	 End If 
	
	
	Else
	
	 numRows = Ubound(arrAllUsers,2)
	
	iPageCurrent = Request.QueryString("page") 
    firstRow = ((10 * iPageCurrent)-10) 
     lastRow = firstRow + 9 

    If lastRow > numRows Then
    lastRow = numRows
   End If

    If firstRow < 0 Then
       firstRow = 0
    End If

 End if
 End If
 
 
 Set Rs8 = Server.CreateObject("ADODB.Recordset")
            
          dim city,st,ed,currency1,id1,date1,cus_no
        str87="select * from QW_CountryDetail where countryId="&Session("country")&""
       ' response.Write(str87)
           Rs8.Open str87,ConnObj
            If Not Rs8.EOF Then
           currency1=Rs8("currency")
            end if
            Rs8.Close

%>
<link rel="stylesheet" type="text/css" href="/QuoteWerks/css/Styles.css">
</head>
<!-- Body Starts -->


<body style="margin-top:0px">
<%

'Email Template for generating quote
Dim strBody

strBody = "<table width=""600px"" border=""0""><tr height=""30px""><td><font face=""Arial"" size=2>Dear "&Session("sold_name1")&",<BR><BR>Greetings from Datrix Training! <BR><BR>Please find below the quotation as requested by you. <BR><BR></td></tr></table><table width=""600px"" border=""0"" style=""border:1px solid #ccc;"" cellspacing=""0"" cellpadding=""0"" ><tr><td align=""center"" valign=""top""><div style=""width: 898px; height: 600px; background-color: #fff; margin: 6px auto 0px;""><div style=""width: 898px; height: 600px; float: left;""><div style=""width: 860px; height: 65px; float: left; font-family: Arial, Helvetica, sans-serif; font-size: 11px; margin-left: 19px; margin-top: 26px;""><table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" height=""65px""><tr><td width=""210px"" valign=""top""><img src=""http://projstudy.com/QuoteWerks/images/logo.jpg"" /></td><td width=""420px"" valign=""top"">N1 Chorley Business &amp; Technology Centre Euxton Lane, Chorley PR7 6TE Phone: 0800 7810626 Fax: 01257270478</td><td valign=""top""><img src=""http://projstudy.com/QuoteWerks/images/quote.jpg"" align=""right"" /><table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td style=""text-align: right; padding-top: 6px;"" align=""right""><b>Number</b></td><td style=""text-align: right; padding-top: 6px;"" align=""right""><b>"
strBody = strBody &""& quoteno&""
strBody = strBody&"</b></td></tr><tr><td style=""text-align: right; padding-top: 6px;"" align=""right""><b>Date</b></td><td style=""text-align: right; padding-top: 6px;"" align=""right""><b>"&MonthName(Month(date),3) & " " & DAY(date) & ", "  & YEAR(date)&"</b></td></tr></table></td></tr></table></div> <div style=""width: 866px; height: 170px; float: left; font-family: Arial, Helvetica, sans-serif; font-size: 10px; margin-left: 16px;""><table width=""100%"" border=""0"" cellspacing=""6"" cellpadding=""0"" height=""170px""><tr><td valign=""top"" width=""226"" height=""18"" style=""background-color: #efefef; border: 1px solid #bfbfbf; padding-left: 4px;"" bgcolor=""#efefef"">Sold To</td><td valign=""top"" width=""226"" height=""18"" style=""background-color: #efefef; border: 1px solid #bfbfbf; padding-left: 4px;"" bgcolor=""#efefef"">Ship To</td><td valign=""top"" width=""226""> </td><td valign=""top"" width=""226"" style=""background-color: #efefef; border: 1px solid #bfbfbf; padding-left: 4px;"" bgcolor=""#efefef"">Your Account Manager</td></tr><tr><td valign=""top"">"&Session("sold_cname")&"<br />"&Session("sold_name1")&"<br />"&Session("SoldAddress")&"<br /><br /><br />Phone: "&Session("ph1")&"<br />Fax: "&Session("fax1")&"</td><td valign=""top"">"&Session("ship_cname")&"<br />"&Session("ship_name1")&"<br />"&Session("ShipAddress")&"<br /><br /><br /> Phone: "&Session("ph2")&"<br />Fax: "&Session("fax2")&"</td><td valign=""top"" style=""font-size: 10px;""><b>To accept this quotation, please tickrequired line items, enter a PO number,sign &amp; date below and return.</b><br /><br /><b>Please email us if your organisation doesnot use PO numbers.</b></td><td valign=""top""><b>"& rqfirstname&"&nbsp;"& rqlastname&"</b> <br /><br /><b>"&rqofficialemailid&"</b> <br /><br /><b>"&rqphoneno&" </b></td></tr></table><table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td width=""70"" height=""18"" style=""background-color: #efefef; border: 1px solid #bfbfbf; padding-left: 4px;"" bgcolor=""#efefef""><b>P.O. Number</b></td><td width=""150px""> </td><td width=""70"" height=""18"" style=""background-color: #efefef; border: 1px solid #bfbfbf; padding-left: 4px;"" bgcolor=""#efefef""><b>Terms</b></td><td>14 days before course, or 30 days from invoice, whichever is sooner</td>&#13<td> </td></tr></table></div><div style=""width: 866px; height: 95px; float: left; font-family: Arial, Helvetica, sans-serif; font-size: 10px; margin-left: 16px; margin-bottom: 20px;""><table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""4"" style=""border-collapse:collapse;	""><tr><td height=""20""> </td><td height=""20""> </td><td height=""20""> </td><td height=""20""> </td><td height=""20""> </td><td height=""20""> </td><td height=""20""> </td><td height=""20""> </td><td height=""20""> </td><td height=""20""> </td><td height=""20""> </td><td height=""20""> </td></tr><tr><td valign=""middle"" valign=""top"" width=""24""> </td><td valign=""middle"" valign=""top"" width=""33"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Line</b></td><td valign=""middle"" valign=""top"" width=""38"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Qty</b></td><td valign=""middle"" valign=""top"" width=""70"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Course Code</b></td><td valign=""middle"" valign=""top"" width=""335"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Description</b></td><td valign=""middle"" valign=""top"" width=""53"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Date</b></td><td valign=""middle"" valign=""top"" width=""63"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Location</b></td><td valign=""middle"" valign=""top"" width=""30"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Days</b></td><td valign=""middle"" valign=""top"" width=""41"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>RRP £</b></td><td valign=""middle"" valign=""top"" width=""49"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Discount</b></td><td valign=""middle"" valign=""top"" width=""41"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Unit £</b></td><td valign=""middle"" valign=""top"" width=""49"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Total</b></td></tr>"
 
			 Dim item_id,sql1
		   item_id=""
	      dim  SrNo,id,code 
		   SrNo=1
        Set Rs6  = Server.CreateObject("ADODB.Recordset")
        Set Rs7 = Server.CreateObject("ADODB.Recordset")
        
   		
    	 For rowcounter = firstRow To lastRow 
			 id=arrAllUsers(22,rowcounter)
		     code=arrAllUsers(4,rowcounter)
        	item_id=item_id &"'"&arrAllUsers(4,rowcounter)&"',"
			 
        if id ="0" then 
            city="N/A"
          date1="N/A"        
     else if id <> "" then 
           ' response.Write(id)
             strq="select b.city ci,b.startdate st,b.enddate ed from course b  where b.courseid="&id&""
          '  response.Write(strq)
            Rs6.Open strq,ConnObj

	  If Not Rs6.EOF Then
            city=Rs6("ci")
            st=Rs6("st")
            ed=Rs6("ed")
           
          date1=st &"&nbsp; to &nbsp;" &ed
        
        end if 
        Rs6.Close
       else if id="" then 
       
       city="N/A"
          date1="N/A"   
         end if 
            end if 
            end if 
           strq1="select CustomNumber01 a from QW_Category  where  ManufacturerPartNumber='"&code&"'"
          '  response.Write(strq)
            Rs7.Open strq1,ConnObj

	  If Not Rs7.EOF Then  
       cus_no=Rs7("a") 
           end if 
        Rs7.Close
            



		strBody = strBody &"<tr><td valign=""top"" width=""24"" style=""border: 1px solid #bfbfbf;""> </td><td valign=""top"" width=""33"" align=""center"">"&SrNo&"</td><td valign=""top"" width=""38"" align=""center"">"&arrAllUsers(7,rowcounter)&"</td><td valign=""top"" width=""63"" align=""center"">"&arrAllUsers(4,rowcounter)&"</td><td valign=""top"" width=""344"" align=""center"">"&arrAllUsers(3,rowcounter)&"</td><td valign=""top"" width=""53"">"&date1&" </td><td valign=""top"" width=""63"">"&city&" </td><td valign=""top"" width=""30"" align=""center"">"&cus_no&"</td><td valign=""top"" width=""41"" align=""center"">"&currency1&""&arrAllUsers(8,rowcounter)&"</td><td valign=""top"" width=""49"" align=""center"">"&currency1&""&arrAllUsers(10,rowcounter)&"</td><td valign=""top"" width=""41"" align=""center"">"&currency1&""&arrAllUsers(11,rowcounter)&"</td><td valign=""top"" width=""49"" align=""center"">"&currency1&""&arrAllUsers(12,rowcounter)&"</td></tr>"

 SrNo = SrNo + 1
   city=""
    date1=""
    cus_no=""
    code=""
    id=""
  Next
    if item_id<>"" then
  item_id=Left(item_id,Len(item_id)-1)
  end if
  
strBody = strBody &"</table></div> "

strBody = strBody &"<div style=""width: 866px; height: 160px; float: left; font-family: Arial, Helvetica, sans-serif; font-size: 10px; margin-left: 16px;""><div style=""width: 484px; float: left; text-align:left;"">I am authorised to place this order:<table width=""192"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td width=""36"" height=""22"">Signature:</td><td height=""22"" style=""border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #333;""> </td></tr><tr><td width=""36"" height=""22"">Date:</td><td height=""22"" style=""border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #333;""> </td></tr><tr><td width=""36"" height=""22"">Name:</td><td height=""22"" style=""border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #333;""> </td></tr><tr><td width=""36"" height=""22"">Position:</td><td height=""22"" style=""border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #333;""> </td></tr></table></div><div style=""width: 187px; float: left;""><div style=""background-color: #efefef; border: 1px solid #bfbfbf; padding: 10px 0px 10px 8px;""><b>Please note: discounts are appliedassuming prompt payment and will beremoved from overdue invoices.</b></div></div><div style=""width: 162px; float: right;""><div style=""width: 155px; height: 68px; padding: 4px; border: 1px solid #ccc;"">"

strBody = strBody &"<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td><b>RRP Total</b></td><td align=""right"">"&currency1&""&rqtotalActualPrice&"</td></tr><tr><td><b>Discount Total</b></td><td align=""right"">"&currency1&""&rqtotalDiscount&"</td></tr><tr><td><b>SubTotal</b></td><td align=""right"">"&currency1&""&rqtotalsellingPrice&"</td></tr><tr><td><b>VAT</b></td><td align=""right"">"&currency1&""&rqtax&"</td></tr></table></div><div style=""background-color: #efefef; margin-top: 4px; border: 1px solid #bfbfbf; padding: 3px; height: 20px; width: 157px;""><table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td>Total</td><td style=""text-align:right;"">"&currency1&""&rqtotalAmount&"</td></tr></table></div></div></div>"

strBody = strBody &"<div style=""width: 866px; height: 52px; float: left; font-family: Arial, Helvetica, sans-serif; font-size: 10px; margin-left: 16px; border-top-color: #999; border-top-style: solid; border-top-width: 1px; text-align: center; color: #666; padding-top: 10px;"" align=""center""> We accept all major credit and debit cards for payment. Head office: N1 CBTC, Euxton Lane, Chorley, Lans PR7 6TE Post Sales line: 01772 623467 Email: sales@datrixtraining.com Sales line: 0800 781 0626Our terms of business can be viewed at:<a href=""#d41d8cd98f00b204e9800998ecf8427e"">http://www.datrixtraining.com/about/terms/</a> Datrix Training Limited - Company number 4344412</div></div></div></td></tr></table>"

strBody = strBody &"<table><tr><td><br>Please find below the links for the course outlines and to know about Datrix and our clients.<br>"

    'getting the url links from DB based on code selected
     sql1 = "SELECT url a,TittleDescription b FROM [QW_category] where ManufacturerPartNumber in ("& item_id &")"
     
       Set rs = Server.CreateObject("ADODB.Recordset")
	  
         dim i,j,k
		 
	  rs.open sql1, ConnObj
	 	 
	  	  While Not rs.EOF
      		    
	strBody = strBody &"<ul><li><a href="&rs("a")&"  name="&rs("b")&" >"& rs("b")&"</a></li></ul>"

     rs.MoveNext
       Wend
	 urls="/Quotewerks/POgeneratedReport.asp?quoteid="&quoteid
	   rs.Close
	   
strBody = strBody &"<ul><li><a href=""http://projstudy.com/Quotewerks/QW_PDF/DTQQ1007.5-8.pdf"" target=""_blank"">About Datrix</a></li></ul></td></tr></table>"

strBody = strBody &"<table><tr><td>Please <a href="&urls&">click here</a> to place a purchase order.</td></tr></table><table><tr><td>If the ""click here"" link is not working, please reply to this email with ""I Agree""  in the subject line.</td></tr><tr><td><input type=""hidden""  name=""officialemailid"" value="&rqofficialemailid&"><input type=""hidden""  name=""Userid"" value="&Session("QWUserName")&"><input type=""hidden"" name=""quoteId"" value="& quoteid &"></td></tr></table>"

strBody = strBody & "<table><tr><td align=""left""><br><font face=""Arial"" size=2>Best Regards,</font></td></tr>"
strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=2><br>"& rqfirstname&"&nbsp;"& rqlastname&" <br />"&rqofficialemailid&" <br />"&rqphoneno&" </td></font></td></tr></table>"



response.Write(strBody)


'Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'objCDOMail.From = "operations@datrixtraining.com"
'objCDOMail.From = "<" & rqofficialemailid & ">"
'objCDOMail.To =  ""&Session("email1")&""
'objCDOMail.cc = "edusyssavita@gmail.com,edusysayan@gmail.com"
'objCDOMail.Importance = 2
'objCDOMail.Subject = "Quotation from Datrix"
'objCDOMail.BodyFormat = 0
'objCDOMail.MailFormat = 0
'objCDOMail.Body =  strBody
'objCDOMail.Send
'Set objCDOMail = Nothing


%>
<!--<table align="center"><tr>
  
    <td width = "35%"><button type="button" name="Type"  value="Save as PDF" onClick="javascript:window.print()">Save as PDF/Print</button></td>
         <!--<td width = "35%"><button type="button" name="Type"  value="Print" >Print</button></td>
  </tr></table>-->
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftNavigation" >
   
   
 
  <td width="730" align="center" valign="top" height="450px">
  

  
     <div id="quote-container">
<div id="quote-wrapper">
  <div id="quote-header">
     <table width="100%" border="0" cellspacing="0" cellpadding="0" height="65px">
         <tr>
           <td width="210px" valign="top"><img src="/QuoteWerks/images/logo.jpg" /></td>
           <td width="420px" valign="top">N1 Chorley Business & Technology Centre Euxton Lane, Chorley PR7 6TE</br> Phone: 0800 7810626 Fax: 01257 270478</td>
           <td valign="top"><img src="/QuoteWerks/images/quote.jpg" align="right"/>

             <table width="100%" border="0" cellspacing="0" cellpadding="0">
             
               <% 
			' For rowcounter = firstRow To lastRow 
			 
		  %>
  <tr>
    <td style="text-align:right; padding-top:6px;"><b>Quote Number</b></td>
    <td style="text-align:right; padding-top:6px;"><b><% =quoteno %></b></td>
  </tr>
  <tr>
    <td style="text-align:right; padding-top:6px;"><b>Date</b></td>
    <td style="text-align:right; padding-top:6px;"><b><% =MonthName(Month(date),3) & " " & DAY(date) & ", "  & YEAR(date)%></b></td>
  </tr>
</table>

           </td>
        </tr>
    </table>

  </div>
  




  <div id="quote-sellingchart">
     <table width="100%" border="0" cellspacing="6" cellpadding="0" height="170px">
  <tr>
    <td valign="top" class="titlebackground" width="226" height="18">Sold To</td>
    <td valign="top" class="titlebackground" width="226" height="18">Ship To</td>
    <td valign="top" width="226">&nbsp;</td>
    <td valign="top" class="titlebackground" width="226">Your Account Manager</td>
  </tr>
   <tr>
    <td valign="top"><% =Session("sold_cname") %><br />
<% =Session("sold_name1") %><br />
<% =Session("SoldAddress")  %><br />   

    <br />    Phone:  <%=Session("ph1")%><br />Fax:<%=Session("fax1")%> <br /> </td>
  
   
    <td valign="top"><% =Session("ship_cname") %><br />
<% =Session("ship_name1") %><br />
<% =Session("ShipAddress")  %><br />   <br />   Phone:<%=Session("ph2")%> <br />Fax:<%=Session("fax2")%>  <br /> </td>

    <td valign="top" class="small-text"><b>To accept this quotation, please tick
    required line items, enter a PO number,
    sign & date below and return.</b><br /><br />
    
    <b>Please email us if your organisation does
    not use PO numbers.</b></td>
    <td valign="top" align="center"><b><% = rqfirstname%>&nbsp;<%= rqlastname%></b> <br /><br /> <b><% =rqofficialemailid %></b> <br /><br /> <b><% =rqphoneno %> </b></td>
  </tr>
</table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="titlebackground" width="70" width="226" height="18"><b>P.O. Number</b></td>
    <td width="150px">&nbsp;</td>
    <td class="titlebackground" width="70" width="226" height="18"><b>Terms</b></td>
    <td>14 days before course, or 30 days from invoice, whichever is sooner</td>
    <td>&nbsp;</td>
  </tr>
</table>
  </div>
  
  
<div id="quote-descriptionchart">
  <table width="100%" border="0" cellspacing="2" cellpadding="0">
  <tr>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
  </tr>
 

     <tr>
    <td valign="top" width="24" height="20">&nbsp;</td>
    <td valign="top" width="33" class="title-border" align="center" height="20"><b>Line</b></td>
    <td valign="top" width="38" class="title-border" align="center" height="20"><b>Qty</b></td>
    <td valign="top" width="70" class="title-border" align="center" height="20"><b>Course Code</b></td>
    <td valign="top" width="335" class="title-border" align="center" height="20"><b>Description</b></td>
    <td valign="top" width="53" class="title-border" align="center" height="20"><b>Date</b></td>
    <td valign="top" width="63" class="title-border" align="center" height="20"><b>Location</b></td>
    <td valign="top" width="30" class="title-border" align="center" height="20"><b>Days</b></td>
    <td valign="top" width="41" class="title-border" align="center" height="20"><b>RRP £ </b></td>
    <td valign="top" width="49" class="title-border" align="center" height="20"><b>Discount</b></td>
    <td valign="top" width="41" class="title-border" align="center" height="20"><b>Unit £</b></td>
    <td valign="top" width="49" class="title-border" align="center" height="20"><b>Total</b></td>
  </tr>
    <% 
	'Dim item_id,sql1
		   'item_id=""
'	       dim  SrNo,id,code 
		   SrNo=1
 '       Set Rs6  = Server.CreateObject("ADODB.Recordset")
  '      Set Rs7 = Server.CreateObject("ADODB.Recordset")
   '     Set Rs8 = Server.CreateObject("ADODB.Recordset")
            
     '      dim city,st,ed,currency1
        str87="select * from QW_CountryDetail where countryId="&Session("country")&""
       ' response.Write(str87)
           Rs8.Open str87,ConnObj
            If Not Rs8.EOF Then
           currency1=Rs8("currency")
            end if
           Rs8.Close
  			 For rowcounter = firstRow To lastRow 
			 id=arrAllUsers(22,rowcounter)
		     code=arrAllUsers(4,rowcounter)
        	'item_id=item_id &"'"&arrAllUsers(4,rowcounter)&"',"
		  %>
       <tr>
    <td valign="top" width="24" class="title-border" >&nbsp;</td>
    <td valign="top" width="33" align="center"><% = SrNo %></td>
    <td valign="top" width="38" align="center"><% = arrAllUsers(7,rowcounter) %></td>
    <td valign="top" width="63" align="center" ><% = arrAllUsers(4,rowcounter) %></td>
    <td valign="top" width="344" align="center"><% = arrAllUsers(3,rowcounter) %></td>
      
    <td valign="top" width="53" align="center">
        <% if id ="0" then %>
            N/A
        <% else if id <> "" then 
           ' response.Write(id)
             strq="select b.city ci,b.startdate st,b.enddate ed from course b  where b.courseid="&id&""
          '  response.Write(strq)
            Rs6.Open strq,ConnObj

	  If Not Rs6.EOF Then
            city=Rs6("ci")
            st=Rs6("st")
            ed=Rs6("ed")
            %>
        <%=st %> &nbsp; to &nbsp <%=ed %>
        <%
        end if 
        Rs6.Close
       else if id="" then 
        %>
        N/A
        <%  end if 
            end if 
            end if 
            %>
    </td>
    <td valign="top" width="63" align="center"><% if city<>"" then %><%=city %> <%else %>N/A <% end if  
      
          city=""%></td>
    <td valign="top" width="30" align="center">
        <%
            

            strq1="select CustomNumber01 a from QW_Category  where  ManufacturerPartNumber='"&code&"'"
          '  response.Write(strq)
            Rs7.Open strq1,ConnObj

	  If Not Rs7.EOF Then
           
             %>
       <%=Rs7("a") %>
         <%
         end if 
        Rs7.Close
                     
                        
             %>
         </td>
    <td valign="top" width="41" align="center"><%=currency1 %><% = arrAllUsers(8,rowcounter) %></td>
    <td valign="top" width="49" align="center"><%=currency1 %><% = arrAllUsers(10,rowcounter) %></td>
    <td valign="top" width="41" align="center"><%=currency1 %><% = arrAllUsers(11,rowcounter) %></td>
    <td valign="top" width="49" align="center"><%=currency1 %><% = arrAllUsers(12,rowcounter) %></td>

  </tr>
  <% 
   SrNo = SrNo + 1
  Next%> 
</table>
 
 
</div> 
 
 
 <div id="quote-lowerbody">
   <div id="quote-left">
     <div style="margin-left:-26px;">I am authorised to place this order:</div>
       <table width="192" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="36" height="22">Signature:</td>
    <td class="borderbottom" height="22">&nbsp;</td>
  </tr>
  <tr>
    <td width="36" height="22">Date:</td>
    <td class="borderbottom" height="22">&nbsp;</td>
  </tr>
  <tr>
    <td width="36" height="22">Name:</td>
    <td class="borderbottom" height="22">&nbsp;</td>
  </tr>
  <tr>
    <td width="36" height="22">Position:</td>
    <td class="borderbottom" height="22">&nbsp;</td>
  </tr>
</table>

   </div>
   
    <div id="quote-middle">
      <div class="quote-box">
        <b>Please note: discounts are applied
assuming prompt payment and will be
removed from overdue invoices.</b>
      </div>
   </div>
   
    <div id="quote-right">
       <div class="quote-discountbox-up">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><b>RRP Total</b></td>
    <td align="right"><%=currency1 %><%= rqtotalActualPrice%></td>
  </tr>
  <tr>
    <td><b>Discount Total</b></td>
    <td align="right"><%=currency1 %><% = rqtotalDiscount%></td>
  </tr>
  <tr>
    <td><b>SubTotal</b></td>
    <td align="right"><%=currency1 %><%= rqtotalsellingPrice %></td>
  </tr>
  <tr>
    <td><b>VAT</b></td>
    <td align="right"><%=currency1 %><%=rqtax%></td>
  </tr>
</table>

       </div>
        <div class="quote-discountbox-down">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>Total</td>
    <td><%=currency1 %><% = rqtotalAmount%></td>
  </tr>
</table>

       </div>
   </div>
   
 </div>
 
 
 <div id="quote-footer">
 We accept all major credit and debit cards for payment. Head office: N1 CBTC, Euxton Lane, Chorley, Lans PR7 6TE Post Sales line: 01772 623467 Email: sales@datrixtraining.com Sales line: 0800 781 0626
Our terms of business can be viewed at:<a href="#">http://www.datrixtraining.com/about/terms/</a> Datrix Training Limited - Company number 4344412
   
  <div id="quote-footer-left">
     Created on 02/22/13 18:06:13 by QuoteWerks
  </div>
  
  <div id="quote-footer-right">
<br />
  </div>
  <div style="width:auto;height:10000px; overflow:visible;" id="pdfRenderer">
  </div>

 </div>
 

 
 
 
 </div>
</div>     
    </td>     
    </tr>
 </table>

   <%
   Session("quote") = ""
  'response.Write(str)
 Session("qid_edit")=""
 %>
<% End If %>

</Body>
<!-- Body Ends -->
