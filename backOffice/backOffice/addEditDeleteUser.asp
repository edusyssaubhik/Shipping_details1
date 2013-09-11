<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
 '======================================================='
'Written By : Priyanka'
'Last UpDated : 23/09/2010'
'Description :'
'This Page Is Comes From user.asp Page'
'======================================================='%
 
%>
<% 
   If Session("UserId")  = "" Then
     Response.Redirect("/backOffice/login.asp")
   Else
%>
<!-- #include virtual = "/includes/connection.asp"-->
<%
'-----------------------------------------------------------'
'Insert New User'
'-----------------------------------------------------------'

'Declare The Variables'
 
 Dim strQuery
 Dim strQuery1
 Dim Rs1,Rs
 Dim rqFirstName
 Dim rqLastName
 Dim rqUserId
 Dim rqPassword
 Dim rqConfirmPassword
 Dim rqPhoneNo1
 Dim rqPhoneNo2
 Dim rqOfficialEmailId
 Dim rqPersonalemailId
 Dim rqTypeOfUser
 Dim rqDelete
 Dim rqType
 Dim rqEditFirstName
 Dim rqEditLastName
 Dim rqEditPassword
 Dim rqEditConfirmPassword
 Dim rqEditPhoneNo1
 Dim rqEditPhoneNo2
 Dim rqEditOfficialEmailId
 Dim rqEditPersonalEmailId
 Dim rqEditTypeOfUser
 Dim rqEditUserId
 
 Set Rs1 = Server.CreateObject("ADODB.Recordset")
 Set Rs = Server.CreateObject("ADODB.Recordset")

'Retrive Type From user.asp Page'

 rqType = Request.Form("type")

'Retrive All User Values From user.asp Page'

 rqFirstName       =  Request.Form("firstname")
 rqLastName        =  Request.Form("lastname")
 rqUserId          =  Request.Form("userid")
 rqPassword        =  Request.Form("password")
 rqConfirmPassword =  Request.Form("confirmpassword")
 rqPhoneNo1        =  Request.Form("phoneno1")
 rqPhoneNo2        =  Request.Form("phoneno2")
 rqOfficialEmailId =  Request.Form("officialemailid")
 rqPersonalemailId =  Request.Form("personalemailid")
 rqTypeOfUser      =  Request.Form("typeofuser")

'If You Creating New User That Details We Insert Here'
'If Condtion Open For Create User'

If rqType = "Create User" Then

'If You Adding New User, Here We Are Checking That Paricular UserId Available Or Not'

 strQuery1 = "SELECT userid FROM users WHERE userid = '" & rqUserId & "'"
 
 Rs1.Open strQuery1,ConnObj
 
 If (Not Rs1.BOF) and (Not Rs1.EOF) Then
 
'That Particular UserId Already Added Then Through One Message To user.asp Page'

   If (rqUserId = Rs1("userid")) Then
   
     Session("message1") = "This UserName Is Already Added"
	 Response.Redirect("user.asp?type=add")
	 
  End If

'If That Particular UserId Not Added Then Insert Into DataBase'  

 Else

 strQuery = "INSERT INTO users (firstname,lastname,userid,password,confirmpassword,phoneno1,phoneno2,officialemailid,personalemailid,typeofuser)"
 strQuery = strQuery & " Values "
 strQuery = strQuery & "('" & rqFirstName & "',"
 strQuery = strQuery & "'" & rqLastName & "',"
 strQuery = strQuery & "'" & rqUserId & "',"
 strQuery = strQuery & "'" & rqPassword & "',"
 strQuery = strQuery & "'" & rqConfirmPassword & "',"
 strQuery = strQuery & "'" & rqPhoneNo1 & "',"
 strQuery = strQuery & "'" & rqPhoneNo2 & "',"
 strQuery = strQuery & "'" & rqOfficialEmailId & "',"
 strQuery = strQuery & "'" & rqPersonalemailId & "',"
 strQuery = strQuery & "'" & rqTypeOfUser & "')"

 Rs.Open strQuery,ConnObj

 Session("message") = "You Have Successfully Added New User"
 Response.Redirect("/backOffice/user.asp")

End If


'Create User If Condition Closed Here'

'-----------------------------------------------------------'
'Edit Existing User Details'
'-----------------------------------------------------------'


'If Type Equals To Save User Then Update Query Will Execute'

ElseIf rqType = "Save User" Then

'Retrive Type From user.asp Page'


 rqEditFirstName       =  Request.Form("editfirstname")
 rqEditLastName        =  Request.Form("editlastname")
 rqEditPassword        =  Request.Form("editpassword")
 rqEditConfirmPassword =  Request.Form("editconfirmpassword")
 rqEditPhoneNo1        =  Request.Form("editphoneno1")
 rqEditPhoneNo2        =  Request.Form("editphoneno2")
 rqEditOfficialEmailId =  Request.Form("editofficialemailid")
 rqEditPersonalEmailId =  Request.Form("editpersonalemailid")
 rqEditTypeOfUser      =  Request.Form("edittypeofuser")
 rqEditUserId          =  Request.Form("userId")


 strQuery = "UPDATE users SET"
 strQuery = strQuery & " firstname = '" & rqEditFirstName & "',"
 strQuery = strQuery & " lastname = '" & rqEditLastName & "',"
 strQuery = strQuery & " password = '" & rqEditPassword & "',"
 strQuery = strQuery & " confirmpassword = '" & rqEditConfirmPassword & "',"
 strQuery = strQuery & " phoneno1 = '" & rqEditPhoneNo1 & "',"
 strQuery = strQuery & " phoneno2 = '" & rqEditPhoneNo2 & "',"
 strQuery = strQuery & " officialemailid = '" & rqEditOfficialEmailId & "',"
 strQuery = strQuery & " personalemailid = '" & rqEditPersonalEmailId & "',"
 strQuery = strQuery & " typeofuser = '" & rqEditTypeOfUser & "' "
 strQuery = strQuery & " WHERE id = '" & rqEditUserId & "'"
 Rs.Open strQuery,ConnObj

 Session("message") = "You Have Successfully Edited User"
 Response.Redirect("/backOffice/user.asp")

Else

 rqDelete = Request.Querystring("deleteUserId")

 strQuery1 = "DELETE  FROM users WHERE id = '" & rqDelete & "'"

 Rs.Open strQuery1,ConnObj

 Session("message") = "Your Successfully Deleted User"
 Response.Redirect("/backOffice/user.asp")

Rs.Close
ConnObj.Close
End If

'Save User If Condition Closed Here'

End If
%>