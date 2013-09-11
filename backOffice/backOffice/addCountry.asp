<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<% 
	If  Session("UserId") = "" Then
     Response.Redirect("/backOffice/login.asp")
   Else
%>
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 29/04/2011'
'Description :'
' Add status Page'
'======================================================='

'Declare The Variables'

Dim rqCountry, rqUpdate, objRs, rqComplaintNo, strQuery,Rs

'Creating Record Object'
Set objRs = Server.CreateObject("ADODB.Recordset")
Set Rs = Server.CreateObject("ADODB.Recordset")




'Retrivin the values from support.asp page'

rqUpdate  =  Request.Form("updateCoun")

rqCountry = request.Form("addCountry")

If rqUpdate <> "" Then

rqComplaintNo  = Request.Form("complaint_no")

ConnObj.EXECUTE("UPDATE support_complaint SET country = '"&rqCountry&"' WHERE complaint_no = '"& rqComplaintNo &"'")

response.Write("UPDATE support_complaint SET country = '"&rqCountry&"' WHERE complaint_no = '"& rqComplaintNo &"'")

Response.Redirect("admin_ComplaintLog.asp?complaint_no= "&rqComplaintNo&"")

End If 

%>
<% End If %>