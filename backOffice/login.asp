<%
'If InStr(Request.ServerVariables("SERVER_NAME"),"www") = 0 Then

'	Response.Status="301 Moved Permanently"
'	Response.AddHeader "Location","http://www." & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("URL")
'	Response.End

'End if
%>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 23/09/2010'
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
<title>Login</title>
<link href="../backOffice/css/pagestyle.css" rel="stylesheet" type="text/css">
 <title>Login</title>
</head>
<body><div id="htMap">
<div style="position:absolute;top:150px;left:340px;">
<form action="validUser.asp" method="post">
<table border="0" width="400px" align="center" class="dbborder">
 <tr>
 <!--Displaying Error Message-->
  <td colspan="2"><font face="Arial" color="red"><% = errorMessage %></font></td>
 </tr>
 <tr>
  <td colspan="2" align="center">Login</td>
 </tr>
 <tr>
  <td>UserName:</td>
  <td><input type="text" name="username"</td>
 </tr>
 <tr>
  <td>Password:</td>
  <td><input type="password" name="password"></td>
 </tr>
 <tr>
  <td></td>
  <td align="center"><input type="submit" class="buttonc" value="Login"></td>
 </tr>
</table>
</form>
</div>
</div>
</body>
</html>
