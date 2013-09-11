<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
 'Written By : Bharath'
 'Created Date : 27/04/2012'
 'Modified By : Bharath'
 'Last UpDated : 27/04/2012'
 'Description :'
 'Purpose : Checking Valid User Or Not'
 '======================================================='
%>
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->
<%
'======================================================='
 'Declare The Variables'
'======================================================='

 Dim rqUserName
 Dim rqPassword
 Dim strQuery,Rs 
 
 Session("quote")=""

'Replace method'
Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "")
End Function

'======================================================='
 'Retrive UserName And Password From Login.asp Page'
'======================================================='

 rqUserName = StrQuoteReplace(Request.Form("userName"))
 rqPassword = StrQuoteReplace(Request.Form("password"))

Set Rs = Server.CreateObject("ADODB.Recordset")

'======================================================='
 'Sql Query For Checking The UserName Password'
'======================================================='

  strQuery = "SELECT * FROM users where userid= '" & rqUserName & "' and password = '" & rqPassword & "'"

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
  'added by Saubhik
    Session("country")=Trim(Rs("country"))
   ' response.Write(Session("tax"))
'======================================================='
 'if UserName and Password Valid Then Redirecting To CsrHome Page'
'======================================================='

 ' Response.Redirect("home.asp")
     Response.Redirect("login.aspx")
Else

'======================================================='
  'UserID and Password Not Valid Then Redirecting to Ligin Page'
  'And Print Error Message'
'======================================================='
'response.write("B")
  Session("errorMessage") = "Login Failed Please Check User Name and Password"
 Response.Redirect("default.asp")

End If
Rs.Close
ConnObj.Close
%>

