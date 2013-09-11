
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->

<head>
<% 

'If not Session("userName") then redirect to  login page'
 If request.QueryString("userid")<>"" then
  Session("QWUserName")=request.QueryString("userid")
Set Rs = Server.CreateObject("ADODB.Recordset")

  strQuery = "SELECT * FROM users where userid= '" & Session("QWUserName") &"'"

  Rs.Open strQuery,ConnObj

 If (not Rs.BOF) and (not Rs.EOF) Then

'======================================================='
 'Putting Userid Into session'
 'Putting typeofuser Into session'
'======================================================='
  Session("QWFirstName") =  Trim(Rs("firstname"))
  Session("QWLastName") =  Trim(Rs("lastname"))
  Session("QWUserName") = Rs("userid")
  Session("QWTypeofuser") = Rs("typeofuser")
  
  Session("UserId") = Session("QWUserName")
  Session("QWUserName") =  Session("UserId")
    Session("country")=Trim(Rs("country"))
'    Session("tax")=Trim(Rs("tax"))
     response.Redirect("login.aspx")
    'response.Write(Session("tax"))
end if
end if
%>
<!--#include virtual="/QuoteWerks/includes/header.asp"-->
<%
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
Dim hb_website

message = Session("message")
Session("message") = ""
   
'Creating the Recordset objects'
SET objRs1 = Server.CreateObject("ADODB.Recordset")
	
'Retrive the values from this page'
rqAction = Request.QueryString("action")
rqRow  = Request.QueryString("row")
rqPage = Request.QueryString("page")

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
      <table border="0" cellpadding="7">
      <tr><td colspan="2" height="50px">&nbsp;</td></tr>
        <tr>
          <td colspan="2" align="center"><font color="#8b9e3d" face="Arial" size="4">Welcome to Datrix QuoteWerks </font></td>
        </tr>
      </table>
   </div></td>
</tr>
</table>
<% End If %>

</Body>
<!-- Body Ends -->
