<!--#include virtual="/QuoteWerks/includes/header.asp"-->
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<% 
'If not Session("userName") then redirect to  login page'
	If Session("QWUserName") = "" Then 
		Response.Redirect("default.asp")
	Else
	
%>
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
'======================================================='
'Written By : savita'
'Created Date : 28/02/2013'
'Description :'
'This page is for generating the quote '
'======================================================='
%>
<%
'Declaring variables
Dim rqAction ,rqCountry,rqWebsite,cid,quoteno
Dim rqId,arrAllcountries,objRs2,objRs3,objRs4
Dim arrAllEmpDet, firstRow, lastRow, numRows, rqRow, rqPage
Dim message,strquery1
Dim hb_website
Dim id,code

message = Session("message")
Session("message") = ""
   
'Creating the Recordset objects'
SET objRs1 = Server.CreateObject("ADODB.Recordset")
SET objRs2 = Server.CreateObject("ADODB.Recordset")
Set Rs6 = Server.CreateObject("ADODB.Recordset")
Set Rs7 = Server.CreateObject("ADODB.Recordset")
Set Rs8 = Server.CreateObject("ADODB.Recordset")
	
'Retrive the values from this page'
rqAction = Request.QueryString("action")
rqRow  = Request.QueryString("row")
rqPage = Request.QueryString("page")

If Session("Message") <> "" Then
Message = Session("Message")
Session("Message") = "" 
End IF

'rqId = Request.QueryString("rqquoteId")

If Request.Form("id") <> "" Then
	rqId = Request.Form("id")
ElseIf Request.QueryString("id") <> "" Then
	rqId = Request.QueryString("id")
End If

'response.Write("Test"&id)

if rqId  <> ""  then
'response.Write("test1")
strEmpDet = "SELECT * FROM QW_QuoteOverview  where quoteId = '"&rqId&"' and userId = '"&Session("QWUserName")&"' order by versionNo desc "

strEmpDet1 = "SELECT * FROM QW_QuoteDetails where quoteId = '"&rqId&"' Order By orderid desc "
'response.Write(strEmpDet)


'response.Write(strEmpDet)

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
		  rqPONumber = objRs2("PONumber")
		  
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

'response.Write(Session("QWUserName")&"<br>"&strEmpDet1)
objRs1.Open strEmpDet1, ConnObj

 If Not objRs1.EOF Then
	   arrAllUsers = objRs1.getrows
	   firstRow = 0
		lastRow = 9
		numRows = Ubound(arrAllUsers,2)
		If lastRow > numRows Then
		   lastRow = numRows
		End If
		
		allNumRows = numRows
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
        str87="select * from QW_CountryDetail where countryId="&cid&""
        'response.Write(str87)
           Rs8.Open str87,ConnObj
            If Not Rs8.EOF Then
           currency1=Rs8("currency")
            end if
            Rs8.Close

%>
<%
   end if

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "''")
End Function

'Response.Write(rqProspectName)
%>
<script language ="JavaScript" type="text/javascript">

function enableAll(element)
{
var isChecked=element.checked;

}
// Function To Validate Fields And Display An Alert Message If Any Field Is Empty.

function validate_required(field,alerttxt)
{
    with (field)
    {
        if (field.value=="")
          {alert(alerttxt);return false}
        else {return true}
    }
}
function validate_form(thisform)
{
    with (thisform)
    {
        //Check To See If The UserId Field Is Balnk   
      
         if (validate_required(txtwebsite,"Please select Website")==false)
              {txtwebsite.focus();return false}
        if (validate_required(txtcountry,"Please select Country")==false)
              {txtcountry.focus();return false}
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
  <span style="color:red;"> <% = Message %></span>
  <div id="styledForm" class="myform">
  
  <br><p><b>Generated Quote</b></p>
  
  <%  
  'Editing Item Details'
If rqAction = "Edit" Then 
  '  dim currency1
'Response.Write("Under Construction")
     Set Rs8 = Server.CreateObject("ADODB.Recordset")
       if cid<>"" then 
      
        str87="select * from QW_CountryDetail where countryId="&cid&""
   '     response.Write(str87)
           Rs8.Open str87,ConnObj
            If Not Rs8.EOF Then
           currency1=Rs8("currency")
            end if
           Rs8.Close
    ' response.Write(currency1)
       end if

'Response.Write("Under Construction")%>


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
    <td style="text-align:right; padding-top:6px;"><b>Quote Number</b></td>
    <td style="text-align:right; padding-top:6px;"><b><%=quoteno %></b></td>
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
    <td width="150px"></td>
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
         id=arrAllUsers(22,rowcounter)
       ' response.Write("id"&id)
		     code=arrAllUsers(4,rowcounter)
			 
		  %>
  <tr>
    <td valign="top" width="24" class="title-border" >&nbsp;</td>
    <td valign="top" width="33" align="center"><% = SrNo %></td>
    <td valign="top" width="38" align="center"><% = arrAllUsers(7,rowcounter) %></td>
    <td valign="top" width="63" align="center" ><% = arrAllUsers(4,rowcounter) %></td>
    <td valign="top" width="344" align="center"><% = arrAllUsers(3,rowcounter) %></td>
<td valign="top" width="53" align="center">
        <%
             if id ="0" then %>
            N/A
        <% else if id <> "" then 
           ' response.Write(id)
             strq="select b.city ci,b.startdate st,b.enddate ed from course b  where b.courseid="&id&""
           'response.Write(strq)
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
       else 
        %>
    
        N/A
        <%   
            end if 
            end if 
            %>
    </td>
    <td valign="top" width="63" align="center"><% if city<>"" then %><%=city %> <%else %>N/A <% end if  
      
           city=""
           id=""%></td>
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
ElseIf rqAction = "View" or rqAction = "View_PO" or rqAction = "View_IS"  Then 
rqId = Request.QueryString("id")
  '  dim currency1
'Response.Write("Under Construction")
     Set Rs8 = Server.CreateObject("ADODB.Recordset")
       if cid<>"" then 
       str87="select * from QW_CountryDetail where countryId="&cid&""
      '  response.Write(str87)
           Rs8.Open str87,ConnObj
            If Not Rs8.EOF Then
           currency1=Rs8("currency")
            end if
           Rs8.Close
    ' response.Write(currency1)
       end if

%>
  
  
     <div id="quote-container">
<div id="quote-wrapper">
  <div id="quote-header">
     <table width="100%" border="0" cellspacing="0" cellpadding="0" height="65px">
         <tr>
           <td width="210px" valign="top"><img src="/QuoteWerks/images/logo.jpg" /></td>
           <td width="420px" valign="top">N1 Chorley Business & Technology Centre Euxton Lane, Chorley PR7 6TE</br> Phone: 0800 7810626 Fax: 01257           270478</td>
           <td valign="top">
               <% 
                     if  rqAction = "View" then
                    %>
                   <img src="/QuoteWerks/images/quote.jpg" align="right"/>
                   <%
                       else if rqAction = "View_PO" then
                        %>
                 <img src="/QuoteWerks/images/po-received.jpg" align="right"/>
               <%
                       else if rqAction = "View_IS" then
                        %>
                 <img src="/QuoteWerks/images/invoice.jpg" align="right"/>
                   <%
                       end if
                       end if 
                       end if
                        %>
                    
             <table width="100%" border="0" cellspacing="0" cellpadding="0">
             
               <% 
			' For rowcounter = firstRow To lastRow 
			 
		  %>
  <tr>
    <td style="text-align:right; padding-top:6px;"><b>Quote Number</b></td>
    <td style="text-align:right; padding-top:6px;"><b><% =quoteno%></b></td>
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
    <td width="150px"><% If rqAction = "View_PO" or rqAction = "View_IS" Then %> <% = rqPONumber %> <% Else %> &nbsp; <% End If %></td>
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
       id=""
       code="" 
   '      
            
			 For rowcounter = firstRow To lastRow 
			 SrNo = 1
         id=arrAllUsers(22,rowcounter)
        code=arrAllUsers(4,rowcounter)
			 
		  %>
  <tr>
    <td valign="top" width="24" class="title-border" >&nbsp;</td>
    <td valign="top" width="33" align="center"><% = SrNo %></td>
    <td valign="top" width="38" align="center"><% = arrAllUsers(7,rowcounter) %></td>
    <td valign="top" width="63" align="center" ><% = arrAllUsers(4,rowcounter) %></td>
    <td valign="top" width="344" align="center"><% = arrAllUsers(3,rowcounter) %></td>
<td valign="top" width="53" align="center">
        <%
             if id ="0" then %>
            N/A
        <% else if id <> "" then 
           ' response.Write(id)
             strq="select b.city ci,b.startdate st,b.enddate ed from course b  where b.courseid="&id&""
           'response.Write(strq)
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
       else 
        %>
    
        N/A
        <%   
            end if 
            end if 
            %>
    </td>
    <td valign="top" width="63" align="center"><% if city<>"" then %><%=city %> <%else %>N/A <% end if  
      
           city=""
           id=""%></td>
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
 
 
 <% 'Praveen Added on 18th March 2013 for sending email' %>
 
 <div id="quote-lowerbody" style="height:132px !important;">
   <div id="quote-left">
    &nbsp;

   </div>
   
    <div id="quote-middle">
      
   </div>
   <% If rqAction <> "View_PO" AND rqAction <> "View_IS" Then  %>
   
    <div id="quote-middle" style="margin-top: -50px;">
     
         &nbsp;    &nbsp;  
     
  <input type="button" name="I accept" value="I Accept" style="width:200px;"/></div>
  <br /><br />
  
  <% End If %>
   
    <div id="quote-right">
    
    <form action="/QuoteWerks/send_mail.asp" method="post" >
    <input type="hidden" name="quoteid" value="<%=rqId%>" >
    <input type="hidden" name="redirecturl" value="ViewEditQuote.asp?action=<% = rqAction %>&id=<% = rqId%>" >
     <input type="submit" name="type" value="Send Email" />
     </form>
   </div>
   
 </div>
 
 
 <div id="quote-footer">
 We accept all major credit and debit cards for payment. Head office: N1 CBTC, Euxton Lane, Chorley, Lans PR7 6TE Post Sales line: 01772 623467 Email: sales@datrixtraining.com Sales line: 0800 781 0626
Our terms of business can be viewed at:<a href="#">http://www.datrixtraining.com/about/terms/</a> Datrix Training Limited - Company number 4344412
   
 

 </div>
 
 
 
 
 
 
 
 </div>
</div>

<%  'Display the Table'
   Else
   
 'strEditDetail = " Select * from QW_QuoteOverview  where  userId = '"&Session("QWUserName")&"' Order By quoteId desc"
strEditDetail="select distinct quoteno a from QW_QuoteOverview where userId = '"&Session("QWUserName")&"' "
SET objRs11 = Server.CreateObject("ADODB.Recordset")
SET objRs22= Server.CreateObject("ADODB.Recordset")
objRs11.Open strEditDetail, ConnObj  
%>

<div style="width:60%">


  <table  border="0" cellspacing="0" cellpadding="4" class="mainContent" align="left">
  

    
           <font face="Arial" color="red"><% = message %></font><br /><br />
   
   
    <thead>
      <tr>
         <th>Quote No </th>
        <th>Quote Id </th>
		<th>version</th>
        <th>Created Date</th>
        <th>Company Name</th>
        <th>User Name</th>
        <th>Status</th>
        <th>Quote Edit/View</th>
        <th>P.O Receipt</th>
        <th>Invoice Sent</th>
        
      </tr>
    </thead>
<%
While Not objRs11.EOF
   strEdit="select top 1 * from QW_QuoteOverview where quoteno= '"& objRs11("a")&"' order by quoteId desc "
  objRs22.Open strEdit, ConnObj  
 %>
 
   <% Do until objRs22.EOF
   
   rqcompanyId = objRs22("companyId") 
   rqcreatedDate = objRs22("createdDate")
   rquserid = objRs22("userId")
   
   
   SET objRs2 = Server.CreateObject("ADODB.Recordset")
   
   strQuery1 = "select CompName from QW_Company  where compId ='"&rqcompanyId &"'"
	
	objRs2.Open strQuery1,ConnObj
	
	  Do Until objRs2.EOF 

		  rqCompName = objRs2("CompName") 
          
          objRs2.Movenext
		   Loop
		   objRs2.Close 	 
   		'quoteId = objRs22("quoteId")
		'response.Write(quoteId)
   
    %>
    <tbody>
      <tr>
	  
        <td width="15%" ><% = objRs22("quoteno") %></td>
        <td width="15%" ><% = objRs22("quoteId") %></td>
		<td width="15%" ><% = objRs22("versionNo") %></td>
        <td width="15%" ><% = objRs22("createdDate") %></td>
        <td width="15%" ><% = rqCompName %></td>
        <td width="15%" ><% = objRs22("userid") %></td>
        <td width="15%" ><% = objRs22("status") %></td>
        <td width="15%"><a href="/Quotewerks/ViewEditQuote.asp?action=Edit&amp;id=<% = objRs22("quoteId") %>">Edit</a>/<a href="/Quotewerks/ViewEditQuote.asp?action=View&amp;id=<% = objRs22("quoteId") %>">View</a></td>
        <% If objRs22("status") = "P O Received" Then %>
        <td width="15%"><a href="/Quotewerks/ViewEditQuote.asp?action=View_PO&amp;id=<% = objRs22("quoteId") %>">View P.O</a></td>
         <% Else %>
         <td>
		<%
		Response.Write("N/A")
		
		%></td>
   
        <% End If %>
         <% If objRs22("status") = "Invoice Sent" Then %>
        <td width="15%"><a href="/Quotewerks/ViewEditQuote.asp?action=View_IS&amp;id=<% = objRs22("quoteId") %>">View Invoice sent</a></td>
         <% Else %>
         <td>
		<%
		Response.Write("N/A")
		
		%></td>
     <% End If %> 
      </tr>
       <% objRs22.Movenext
		 Loop
		 objRs22.Close
		 objRs11.Movenext
		 wend
		 objRs11.Close
		 
		  %>
     

    </tbody>
  </table>
</div>
<% End If %>


   </div></td>
</tr>
</table>
<% End If %>

</Body>
<!-- Body Ends -->
