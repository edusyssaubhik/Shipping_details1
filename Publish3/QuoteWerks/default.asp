<%@ LANGUAGE="VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Bharath'
'Created Date : 27/04/2012'
'Modified By : Bharath'
'Last UpDated : 27/04/2012'
'Description :'
'This Page is Login Page'
'======================================================='

'Declare The Variables'
'If You Given Wrong Username And Password Then Display One Error Message In This Page'

 Dim errorMessage
 errorMessage = Session("errorMessage")
 Session("errorMessage") = ""
%>
<html>
<head>
<title>Quotework</title>
<script language="javascript">
function focus() {

	loginform.userName.focus();

}
</script>
<link href="/QuoteWerks/css/login.css" rel="stylesheet" type="text/css" />
</head>
<body onLoad="focus()"><div id="htMap">
<div class="loginWindow">
  <div class="headerText">Datrix QuoteWerks</div>
<div class="loginField"><form action="validUser.asp" method="post" name="loginform">
<table width="100%" align="center" border="0" cellspacing="0" cellpadding="8px">
 <tr>
 <!--Displaying Error Message-->
  <td colspan="2" class="errormes"><% = errorMessage %></td>
 </tr>
  <tr>
    <td height="25" width="30%"><label>User Name<span class="small">Please enter User Name</span></label></td>
    <td height="25"><input type="text" name="userName" id="userName" /></td>
  </tr>
    <tr>
    <td height="25" width="30%"><label>Password<span class="small">Please enter Password</span></label></td>
    <td height="25"><input type="password" name="Password" id="Password" /></td>
  </tr>
  <tr>
    <td height="25">&nbsp;</td>
    <td height="35"><button type="submit">Login</button></td>
  </tr>
  </table></form></div>
</div>
</body>
</html>
