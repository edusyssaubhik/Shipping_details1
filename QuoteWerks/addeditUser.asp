<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 'OPTION EXPLICIT %>
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->

<% 
	If Session("QWUserName") = "" Then 
		Response.Redirect("default.asp")
	Else
	%>
<%
	

'======================================================='
'Written By : Mahima'
'Written Date : 29/03/2011'
'Description :'
'This page is for User Details '
'======================================================='
    'added by Saubhik tax and country
Dim rqType,rqfirstName,rqlastName ,rquserName,rqpassword ,rqofficialemailid ,rqpersonalemailid
Dim rqAction,rqtypeofuser,rquserId,rqaddedBy ,rqaddedDate,rqphoneNo,rqDesignation,rqcountry,rqtax
Dim objRs,strEmpDet,rqDelGID, strQuery1 ,Rs1,upuser,  upuser1,rqDeleteuserId,rqID,strBody
Dim objmail
	'Retrive the type of action'
    rqAction = Request.QueryString("action")
	rqType =  Request.form("type")
	
	'Retrive the values from this page'

		rquserName =  Request.Form("userName")
	
	 	rqDeleteuserId = Request.QueryString("id")

	
	rqfirstName = Request.Form("firstname")
	rqlastName = Request.Form("lastname")
	rqpassword = Request.Form("password")
	rqofficialemailid = Request.Form("officialemailid")
	rqpersonalemailid = Request.Form("personalemailid")
	rqphoneNo = Request.Form("phoneno")
	rqDesignation = Request.Form("Designation")	
	rqtypeofuser = Request.Form("typeofuser")
	rqaddedDate	= Now()
	rqaddedBy = Session("QWuserName")
	rqID = Request.Form("id")
    rqcountry=Request.Form("country")
   ' rqtax=Request.Form("tax")
	'RESPONSE.WRITE(rquserName)
	
	
	 'Generating default/random password for logged in users'
	  Dim pChar1, pCount1,i,pass1,userID,EmailID
	   
	 ' Here you can add other characters such as lowercase or special.
	   pChar1 = "ABCDEFGHIJKLMNPQRSTUVWXYZ@#$&0123456789"
	   
	   pCount1 = Len(pChar1) 
	   
	   Dim psw1
	   psw1 = "DAT"
	   
	   Randomize
	   For i = 1 To 6 ' password length
		  psw1 = psw1 & Mid( pChar1, 1 + Int(Rnd * pCount1), 1 )
		  pass1=psw1
	   Next
	   
	   EmailID = Split(rqofficialemailid,"@")
	   
	   'userName = EmailID(0)
'	   
'	   Response.Write(userName)
	   

	'Creating Record Objects'
	Set objRs = Server.CreateObject("ADODB.Recordset")
	Set  Rs1 = Server.CreateObject("ADODB.Recordset")
	'Response.write(rquserName)
 If rqType = "Add User Details" then
  
    
 strQuery1 = "SELECT userid FROM users where userid = '" & EmailID(0) & "'"
   
      Rs1.Open StrQuery1,ConnObj
	  
	  Response.Write(strQuery1)

      If Not Rs1.EOF Then
	  response.write("A")
       upuser=Ucase( EmailID(0) )
        upuser1=Ucase(Rs1("userid"))
    response.Write(upuser & upuser1)  
       If  upuser =  upuser1 Then 
        'If rquserName = Rs1("userName") Then
	 		
			Session("message") = "This User Name Already Exists"
    'response.Write(Session("message"))
			Response.Redirect("/QuoteWerks/users.asp")
		
       	End If 
     Else
   
	 'response.write("b")
    'updated by Saubhik
 strEmpDet = "INSERT INTO users(firstname,lastname,userid,password,officialemailid,personalemailid,phoneno,Designation,typeofuser,addedBy,addedDate,country) values " 
		strEmpDet= strEmpDet& "('" & rqfirstName& "',"
		strEmpDet= strEmpDet& "'" & rqlastName & "',"
		strEmpDet= strEmpDet& "'" & EmailID(0) & "',"
		strEmpDet= strEmpDet& "'" & pass1 & "',"
		strEmpDet= strEmpDet& "'" & rqofficialemailid & "',"
		strEmpDet= strEmpDet& "'" & rqpersonalemailid & "',"
		strEmpDet= strEmpDet& "'" & rqphoneNo & "',"
    	strEmpDet= strEmpDet& "'" & rqDesignation & "',"
	    strEmpDet= strEmpDet& "'" & rqtypeofuser & "',"
		strEmpDet= strEmpDet& "'" & rqaddedBy& "',"
		strEmpDet= strEmpDet& "'" & rqaddeddate & "',"
       	strEmpDet= strEmpDet& "'" & rqcountry & "')"
		
		
		'Response.Write(strEmpDet)
    	objRs.open strEmpDet,ConnObj
		
		
		strBody = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.projstudy.com/Quotewerks/images/email_headerDatrix.jpg"" alt=""Datrix"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""540px""><table border=""0"" width=""520px"" align=""center""><tr height=""30px""><td><font face=""Arial"" size=2>Dear "&rqfirstName&"&nbsp;"&rqlastName&",<BR><BR>Please find below your login details for VMQuotes: <BR><BR>Username: "&EmailID(0)&"<BR><BR>Password: "&pass1&"<BR><BR>Link to login: <a href=""http://projstudy.com/Quotewerks/default.asp"">http://projstudy.com/Quotewerks/default.asp</a><BR><BR>Best Regards, <BR>VMQuotes Admin</font></td></tr></table></td></tr></table></td></tr></table>"
     response.Redirect("User_upload.aspx?id="&EmailID(0)&"&action=V1&que3=Admin")	
    
'response.Write(strBody)
    Set myMail= Server.CreateObject("CDO.Message")
myMail.From = "operations@datrixtraining.com"

'myMail.From = "<" & rqofficialemailid & ">"
'myMail.From = "operations@datrixtraining.com"
myMail.To =  ""&rqofficialemailid&"" 

'myMail.Cc = "edusyssaubhik@gmail.com,edusyssidhardha@gmail.com,edusyssavita@gmail.com,edusysayan@gmail.com"
 
myMail.Subject = "Login Details - VMQuotes"
myMail.HtmlBody =  strBody
myMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
'Name or IP of remote SMTP server
myMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/smtpserver") _
="46.183.10.241"
'Server port
myMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/smtpserverport") _
=25 
myMail.Configuration.Fields.Update
myMail.Send
set myMail=nothing




'Set objmail = Server.CreateObject("CDONTS.NewMail")

'response.Write("called")
'objmail.From = "operations@datrixtraining.com"
'objmail.From = "edusy

		
	 	Session("message") = "You Have Successfully Added User" 
	 response.Redirect("User_upload.aspx?id="&EmailID(0)&"&action=V1&que3=Admin")	
    'Response.Redirect("/QuoteWerks/Users.asp")
	
	End If
	'Updating values into the database'	
 ElseIf rqType = "Edit User Details" then
 
 
			'update by Saubhik
        ' Response.write("c")
					strEmpDet= "UPDATE users  SET "
					strEmpDet= strEmpDet& "firstName = '"& rqfirstName &"',"
					strEmpDet= strEmpDet& "lastName = '"& rqlastName &"',"
					strEmpDet= strEmpDet& "officialemailid = '"& rqofficialemailid &"',"
					strEmpDet= strEmpDet& "personalemailid = '"& rqpersonalemailid &"',"
					strEmpDet= strEmpDet& "PhoneNo = '"& rqphoneNo &"',"
                    strEmpDet= strEmpDet& "Designation='" & rqDesignation & "',"
					strEmpDet= strEmpDet& "typeofuser= '" & rqtypeofuser & "',"
					strEmpDet= strEmpDet& "modifiedBy= '" & rqaddedBy & "',"
					strEmpDet= strEmpDet& "modifiedDate= '" & rqaddeddate & "',"
					strEmpDet= strEmpDet& "country= '" & rqcountry & "'"
		
    				strEmpDet= strEmpDet& " WHERE id = '"& rqId &"'"
				  
				'response.write(strEmpDet)
					ConnObj.Execute strEmpDet
					 Session("message") = "You Have Successfully Edit User" 
	 response.Redirect("User_upload.aspx?id="&rqId&"&action=V2&que3=Admin")	
    
    				Response.Redirect("/QuoteWerks/users.asp")
		
				 
				'Deleteing the records from the table'
ElseIf rqAction ="deleteUser" then	
  Response.Write(rqDeleteuserId) 
				 
				 ConnObj.Execute("DELETE  from users where id = '"& rqDeleteuserId &"'")
				  Session("message") = "You Have Successfully Deleted User" 
				 response.Redirect("/QuoteWerks/users.asp")
	
end If

%>
<% End If %>
<!--#include virtual="/QuoteWerks/includes/connectionClose.asp"-->
