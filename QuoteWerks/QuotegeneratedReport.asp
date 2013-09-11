   <!--#include virtual="/QuoteWerks/includes/connection.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script>
      var req1=null;
        var req2=null;

        function call_createPDF(x,y,z) 
        {
           
            if(window.XMLHttpRequest)
            {
                req2=new XMLHttpRequest; //mozilla/safari
            } else if(window.ActiveXObject){
                req2=new ActiveXObject("Microsoft.XMLHTTP"); //internet explorer
            }
             //define callback handler
            if(req2) {
                //
                req2.onreadystatechange=onReadyState2;
                req2.open("GET","/Convert_pdf1.aspx?action="+x+"&id="+y+"&req="+z,true);
                req2.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
                req2.send(null);
  
            }


        }

        function onReadyState2() 
        {
            //req2=null;
            //

            var ready2=req2.readyState;
            var data=null;
            var myString="";
            if(ready2==4)
            { //check ready state

                data=req2.responseText; //read response data
                console.log("ok")       
           }
        }

</script>
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
Dim hb_website,redirecturl

message = Session("message")
Session("message") = ""
   
'Creating the Recordset objects'
SET objRs1 = Server.CreateObject("ADODB.Recordset")
SET objRs2 = Server.CreateObject("ADODB.Recordset")
	
'Retrive the values from this page'
rqAction = Request.QueryString("action")
rqRow  = Request.QueryString("row")
rqPage = Request.QueryString("page")

'Praveen Added on 18th March 2013 for sending email'

QuoteId = Request.Form("QuoteID")
redirecturl = Request.Form("redirecturl")

If QuoteId <> "" then
Session("quote") = QuoteId
Else 
Session("quote") = Session("quote")
End If


'Ends  Praveen Added on 18th March 2013 for sending email'


'updating query with status omplete'
strEmpDet= "UPDATE QW_QuoteOverview  SET "
		  strEmpDet= strEmpDet& "sentDate = '"& now() &"',"
		  strEmpDet= strEmpDet& "status = 'Quote Sent'"
		  strEmpDet= strEmpDet& " WHERE quoteId = '"& Session("quote") &"'"
					
ConnObj.Execute strEmpDet

strEmpDet1= "UPDATE QW_QuoteDetails  SET "
		  strEmpDet1= strEmpDet1& "addedDate = '"& now() &"',"
		  strEmpDet1= strEmpDet1& "status = 'Quote Sent'"
		  strEmpDet1= strEmpDet1& " WHERE quoteId = '"& Session("quote") &"'"
					
ConnObj.Execute strEmpDet1

'response.write(Session("quote"))								  

if Session("quote") <>"" then
strEmpDet = "SELECT * FROM QW_QuoteOverview  where userId = '"&Session("QWUserName")&"' and quoteId = '"&Session("quote")&"' "

strEmpDet1 = "SELECT * FROM QW_QuoteDetails where quoteId = '"&Session("quote")&"' Order By orderid desc "
'response.write(strEmpDet)

'response.Write(strEmpDet1)
else
strEmpDet ="select top 1 * from QW_QuoteOverview  where  userId = '"&Session("QWUserName")&"' Order By quoteId desc"

strEmpDet1 = "SELECT * FROM QW_QuoteDetails a where a.quoteId =(select top 1 b.quoteId from QW_QuoteOverview b  where  b.userId = '"&Session("QWUserName")&"' Order By b.quoteId desc) Order By orderid desc "

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
    	  rqcreatedate= objRs2("createdDate")
          objRs2.Movenext
		   Loop
		   objRs2.Close 


strEmpDet = "SELECT * FROM Users where userId = '"&Session("QWUserName")&"' "
'dim id2
id1=Session("QWUserName")
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
        str87="select * from QW_CountryDetail where countryId=(SELECT countryId FROM QW_QuoteOverview  where quoteId = '"&Session("quote")&"')"
		
       ' response.Write(str87)
           Rs8.Open str87,ConnObj
            If Not Rs8.EOF Then
           currency1=Rs8("currency")
            end if
            Rs8.Close

%>
<link rel="stylesheet" type="text/css" href="/QuoteWerks/css/Styles.css">
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }
    </style>
</head>
<!-- Body Starts -->


<body style="margin-top:0px">
<%

'Email Template for generating quote
Dim strBody,strbody4,start,userimage,usersign
    'to generate pdf
'        start="<table width=""600px"" border=""0""><tr height=""30px""><td><font face=""Arial"" size=2>"&request.QueryString("add_tag")&"<br>"
   'added by Saubhik
strBody = " <BR><BR></td></tr></table><table width=""600px"" border=""0"" style=""border:1px solid #ccc;"" cellspacing=""0"" cellpadding=""0"" ><tr><td align=""center"" valign=""top""><div style=""width: 898px; height: 600px; background-color: #fff; margin: 6px auto 0px;""><div style=""width: 898px; height: 600px; float: left;""><div style=""width: 860px; height: 65px; float: left; font-family: Arial, Helvetica, sans-serif; font-size: 11px; margin-left: 19px; margin-top: 26px;""><table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" height=""65px""><tr><td width=""210px"" valign=""top""><img src=""http://projstudy.com/QuoteWerks/images/logo.jpg"" /></td><td width=""420px"" valign=""top"">N1 Chorley Business &amp; Technology Centre Euxton Lane, Chorley PR7 6TE Phone: 0800 7810626 Fax: 01257270478</td><td valign=""top""><img src=""http://projstudy.com/QuoteWerks/images/quote.jpg"" align=""right"" /><table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td style=""text-align: right; padding-top: 6px;"" align=""right""><b>Number</b></td><td style=""text-align: right; padding-top: 6px;"" align=""right""><b>"
    userimage="http://46.183.10.241/QuoteWerks/UserImage/"&id1&"/"&id1&"_image.jpg"  
     usersign="http://46.183.10.241/QuoteWerks/UserSign/"&id1&"/"&id1&"_sign.jpg"  
strBody4 = " <table  border=""0"" style=""width:600px;border:1px solid #ccc;"" cellspacing=""0"" cellpadding=""0"" ><tr><td align=""center"" valign=""top""><div style=""width: 898px; height: 600px; background-color: #fff; margin: 6px auto 0px;""><div style=""width: 898px; height: 600px; float: left;""><div style=""width: 860px; height: 65px; float: left; font-family: Arial, Helvetica, sans-serif; font-size: 11px; margin-left: 19px; margin-top: 26px;""><table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" height=""65px""><tr><td width=""210px"" valign=""top""><img src=""D:/new file_Quotewerks/Shipping_details1/QuoteWerks/images/logo.jpg"" /></td><td width=""420px"" valign=""top"">N1 Chorley Business &amp; Technology Centre Euxton Lane, Chorley PR7 6TE Phone: 0800 7810626 Fax: 01257270478</td><td valign=""top""><img src=""D:/new file_Quotewerks/Shipping_details1/QuoteWerks/images/logo.jpg"" align=""right"" /><table style=""width:100px"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td style=""text-align: right; padding-top: 6px;"" align=""right""><b>Number</b></td><td style=""text-align: right; padding-top: 6px;"" align=""right""><b>"

strBody = strBody &""& quoteno&""
    date_create=rqcreatedate  
strBody = strBody&"</b></td></tr><tr><td style=""text-align: right; padding-top: 6px;"" align=""right""><b>Date</b></td><td style=""text-align: right; padding-top: 6px;"" align=""right""><b>"&MonthName(Month(date_create),3) & " " & DAY(date_create) & ", "  & YEAR(date_create)&"</b></td></tr></table></td></tr></table></div> <div style=""width: 866px; height: 170px; float: left; font-family: Arial, Helvetica, sans-serif; font-size: 10px; margin-left: 16px;""><table width=""100%"" border=""0"" cellspacing=""6"" cellpadding=""0"" height=""170px""><tr><td valign=""top"" width=""226"" height=""18"" style=""background-color: #efefef; border: 1px solid #bfbfbf; padding-left: 4px;"" bgcolor=""#efefef"">Sold To</td><td valign=""top"" width=""226"" height=""18"" style=""background-color: #efefef; border: 1px solid #bfbfbf; padding-left: 4px;"" bgcolor=""#efefef"">Ship To</td><td valign=""top"" width=""226""> </td><td valign=""top"" width=""226"" style=""background-color: #efefef; border: 1px solid #bfbfbf; padding-left: 4px;"" bgcolor=""#efefef"">Your Account Manager</td></tr><tr><td valign=""top"">"&Session("sold_name1")&"<br />"&Session("SoldAddress")&"<br />Email id: "&Session("email1")&"<br />Phone: "&Session("ph1")&"<br /></td><td valign=""top"">"&Session("ship_name1")&"<br />"&Session("ShipAddress")&"<br />Email id: "&Session("email2")&"<br />Phone:"&Session("ph2")&"</td><td valign=""top"" style=""font-size: 10px;""><b>To accept this quotation, please tickrequired line items, enter a PO number,sign &amp; date below and return.</b><br /><br /><b>Please email us if your organisation doesnot use PO numbers.</b></td><td valign=""top"" align=""left""><div style=""height: 112px""><div style=""float:left; width: 75px; height: 89px;""><img src="&userimage&" style=""height: 97px; width: 78px"" /></div><div style=""float:right; height: 93px""><b>"& rqfirstname&"&nbsp;"& rqlastname&"</b> <br /><br /> <b>"&rqofficialemailid&"</b> <br /><br /><b>"&rqphoneno&"</b><br /><br /><img src="&usersign&" style=""width: 108px; height: 30px"" /></div></div></td></tr></table><table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td width=""70"" height=""18"" style=""background-color: #efefef; border: 1px solid #bfbfbf; padding-left: 4px;"" bgcolor=""#efefef""><b>P.O. Number</b></td><td width=""150px""> </td><td width=""70"" height=""18"" style=""background-color: #efefef; border: 1px solid #bfbfbf; padding-left: 4px;"" bgcolor=""#efefef""><b>Terms</b></td><td>14 days before course, or 30 days from invoice, whichever is sooner</td>CR<td> </td></tr></table></div><div style=""width: 866px; height: 95px; float: left; font-family: Arial, Helvetica, sans-serif; font-size: 10px; margin-left: 16px; margin-bottom: 20px;""><table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""4"" style=""border-collapse:collapse;	""><tr><td height=""20""> </td><td height=""20""> </td><td height=""20""> </td><td height=""20""> </td><td height=""20""> </td><td height=""20""> </td><td height=""20""> </td><td height=""20""> </td><td height=""20""> </td><td height=""20""> </td><td height=""20""> </td><td height=""20""> </td></tr><tr><td valign=""middle"" valign=""top"" width=""24""> </td><td valign=""middle"" valign=""top"" width=""33"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Line</b></td><td valign=""middle"" valign=""top"" width=""38"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Qty</b></td><td valign=""middle"" valign=""top"" width=""70"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Course Code</b></td><td valign=""middle"" valign=""top"" width=""335"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Description</b></td><td valign=""middle"" valign=""top"" width=""53"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Date</b></td><td valign=""middle"" valign=""top"" width=""63"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Location</b></td><td valign=""middle"" valign=""top"" width=""30"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Days</b></td><td valign=""middle"" valign=""top"" width=""41"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>RRP £</b></td><td valign=""middle"" valign=""top"" width=""49"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Discount</b></td><td valign=""middle"" valign=""top"" width=""41"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Unit £</b></td><td valign=""middle"" valign=""top"" width=""49"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Total</b></td></tr>"
 
 
 
 
'Dates and location Removed sentence '

'<td valign=""middle"" valign=""top"" width=""53"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Date</b></td><td valign=""middle"" valign=""top"" width=""63"" align=""center"" style=""border: 1px solid #bfbfbf;""><b>Location</b></td>



'End Of Dates and location Removed sentence '

 
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
     else if id <> "" then 
           ' response.Write(id)
             strq="select b.city ci,b.startdate st,b.enddate ed from datrixClasses b  where b.courseid='"&id&"'"
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
          '  response.Write(strq1)
            Rs7.Open strq1,ConnObj

	  If Not Rs7.EOF Then  
       cus_no=Rs7("a") 
           end if 
        Rs7.Close
            



		strBody = strBody &"<tr><td valign=""top"" width=""24"" style=""border: 1px solid #bfbfbf;""> </td><td valign=""top"" width=""33"" align=""center"">"&SrNo&"</td><td valign=""top"" width=""38"" align=""center"">"&arrAllUsers(7,rowcounter)&"</td><td valign=""top"" width=""63"" align=""center"">"&arrAllUsers(4,rowcounter)&"</td><td valign=""top"" width=""344"" align=""center"">"&arrAllUsers(3,rowcounter)&"</td><td valign=""top"" width=""53"">"&date1&" </td><td valign=""top"" width=""63"">"&city&" </td><td valign=""top"" width=""30"" align=""center"">"&cus_no&"</td><td valign=""top"" width=""41"" align=""center"">"&currency1&""&rrp1&"</td><td valign=""top"" width=""49"" align=""center"">"&currency1&""&dis1&"</td><td valign=""top"" width=""41"" align=""center"">"&currency1&""&unit1&"</td><td valign=""top"" width=""49"" align=""center"">"&currency1&""&arrAllUsers(11,rowcounter)&"</td></tr>"


'Dates and location Removed sentence '

'<td valign=""top"" width=""53"">"&date1&" </td><td valign=""top"" width=""63"">"&city&" </td>

'End Of Dates and location Removed sentence '

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

strBody = strBody &"<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td><b>RRP Total</b></td><td align=""right"">"&currency1&""&rqtotalActualPrice&"</td></tr><tr><td><b>Discount Total</b></td><td align=""right"">"&currency1&""&rqtotalDiscount&"</td></tr><tr><td><b>SubTotal</b></td><td align=""right"">"&currency1&""&rqtotalsellingPrice&"</td></tr><tr><td><b>VAT</b></td><td align=""right"">"&currency1&""&rqtax&"</td></tr><tr><td><b>Shipping Charges</b></td><td align=""right"">"&currency1&""&add&"</td></tr></table></div><div style=""background-color: #efefef; margin-top: 4px; border: 1px solid #bfbfbf; padding: 3px; height: 20px; width: 157px;""><table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td>Total</td><td style=""text-align:right;"">"&currency1&""&rqtotalAmount&"</td></tr></table></div></div></div>"

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
	 urls="http://www.projstudy.com/Quotewerks/POgeneratedReport.asp?quoteid="&quoteid
	   rs.Close
	   
strBody = strBody &"<ul><li><a href=""http://www.projstudy.com/Quotewerks/QW_PDF/DTQQ1007.5-8.pdf"" target=""_blank"">About Datrix</a></li></ul></td></tr></table>"

strBody = strBody &"<table><tr><td>Please click <a href="&urls&"><input type=""button"" value=""I Accept""/></a> to place a purchase order.</td></tr></table><table><tr><td>If the 'I Accept' button is not working, please reply to this email with ""I Agree""  in the subject line.</td></tr><tr><td><input type=""hidden""  name=""officialemailid"" value="&rqofficialemailid&"><input type=""hidden""  name=""Userid"" value="&Session("QWUserName")&"><input type=""hidden"" name=""quoteId"" value="& quoteid &"></td></tr></table>"

strBody = strBody & "<table><tr><td align=""left""><br><font face=""Arial"" size=2>Best Regards,</font></td></tr>"
strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=2><br>"& rqfirstname&"&nbsp;"& rqlastname&" <br />"&rqofficialemailid&" <br />"&rqphoneno&" </td></font></td></tr></table>"
    'added by Saubhik
    session("body")=strBody
    
iMode = 2
dim file_name
'file_name=QuoteId&".html"
file_name="abc121.html"
 dim fs71,fo,fo79,fo1
   
'set fs71=Server.CreateObject("Scripting.FileSystemObject") 
'fo=Server.Mappath("~/pdf_product/")

'Set fo1=fs71.GetFolder("c:\")
'response.write("ll"&fo)
'set fo79=fs71.CreateTextFile(Server.Mappath(file_name),True)
'set fo79=fs71.OpenTextFile("C:\Test1.txt",8,true)

'fo79.write(strBody4)

'fo79.close
'response.Write(strBody)

'response.Write(strBody)


'Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
'objCDOMail.From = "operations@datrixtraining.com"
'objCDOMail.From = "<" & rqofficialemailid & ">"
'objCDOMail.To =  ""&Session("email1")&""
'objCDOMail.cc = "edusyssaubhik@gmail.com,edusyssidhardha@gmail.com,edusyssavita@gmail.com,edusysayan@gmail.com"
'objCDOMail.Importance = 2
'objCDOMail.Subject = "Quotation from Datrix"
'objCDOMail.BodyFormat = 0
'objCDOMail.MailFormat = 0
'objCDOMail.Body =  strBody
'objCDOMail.Send
'Set objCDOMail = Nothing






If redirecturl <> "" Then
Session("quote") = ""

Response.Redirect(redirecturl)
End If

%>
<!--<table align="center"><tr>
  
    <td width = "35%"><button type="button" name="Type"  value="Save as PDF" onClick="javascript:window.print()">Save as PDF/Print</button></td>
         <!--<td width = "35%"><button type="button" name="Type"  value="Print" >Print</button></td>
  </tr></table>-->
    <form action="QuotegeneratedReport.asp" method="post" > 
         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftNavigation" >
   
   
 
  <td width="730" align="center" valign="top" height="450px">
  
      <%
      ' added by Saubhik
      dim st1
      if request.form("add_tag")<>"" then
      st1=request.form("add_tag")
      else
      st1="Dear "& Session("sold_name1")&",<BR><BR>Greetings from Datrix Training! <BR><BR>Please find below the quotation as requested by you."
      end if 
      %>
      Edit your Mail <textarea name="add_tag" rows="20" style="height: 92px; width: 790px"><%=st1 %></textarea>
  
     <div id="quote-container" >
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
    <td style="text-align:right; padding-top:6px;" class="auto-style1"><b>Quote Number</b></td>
    <td style="text-align:right; padding-top:6px;" class="auto-style1"><b><% =quoteno %></b></td>
  </tr>
  <tr>
    <td style="text-align:right; padding-top:6px;"><b>Date</b></td>
    <td style="text-align:right; padding-top:6px;"><b><% =MonthName(Month(rqcreatedate),3) & " " & DAY(rqcreatedate) & ", "  & YEAR(rqcreatedate)%></b></td>
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
    <td valign="top">
 <% =Session("sold_name1") %><br /> <% =Session("email1") %><br />
 <% =Session("SoldAddress")  %><br />   

       Phone:  <%=Session("ph1")%> </td>
  
   
    <td valign="top">
<% =Session("ship_name1") %><br /><% =Session("email2") %><br />
<% =Session("ShipAddress")  %><br />      Phone:<%=Session("ph2")%>  <br /> </td>

    <td valign="top" class="small-text"><b>To accept this quotation, please tick
    required line items, enter a PO number,
    sign & date below and return.</b><br /><br />
    
    <b>Please email us if your organisation does
    not use PO numbers.</b></td>
   <td valign="top" align="left"><div style="height: 112px"><div style="float:left; width: 75px; height: 89px;"><img src="UserImage/<%=id1 %>/<%=id1 %>_image.jpg" style="height: 97px; width: 78px" /></div><div style="float:right; height: 93px">
          
            <b><% = rqfirstname%>&nbsp;<%= rqlastname%></b> <br /><br /> <b><% =rqofficialemailid %></b> <br /><br /> <b><% =rqphoneno %> </b><br /><br />
            <img src="UserSign/<%=id1 %>/<%=id1 %>_sign.jpg" style="width: 108px; height: 30px" /></div></div></td>
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
'	Dim item_id,sql1
		   item_id=""
'	       dim  SrNo,id,code 
		   SrNo=1
       Set Rs6  = Server.CreateObject("ADODB.Recordset")
        Set Rs7 = Server.CreateObject("ADODB.Recordset")
       Set Rs8 = Server.CreateObject("ADODB.Recordset")
            
 '          dim city,st,ed,currency1
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
			 
			 
			  'newly aaded calculation of rrp,dis
		 add=CDBL(CDBL(add)+CDbl(arrAllUsers(14,rowcounter)))
		 
          x=CDbl(arrAllUsers(7,rowcounter))
         rrp=CDbl(arrAllUsers(8,rowcounter))
        discount=CDbl(arrAllUsers(10,rowcounter))
         unit=CDbl(arrAllUsers(11,rowcounter))
         rrp1=FormatNumber(CDbl(rrp/x),2)
         dis1=FormatNumber(CDbl(discount/x),2)
         unit1=FormatNumber(CDbl(unit/x),2)
        	 
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
            response.Write(id)
            strq="select b.city ci,b.startdate st,b.enddate ed from datrixClasses b  where b.courseid="&id&""
           'response.Write(strq)
            Rs6.Open strq,ConnObj

	 If Not Rs6.EOF Then
            city=Rs6("ci")
            st=Rs6("st")
           ed=Rs6("ed")
            %>
        <%=st %> &nbsp; to &nbsp <%'=ed %>
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
    <td valign="top" width="63" align="center"><%if city<>"" then %><%=city %> <%else %>N/A <% end if  
      
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
   <td valign="top" width="41" align="center"><%=currency1%><% = rrp1 %></td>
    <td valign="top" width="49" align="center"><%=currency1%><% = dis1 %></td>
    <td valign="top" width="41" align="center"><%=currency1%><% = unit1 %></td>
    <td valign="top" width="49" align="center"><%=currency1%><% = arrAllUsers(11,rowcounter) %></td>

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
    <tr>
    <td><b>Total Shipping Charge</b></td>
    <td align="right"><%=currency1%><%=add%></td>
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
  <div id="quote-middle" style="margin-top: -50px;">
     
         &nbsp;    &nbsp;  
     
  <input type="button" name="I accept" value="I Accept" style="width:200px;"/></div>
  <br /><br />
  
 
 
 <div id="quote-footer">
 We accept all major credit and debit cards for payment. Head office: N1 CBTC, Euxton Lane, Chorley, Lans PR7 6TE Post Sales line: 01772 623467 Email: sales@datrixtraining.com Sales line: 0800 781 0626
Our terms of business can be viewed at:<a href="#">http://www.datrixtraining.com/about/terms/</a> Datrix Training Limited - Company number 4344412
   
  <div id="quote-footer-left">
     Created on 02/22/13 18:06:13 by QuoteWerks
  </div>
  
  <div id="quote-footer-right">
<br />
  </div>
 

 </div>
 

 
 
 
 </div>
</div>     
    </td>     
    </tr>
 </table>
    <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" name="preview" value="Show Preview" /></div>
   <%
 %>
<% End If %>
    </form>
   
    <%
               '<table width=""600px"" border=""0""><tr height=""30px""><td><font face=""Arial"" size=2>Dear "&Session("sold_name1")&",<BR><BR>Greetings from Datrix Training! <BR><BR>Please find below the quotation as requested by you.
        if request.form("preview")="Show Preview" then
   
           %>
     <script>
        var y='<%=Session("quote") %>'
        var x='View'
        var z='<%=Session("QWUserName") %>'
        call_createPDF(x,y,z);
    </script>
    
    <form action="QuotegeneratedReport.asp" method="post"  >   
       
                      <%
       
      '  tag_add="<table width=""600px"" border=""0""><tr height=""30px""><td><font face=""Arial"" size=""2"">"&request.QueryString("add_tag")&"</font>"
         session("tag")="<table width=""600px"" border=""0""><tr height=""30px""><td><font face=""Arial"" size=""2"">"&request.form("add_tag")&""
         response.Write("<table width=""600px"" border=""0""><tr height=""30px""><td><font face=""Arial"" size=2>"& request.form("add_tag")&"<br>")
         response.Write(session("body"))
        %>
   <center><input type="submit" name="send" value="Send mail" /></center>
     </form>
        <%
        end if

       
    %>
    <%
         if request.Form("send")="Send mail" then
        %>
    <%
        'create a file

         body_mail= session("tag")&"<br>"&session("body")
      '  response.Write(request.Form("tag_add"))
        response.Write(body_mail)     
       ' response.Redirect("create_pdf1.aspx")     
Set myMail= Server.CreateObject("CDO.Message")
'myMail.From = "operations@datrixtraining.com"
'myMail.From = "edusysayan@gmail.com"

myMail.From = "" & rqofficialemailid & ""
'myMail.From = "operations@datrixtraining.com"
myMail.To =  ""&Session("email1")&",edusyssaubhik@gmail.com"

'myMail.Cc = "edusyssaubhik@gmail.com,edusyssidhardha@gmail.com,edusyssavita@gmail.com,edusysayan@gmail.com"
myMail.Cc = "operations@datrixtraining.com" 
myMail.Subject = "Quotation from Datrix"
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
myMail.AddAttachment server.MapPath("/Quotewerks/Cerpdf/"&Session("quote")&"_View.pdf")
myMail.Send
set myMail=nothing

        Session("Message") = "Email Sent Successfully"
        quoteId=Session("quote")
  Session("quote") = ""
  response.Write(str)
 Session("qid_edit")=""
        
        session("tag")=""
        session("body")=""                                 
response.Redirect("home.asp") 
        
        end if
         %>
</Body>
<!-- Body Ends -->
