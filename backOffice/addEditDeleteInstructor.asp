<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 23/09/2010'
'Description :'
' Add/Edit/Delete instructors'
'======================================================='
%>
<% If Session("UserId") <> "" Then %>
<!--#include file="./includes/connection.asp"-->
<%
 'Declare The Variables'
 Dim rqAdd, todayDate
 Dim rqEdit
 Dim rqEditId
 Dim rqDeleteId
 Dim strQuery2
 Dim strQuery3
 Dim strQuery1
 Dim revLevel
 Dim Rs1,Rs2,Rs3,Rs

 Set Rs  = Server.Createobject("ADODB.Recordset")
 Set Rs1 = Server.Createobject("ADODB.Recordset")
 Set Rs2 = Server.Createobject("ADODB.Recordset")
 Set Rs3 = Server.Createobject("ADODB.Recordset") 

'Retrive The Type From instructor.asp Page'

 rqAdd       =  Request.Form("addinstructor")
 rqEdit      =  Request.Form("editinstructor")
 rqDeleteId  =  Request.Querystring("deleteinstructorId")

'If you Adding New Instructor That values Comes Here and Insert Into DataBase'

'formatting date
	   todayDate = (YEAR(now()) & "-" & (Month(now())) & "-" & (DAY(now()))) 


If (rqAdd = "Add Instructor") Then

 Dim rqInstructorId
 Dim rqFirstName,UserId
 Dim rqLastName
 Dim rqEmail1
 Dim rqEmail2
 Dim rqPhoneNo1
 Dim rqPhoneNo2
 Dim rqCompName
 Dim rqCompAdd
 Dim rqCountry
 Dim rqComment
 Dim strQuery
 Dim FirstName
 Dim LastName
 Dim City
 Dim Location
 Dim rqUserId
 Dim rqPassword
 Dim  rqRate, rqinsType
 
 rqInstructorId          =  Session("maxInstructorId")
 rqFirstName             =  Trim(Request.Form("firstname"))
 rqLastName 		     =  Trim(Request.Form("lastname"))
 rqEmail1   		     =  Request.Form("email1")
 rqEmail2   		     =  Request.Form("email2")
 rqPhoneNo1			     =  Request.Form("phoneno1")
 rqPassword              =  Request.Form("pwd")
 rqCompName              =  Request.Form("CompName")
 rqCompAdd               =  Replace(Request.Form("CompAdd"),"'","''")
 rqAdd                   =  Replace(Request.Form("address"),"'","''")
 rqCountry               =  Request.Form("Country") 
 rqRate                  =  Request.Form("Rate") 
 rqinsType               =  Request.Form("insType") 
 

'Checking The Instructor Already Added Or Not'
'If Added That Instructor Through One Message "This Instructor Is Already Added"'
'Else Insert Into DataBase'

If session("brand") = "Datrix" OR session("brand") = "PROJstudy" then
            
 strQuery2 = "SELECT firstname,lastname,email1 FROM instructor WHERE email1 = '"& rqEmail1 &"' AND country = '"& session("country") &"' and vendorId = '"&Session("vendor")&"'"
            
ElseIf session("brand") = "All" then
             
 strQuery2 = "SELECT firstname,lastname,email1 FROM instructor WHERE email1 = '"& rqEmail1 &"' AND country = '"& session("country") &"'"

End If 


response.Write(strQuery2)
 Rs2.Open strQuery2,ConnObj

  If (not Rs2.BOF) and (not Rs2.EOF) Then

      FirstName =  Rs2("firstname")
      LastName  =  Rs2("lastname")
	  UserId =    Rs2("email1")

    If (rqEmail1 = UserId) Then

      Session("msg") = "This Instructor Already Added"
      Response.Redirect("instructor.asp")

   End if

  Else

 revLevel = 1

 strQuery = "INSERT INTO instructor (instructorid,firstname,lastname,email1,email2,phoneno1,compname,compadd,address,country,vendorId,RatePerDay,TypeOfInstructor,pwd)"
 strQuery = strQuery & " values "
 strQuery = strQuery & "('" & rqInstructorId & "',"
 strQuery = strQuery & "'" & rqFirstName & "',"
 strQuery = strQuery & "'" & rqLastName & "',"
 strQuery = strQuery & "'" & rqEmail1 & "',"
 strQuery = strQuery & "'" & rqEmail2 & "',"
 strQuery = strQuery & "'" & rqPhoneNo1 & "',"
 strQuery = strQuery & "'" & rqCompName & "',"
 strQuery = strQuery & "'" & rqCompAdd & "',"
 strQuery = strQuery & "'" & rqAdd & "',"
 strQuery = strQuery & "'" & session("country") & "',"
 strQuery = strQuery & "'" & Session("vendor") & "',"
 strQuery = strQuery & "'" & rqRate & "',"
 strQuery = strQuery & "'" & rqinsType & "',"
 strQuery = strQuery & "'" & rqPassword & "')"

Rs.Open strQuery,ConnObj

'If You Entered Comment Then Only Add That Comment'

 If rqComment <> "" Then

 strQuery1 = "Insert Into instructorcomments (comment,enteredby,createddate,revlevel,vendorId,instructorid)"
 strQuery1 = strQuery1 & " Values "
 strQuery1 = strQuery1 & "('" & rqComment & "',"
 strQuery1 = strQuery1 & "'" & Session("UserId") & "',"
 strQuery1 = strQuery1 & "'" & todayDate & "',"
 strQuery1 = strQuery1 & "'" & revLevel & "',"
 strQuery1 = strQuery1 & "'" & Session("vendor") & "',"
 strQuery1 = strQuery1 & "'" & rqInstructorId & "')"

Rs1.Open strQuery1,ConnObj

End If

End If

'Add Instructor If Condition Closed Here'
'And Redirecting This Page to instructor.asp Page'

 Session("msg") = "You Have Successfully Added The Instructor"
 Response.Redirect("instructor.asp")

'If You Editing The Instructor That Values Comes here'

Elseif(rqEdit = "Edit Instructor") Then

 Dim rqEditFirstName
 Dim rqEditLastName
 Dim rqEditEmail1
 Dim rqEditEmail2
 Dim rqEditPhoneNo1
 Dim rqEditCompName
 Dim rqEditCompAdd 
 Dim rqEditAdd 
 Dim rqEditCountry
 Dim rqRevLevel
 Dim rqNewRevLevel
 
 

 rqInstructorId              =  Request.Form("editinstructorid")
 rqEditFirstName             =  Trim(Request.Form("editfirstname"))
 rqEditLastName 		     =  Trim(Request.Form("editlastname"))
 rqEditEmail1   		     =  Request.Form("editemail1")
 rqEditEmail2   		     =  Request.Form("editemail2")
 rqEditPhoneNo1			     =  Request.Form("editphoneno1")
 rqEditCompName              =  Request.Form("editCompName")
 rqEditCompAdd               =  Replace(Request.Form("editCompAdd"),"'","''") 
 rqEditAdd	                 =  Replace(Request.Form("editAdd"),"'","''")
 rqEditCountry   	         =  Request.Form("editCountry")
 rqComment                   =  Replace(Request.Form("comment"),"'","''")
 rqRevLevel                  =  Session("maxRevLevel")
 rqPassword                  =  Request.Form("pwd")
 rqRate                      =  Request.Form("Rate") 
 rqinsType                   =  Request.Form("insType") 

'Sql Query For Updating the instructor'

 strQuery = "UPDATE instructor SET "
 strQuery = strQuery & " firstname = '" & rqEditFirstName & "',"
 strQuery = strQuery & " lastname = '" & rqEditLastName & "',"
 strQuery = strQuery & " email1 = '" & rqEditEmail1 & "',"
 strQuery = strQuery & " email2 = '" & rqEditEmail2 & "',"
 strQuery = strQuery & " phoneno1 = '" & rqEditPhoneNo1 & "',"
 strQuery = strQuery & " compname = '" & rqEditCompName & "',"
 strQuery = strQuery & " compadd = '" & rqEditCompAdd & "',"
 strQuery = strQuery & " address = '" & rqEditAdd & "',"
 strQuery = strQuery & " country = '" & rqEditCountry & "',"
 strQuery = strQuery & " RatePerDay = '" & rqRate & "',"
 strQuery = strQuery & " TypeOfInstructor = '" & rqinsType & "',"
 strQuery = strQuery & " pwd = '" & rqPassword & "'" 
 strQuery = strQuery & " WHERE instructorid = '" & rqInstructorId &"' and vendorId = '"&Session("vendor")&"'"
 

 Rs.Open strQuery,ConnObj
 
'Add The Comment'
 If rqComment <> "" Then

 strQuery1 = "Insert Into instructorcomments (comment,enteredby,createddate,revlevel,vendorId,instructorid)"
 strQuery1 = strQuery1 & " Values "
 strQuery1 = strQuery1 & "('" & rqComment & "',"
 strQuery1 = strQuery1 & "'" & Session("UserId") & "',"
 strQuery1 = strQuery1 & "'" & todayDate & "',"
 strQuery1 = strQuery1 & "'" & rqRevLevel & "',"
 strQuery1 = strQuery1 & "'" & Session("vendor") & "',"
 strQuery1 = strQuery1 & "'" & rqInstructorId & "')"

 Rs1.Open strQuery1,ConnObj

 End If

'After Updating The Instructor Redirect to instructor.asp Page '

 Session("msg") = "You Have Successfully Edited The Instructor"
 Response.Redirect("instructor.asp?type=editOrDelete")

'If You Click The Delete That Will COmes Here'
'And Redirecting To instructor.asp Page'

Elseif rqDeleteId <> "" Then

 strQuery = "DELETE FROM instructor Where instructorid = '" & rqDeleteId & "'"

 Rs.Open strQuery,ConnObj

 Session("msg") = "You Have Successfully Deleted The Instructor"
 Response.Redirect("instructor.asp?type=editOrDelete")

End If

'If you want only add comment that will come here'
'After add the comment redirecting to instructor.aps page'

Dim rqAddComment
Dim rqAddCommentInstructorId

rqAddComment   =  Request.Form("addcommnet")
rqInstructorId =  Request.Form("instructorId")
rqComment      =  Replace(Request.Form("comment"),"'","''")
rqRevLevel     =  Session("maxRevLevel")

If rqAddComment = "Add Comment" Then

 strQuery = "Insert Into instructorcomments (comment,enteredby,createddate,revlevel,vendorId,instructorid)"
 strQuery = strQuery & " Values "
 strQuery = strQuery & "('" & rqComment & "',"
 strQuery = strQuery & "'" & Session("UserId") & "',"
 strQuery = strQuery & "'" & todayDate & "',"
 strQuery = strQuery & "'" & rqRevLevel & "',"
 strQuery1 = strQuery1 & "'" & Session("vendor") & "',"
 strQuery = strQuery & "'" & rqInstructorId & "')"

 Rs.Open strQuery,ConnObj

 Response.Redirect("instructor.asp?type=View&viewinstructorid=" &rqInstructorId)
End If

Rs.Close
Rs1.Close
ConnObj.Close
Else
 Response.Redirect("../backOffice/login.asp")
End if
%>
