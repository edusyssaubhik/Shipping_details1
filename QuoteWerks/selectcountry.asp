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

function Form_Validator(theform)
{
	
	if (theform.country.value == "")
  {
     alert("Please select country.");
     theform.country.focus();
     return (false);
  }
}

</script>

</head>

<%
    response.Write(session("tax"))
    if Session("country")="1" then
    response.Redirect("category-items.asp")
    end if
Dim strcountry,Rs

SET Rs = Server.CreateObject("ADODB.Recordset")
strcountry = "SELECT * FROM QW_CountryDetail"
Rs.open strcountry,ConnObj

If Request.Form("country") <> "" Then
	rqcountry = Request.Form("country")
Else
	rqcountry = Request.QueryString("country")
End If

Session("country") = rqcountry

Response.Write(Session("country"))

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
  
   <form action="category-items.asp" method="post" onSubmit="return Form_Validator(this)">
      <table  align="center" border="0" cellpadding="7">
      <tr><td colspan="2" height="50px">&nbsp;</td></tr>
        <tr>
          <td colspan="2" align="center">
         
		<table>
			<tr>
				<td><b>Select country: </b></td>
				<td><select name="country">
					<option value="">--Select--</option>
                   
                    <% do until Rs.EOF 
			 %>
			<option value="<% =Rs("countryId") %>"><% = Rs("country") %> </option>
            
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
