<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

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
Dim rqNewPassword,strBody,rqofficialemailid
Dim ObjRs, ObjRs1,rqId,rqfirstname,rqlastname

Set objRs = server.CreateObject("ADODB.Recordset")
Set objRs1 = server.CreateObject("ADODB.Recordset")

 rqId             =  Request.Form("ID")
 rqCurrentPassword    =  Request.Form("pwd")
 rqNewPassword        =  Request.Form("newPwd")
 
 strQuery = "SELECT * FROM QW_Users WHERE id = '" & rqId & "'"
 
 objRs.Open strQuery,ConnObj
 
 'Response.Write(strQuery)

 
 If (Not objRs.BOF) and (Not objRs.EOF) Then
 
 rqCurrentPassword = objRs("password")
 rqfirstname = objRs("firstname")
 rqlastname = objRs("lastname")
 rquserid = objRs("userid")
 rqofficialemailid = objRs("officialemailid")

  If rqCurrentPassword <> objRs("password") Then

	Session("message") = "Your Password is incorrect"
	Response.Redirect("changepassword.asp")
	
  Else
 
   strQuery1 = "UPDATE QW_Users SET password = '" & rqNewPassword & "' WHERE id = '" & rqId & "'"
   ConnObj.Execute strQuery1

   
strBody = "<table width=""100%"" bordrer=""0"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.projstudy.com/Quotewerks/images/email_headerDatrix.jpg"" alt=""Datrix"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""540px""><table border=""0"" width=""520px"" align=""center""><tr height=""30px""><td><font face=""Arial"" size=2>Dear "& rqfirstname&"&nbsp;"& rqlastname&",<BR><BR>We have received your request for change of password. Please find below your changed login details for VMQuotes: <BR><BR>Username: "&rquserid&"<BR><BR>Password: "&rqNewPassword&"<BR><BR>Link to login: <a href=""http://projstudy.com/Quotewerks/default.asp"">http://projstudy.com/Quotewerks/default.asp</a><BR><BR>Best Regards, <BR>VMQuotes Admin</font></td></tr></table></td></tr></table></td></tr></table>"

'response.Write(strBody)

Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
objCDOMail.From = "operations@datrixtraining.com"
objCDOMail.To =  ""&rqofficialemailid&""    
objCDOMail.cc = "edusysayan@gmail.com,edusyssavita@gmail.com"
objCDOMail.Importance = 2
objCDOMail.Subject = "Change of Password - VMQuotes"
objCDOMail.BodyFormat = 0
objCDOMail.MailFormat = 0
objCDOMail.Body =  strBody
objCDOMail.Send
Set objCDOMail = Nothing

		
   
   Session("message") = "Successfully Changed Password"
   Response.Redirect("/QuoteWerks/changepassword.asp")
   

   
  End If
  
 End If  

objRs.Close
Set objRs = Nothing

ConnObj.Close
Set ConnObj = Nothing
End If
%>