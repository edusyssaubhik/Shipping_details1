<!--#include virtual="/QuoteWerks/includes/header.asp"-->
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script>
function load_update(x)
{
window.location="Edit-Category-Item.asp?qid="+x;
}
function abc()
{
window.location="/QuoteWerks/QuotegeneratedReport.asp"
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
Dim rqAction ,rqCountry,rqWebsite,cid
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

'rqId = Request.QueryString("rqquoteId")

If Request.Form("id") <> "" Then
	rqId = Request.Form("id")
Else
	rqId = Request.QueryString("id")
End If

'response.Write("Test"&id)

if rqId  <> "" then
'response.Write("test1")
strEmpDet = "SELECT * FROM QW_QuoteOverview  where quoteId = '"&rqId&"' and userId = '"&Session("QWUserName")&"' order by versionNo desc "

strEmpDet1 = "SELECT * FROM QW_QuoteDetails where quoteId = '"&rqId&"' Order By orderid desc "
'response.Write(strEmpDet)
else
strEmpDet ="select top 1 * from QW_QuoteOverview  where  userId = '"&Session("QWUserName")&"' Order By quoteId desc"

strEmpDet1 = "SELECT * FROM QW_QuoteDetails a where a.quoteId =(select top 1 b.quoteId from QW_QuoteOverview b  where  b.userId = '"&Session("QWUserName")&"' Order By b.quoteId desc) Order By orderid desc "

'response.Write(strEmpDet)
end if
objRs2.Open strEmpDet, ConnObj

  Do Until objRs2.EOF 
          cid=objRs2("countryId") 
          rqtotalAmount = objRs2("totalAmount") 
		  rqtax = objRs2("tax")
		  rqtotalsellingPrice = objRs2("totalsellingPrice")
		  rqtotalActualPrice =objRs2("totalActualPrice")
          rqtotalDiscount=objRs2("totalDiscount")
		  rqsoldtoAddress=objRs2("soldtoAddress")
		  rqshiptoAddress= objRs2("shiptoAddress")
		  
		  'response.Write(rqsoldtoAddress)
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

'response.Write(strEmpDet)
objRs1.Open strEmpDet1, ConnObj

 while Not objRs1.EOF 
	   arrAllUsers = objRs1.getrows
	  cnt = 1
     wend

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
<script language ="JavaScript" type="text/javascript">

    function enableAll(element) {
        var isChecked = element.checked;

    }
    // Function To Validate Fields And Display An Alert Message If Any Field Is Empty.

    function validate_required(field, alerttxt) {
        with (field) {
            if (field.value == "")
            { alert(alerttxt); return false }
            else { return true }
        }
    }
    function validate_form(thisform) {
        with (thisform) {
            //Check To See If The UserId Field Is Balnk   

            if (validate_required(txtwebsite, "Please select Website") == false)
            { txtwebsite.focus(); return false }
            if (validate_required(txtcountry, "Please select Country") == false)
            { txtcountry.focus(); return false }
        }
    }


</script>

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
  
  <% 'Editing Item Details'
       
If rqAction = "Edit" Then 
    dim currency1
'Response.Write("Under Construction")
     Set Rs8 = Server.CreateObject("ADODB.Recordset")
       if cid<>"" then 
      
        str87="select * from QW_CountryDetail where countryId="&cid&""
        response.Write(str87)
           Rs8.Open str87,ConnObj
            If Not Rs8.EOF Then
           currency1=Rs8("currency")
            end if
           Rs8.Close
     response.Write(currency1)
       end if
		

      
      %>
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
			' For rowcounter = firstRow To lastRow 
			 
		  %>
  <tr>
    <td style="text-align:right; padding-top:6px;"><b>Number</b></td>
    <td style="text-align:right; padding-top:6px;"><b><% = arrAllUsers(1,rowcounter) %></b></td>
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
  <%
     dim arr1,arr2
	 arr1=Split(rqsoldtoAddress,"!")
	 arr2=Split(rqshiptoAddress,"!")
	 
  %>
   <tr>
    <td valign="top"><%=arr1(0) %><br /><%=arr1(1) %><br /><%=arr1(2) %><br /><%=arr1(3) %> <br />  <br />  Phone: <%=arr1(4) %><br />Fax :<%=arr1(5) %> <br /> </td>
    <td valign="top"><%=arr2(0) %><br /><%=arr2(1) %><br /><%=arr2(2) %><br /><%=arr1(3) %><br />   <br /> Phone: <%=arr2(4) %><br />Fax  :<%=arr2(5) %> <br /> </td>
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
    <td valign="top" width="41" class="title-border" align="center" height="20"><b>RRP <%=currency1 %> </b></td>
    <td valign="top" width="49" class="title-border" align="center" height="20"><b>Discount</b></td>
    <td valign="top" width="41" class="title-border" align="center" height="20"><b>Unit <%=currency1 %></b></td>
    <td valign="top" width="49" class="title-border" align="center" height="20"><b>Total</b></td>
  </tr>
    <% 
			 For rowcounter = firstRow To lastRow 
			 SrNo = 1
			 
		  %>
  <tr>
    <td valign="top" width="24" class="title-border" >&nbsp;</td>
    <td valign="top" width="33" align="center"><% = SrNo %></td>
    <td valign="top" width="38" align="center"><% = arrAllUsers(7,rowcounter) %></td>
    <td valign="top" width="63" align="center" ><% = arrAllUsers(4,rowcounter) %></td>
    <td valign="top" width="344" align="center"><% = arrAllUsers(3,rowcounter) %></td>
    <td valign="top" width="53">&nbsp;</td>
    <td valign="top" width="63">&nbsp;</td>
    <td valign="top" width="30" align="center">5</td>
    <td valign="top" width="41" align="center"><%=currency1 %><% = arrAllUsers(8,rowcounter) %></td>
    <td valign="top" width="49" align="center"><%=currency1 %><% = arrAllUsers(10,rowcounter) %></td>
    <td valign="top" width="41" align="center"><%=currency1 %><% = arrAllUsers(11,rowcounter) %></td>
    <td valign="top" width="49" align="center"><%=currency1 %><% = arrAllUsers(12,rowcounter) %></td>

  </tr>
  <% 
   SrNo = SrNo + 1
  Next
  %> 
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
   
 </div>
 
 
 
 
 
 
 
 </div>
</div>

<div style="float:center">
 <button type="submit" name="type" value="Add"  onClick="return load_update(<%=rqId%>);">Edit</button>
  </div>


<% 'View category Details'
ElseIf rqAction = "View" Then 
rqId = Request.QueryString("id")
    ' dim currency1
'Response.Write("Under Construction")
     Set Rs8 = Server.CreateObject("ADODB.Recordset")
       if cid<>"" then 
      
        str87="select * from QW_CountryDetail where countryId="&cid&""
       
    ' response.Write(str87)
           Rs8.Open str87,ConnObj
            If Not Rs8.EOF Then
           currency1=Rs8("currency")
            end if
           Rs8.Close
		end if

     
%>
  
  
     <div id="Div1">
<div id="Div2">
  <div id="Div3">
     <table width="100%" border="0" cellspacing="0" cellpadding="0" height="65px">
         <tr>
           <td width="210px" valign="top"><img src="/QuoteWerks/images/logo.jpg" /></td>
           <td width="420px" valign="top">N1 Chorley Business & Technology Centre Euxton Lane, Chorley PR7 6TE</br> Phone: 0800 7810626 Fax: 01257           270478</td>
           <td valign="top"><img src="/QuoteWerks/images/quote.jpg" align="right"/>
             <table width="100%" border="0" cellspacing="0" cellpadding="0">
             
               <% 
			' For rowcounter = firstRow To lastRow 
			 
		  %>
  <tr>
    <td style="text-align:right; padding-top:6px;"><b>Number</b></td>
    <td style="text-align:right; padding-top:6px;"><b><% = arrAllUsers(1,rowcounter) %></b></td>
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
  




  <div id="Div4">
     <table width="100%" border="0" cellspacing="6" cellpadding="0" height="170px">
  <tr>
    <td valign="top" class="titlebackground" width="226" height="18">Sold To</td>
    <td valign="top" class="titlebackground" width="226" height="18">Ship To</td>
    <td valign="top" width="226">&nbsp;</td>
    <td valign="top" class="titlebackground" width="226">Your Account Manager</td>
  </tr>
  	 <%
     'dim arr1,arr2
	 arr1=Split(rqsoldtoAddress,"!")
	 arr2=Split(rqshiptoAddress,"!")
	 
  %>
   <tr>
    <td valign="top"><%=arr1(0) %><br /><%=arr1(1) %><br /><%=arr1(2) %><br /><%=arr1(3) %> <br />  <br />  Phone: <%=arr1(4) %><br />Fax  :<%=arr1(5) %> <br /> </td>
    <td valign="top"><%=arr2(0) %><br /><%=arr2(1) %><br /><%=arr2(2) %><br /><%=arr1(3) %><br />   <br /> Phone: <%=arr2(4) %><br />Fax  :<%=arr2(5) %> <br /> </td>
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
  
  
<div id="Div5">
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
    <td valign="top" width="41" class="title-border" align="center" height="20"><b>RRP <%=currency1 %> </b></td>
    <td valign="top" width="49" class="title-border" align="center" height="20"><b>Discount</b></td>
    <td valign="top" width="41" class="title-border" align="center" height="20"><b>Unit <%=currency1 %></b></td>
    <td valign="top" width="49" class="title-border" align="center" height="20"><b>Total</b></td>
  </tr>
    <% 
			 For rowcounter = firstRow To lastRow 
			 SrNo = 1
			 
		  %>
  <tr>
    <td valign="top" width="24" class="title-border" >&nbsp;</td>
    <td valign="top" width="33" align="center"><% = SrNo %></td>
    <td valign="top" width="38" align="center"><% = arrAllUsers(7,rowcounter) %></td>
    <td valign="top" width="63" align="center" ><% = arrAllUsers(4,rowcounter) %></td>
    <td valign="top" width="344" align="center"><% = arrAllUsers(3,rowcounter) %></td>
    <td valign="top" width="53">&nbsp;</td>
    <td valign="top" width="63">&nbsp;</td>
    <td valign="top" width="30" align="center">5</td>
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
 
 
 <div id="Div6">
   <div id="Div7">
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
   
    <div id="Div8">
      <div class="quote-box">
        <b>Please note: discounts are applied
assuming prompt payment and will be
removed from overdue invoices.</b>
      </div>
   </div>
   
    <div id="Div9">
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
 
 
 <div id="Div10">
 We accept all major credit and debit cards for payment. Head office: N1 CBTC, Euxton Lane, Chorley, Lans PR7 6TE Post Sales line: 01772 623467 Email: sales@datrixtraining.com Sales line: 0800 781 0626
Our terms of business can be viewed at:<a href="#">http://www.datrixtraining.com/about/terms/</a> Datrix Training Limited - Company number 4344412
   
 

 </div>
 
 
 
 
 
 
 
 </div>
</div>

<%  'Display the Table'
end if
%>