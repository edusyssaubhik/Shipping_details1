<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 23/09/2010'
'Description :'
' Add/Edit/Delete city '
'======================================================='
%>
<% If not  Session("UserId") = "" Then %>
<!--#include file="includes/connection.asp"-->
<%
 'Declare The Variables'

 Dim strQuery
 Dim strQuery1
 Dim rqCountry
 Dim addCourse
 Dim rqEditCountry
 Dim rqCity
 Dim rqState
 Dim rqStateCode
 Dim editCourse
 Dim rqEditCity
 Dim rqEditCityId
 Dim rqEditState
 Dim rqEditStateCode
 Dim strQuery2
 Dim rqDelete
 Dim strQuery3
 Dim strQuery4
 Dim strQuery5
 Dim Rs1,Rs
 Dim Rs2
 Dim City
 Dim rqcertification,rqRefNumber,rqCourseName,rqDuration,rqCapacity
 Dim rqEditCertification,rqeditRefNumber, rqeditcourseName, rqeditedDuration, rqEditCourseId
 DIm rqStartHour, rqStartMin,rqStartSession,rqEndHour,rqEndMin,rqEndSession,rqRetailPrice

 Set Rs = Server.CreateObject("ADODB.Recordset")
 Set Rs1 = Server.CreateObject("ADODB.Recordset")
 Set Rs2 = Server.CreateObject("ADODB.Recordset")

'==================================================='
'Retrive From city.asp Page User Clicks Add City Or Edit City'
'==================================================='

 addCourse = Request.Form("addCourse")
 response.Write(addCourse)

 editCourse = Request.Form("editcourse")

'==================================================='
'If User Clicks Add City and Add One City That City We Insert Here'
'strQuery1 For Searching User Entered City Already Existing Or Not'
'If City already Existed Then Display One Message in city.asp Page "You Already Added This City"'
'If you haven't That City it Will Insert Into DataBase
'==================================================='

If addCourse= "Add Course" Then


  rqcertification      =  Request.Form("certification")
  rqRefNumber          =  Request.Form("RefNumber")
  rqCourseName         =  Request.Form("courseName")
  rqDuration           =  Request.Form("Duration")
  rqStartHour	       =  Request.Form("startinghour")
  rqStartMin		   =  Request.Form("startingminute")
  rqStartSession	   =  Request.Form("sessionstart")
  rqEndHour		       =  Request.Form("endinghour")
  rqEndMin		       =  Request.Form("endingminute")
  rqEndSession	       =  Request.Form("sessionend")
  rqRetailPrice        =  Request.Form("RetailPrice")
  rqCapacity           =  Request.Form("Capacity")

 strQuery = "INSERT INTO datrixCourse (RefNumber,courseName,Duration,starthour,startminute,startsession,endhour,endminute,endsession,RetailPrice,certificationId,vendorId) values ('"& rqRefNumber & "','"& rqCourseName &"','"&rqDuration&"','"&rqStartHour&"','"&rqStartMin&"','"&rqStartSession&"','"&rqEndHour&"','"&rqEndMin&"','"&rqEndSession&"','"&rqRetailPrice&"','"&rqcertification&"','2')"

'response.Write(strQuery)'
    Rs.Open strQuery,ConnObj

    Session("message") = "You Have Successfully Added course "
    Response.Redirect("staticCourse.asp")


End If

'==================================================='
'If You Click Edit In city.asp Page In That Page You can Edit That City and Insert Here'
'At The Same Time in Location Table also We Can Edit That particular City'
'Retrive The cityId and Edited City From city.asp Page'
'==================================================='

If editCourse = "Edit Course" Then

 rqEditCertification   = Request.Form("editCertification")
 rqeditRefNumber      = Request.Form("editRefNumber")
 rqeditcourseName    = Request.Form("editcourseName")
 rqeditedDuration     =  Request.Form("editedDuration")
 rqEditCourseId      =  Request.Form("editCourseid")
  rqStartHour	       =  Request.Form("startinghour")
  rqStartMin		   =  Request.Form("startingminute")
  rqStartSession	   =  Request.Form("sessionstart")
  rqEndHour		       =  Request.Form("endinghour")
  rqEndMin		       =  Request.Form("endingminute")
  rqEndSession	       =  Request.Form("sessionend")
  rqRetailPrice        =  Request.Form("RetailPrice")
  rqCapacity           =  Request.Form("Capacity")


 strQuery2 = "UPDATE datrixCourse SET certificationId = '"& rqEditCertification &"', RefNumber = '" & rqeditRefNumber & "', courseName = '" & rqeditcourseName & "', starthour = '"& rqStartHour & "',startminute = '"& rqStartMin & "', startsession = '"& rqStartSession & "', endhour = '"& rqEndHour & "',endminute = '"& rqEndMin & "',endsession = '"& rqEndSession & "',RetailPrice = '" & rqRetailPrice & "', Duration = '" & rqeditedDuration & "' Where courseid = '" & rqEditCourseId & "'"

 Rs.Open strQuery2,ConnObj

 Session("message") = "You Have Successfully Edited course "
    Response.Redirect("staticCourse.asp")

End If

'==================================================='
'If You Click The Delete Button That Particular Delete Here'
'And Display The Message in city.asp Page'
'==================================================='

 rqDelete = Request.Querystring("delete")

If rqDelete <> "" Then

 strQuery3 = "DELETE FROM datrixCourse WHERE courseid = '" & rqDelete & "'"

 Rs.Open strQuery3,ConnObj


 Session("message") = "You Have Successfully Deleted course"
    Response.Redirect("staticCourse.asp")

End If

 Rs.Close
 Set Rs = Nothing
 ConnObj.Close
 Set ConnObj = Nothing
 Else
  Response.Redirect("../backOffice/login.asp")
 End If
%>