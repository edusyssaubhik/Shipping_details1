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
 Dim rqcertification,rqRefNumber,rqCourseName,rqWhatyoulearn,rqAudienceProfile,rqPrerequisites,rqOutline
 Dim rqEditCertification,rqeditRefNumber, rqeditcourseName, rqeditWhatyoulearn, rqEditCourseId,rqeditAudienceProfile,rqeditedPrerequisites,rqeditedOutline

 Set Rs = Server.CreateObject("ADODB.Recordset")
 Set Rs1 = Server.CreateObject("ADODB.Recordset")
 Set Rs2 = Server.CreateObject("ADODB.Recordset")

'==================================================='
'Retrive From city.asp Page User Clicks Add City Or Edit City'
'==================================================='

  Function StrQuoteReplace(strValue)
	 StrQuoteReplace = Replace(strValue, "'", "")
  End Function




 addCourse = Request.Form("addCourse")

 editCourse = Request.Form("editcourse")
   response.Write(editCourse)

'==================================================='
'If User Clicks Add City and Add One City That City We Insert Here'
'strQuery1 For Searching User Entered City Already Existing Or Not'
'If City already Existed Then Display One Message in city.asp Page "You Already Added This City"'
'If you haven't That City it Will Insert Into DataBase
'==================================================='

If addCourse= "Add Course Content" Then


  rqcertification      =  Request.Form("certification")
  rqRefNumber          =  Request.Form("RefNumber")
  rqCourseName         =  Request.Form("courseName")
  rqWhatyoulearn       =  replace(Request.Form("Whatyoulearn"),"'","")
  rqAudienceProfile    =  replace(Request.Form("AudienceProfile"),"'","")
  rqPrerequisites      =  replace(Request.Form("Prerequisites"),"'","")
  rqOutline            =  replace(Request.Form("Outline"),"'","")

 strQuery = "UPDATE datrixCourse SET Whatyoulearn = '"& StrQuoteReplace(rqWhatyoulearn) &"', AudienceProfile = '" & StrQuoteReplace(rqAudienceProfile) & "', Prerequisites = '" & StrQuoteReplace(rqPrerequisites) & "', Outline = '" & StrQuoteReplace(rqOutline) & "' Where certificationId = '" & StrQuoteReplace(rqcertification) & "' and 	RefNumber = '" & rqRefNumber & "'"


response.Write(strQuery)
    Rs.Open strQuery,ConnObj

    Session("message") = "You Have Successfully Added course "
    Response.Redirect("courseContent.asp")


End If

'==================================================='
'If You Click Edit In city.asp Page In That Page You can Edit That City and Insert Here'
'At The Same Time in Location Table also We Can Edit That particular City'
'Retrive The cityId and Edited City From city.asp Page'
'==================================================='

If editCourse = "Edit Course Content" Then

 rqEditCertification      =  Request.Form("editCertification")
  rqeditCourseName        =  Request.Form("editCourseName")
 rqeditRefNumber          =  Request.Form("editRefNumber")
 rqeditWhatyoulearn       =  replace(Request.Form("editWhatyoulearn"),"'","")
 rqeditAudienceProfile    =  replace(Request.Form("editAudienceProfile"),"'","")
 rqeditedPrerequisites    =  replace(Request.Form("editedPrerequisites"),"'","")
 rqeditedOutline          =  replace(Request.Form("editedOutline"),"'","")
  rqEditCourseId          =  Request.Form("editCourseid")
  
 strQuery2 = "UPDATE datrixCourse SET Whatyoulearn = '"& StrQuoteReplace(rqeditWhatyoulearn) &"', AudienceProfile = '" & StrQuoteReplace(rqeditAudienceProfile) & "', Prerequisites = '" & StrQuoteReplace(rqeditedPrerequisites) & "', Outline = '" & StrQuoteReplace(rqeditedOutline) & "' Where courseid = '" & rqEditCourseId & "'"
response.Write(strQuery2)
 Rs.Open strQuery2,ConnObj

 Session("message") = "You Have Successfully Edited course " 
    Response.Redirect("courseContent.asp")

End If

'==================================================='
'If You Click The Delete Button That Particular Delete Here'
'And Display The Message in city.asp Page'
'==================================================='

 rqDelete = Request.Querystring("delete")

If rqDelete <> "" Then

 strQuery3 = "DELETE Whatyoulearn, AudienceProfile, Prerequisites, Outline FROM datrixCourse WHERE courseid = '" & rqDelete & "'"

 Rs.Open strQuery3,ConnObj


 Session("message") = "You Have Successfully Deleted course"
    Response.Redirect("courseContent.asp")

End If

 Rs.Close
 Set Rs = Nothing
 ConnObj.Close
 Set ConnObj = Nothing
 Else
  Response.Redirect("../backOffice/login.asp")
 End If
%>