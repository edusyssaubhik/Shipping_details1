<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 23/09/2010'
'Description :'
'This Page is Login Page'
'======================================================='%>
<!-- #include virtual = "/includes/connection.asp"-->
<%
'======================================================='
 'Declare The Variables'
'======================================================='

 Dim rqUsername,Rs
 Dim rqPassword
 Dim strQuery
 
'======================================================='
'Creating the Recordset objects'
'======================================================='
SET Rs = Server.CreateObject("ADODB.Recordset")


'======================================================='
 'Retrive UserName And Password From Login.asp Page'
'======================================================='
  Function StrQuoteReplace(strValue)
	 StrQuoteReplace = Replace(strValue, "'", "")
  End Function

 rqUsername = StrQuoteReplace(Request.Form("username"))
 rqPassword = StrQuoteReplace(Request.Form("password"))

'======================================================='
 'Sql Query For Checking The UserName Password'
'======================================================='

  strQuery = "SELECT * FROM users where userid = '" & rqUsername & "' and password = '" & rqPassword & "'"

  Rs.Open strQuery,ConnObj

 If (not Rs.BOF) and (not Rs.EOF) Then

'======================================================='
 'Putting Userid Into session'
 'Putting typeofuser Into session'
'======================================================='

  Session("UserId") = Rs("userid")
  Session("typeofuser") = Rs("typeofuser")
  Session("QWUserName") =  Session("UserId")
  Session("USBUserId") = Rs("officialemailid")
  Session("QWTypeofuser") =  session("typeofuser") 
  

'======================================================='
 'if UserName and Password Valid Then Redirecting To CsrHome Page'
'======================================================='

  Response.Redirect("./home.asp")

Else

'======================================================='
  'UserName and Password Not Valid Then Redirecting to Ligin Page'
  'And Print Error Message'
'======================================================='

  Session("errorMessage") = "Login Failed Please Check Username and Password"
  Response.Redirect("login.asp")

End If
Rs.Close
ConnObj.Close
%>

