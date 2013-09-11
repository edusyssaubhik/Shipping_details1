<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
 'Written By : Bharath'
 'Modified By: Priyanka'
 'Last UpaDated: 22/02/2012'
 'Description :'
 'Purpose : Insert/Update/Delete New User Into DataBase'
 'This Page Is Comes From admin-user.asp Page'
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
 Dim Rs1
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
 DIm Rs

 Set Rs  = Server.CreateObject("ADODB.Recordset")

 Set Rs1 = Server.CreateObject("ADODB.Recordset")

'Retrive Type From admin-user.asp Page'

 rqType = Request.Form("createuser")



'If You Creating New User That Details We Insert Here'
'If Condtion Open For Create User'

If rqType = "Create User" Then

'Retrive All User Values From admin-user.asp Page'

 rqUserId          =  Request.Form("userid")
 rqPassword        =  Request.Form("password")
 rqTypeOfUser      =  Request.Form("typeofuser")

'If You Adding New User, Here We Are Checking That Paricular UserId Available Or Not'

 strQuery1 = "SELECT userid FROM Accesstable WHERE userid = '" & rqUserId & "'"
 
 Rs1.Open strQuery1,ConnObj
 
 If (Not Rs1.BOF) and (Not Rs1.EOF) Then
 
'That Particular UserId Already Added Then Through One Message To admin-user.asp Page'

   If (rqUserId = Rs1("userid")) Then
   
     Session("message1") = "This UserName Is Already Added"
	 Response.Redirect("admin-user.asp?type=add")
	 
  End If

'If That Particular UserId Not Added Then Insert Into DataBase'  

 Else

 strQuery = "INSERT INTO Accesstable (UserID,password,Accessgranted)"
 strQuery = strQuery & " Values "
 strQuery = strQuery & "('" & rqUserId & "',"
 strQuery = strQuery & "'" & rqPassword & "',"
 strQuery = strQuery & "'" & rqTypeOfUser & "')"

 Rs.Open strQuery,ConnObj

 Session("message") = "You Have Successfully Added New User"
 Response.Redirect("admin-user.asp")

End If

End If

'Create User If Condition Closed Here'

'-----------------------------------------------------------'
'Edit Existing User Details'
'-----------------------------------------------------------'

'Retrive Type From admin-user.asp Page'

rqType = Request.Form("saveuser")


'If Type Equals To Save User Then Update Query Will Execute'

If rqType = "Save User" Then

 rqEditPassword        =  Request.Form("editpassword")
 rqEditUserId          =  Request.Form("userId")


 strQuery = "UPDATE Accesstable SET"
 strQuery = strQuery & " password = '" & rqEditPassword & "'"
 strQuery = strQuery & " WHERE GID = '" & rqEditUserId & "'"

 Rs.Open strQuery,ConnObj

 Session("message") = "You Have Successfully Edited User"
 Response.Redirect("admin-user.asp")

Else

 rqDelete = Request.Querystring("deleteUserId")

 strQuery1 = "DELETE  FROM Accesstable WHERE GID = '" & rqDelete & "'"

 Rs.Open strQuery1,ConnObj

 Session("message") = "Your Successfully Deleted User"
 Response.Redirect("admin-user.asp")

Rs.Close
ConnObj.Close
End If

'Save User If Condition Closed Here'

End If
%>