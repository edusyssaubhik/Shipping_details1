
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 23/09/2010'
'Description :'
' Add/Edit/Delete examDetails '
'======================================================='
%>
<% If not  Session("UserId") = "" Then %>
	<!--#include virtual="./includes/connection.asp"-->
<%

Dim rqEditExamDate,rqEditExamTime,rqEditExamid 

 Set Rs = Server.CreateObject("ADODB.Recordset")
 Set Rs1 = Server.CreateObject("ADODB.Recordset")
 Set Rs2 = Server.CreateObject("ADODB.Recordset")




'Retrive All User Values From classroomphotos.asp Page'

 rqCity               =  Request.Form("city")
 rqExamDate           =  Request.Form("ExamDate")
 rqExamTime           =  Request.Form("ExamTime")
 rqExamId			  =  Request.Form("Examid")
 

'==================================================='
'If User Clicks Add City and Add One City That City We Insert Here'
'strQuery1 For Searching User Entered City Already Existing Or Not'
'If City already Existed Then Display One Message in city.asp Page "You Already Added This City"'
'If you haven't That City it Will Insert Into DataBase
'==================================================='


 'Retrive Type From examdetails.asp Page'
  If Request.Form("type")<> "" Then
  rqType = Request.Form("type")
  Else
  rqType = Request.Querystring("type")
  End If
  response.Write(rqType)
  'If You Creating New User That Details We Insert Here'
'If Condtion Open For Create User'

If rqType = "Add" Then

 strQuery = "INSERT INTO PROJITIL-liveclass_examdetails (city,examDate,examTime,CertificationID,VendorID)"
 strQuery = strQuery & " Values "
 strQuery = strQuery & "('" & rqCity  & "',"
 strQuery = strQuery & "'" & rqExamDate & "',"
 strQuery = strQuery & "'" & rqExamDate & "',"
 strQuery = strQuery & "'1',"
 strQuery = strQuery & "'1')"
 response.Write(strQuery)
 Rs.Open strQuery,ConnObj

 Session("message") = "You Have Successfully Added exam details"
 Response.Redirect("ITIL-examDetails.asp")
 
 End If
 
If rqType = "Edit" Then

 rqEditCity        = Request.Form("editcity")
 rqEditExamDate    = Request.Form("editExamDate")
 rqEditExamTime    =  Request.Form("editExamTime")
 rqEditExamid      =  Request.form("editExamId")
  
 strQuery2 = "UPDATE PROJITIL-liveclass_examdetails SET city = '"& rqEditCity &"', examDate = '" & rqEditExamDate & "', examTime = '" & rqEditExamTime & "' Where Examid = '" & rqEditExamid & "'"
'response.Write(strQuery2)
 Rs1.Open strQuery2,ConnObj


 Session("message") = "You Have Successfully Edited Live class exam detail"
 Response.Redirect("ITIL-examDetails.asp")

End If

'==================================================='
'If You Click The Delete Button That Particular Delete Here'
'And Display The Message in city.asp Page'
'==================================================='

 rqDelete = Request.Querystring("delete")

If rqDelete <> "" Then

 strQuery3 = "DELETE FROM PROJITIL-liveclass_examdetails WHERE Examid = '" & rqDelete & "'"

 Rs2.Open strQuery3,ConnObj

 Session("message") = "You Have Successfully Deleted Live class exam detail"
 Response.Redirect("ITIL-examDetails.asp")

End If

 'Rs.Close
 Set Rs = Nothing
 ConnObj.Close
 Set ConnObj = Nothing
 Else
  Response.Redirect("../backOffice/login.asp")
 End If
%>