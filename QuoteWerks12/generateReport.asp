<!--#include virtual="/QuoteWerks/includes/header.asp"-->
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->

<head>
<% 
'If not Session("userName") then redirect to  login page'
	If Session("QWUserName") = "" Then 
		Response.Redirect("default.asp")
	Else
	
%>
<%
'======================================================='
'Written By : Bharath'
'Created Date : 27/04/2012'
'Modified By : Bharath'
'Last UpDated : 27/04/2012'
'Description :'
'This page is for selecting website and country Details '
'======================================================='
%>
<%
'Declaring variables
Dim rqAction ,rqCountry,rqWebsite
Dim rqId,arrAllcountries,objRs2,objRs3,objRs4
Dim arrAllEmpDet, firstRow, lastRow, numRows, rqRow, rqPage
Dim message,strquery1
Dim objRsComp

message = Session("message")
Session("message") = ""
   
'Creating the Recordset objects'
SET objRs1 = Server.CreateObject("ADODB.Recordset")
	
'Retrive the values from this page'
If Request.QueryString("action") <> "" Then
	rqAction = Request.QueryString("action")
Else
	rqAction = Request.Form("action")
End If	

If Request.Form("type") <> "" Then
	rqType = Request.Form("type")
Else
	rqType = Request.QueryString("type")
End If

If Request.Form("userId") <> "" Then
	rquserId = Request.Form("userId")
Else
	rquserId = Request.QueryString("userId")
End If

If Request.Form("Company") <> "" Then
	rqCompany = Request.Form("Company")
Else
	rqCompany = Request.QueryString("Company")
End If

Response.Write(rqQuoteId)



'Recordset   
Set objRsuserId = Server.CreateObject("ADODB.Recordset")
Set objRsDesc = Server.CreateObject("ADODB.Recordset")

'Calling distinct category

struserId = "SELECT userId FROM QW_QuoteOverview "

objRsuserId.Open struserId, ConnObj

Response.Write(struserId)

Set objRsComp = Server.CreateObject("ADODB.Recordset")

strCompany = "SELECT Distinct CompName FROM QW_Company"

objRsComp.Open strCompany, ConnObj


%>

<script language ="JavaScript" type="text/javascript">

function check()
{
if(document.getElementById("category").value=="")
{
alert("Please select any Category");
return false;
}
else {
return true;
}
}

function check1()
{
if(document.getElementById("userid").value=="")
{
alert("Please select any userid");
return false;
}
/*if(document.getElementById("comp").value=="")
{
alert("Please select any company");
return false;
}
*/
else 
return true;

}


/*
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
*/



</script>

</head>
<!-- Body Starts -->
<body>
<link href="/QuoteWerks/css/leftNavi.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/form.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/mainContent.css" rel="stylesheet" type="text/css" />
<body style="margin-top:0px">

<tr>
  <td width="170px" align="left" valign="top" style=" border-right:#CCC thin solid;"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftNavigation" >
      <!--#include virtual="/QuoteWerks/includes/LeftMenu.asp"-->
    </table></td>
  <td width="730" align="center" valign="top" height="450px">
  <div id="styledForm" class="myform">
  
    <table  border="0" cellspacing="0" cellpadding="4" align="left">
  <tr><td>
  <form action="generateReport.asp?type=SalesManager" method="post" ><!--onSubmit="return Form_Validator(this);"-->
  <table>
    <tr>
      <td>Search By Category: </td>
      <td><select name="category" id="category">
          <option value="">--Select--</option>
          <option <% If rqQuoteId = "SalesManager" Then %> selected="selected" <% End If %> value="SalesManager" >Sales Manager</option>
          <option <% If rqCompany = "Company" Then %> selected="selected" <% End If %> value="Company">Company</option>
          <option <% If rqDate = "Date" Then %> selected="selected" <% End If %> value="Date">Quote Sent Date</option>

        </select></td>
      <td><input type="Submit" name="Search" value="Search"  onclick="return check();"/></td>
    </tr>
  </table>
</form>
<% If rqType = "SalesManager" Then %>
     
  <form action="report.asp?type=SalesManager" target="_blank" method="post"> <!--onSubmit="return Form_Validator(this)"-->
  <table>
    <tr>
      <td>Search By Sales Manager: </td>
      <td><select name="userId" id="userid">
          <option value="">--Select--</option>
          <% Do Until objRsuserId.EOF %>
          <option <% If rquserId = objRsuserId("userId") Then %> selected="selected" <% End If %> value="<% = objRsuserId("userId") %>">
          <% = objRsuserId("userId") %>
          </option>
          <% objRsuserId.Movenext
							   Loop
							   objRsuserId.Close %>
        </select></td>
      <td><input type="Submit" name="Search" value="Search" id="submit" onclick="return check1();"/></td>
    </tr>
  </table>
</form>
<% ElseIf rqType = "Company" Then  %>
 <form action="report.asp?type=Company" target="_blank" target="_blank" method="post"> <!--onSubmit="return Form_Validator(this)"-->
  <table>
    <tr>
	
	
      <td>Search By Company Name: </td>
      <td><select name="CompName" id="comp">
          <option value="">--Select--</option>
          <% Do Until objRsComp.EOF %>
          <option <% If rqCompName = objRsComp("CompName") Then %> selected="selected" <% End If %> value="<% = objRsComp("CompName") %>">
          <% = objRsComp("CompName") %>
          </option>
          <% objRsComp.Movenext
							   Loop
							   objRsComp.Close %>
        </select></td>
      <td><input type="Submit" name="Search" value="Search"  onclick="return check2();"/></td>
    </tr>
  </table>
</form>



<% ElseIf rqType = "Date" Then  %>
<form action="report.asp?type=Date" target="_blank" method="post" >
<table border="0" cellpadding="3" cellspacing="0">
   
  <tr>
    <td>From Sent Date:</td><td><input type="text" name="fromDate" value="<% = rqFromDate %>" />(format: yyyy/mm/dd)</td>
  </tr>
  <tr>
    <td>To Sent Date:</td><td><input type="text" name="toDate" value="<% = rqToDate %>" />(format: yyyy/mm/dd)</td>    
  </tr>  
  <tr>
  	<td>&nbsp;</td>
    <td><input type="submit" value="Submit" onclick="return check();"/></td>
  </tr>
</table>
</form>
<% End If %>
</td>
</tr>
<tr><br /></tr>
</table>
<% End If %>

</Body>
<!-- Body Ends -->
