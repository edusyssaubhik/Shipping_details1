<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->

<% 
	If Session("QWUserName") = "" Then 
		Response.Redirect("default.asp")
	Else
	%>
<%
	

'======================================================='
'Written By : savita'
'Written Date : 29/03/2013'
'Description :'
'This page is for User Details '
'======================================================='

Dim rqType,rqfirstName,rqlastName ,rquserName,rqpassword ,rqofficialemailid ,rqpersonalemailid
Dim rqAction,rqtypeofuser,rquserId,rqaddedBy ,rqaddedDate,rqphoneNo,rqDesignation
Dim objRs,strEmpDet,rqDelGID, strQuery1 ,Rs1,upuser,  upuser1,rqDeleteuserId,rqID

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
 
 
 
 
    
 strQuery1 = "SELECT userid FROM QW_Users where userid = '" & EmailID(0) & "'"
   
      Rs1.Open StrQuery1,ConnObj
	  
	  'Response.Write(strQuery1)

      If (Not Rs1.BOF) and (Not Rs1.EOF) Then
	  'response.write("A")
       upuser=Ucase( userID )
        upuser1=Ucase(Rs1("userid"))
         If  upuser =  upuser1 Then 
        'If rquserName = Rs1("userName") Then
	 		
			Session("message") = "This User Name Already Exists"
			Response.Redirect("/QuoteWerks/users.asp")
		
       	End If 
     Else
   
	 'response.write("b")
 strEmpDet = "INSERT INTO QW_Users(firstname,lastname,userid,password,officialemailid,personalemailid,phoneno,Designation,typeofuser,addedBy,addedDate) values " 
		strEmpDet= strEmpDet& "('" & rqfirstName& "',"
		strEmpDet= strEmpDet& "'" & rqlastName & "',"
		strEmpDet= strEmpDet& "'" & EmailID(0) & "',"
		strEmpDet= strEmpDet& "'" & pass1 & "',"
		strEmpDet= strEmpDet& "'" & rqofficialemailid & "',"
		strEmpDet= strEmpDet& "'" & rqpersonalemailid & "',"
		strEmpDet= strEmpDet& "'" & rqDesignation & "',"
		strEmpDet= strEmpDet& "'" & rqphoneNo & "',"
		strEmpDet= strEmpDet& "'" & rqtypeofuser & "',"
		strEmpDet= strEmpDet& "'" & rqaddedBy& "',"
		strEmpDet= strEmpDet& "'" & rqaddeddate & "')"
		
		'Response.Write(strEmpDet)
    	objRs.open strEmpDet,ConnObj
	 	 Session("message") = "You Have Successfully Added User" 
			Response.Redirect("/QuoteWerks/users.asp")
	
	End If
	'Updating values into the database'	
 ElseIf rqType = "Edit User Details" then
 
 
			
        ' Response.write("c")
					strEmpDet= "UPDATE QW_Users  SET "
					strEmpDet= strEmpDet& "firstName = '"& rqfirstName &"',"
					strEmpDet= strEmpDet& "lastName = '"& rqlastName &"',"
					strEmpDet= strEmpDet& "officialemailid = '"& rqofficialemailid &"',"
					strEmpDet= strEmpDet& "personalemailid = '"& rqpersonalemailid &"',"
					strEmpDet= strEmpDet& "PhoneNo = '"& rqphoneNo &"',"
					strEmpDet= strEmpDet& "typeofuser= '" & rqtypeofuser & "',"
					strEmpDet= strEmpDet& "modifiedBy= '" & rqaddedBy & "',"
					strEmpDet= strEmpDet& "modifiedDate= '" & rqaddeddate & "'"
					strEmpDet= strEmpDet& " WHERE id = '"& rqId &"'"
				  
				'response.write(strEmpDet)
					ConnObj.Execute strEmpDet
					 Session("message") = "You Have Successfully Edit User" 
					Response.Redirect("/QuoteWerks/users.asp")
		
				 
				'Deleteing the records from the table'
ElseIf rqAction ="deleteUser" then	
  'Response.Write(rqDeleteuserId) 
				 
				 ConnObj.Execute("DELETE  from QW_Users where id = '"& rqDeleteuserId &"'")
				  Session("message") = "You Have Successfully Deleted User" 
				 response.Redirect("/QuoteWerks/users.asp")
	
end If

%>
<% End If %>
<!--#include virtual="/QuoteWerks/includes/connectionClose.asp"-->
