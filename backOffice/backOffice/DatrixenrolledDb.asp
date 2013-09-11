<%@ LANGUAGE="VBScript" %>
<%' OPTION EXPLICIT %>
<!--#include virtual ="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<!--#include virtual="/includes/connectionRef.asp"-->


<% If not Session("UserId") = "" Then %>
<%
Response.Buffer = True
Response.ExpiresAbsolute = 0

Dim rqFirstName,rqLastName,rqPrimaryEmail,rqaddress_country
Dim rqActive, conObj,rqComment,rqComments,rqCountryOrigin,rqPOexpected,POExpectedDate1
Dim rqType,rqStatus,rqUser,strQuery,strQuery1,strQuery2,rqEnrollUserId,EnrollStatus
Dim rqUserId,rqEnrollDate,rqRevLevel,Setcheckreceived,Currency_Format_Front,Currency_Format_Back
Dim ChangeStatusDateBy,strVAT,RsVAT,VAT_Invoice,rqorderNo,text1,rqTotal,rqPaymentdate
Dim rqStatusNumber,rqCourseDetails,rqCity,str,i,rqModeofPayment,PRINCE2Manual
Dim rqCourseId, rqEnrollStatus,Rs,rqSrNo,rqSrNo2,rqStatus1,rqpage,rqAmount,rqVAT,VAT
Dim rqName,rqEmailid,rqcourse ,rqPhoneno,status1,rqStatus2,rqCountry,PRINCE2ManualPrice
DIm Rs1,Rs2,Rs3,Rs4,RsPoint,strQuery3,RefID,Ref_Points,strRewPoints,RewardPoints,Points,TotalPoints,RefRs

set Rs = Server.CreateObject("ADODB.Recordset")
set Rs1 = Server.CreateObject("ADODB.Recordset")
set Rs2 = Server.CreateObject("ADODB.Recordset")
Set Rs3 = Server.CreateObject("ADODB.Recordset")
Set Rs4 = Server.CreateObject("ADODB.Recordset")
Set RsPoint  = Server.CreateObject("ADODB.Recordset")

Set RefRs =  Server.CreateObject("ADODB.Recordset")

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "''")
End Function

rqUserId = Session("UserId")

'-------------------------------'
' Extracting values from posted values'
' for serching'
'-------------------------------'
    rqCourseDetails     = Request.Form("CourseDetails")
	rqType				= Request.Querystring("type")
	rqpage				= Request.Querystring("page")
	rqFirstName	    	= Request.Form("firstname")
	rqLastName          = Request.Form("lastname")
	rqPrimaryEmail		= Request.Form("email")
	rqActive			= Request.Form("review")
	rqStatus1			= Request.form("Status")
	rqStatus			= Request.form("status")
	rqUser 				= Request.form("Username")
    rqEnrollUserId      = Request.form("enrollUserId")
    rqComment           = Request.Form("comment")
	rqComments           = Request.Form("comments")
    rqEnrollDate        = Request.Form("enrolldate")
	rqCourseId          = Request.Form("courseId")
	rqEnrollStatus      = Request.Form("enrollStatus")
	rqPOexpected        = Request.Form("POexpected")
    rqSrNo              = Request.Form("SrNo")
	rqSrNo2             = Request.Form("SrNo2")
	rqaddress_country   = Request.Form("address_country")
	rqAmount			= Request.Form("Amount")
	rqModeofPayment     = Request.Form("modeofpayment")
	rqorderNo           = Request.Form("orderNo")
	PRINCE2Manual       = Request.Form("PRINCE2Manual")
	PRINCE2ManualPrice       = Request.Form("PRINCE2ManualPrice")
	rqVAT               = Request.Form("VAT")
	rqPaymentdate       = Request.Form("Paymentdate")

	
	


rqStatus = Request.form("Candidatestatus")


					 


If rqType = "review" Then

	

	  strQuery = "Update enrolledusers Set "
	  strQuery = strQuery & "status   = '"&rqStatus&"',"
	  strQuery = strQuery & " where  id     = '" & rqEnrollUserId & "'"

      Rs.Open strQuery,ConnObj
	  
	 
	 

   Response.redirect("datrixClass.asp?CourseId="&rqCourseId)

	 

End If

ElseIf rqType = "status" then

  rqStatus = request.Form("changestatus")
  ChangeStatusDateBy = Now() & " by " & rqUserId
  'Response.Write(rqActive)
 
  If rqActive = 4 Then
     rqStatusNumber = 4
  Else
	  If rqStatus = "Active" then
		 rqStatusNumber = 1
	  ElseIf rqStatus = "Re-Schedule" then
		 rqStatusNumber = 2
	  ElseIf rqStatus = "Cancel" then
		 rqStatusNumber = 3
	  End If
  End If
	 
	strQuery1 =  "Update enrolledusers set status = '" & rqStatus & "',changestatusdateby = '" & ChangeStatusDateBy &"',statusnumber = '" & rqStatusNumber & "'  where id = '" & rqEnrollUserId & "'"

    Rs.Open strQuery1,ConnObj

    Response.Redirect("courses.asp?CourseId="&rqCourseId)

ElseIf rqType = "comment" then

 rqComment  =  Request.Form("notes")
 rqRevLevel =  Session("maxRevLevel")

 strQuery1 = "Insert Into enrolledusercomments (comment,enteredby,createddate,revlevel,enrolluserid)"
 strQuery1 = strQuery1 & " Values "
 strQuery1 = strQuery1 & "('" & StrQuoteReplace(rqComment) & "',"
 strQuery1 = strQuery1 & "'" & Session("UserId") & "',"
 strQuery1 = strQuery1 & "'" & Now() & "',"
 strQuery1 = strQuery1 & "'" & rqRevLevel & "',"
 strQuery1 = strQuery1 & "'" & rqEnrollUserId & "')"

 Rs.Open strQuery1,ConnObj

 Session("message") = "You Have Successfully Added Comment"
 Response.Redirect("courses.asp?CourseId="&rqCourseId)
 
 
 ElseIf rqType = "comments" then

 rqComments  =  Request.Form("notes")
 rqRevLevel =  Session("maxRevLevel")

 strQuery1 = "Insert Into freeenrolledusercomments (comment,enteredby,createddate,revlevel,enrolluserid)"
 strQuery1 = strQuery1 & " Values "
 strQuery1 = strQuery1 & "('" & StrQuoteReplace(rqComments) & "',"
 strQuery1 = strQuery1 & "'" & Session("UserId") & "',"
 strQuery1 = strQuery1 & "'" & Now() & "',"
 strQuery1 = strQuery1 & "'" & rqRevLevel & "',"
 strQuery1 = strQuery1 & "'" & rqEnrollUserId & "')"

 Rs.Open strQuery1,ConnObj

 Session("message") = "You Have Successfully Added Comment"
 Response.Redirect("enrolments.asp?type=Submit")
 
 ElseIf rqpage = "Status" Then
 
 
 strQuery1 = "Insert Into callsreceived_new (callfor,callername,phoneno,emailid,question,call_status1,call_status2,addeddate,addedby,country,website,ID)"
 strQuery1 = strQuery1 & " Values "
  strQuery1 = strQuery1 & "('Free enroll',"
 strQuery1 = strQuery1 & "'" &rqName& "',"
 strQuery1 = strQuery1 & "'" & rqPhoneno& "',"
 strQuery1 = strQuery1 & "'" & rqEmailid& "',"
 strQuery1 = strQuery1 & "'" & rqcourse & "',"
 strQuery1 = strQuery1 & " '1' ,"
 strQuery1 = strQuery1 & "'" & status1 & "',"
 strQuery1 = strQuery1 & "'" & Now() & "',"
 strQuery1 = strQuery1 & "'" & Session("UserId") & "',"
 strQuery1 = strQuery1 & "'" & rqaddress_country & "',"
 strQuery1 = strQuery1 & "'PROJstudy',"
 strQuery1 = strQuery1 & "'" & rqCourseId & "'  )"
	Rs.Open strQuery1, ConnObj
	
 Response.Redirect("enrolments.asp?type=preview&SrNo="&rqSrNo&"&SrNo2="&rqSrNo2&"")
 
	'ConnObj.Execute "UPDATE freeenrolleduserstatus SET status = '" & rqStatus1 & "', enteredby = '"& Session("UserId") &"' WHERE enrolluserid = '" & rqEnrollUserId &"'"
Elseif rqpage = "Edit" Then
      
	  
ConnObj.Execute "UPDATE callsreceived_new SET call_status2 = '" & rqStatus2 & "', addedby = '"& Session("UserId") &"' WHERE ID = '" & rqCourseId &"'"
 Response.Redirect("enrolments.asp?type=preview&SrNo="&rqSrNo&"&SrNo2="&rqSrNo2&"")


	
ElseIf rqType = "enrollStatus" And rqPOexpected = "" Then

	ConnObj.Execute "UPDATE enrolledusers SET us_status = '" & rqEnrollStatus & "', us_status_addedby = '"& Session("UserId") &"' WHERE id = '" & rqEnrollUserId &"'"
	'response.Write("UPDATE ps_enrolledusers SET us_status = '" & rqEnrollStatus & "', us_status_addedby = '"& Session("UserId") &"' WHERE id = '" & rqEnrollUserId &"'")
	Response.Redirect("courses.asp?CourseId="&rqCourseId)


ElseIf  rqType = "enrollStatus" And rqEnrollStatus = "P.O Received" AND rqPOexpected <> "" Then

	ConnObj.Execute "UPDATE enrolledusers SET us_status = '" & rqEnrollStatus & "', po_expected = '" & rqPOexpected & "', us_status_addedby = '"& Session("UserId") &"' WHERE id = '" & rqEnrollUserId &"'"
	Response.Redirect("courses.asp?CourseId="&rqCourseId)
End If

%>
<%

  ConnObj.Close
  Else
 Response.Redirect("/backOffice/login.asp")
   End If
%>