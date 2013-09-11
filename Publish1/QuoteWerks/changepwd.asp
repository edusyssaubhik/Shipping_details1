<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<% 
	If Session("QWUserName") = "" Then 
		Response.Redirect("default.asp")
	Else
	
%>
<%
'======================================================='
'Written By : Vinaya'
'Written Date : 1/04/2011'
'Modified By : Bharath'
'Modified Date : 7th Apr 2011'
'Description :'
'This page is for country Details '
'======================================================='
%>
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->
<%


Dim strQuery
Dim strQuery1
Dim rqUserId
Dim rqCurrentPassword
Dim rqNewPassword
Dim ObjRs, ObjRs1,rqId

Set objRs = server.CreateObject("ADODB.Recordset")
Set objRs1 = server.CreateObject("ADODB.Recordset")

 rqId             =  Request.Form("ID")
 rqCurrentPassword    =  Request.Form("pwd")
 rqNewPassword        =  Request.Form("newPwd")
 
 strQuery = "SELECT password FROM QW_Users WHERE id = '" & rqId & "'"
 
 objRs.Open strQuery,ConnObj
 
 If (Not objRs.BOF) and (Not objRs.EOF) Then

  If rqCurrentPassword <> objRs("password") Then

	Session("message") = "Your Password is incorrect"
	Response.Redirect("changepassword.asp")
	
  Else
 
   strQuery1 = "UPDATE QW_Users SET password = '" & rqNewPassword & "' WHERE id = '" & rqId & "'"
   objRs1.Open strQuery1,ConnObj
   
   Session("message") = "Successfully Changed Password"
   Response.Redirect("/QuoteWerks/changepassword.asp")
   
   objRs1.Close
   Set objRs1 = Nothing
   
  End If
  
 End If  

objRs.Close
Set objRs = Nothing

ConnObj.Close
Set ConnObj = Nothing
End If
%>