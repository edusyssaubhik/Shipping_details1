
<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/QuoteWerks/includes/header.asp"-->
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<script>
/*var pdf = new PDFObject({
  url: "http://projstudy.com/Quotewerks/QW_PDF/DTQQ1007.5-8.pdf",
  id: "pdfRendered",
  pdfOpenParams: {
    view: "FitH"
  }
}).embed("pdfRenderer");*/
function abc()

{
	window.open("/QuoteWerks/edit_QuotegeneratedReport.asp")
//window.location="/QuoteWerks/edit_QuotegeneratedReport.asp"
}
function load_backup()
  {
  //take_backup();
   var x=document.getElementById("id3").value
  var form = document.createElement("form");
 form.setAttribute("method", "post"); 
form.setAttribute("action", "Edit_Category_Item1.asp");

// setting form target to a window named 'formresult'
//form.setAttribute("target", "formresult");

var hiddenField = document.createElement("input");              
hiddenField.setAttribute("type", "hidden");
hiddenField.setAttribute("name", "ids");
hiddenField.setAttribute("value", x);
form.appendChild(hiddenField);
document.body.appendChild(form);
form.submit();
  
  // window.location="Category-Items.asp?ids="+x;
   //return true;
  //history.go(-1);
  //history.back();
  //return false;
  
  }


function generateBack()

{
window.location="/QuoteWerks/shippingAddress.asp"
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
Dim hb_website,x1

message = Session("message")
Session("message") = ""
   
'Creating the Recordset objects'
SET objRs1 = Server.CreateObject("ADODB.Recordset")
SET objRs2 = Server.CreateObject("ADODB.Recordset")
	
'Retrive the values from this page'
rqAction = Request.QueryString("action")
rqRow  = Request.QueryString("row")
rqPage = Request.QueryString("page")

if Session("new_quoteid") <>"" then
x1=Session("new_quoteid")
strEmpDet = "SELECT * FROM QW_QuoteOverview  where userId = '"&Session("QWUserName")&"' and quoteId = '"&x1&"' "

strEmpDet1 = "SELECT * FROM QW_QuoteDetails where quoteId = '"&x1&"' Order By orderid desc "
'response.Write(strEmpDet1)
'else
'strEmpDet ="select top 1 * from QW_QuoteOverview  where  userId = '"&Session("QWUserName")&"' Order By quoteId desc"

'strEmpDet1 = "SELECT * FROM QW_QuoteDetails a where a.quoteId =(select top 1 b.quoteId from QW_QuoteOverview b  where  b.userId = '"&Session("QWUserName")&"' Order By b.quoteId desc) Order By orderid desc "

end if
objRs2.Open strEmpDet, ConnObj
'response.Write(strEmpDet)
  
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


strEmpDet = "SELECT * FROM users where userId = '"&Session("QWUserName")&"' "

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

%>
<%

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "''")
End Function

'Response.Write(rqProspectName)
%>


<link href="/QuoteWerks/css/leftNavi.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/form.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/mainContent.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/QuoteWerks/css/Styles.css">

</head>
<!-- Body Starts -->
<body>

<body style="margin-top:0px">

<tr>
  <td width="170px" align="left" valign="top" style=" border-right:#CCC thin solid;"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftNavigation" >
      <!--#include virtual="/QuoteWerks/includes/LeftMenu.asp"-->
    </table></td>
  <td width="730" align="center" valign="top" height="450px">
  
  <div id="styledForm" class="myform">
  
  <br><p><b>Generated Quote</b></p>
  
  
     <div id="quote-container">
<div id="quote-wrapper">
  <div id="quote-header">
     <table width="100%" border="0" cellspacing="0" cellpadding="0" height="65px">
         <tr>
           <td width="210px" valign="top"><img src="/QuoteWerks/images/logo.jpg" /></td>
           <td width="420px" valign="top">N1 Chorley Business & Technology Centre Euxton Lane, Chorley PR7 6TE</br> Phone: 0800 7810626 Fax: 01257           270478</td>
           <td valign="top"><img src="/QuoteWerks/images/quote.jpg" align="right"/>
             <table width="100%" border="0" cellspacing="0" cellpadding="0">
             
               <% 
			 'For rowcounter = firstRow To lastRow 
			 
		  %>
  <tr>
    <td style="text-align:right; padding-top:6px;"><b>Quote Number
                                                   </b></td>
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
    <td valign="top" width="30" class="title-border" align="center" height="20"><b>Days</b></td>
    <td valign="top" width="41" class="title-border" align="center" height="20"><b>RRP <%=currency1 %> </b></td>
    <td valign="top" width="49" class="title-border" align="center" height="20"><b>Discount</b></td>
    <td valign="top" width="41" class="title-border" align="center" height="20"><b>Unit <%=currency1 %></b></td>
    <td valign="top" width="49" class="title-border" align="center" height="20"><b>Total</b></td>
  </tr>
    <% 
	'Dim item_id,sql1
		   'item_id=""
	       dim  SrNo,id,code 
		   SrNo=1
        Set Rs6  = Server.CreateObject("ADODB.Recordset")
        Set Rs7 = Server.CreateObject("ADODB.Recordset")
        Set Rs8 = Server.CreateObject("ADODB.Recordset")
            
           dim city,st,ed,currency1
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
       dim x,rrp,discount,unit,rrp1,dis1,unit1
          x=CDbl(arrAllUsers(7,rowcounter))
         rrp=CDbl(arrAllUsers(8,rowcounter))
        discount=CDbl(arrAllUsers(10,rowcounter))
         unit=CDbl(arrAllUsers(11,rowcounter))
         rrp1=CDbl(rrp/x)
         dis1=CDbl(discount/x)
         unit1=CDbl(unit/x)
			 
			 
        	'item_id=item_id &"'"&arrAllUsers(4,rowcounter)&"',"
		  %>
  <tr>
    <td valign="top" width="24" class="title-border" >&nbsp;</td>
    <td valign="top" width="33" align="center"><% = SrNo %></td>
    <td valign="top" width="38" align="center"><% = arrAllUsers(7,rowcounter) %></td>
    <td valign="top" width="63" align="center" ><% = arrAllUsers(4,rowcounter) %></td>
    <td valign="top" width="344" align="center"><% = arrAllUsers(3,rowcounter) %></td>
      
   <!-- <td valign="top" width="53" align="center">
        <%' if id ="0" then %>
            N/A
        <% 'else if id <> "" then 
           ' response.Write(id)
            ' strq="select b.city ci,b.startdate st,b.enddate ed from course b  where b.courseid="&id&""
          '  response.Write(strq)
            'Rs6.Open strq,ConnObj

	'  If Not Rs6.EOF Then
       '     city=Rs6("ci")
       '     st=Rs6("st")
       '     ed=Rs6("ed")
            %>
        <%'=st %> &nbsp; to &nbsp <%'=ed %>
        <%
     '   end if 
      '  Rs6.Close
     '  else if id="" then 
        %>
        N/A
        <% ' end if 
            'end if 
            'end if 
            %>
    </td>
    <td valign="top" width="63" align="center"><% 'if city<>"" then %><%'=city %> <%'else %>N/A <% 'end if  
      
         ' city=""%></td>
    <td valign="top" width="30" align="center">
        <%
            

          '  strq1="select CustomNumber01 a from QW_Category  where  ManufacturerPartNumber='"&code&"'"
          '  response.Write(strq)
           ' Rs7.Open strq1,ConnObj

	 ' If Not Rs7.EOF Then
           
             %>
       <%'=Rs7("a") %>
         <%
         'end if 
      '  Rs7.Close
                     
                        
             %>
         </td>-->
    <td valign="top" width="41" align="center"><%=currency1%><% = rrp1 %></td>
    <td valign="top" width="49" align="center"><%=currency1%><% = dis1 %></td>
    <td valign="top" width="41" align="center"><%=currency1%><% = unit1 %></td>
    <td valign="top" width="49" align="center"><%=currency1%><% = arrAllUsers(11,rowcounter) %></td>

  </tr>
  <% 
   SrNo = SrNo + 1
   
  Next
 ' if item_id<>"" then
'  item_id=Left(item_id,Len(item_id)-1)
'  end if
  %> 


   
</table>
 
 
</div> 
 
 
 <div id="quote-lowerbody">
   <div id="quote-left">
<input type="hidden"  id="id3" value="<%=item_id %>" />
   
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
 
 
 <div id="quote-footer">
 We accept all major credit and debit cards for payment. Head office: N1 CBTC, Euxton Lane, Chorley, Lans PR7 6TE Post Sales line: 01772 623467 Email: sales@datrixtraining.com Sales line: 0800 781 0626
Our terms of business can be viewed at:<a href="#">http://www.datrixtraining.com/about/terms/</a> Datrix Training Limited - Company number 4344412
   
 </div>
 
 
 
 </div>
</div>





<table>
<tr><br></tr>
 <tr>
      
     <!-- <td width = "45%"><button type="submit" name="type" value="Back" onClick="load_backup()">Back</button></td>-->
      <td width = "45%"><button type="submit" name="type" value="Submit" onClick="abc()">Submit</button></td>
         <!--<td width = "35%"><button type="button" name="Type"  value="Save as PDF">Save as PDF</button></td>
          <td width = "35%"><button type="button" name="Type"  value="Print" onClick="javascript:window.print()">Print</button></td>-->
    </tr>
 </table>
   </div></td>
<div id="pdfRenderer"></div>
</tr>
</table>
<% End If %>

</Body>
<!-- Body Ends -->
