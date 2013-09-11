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
'This page is for selecting website and Company Details '
'======================================================='

%>
</head>

<%

SET Rs = Server.CreateObject("ADODB.Recordset")
strCompany = "SELECT compId,CompName FROM QW_Company"
Rs.open strCompany,ConnObj
	
	rqCompanyForm = Request.Form("company")
	
	if rqCompanyForm <> "" then
		rqCompany = rqCompanyForm
	else
		rqCompany = rqCountrySession 
	end if
	
	Session("company") = rqCompany
    rqMessage=Session("editMessage")
    Session("editMessage")=""
	
	addMessage=Session("addMessage")
    Session("addMessage")=""
	
	

%>
<!-- Body Starts -->
<body style="margin-top:0px">
<link href="/QuoteWerks/css/leftNavi.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/form.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/mainContent.css" rel="stylesheet" type="text/css" />


<tr>
  <td width="170px" align="left" valign="top" style=" border-right:#CCC thin solid;"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftNavigation" >
      <!--#include virtual="/QuoteWerks/includes/LeftMenu.asp"-->
    </table></td>
  <td width="730" align="center" valign="top" height="450px">
 
  <div id="styledForm" class="myform">
  
   <form action="addeditcompanydetails.asp" method="post" onSubmit="return Form_Validator(this)">
      <table  align="center" border="0" cellpadding="7">
      <tr>
      <td colspan="2" align="center"><font face="Arial" size="2" color="orangered"><%
	  If rqMessage <> "" Then
	  
	  response.Write(rqMessage)
	  Else
	  
	  response.Write(addMessage)
	  End If
	  %></font></td>
    </tr>
      <tr><td colspan="2" height="50px">&nbsp;</td></tr>
        <tr>
          <td colspan="2" align="center">
         
		<table>
			<tr>
				<td><b>Company: </b></td>
				<td><select name="company">
					<option value="">--Select--</option>
                    <option value="addCompany">Add New Company</option>
                    <% do until Rs.EOF 
			 %>
			<option value="<% =Rs("compId") %>" <% If rqCompany = Rs("CompName") Then %> selected="selected" <% End If %>><% = Rs("CompName") %> </option>
            
			<% 
			   Rs.movenext
		       loop %>
				 </select>
				 </td>
                </tr><br /><br />
                <tr></tr>
                <tr></tr>
                <tr></tr>
                <tr></tr>
				<tr><td height="25">&nbsp;</td>
              <td height="25"><button type="submit" name="Submit" value="submit">submit</button></tr>
			</table>
		</form></td>
        </tr>
      </table>
   </div></td>
</tr>
</table>
<% End If %>

</Body>
<!-- Body Ends -->
