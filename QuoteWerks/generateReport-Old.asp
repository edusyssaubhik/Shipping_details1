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
'Written By : savita'
'Created Date : 5/03/2013'
'Description :'
'This page is for generating report '
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


If Request.Form("category") <> "" Then
	rqcategory = Request.Form("category")
Else
	rqcategory = Request.QueryString("category")
End If




'Recordset   
Set objRsuserId = Server.CreateObject("ADODB.Recordset")
Set objRsDesc = Server.CreateObject("ADODB.Recordset")

'Calling distinct category

struserId = "SELECT Distinct userId FROM QW_QuoteOverview "

objRsuserId.Open struserId, ConnObj


Set objRsComp = Server.CreateObject("ADODB.Recordset")

strCompany = "SELECT Distinct CompName FROM QW_Company"

objRsComp.Open strCompany, ConnObj


%>
<script language ="JavaScript" type="text/javascript">
/*function check_d()
{
  if(document.getElementById("category").value=="")
  {
	alert("Please select Category");
	return false;
  }
  else
  {
	return true;  
  }
	
}*/

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

function Form_Validator(theform)
{
	
	if (theform.category.value == "")
  {
     alert("Please select category.");
     theform.category.focus();
     return (false);
  }
}
function Form_Validator1(theform)
{
	
  if (theform.userId.value == "")
  {
     alert("Please select Manager Name.");
     theform.userId.focus();
     return (false);
  }
}
  function Form_Validator2(theform)
  {
  if (theform.CompName.value == "")
  {
     alert("Please select Company Name.");
     theform.CompName.focus();
     return (false);
  }
  }
  function Form_Validator3(theform)
  {
   if (theform.fromDate.value == "")
  {
     alert("Please Enter From Date.");
     theform.fromDate.focus();
     return (false);
  }
  
    if (theform.toDate.value == "")
  {
     alert("Please Enter To Date.");
     theform.toDate.focus();
     return (false);
  }
}


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
  <td width="730" align="center" valign="top" height="450px"><div id="styledForm" class="myform">
    <table  border="0" cellspacing="0" cellpadding="4" align="left">
      <tr>
        <td><form action="generateReport.asp" method="post" onSubmit="return Form_Validator(this)">
            <table width="100%" border="0" cellspacing="0" cellpadding="8px">
              <tr>
                <td>Search By Category: </td>
                <td><select name="category">
                    <option value="">--Select--</option>
                    <option <% If rqcategory = "SalesManager" Then %> selected="selected" <% End If %> value="SalesManager" >Sales Manager</option>
                    <option <% If rqcategory = "Company" Then %> selected="selected" <% End If %> value="Company">Company</option>
                    <option <% If rqcategory = "Date" Then %> selected="selected" <% End If %> value="Date">Quote Sent Date</option>
                  </select></td>
                <td><input type="Submit" name="Search" value="Search" /></td>
              </tr>
            </table>
          </form>
          <% If rqcategory = "SalesManager" Then %>
          <form action="report.asp?type=SalesManager" target="_blank" method="post" onSubmit="return Form_Validator1(this)">
            <table width="100%" border="0" cellspacing="0" cellpadding="8px">
              <tr><br>
                <td colspan="2" ><p> Search Report By Sales Manager </p></td>
              </tr>
              <tr>
                <td>Search By Sales Manager: </td>
                <td><select name="userId">
                    <option value="">--Select--</option>
                      <% If Session("QWTypeofuser") = "Admin" Then %>
                    <% Do Until objRsuserId.EOF %>
                   
                    <option <% If rquserId = objRsuserId("userId") Then %> selected="selected" <% End If %> value="<% = objRsuserId("userId") %>">
                    <% = objRsuserId("userId") %>
                    </option>
                   
                    <% objRsuserId.Movenext
							   Loop
							   objRsuserId.Close %>
                                <% Else %>
                     <option value="<% = Session("QWUserName") %>">
                    <% = Session("QWUserName") %> </option>
                    <% End If %>
                  </select></td>
                <td><input type="Submit" name="Search" value="Search" /></td>
              </tr>
            </table>
          </form>
          <% ElseIf rqcategory = "Company" Then  %>
          <form action="report.asp?type=Company" target="_blank" target="_blank" method="post" onsubmit="return Form_Validator2(this)">
          <table width="100%" border="0" cellspacing="0" cellpadding="8px">
            <tr><br>
              <td colspan="2" ><p> Search Report By Company Name </p></td>
            </tr>
            <tr>
              <td>Search By Company Name: </td>
              <td><select name="CompName">
                  <option value="">--Select--</option>
                  <% Do Until objRsComp.EOF %>
                  <option <% If rqCompName = objRsComp("CompName") Then %> selected="selected" <% End If %> value="<% = objRsComp("CompName") %>">
                  <% = objRsComp("CompName") %>
                  </option>
                  <% objRsComp.Movenext
							   Loop
							   objRsComp.Close %>
                </select></td>
              <td><input type="Submit" name="Search" value="Search" /></td>
            </tr>
          </table>
          </form>
          <% ElseIf rqcategory = "Date" Then  %>
          <form action="report.asp?type=Date" target="_blank" method="post" onSubmit="return Form_Validator3(this)">
            <table width="100%" border="0" cellspacing="0" cellpadding="8px">
              <tr><br>
                <td colspan="2" ><p> Search Report By Date Sent </p></td>
              </tr>
              <tr>
                <td>From Sent Date:</td>
                <td><input type="text" name="fromDate" value="<% = rqFromDate %>" />
                  (format: yyyy/mm/dd)</td>
              </tr>
              <tr>
                <td>To Sent Date:</td>
                <td><input type="text" name="toDate" value="<% = rqToDate %>" />
                  (format: yyyy/mm/dd)</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td><input type="submit" value="Submit" /></td>
              </tr>
            </table>
          </form>
          <% End If %></td>
      </tr>
      <tr><br />
      </tr>
    </table>
    <% End If %>
</Body>
<!-- Body Ends -->
