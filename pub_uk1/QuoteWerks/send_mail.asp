   <!--#include virtual="/QuoteWerks/includes/connection.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>

<%
'======================================================='
'Written By : savita'
'Created Date : 28/02/2013'
'Description :'
'This page is for generating the quote '
'======================================================='
%>
<script>
function sendPOgeneratedReport()

quoteno{
	window.open("/QuoteWerks/sendPOgeneratedReport.asp")
}

</script>
<%
'Declaring variables
Dim rqAction ,rqCountry,rqWebsite,quoteno
Dim rqId,arrAllcountries,objRs2,objRs3,objRs4
Dim arrAllEmpDet, firstRow, lastRow, numRows, rqRow, rqPage
Dim message,strquery1
Dim hb_website,rqquoteid
dim action
message = Session("message")
Session("message") = ""
   
'Creating the Recordset objects'
SET objRs1 = Server.CreateObject("ADODB.Recordset")
SET objRs2 = Server.CreateObject("ADODB.Recordset")
	
'Retrive the values from this page'
rqAction = Request.QueryString("action")
rqRow  = Request.QueryString("row")
rqPage = Request.QueryString("page")

redirecturl = Request.Form("redirecturl")



If Request.Form("quoteid") <> "" Then
	rqquoteid = Request.Form("quoteid")
    
Else
	rqquoteid = Request.QueryString("quoteid")
End If
if      Request.Form("quoteid1")<>"" then
    rqquoteid =  Request.Form("quoteid1")
    end if
    If Request.Form("action")<>"" then
       action=Request.Form("action")
    	end if			  

'    response.Write(action)

if rqquoteid  <> "" then
'response.Write(rqquoteid)

strEmpDet = "SELECT * FROM QW_QuoteOverview  where quoteId = '"&rqquoteid&"' order by versionNo desc "
'response.Write(strEmpDet)
strEmpDet1 = "SELECT * FROM QW_QuoteDetails where quoteId = '"&rqquoteid&"' Order By orderid desc "
'response.Write(strEmpDet)
'response.Write(strEmpDet)

end if
objRs2.Open strEmpDet, ConnObj

  Do Until objRs2.EOF 

         quoteno=objRs2("quoteno")
          cid=objRs2("countryId") 
          rqtotalAmount = objRs2("totalAmount") 
		  rqtax = objRs2("tax")
		  rqtotalsellingPrice = objRs2("totalsellingPrice")
		  rqtotalActualPrice =objRs2("totalActualPrice")
          rqtotalDiscount=objRs2("totalDiscount")
		  rqsoldtoAddress=objRs2("soldtoAddress")
		  rqshiptoAddress= objRs2("shiptoAddress")
		  userId=objRs2("userId")
		  rqPONumber = objRs2("PONumber")
         rqcreatedate= objRs2("createdDate")
         rqinvoice=objRs2("Invoiceno")

		  'response.Write(rqsoldtoAddress)
          objRs2.Movenext
		   Loop
		   objRs2.Close 


strEmpDet = "SELECT * FROM users where userId = '"&userId&"' "

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
 
 'to get country details

 Set Rs8 = Server.CreateObject("ADODB.Recordset")
            
          dim city,st,ed,currency1,id1,date1,cus_no
        str87="select * from QW_CountryDetail where countryId=(SELECT countryId FROM QW_QuoteOverview  where quoteId = '"&rqquoteid&"')"
       ' response.Write(str87)
           Rs8.Open str87,ConnObj
            If Not Rs8.EOF Then
           currency1=Rs8("currency")
            end if
            Rs8.Close

%>
 <%
     'dim arr1,arr2
	 arr1=Split(rqsoldtoAddress,"!")
	 arr2=Split(rqshiptoAddress,"!")
	 
  %>
<link rel="stylesheet" type="text/css" href="/QuoteWerks/css/Styles.css">
</head>
<!-- Body Starts -->


<body style="margin-top:0px">

      <form action="send_mail.asp" method="post" > 
     <table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftNavigation" >
   
   
 
      <td width="730" align="center" valign="top" height="23px">
  <%
      ' added by Saubhik
      dim st1
      if request.form("add_tag")<>"" then
      st1=request.form("add_tag")
      else
      st1="Dear "& Session("sold_name1")&",<BR><BR>Greetings from Datrix Training! <BR><BR>Please find below the quotation as requested by you."
      end if 
      %>
      Edit your Mail&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <textarea name="add_tag" rows="20" style="height: 92px; width: 790px"><%=st1 %></textarea>
  <%
  
    dim img_src,url
     if  action = "View" then
                 img_src="http://46.183.10.241/QuoteWerks/images/quote.jpg" 
                  url="http://46.183.10.241/Quotewerks/POgeneratedReport.asp?quoteid="&rqquoteid  ' to add in I accept button
      elseif  action = "View_PO" then
                 img_src="http://46.183.10.241/QuoteWerks/images/po-received.jpg"
                 
    elseif action = "View_IS" then
                 img_src="http://46.183.10.241/QuoteWerks/images/invoice.jpg"
                 ' url="?"
      end if
                   ' response.Write(action)
'Email Template for generating quote
Dim strBody,strpdf
    'added by Saubhik
'strBody = "<table width=""600px"" border=""0""><tr height=""30px""><td><font face=""Arial"" size=2>Dear "&arr1(1)&",<BR><BR>Greetings from Datrix Training! <BR><BR>Thank you for accepting our quotation and sending us the purchase order"

If rqPOnumber <> "" Then
strBody = strBody &"<BR> with PO number "&rqPOnumber&" "

End If
strBody = strBody &"<center><BR></td></tr></table><table width=""600px"" border=""0"" style=""border:1px solid #ccc;margin-left: 215px;""  cellspacing=""0"" cellpadding=""0"" ><tr><td align=""center"" valign=""top""><div style=""width: 898px; height: 600px; background-color: #fff; margin: 6px auto 0px;""><div style=""width: 898px; height: 600px; float: left;""><div style=""width: 860px; height: 65px; float: left; font-family: Arial, Helvetica, sans-serif; font-size: 11px; margin-left: 19px; margin-top: 26px;""><table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" height=""65px""><tr><td width=""210px"" valign=""top""><img src=""http://46.183.10.241/QuoteWerks/images/logo.jpg"" /></td><td width=""420px"" valign=""top"">N1 Chorley Business &amp; Technology Centre Euxton Lane, Chorley PR7 6TE Phone: 0800 7810626 Fax: 01257270478</td><td valign=""top""><img src="&img_src&" align=""right"" /><table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td style=""text-align: right; padding-top: 6px;"" align=""right""><b>Number</b></td><td style=""text-align: right; padding-top: 6px;"" align=""right""><b>"

'strpdf = strpdf &"<center><table  style=""width:600px;border:1px solid #ccc;margin-left: 215px;""  cellspacing=""0"" cellpadding=""0"" ><tr><td align=""center"" valign=""top""><div style=""width: 898px; height: 600px; background-color: #fff; margin: 6px auto 0px;""><div style=""width: 898px; height: 600px; float: left;""><div style=""width: 860px; height: 65px; float: left; font-family: Arial, Helvetica, sans-serif; font-size: 11px; margin-left: 19px; margin-top: 26px;""><table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" height=""65px""><tr><td width=""210px"" valign=""top""><img src=""http://46.183.10.241/QuoteWerks/images/logo.jpg"" /></td><td width=""420px"" valign=""top"">N1 Chorley Business &amp; Technology Centre Euxton Lane, Chorley PR7 6TE Phone: 0800 7810626 Fax: 01257270478</td><td valign=""top""><img src="&img_src&" align=""right"" /><table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td style=""text-align: right; padding-top: 6px;"" align=""right""><b>Number</b></td><td style=""text-align: right; padding-top: 6px;"" align=""right""><b>"


'strBody = strBody &""& quoteno&""
if rqinvoice<>"" then
strBody = strBody &""& rqinvoice&""
      else
strBody = strBody &""& quoteno&""
            end if

strBody = strBody&"</b></td></tr><tr><td style=""text-align: right; padding-top: 6px;"" align=""right""><b>Date</b></td><td style=""text-align: right; padding-top: 6px;"" align=""right""><b>"&MonthName(Month(rqcreatedate),3) & " " & DAY(rqcreatedate) & ", "  & YEAR(rqcreatedate)&"</b></td></tr></table></td></tr></table></div><div style=""width: 866px; height: 170px; float: left; font-family: Arial, Helvetica, sans-serif; font-size: 10px; margin-left: 16px;""><table width=""100%"" border=""0"" cellspacing=""6"" cellpadding=""0"" height=""170px""><tr><td valign=""top"" width=""226"" height=""18"" style=""background-color: #efefef; border: 1px solid #bfbfbf; padding-left: 4px;"" bgcolor=""#efefef"">Sold To</td><td valign=""top"" width=""226"" height=""18"" style=""background-color: #efefef; border: 1px solid #bfbfbf; padding-left: 4px;"" bgcolor=""#efefef"">Ship To</td><td valign=""top"" width=""226""></td><td valign=""top"" width=""226"" style=""background-color: #efefef; border: 1px solid #bfbfbf; padding-left: 4px;"" bgcolor=""#efefef"">Your Account Manager</td></tr>"

     dim arr1,arr2

	 arr1=Split(rqsoldtoAddress,"!")
	 arr2=Split(rqshiptoAddress,"!")
	  id1=Session("QWUserName")  
       userimage="http://46.183.10.241/QuoteWerks/UserImage/"&id1&"/"&id1&"_image.jpg"  
      usersign="http://46.183.10.241/QuoteWerks/UserSign/"&id1&"/"&id1&"_sign.jpg"  


strBody = strBody&"<tr><td valign=""top"">"&arr1(1)&"<br />"&arr1(2)&"<br />"&arr1(3)&"<br />Phone: "&arr1(4)&"</td><td valign=""top"">"&arr2(1)&"<br />"&arr2(2)&"<br />"&arr2(3)&"<br />Phone:"&arr2(4)&"<br /></td><td valign=""top"" style=""font-size: 10px;""><b>To accept this quotation, please tickrequired line items, enter a PO number,sign &amp; date below and return.</b><br /><br /><b>Please email us if your organisation doesnot use PO numbers.</b></td><td valign=""top"" align=""left""><div style=""height: 112px""><div style=""float:left; width: 75px; height: 89px;""><img src="&userimage&" style=""height: 97px; width: 78px"" /></div><div style=""float:right; height: 93px""><b>"& rqfirstname&"&nbsp;"& rqlastname&"</b> <br /><br /> <b>"&rqofficialemailid&"</b> <br /><br /><b>"&rqphoneno&"</b><br /><br /><img src="&usersign&" style=""width: 108px; height: 30px"" /></div></div></td></tr></table><table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td width=""70"" height=""18"" style=""background-color: #efefef; border: 1px solid #bfbfbf; padding-left: 4px;"" bgcolor=""#efefef""><b>P.O. Number</b></td><td width=""150px"">"&rqPONumber&"</td><td width=""70"" height=""18"" style=""background-color: #efefef; border: 1px solid #bfbfbf; padding-left: 4px;"" bgcolor=""#efefef""><b>Terms</b></td><td>14 days before course, or 30 days from invoice, whichever is sooner</td>CR<td></td></tr></table></div><div style=""width: 866px; height: 95px; float: left; font-family: Arial, Helvetica, sans-serif; font-size: 10px; margin-left: 16px; margin-bottom: 20px;""><table width=""100%""  border=""0"" cellspacing=""0"" cellpadding=""4"" style=""border-collapse:collapse;""><tr><td height=""20""></td><td height=""20""></td><td height=""20""></td><td height=""20""></td><td height=""20""></td><td height=""20""></td><td height=""20""></td><td height=""20""></td><td height=""20""></td><td height=""20""></td><td height=""20""></td><td height=""20""></td></tr><tr><td valign=""middle"" valign=""top"" width=""24""></td><td valign=""middle"" valign=""top"" width=""33"" align=""center"" style=""border:1px solid #bfbfbf;""><b>Line</b></td><td valign=""middle"" valign=""top"" width=""38"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Qty</b></td><td valign=""middle"" valign=""top"" width=""70"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Course Code</b></td><td valign=""middle"" valign=""top"" width=""335"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Description</b></td><td valign=""middle"" valign=""top"" width=""30"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Days</b></td><td valign=""middle"" valign=""top"" width=""41"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>RRP "&currency1&"</b></td><td valign=""middle"" valign=""top"" width=""49"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Discount</b></td><td valign=""middle"" valign=""top"" width=""41"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Unit "&currency1&"</b></td><td valign=""middle"" valign=""top"" width=""49"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Total</b></td></tr>"
 
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
			                                                                                                                                                
				 
        'newly aaded calculation of rrp,dis
		 add=CDBL(CDBL(add)+CDbl(arrAllUsers(14,rowcounter)))
       dim x,rrp,discount,unit,rrp1,dis1,unit1
          x=CDbl(arrAllUsers(7,rowcounter))
         rrp=CDbl(arrAllUsers(8,rowcounter))
        discount=CDbl(arrAllUsers(10,rowcounter))
         unit=CDbl(arrAllUsers(11,rowcounter))
        rrp1=FormatNumber(CDbl(rrp/x),2)
         dis1=FormatNumber(CDbl(discount/x),2)
         unit1=FormatNumber(CDbl(unit/x),2)
        		
			
			 
        if id ="0" then 
            city="N/A"
          date1="N/A"        
     elseif id <> "" then 
           ' response.Write(id)
             strq="select b.city ci,b.startdate st,b.enddate ed from datrixClasses b  where b.courseid="&id&""
           ' response.Write(strq)
            Rs6.Open strq,ConnObj

	  If Not Rs6.EOF Then       
            city=Rs6("ci")
            st=Rs6("st")
            ed=Rs6("ed")
           
          date1=st &"&nbsp; to &nbsp;" &ed
        
        end if 
        Rs6.Close
       elseif id="" then 
       
       city="N/A"
          date1="N/A"   
         end if  
           strq1="select CustomNumber01 a from QW_Category  where  ManufacturerPartNumber='"&code&"'"
           ' response.Write(strq)
            Rs7.Open strq1,ConnObj

	  If Not Rs7.EOF Then  
       cus_no=Rs7("a") 
           end if 
        Rs7.Close
            



		strBody = strBody &"<tr><td valign=""top"" width=""24"" style=""border: 1px solid #bfbfbf;""></td><td valign=""top"" width=""33"" align=""center"">"&SrNo&"</td><td valign=""top"" width=""38"" align=""center"">"&arrAllUsers(7,rowcounter)&"</td><td valign=""top"" width=""63"" align=""center"">"&arrAllUsers(4,rowcounter)&"</td><td valign=""top"" width=""344"" align=""center"">"&arrAllUsers(3,rowcounter)&"</td><td valign=""top"" width=""30"" align=""center"">"&cus_no&"</td><td valign=""top"" width=""41"" align=""center"">"&currency1&""&rrp1&"</td><td valign=""top"" width=""49"" align=""center"">"&currency1&""&dis1&"</td><td valign=""top"" width=""41"" align=""center"">"&currency1&""&unit1&"</td><td valign=""top"" width=""49"" align=""center"">"&currency1&""&arrAllUsers(11,rowcounter)&"</td></tr>"

 SrNo = SrNo + 1
   city=""
    date1=""
    cus_no=""
    code=""
    id=""
  Next
   
  
strBody = strBody &"</table></div> "

strBody = strBody &"<div style=""width: 866px; height: 160px; float: left; font-family: Arial, Helvetica, sans-serif; font-size: 10px; margin-left: 16px;""><div style=""width: 484px; float: left; text-align:left;"">I am authorised to place this order:<table width=""192"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td width=""36"" height=""22"">Signature:</td><td height=""22"" style=""border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #333;""></td></tr><tr><td width=""36"" height=""22"">Date:</td><td height=""22"" style=""border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #333;""></td></tr><tr><td width=""36"" height=""22"">Name:</td><td height=""22"" style=""border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #333;""></td></tr><tr><td width=""36"" height=""22"">Position:</td><td height=""22"" style=""border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #333;""></td></tr></table></div><div style=""width: 187px; float: left;""><div style=""background-color: #efefef; border: 1px solid #bfbfbf; padding: 10px 0px 10px 8px;""><b>Please note: discounts are appliedassuming prompt payment and will beremoved from overdue invoices.</b></div></div><div style=""width: 162px; float: right;""><div style=""width: 155px; height: 68px; padding: 4px; border: 1px solid #ccc;"">"

strBody = strBody &"<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td><b>RRP Total</b></td><td align=""right"">"&currency1&""&rqtotalActualPrice&"</td></tr><tr><td><b>Discount Total</b></td><td align=""right"">"&currency1&""&rqtotalDiscount&"</td></tr><tr><td><b>SubTotal</b></td><td align=""right"">"&currency1&""&rqtotalsellingPrice&"</td></tr><tr><td><b>VAT</b></td><td align=""right"">"&currency1&""&rqtax&"</td></tr><tr><td><b>Shipping Charges</b></td><td align=""right"">"&currency1&""&add&"</td></tr></table></div><div style=""background-color: #efefef; margin-top: 4px; border: 1px solid #bfbfbf; padding: 3px; height: 20px; width: 157px;""><table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td>Total</td><td style=""text-align:right;"">"&currency1&""&rqtotalAmount&"</td></tr></table></div></div></div>"

strBody = strBody &"<div style=""width: 866px; height: 52px; float: left; font-family: Arial, Helvetica, sans-serif; font-size: 10px; margin-left: 16px; border-top-color: #999; border-top-style: solid; border-top-width: 1px; text-align: center; color: #666; padding-top: 10px;"" align=""center""> We accept all major credit and debit cards for payment. Head office: N1 CBTC, Euxton Lane, Chorley, Lans PR7 6TE Post Sales line: 01772 623467 Email: sales@datrixtraining.com Sales line: 0800 781 0626Our terms of business can be viewed at:<a href=""#d41d8cd98f00b204e9800998ecf8427e"">http://www.datrixtraining.com/about/terms/</a> Datrix Training Limited - Company number 4344412</div></div></div></td></tr></table>"


strBody = strBody &"<table><tr><td><input type=""hidden""  name=""officialemailid"" value="&officialemailid&"><input type=""hidden""  name=""Userid"" value="&Session("QWUserName")&"><input type=""hidden"" name=""quoteId"" value="& quoteid &"></td></tr></table>"

strBody = strBody & "<table><tr><td align=""left""><br><font face=""Arial"" size=2>Best Regards,</font></td></tr>"
strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=2><br>"& rqfirstname&"&nbsp;"& rqlastname&" <br />"&rqofficialemailid&" <br />"&rqphoneno&"<br>Datrix Training </td></font></td></tr></table>"
if rqinvoice<>"" then
strBody =strBody &"</center>"
else
strBody = strBody &"<table><tr><td>Please click <a href="&urls&"><input type=""button"" value=""I Accept""/></a> to place a purchase order.</td></tr></table><table><tr><td>If the ""I Accept"" button is not working, please reply to this email with ""I Agree""  in the subject line.</td></tr><tr><td><input type=""hidden""  name=""officialemailid"" value="&rqofficialemailid&"><input type=""hidden""  name=""Userid"" value="&Session("QWUserName")&"><input type=""hidden"" name=""quoteId"" value="& quoteid &"></td></tr></table></center>"
end if    
  'if session("body")="" then
     session("body")=strBody
      'end if
   

response.Write(session("body"))
'response.Write(quoteid)

%>
               <input type="hidden" name="action" value="<%=action %>" />
            <input type="hidden" name="quoteid1" value="<%=rqquoteid %>" />
          <input type="hidden" name="redirecturl" value="<%=redirecturl %>" />
  
                  <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="preview" style=" margin-left: 187px; " value="Show Preview" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </div>
   <hr />
          <%
 %>
<% %>
    </form>
   <br /><br />
    <%
               '<table width=""600px"" border=""0""><tr height=""30px""><td><font face=""Arial"" size=2>Dear "&Session("sold_name1")&",<BR><BR>Greetings from Datrix Training! <BR><BR>Please find below the quotation as requested by you.
        if request.form("preview")="Show Preview" then
      %>
     <form action="send_mail.asp" method="post"  >  <center>
    <div style="width:899px; height:1068px; border:1px solid #ccc;" >
       
                      <%
       
      '  tag_add="<table width=""600px"" border=""0""><tr height=""30px""><td><font face=""Arial"" size=""2"">"&request.QueryString("add_tag")&"</font>"
         session("tag")="<table width=""600px"" border=""0""><tr height=""30px""><td><font face=""Arial"" size=""2"">"&request.form("add_tag")&"<br>"
         response.Write("<div style=""float:right""><table width=""600px"" border=""0""><tr height=""30px""><td><font face=""Arial"" size=2>"& request.form("add_tag")&"</div><br>")
         %><%
                     response.Write(session("body"))
        %>
   <br /><br /><center> 
       <input type="hidden" name="action" value="<%=action %>" />
         <input type="hidden" name="quoteid1" value="<%=rqquoteid %>" />
          <input type="hidden" name="redirecturl" value="<%=redirecturl %>" />
             
  <input type="submit" name="send" value="Send mail" /></center></div></center>
     </form>
        <%
        end if

       
    %>
    <%
         if request.Form("send")="Send mail" then
         body_mail= session("tag")&"<br>"&session("body")
      '  response.Write(request.Form("tag_add"))
        response.Write(body_mail)          
        Set myMail= Server.CreateObject("CDO.Message")
  ' myMail.From = "operations@datrixtraining.com"
'  myMail.From = "edusysayan@gmail.com"
response.write(rqofficialemailid)
response.write(arr1(3))
 'myMail.From ="edusysquote@gmail.com"
 myMail.From =   ""&rqofficialemailid&"" 
'myMail.From = "operations@datrixtraining.com"
 myMail.To =  ""&arr1(3)&",edusyssaubhik@gmail.com"

'myMail.Cc = "edusyssaubhik@gmail.com,edusyssidhardha@gmail.com,edusyssavita@gmail.com,edusysayan@gmail.com"
 myMail.Cc = "operations@datrixtraining.com"
myMail.Subject = "Thank you for sending the Purchase Order"
myMail.HtmlBody =  body_mail
myMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
'Name or IP of remote SMTP server
myMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/smtpserver") _
="46.183.10.241"
'Server port
myMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/smtpserverport") _
=25 
myMail.Configuration.Fields.Update
myMail.Send
set myMail=nothing


Session("Message") = "Email Sent Successfully"


Response.Redirect(redirecturl)


                          
        end if
            
         %>




</Body>
<!-- Body Ends -->
