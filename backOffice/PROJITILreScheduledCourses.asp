<%@ Language = "VBScript" %>
<% 'OPTION EXPLICIT %>
<%
 'Written By : Bharath'
 'Last UpaDated: 23/11/2007'
 'Description :'
 'Purpose : In This Page We Diplaying All Courses'
 'Re-Scheduling The Course'
 'This Page Comes From courses.asp Page'
%>
<!--#include virtual ="includes/connection.asp"-->
<!--#include virtual ="includes/displayFormat.asp"-->
<%
 'Declare The Variables'
 Dim strQuery,strQuery1,strQuery2,strQuery3,strQuery4
 Dim ApplicableDays,rqReschedule,rqRescheduledCourse
 Dim FirstName,LastName,Email,NameOfEmployeer,PhoneNumber,Pmbok
 Dim startingDate,splitStartDate,endingDate,splitEndDate
 Dim Course,Course1,Course2,i,todaysDate,Date2
 Dim price,dbprice,dtax,coursePrice,Total,rqAmount
 Dim CheckReceived,CheckReceivedDate,CheckReceivedBy
 Dim rqEnrollUserId,StatusNumber,CourseDate,CourseId,str7,DiscountPercentage,PMBokPrice,rqCourseID
 Dim strDisplay,rqType,rqStatus,rqUserId,ChangeStatusDateBy,rqActive,rqStatusNumber,rqAction
 Dim rqRescheduleCourse,str,rqResCourseID,rqFBdiscount
 Dim rqRegType,rqWeekendType,str1,str6,rqReschRegCourse,rqReschWeekendCourse,rqCanAmount,rqRefAmount,rqRefAmount1

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "''")
End Function
  
 rqCourseId     =  Request.Form("courseId")
 rqEnrollUserId =  Request.Form("enrollUserId")
 rqType	        =  Trim(Request.Form("changestatus"))
 rqAction       =  Request.Form("type")
 rqUserId       =  Session("UserId")
 rqAmount      =  Request.Form("Amount")
 rqMBGAmount      =  Request.Form("mbg_amount")

Set Rs = Server.CreateObject("ADODB.Recordset")
 Set Rs1 = Server.CreateObject("ADODB.Recordset")
 Set Rs2 = Server.CreateObject("ADODB.Recordset")
 
  'Re-Schedule Not Confirmed  
 If rqType = "Re-Schedule Not Confirmed" Then 


	  ChangeStatusDateBy = Now() & " by " & rqUserId
	  rqStatus = "Re-Schedule Not Confirmed"
	  rqStatusNumber = 5
	  
	  rqCourseId     =  Request.Form("courseId")

  	  strQuery1 =  "Update PROJITIL_enrolledusers set status = '" & rqStatus & "',changestatusdateby = '" & ChangeStatusDateBy &"',statusnumber = '" & rqStatusNumber & "'  where id = '" & rqEnrollUserId & "'"
	
 	'Response.Write(strQuery1)
     Rs1.Open strQuery1,ConnObj
     ' Rs1.Close
     'Response.Write(strQuery1)
	
     Response.Redirect("ITIL-courses.asp?CourseId="&rqCourseId)
 
End If

 'Status changing from Re-Schedule Not Confirmed to Active'
 If rqType = "Active" Then 


	  ChangeStatusDateBy = Now() & " by " & rqUserId
	  rqStatus = "Active"
	  rqStatusNumber = 1
	  
	  rqCourseId     =  Request.Form("courseId")

  	  strQuery1 =  "Update PROJITIL_enrolledusers set status = '" & rqStatus & "',changestatusdateby = '" & ChangeStatusDateBy &"',statusnumber = '" & rqStatusNumber & "'  where id = '" & rqEnrollUserId & "'"
	
     ConnObj.Execute strQuery1
	
     Response.Redirect("ITIL-courses.asp?CourseId="&rqCourseId)
 
End If


If rqAction = "Cancel" Then
 
  ChangeStatusDateBy = Now() & " by " & rqUserId
  rqStatus = "Cancel" 
  rqStatusNumber = 3
  
   rqCanAmount =  Request.Form("CanAmount")
   rqCourseId     =  Request.Form("courseId")
   


  
    strQuery1 =  "Update PROJITIL_enrolledusers set status = '" & rqStatus & "',changestatusdateby = '" & ChangeStatusDateBy &"',statusnumber = '" & rqStatusNumber & "' ,res_can_mbg_amount = '" & rqCanAmount & "'  where id = '" & rqEnrollUserId & "'"
	

    Rs1.Open strQuery1,ConnObj
   ' Rs1.Close
  ' Response.Write(strQuery1)
	
   Response.Redirect("ITIL-courses.asp?CourseId="&rqCourseId)

ElseIf rqAction = "MBG" Then

'MBG
 ChangeStatusDateBy = Now() & " by " & rqUserId
  rqStatus = "MBG" 
  rqStatusNumber = 4
  
    rqRefAmount =  Request.Form("RefAmount")
    rqCourseId     =  Request.Form("courseId")
	
	If (rqMBGAmount = "" OR IsNull(rqMBGAmount)) Then
	  rqMBGAmount = 0 
	End If
	
	rqRefTotAmount =   (Int(rqMBGAmount)) + (Int(rqRefAmount))
	
      response.write(rqRefAmount1)

    strQuery1 =  "Update PROJITIL_enrolledusers set status = '" & rqStatus & "',changestatusdateby = '" & ChangeStatusDateBy &"',statusnumber = '" & rqStatusNumber & "',res_can_mbg_amount = '" & rqRefTotAmount & "'  where id = '" & rqEnrollUserId & "'"

    Rs1.Open strQuery1,ConnObj
   ' Rs1.Close
	
    Response.Redirect("ITIL-courses.asp?CourseId="&rqCourseId)


ElseIf rqAction = "Re-Schedule" Then

 'Dispaly The Today Date'

 todaysDate=now()

'Increment 5 Days and Display That'

 Date2 = DateAdd("d", +6,CDate(todaysDate)) 

	 'If rqType = "Re-Schedule" Then
	
	 'Retrive Values From This Page'
	 
	  strQuery1 = "SELECT * FROM PROJITIL_enrolledusers WHERE id = '"& rqEnrollUserId &"'"
		 
	  Rs.Open strQuery1,ConnObj
	  
	  Do Until Rs.EOF 
	  
	   FirstName         =  Rs("firstname")
	   LastName          =  Rs("lastname")
	   Email             =  Rs("email")
	   NameOfEmployeer   =  Replace(Rs("nameofemployeer"),"'","''")
	   PhoneNumber       =  Rs("phoneno")
	   Pmbok             =  Rs("pmbok")
	   CheckReceived     =  Rs("checkreceived")
	   CheckReceivedDate =  Rs("checkreceiveddate")
	   CheckReceivedBy   =  Rs("checkreceivedby")
	   StatusNumber      =  Rs("statusnumber")
	   DiscountPercentage=  Rs("discountpercentage")
	   PMBokPrice        =  Rs("pmbokprice")
	   rqCourseID        =  Rs("courseid")
	   rqAmount          =  Rs("Amount")
	   rqOldCourseDet    =  Rs("coursedetails")
	   rqOldResAmount       =  Rs("res_can_mbg_amount")
	   rqcourseType      =  Rs("courseType")
	   rqVAT             =  Rs("VAT")
	   rqFBdiscount      =  Rs("FBdiscount")


	   
	   'Retrive the course details and split the city, course date and price'
	   'Because of displaying the course details in the email and city for sending the emails to faculty'
	   rqCourseDetails   =  Split(Rs("coursedetails"),"for ")
	   
	   CourseDetails1 = rqCourseDetails(0)
	   
	   CourseDetails2 = Split(rqCourseDetails(0),":")
	
	   oldCity = Trim(CourseDetails2(0))   
	   oldCourseDate = CourseDetails2(1)
	   
	  Rs.Movenext
	  Loop
	  
	  Rs.Close
	
	' End If   


 'rqReschedule = Request.Form("reschedule")
 
 'If rqReschedule = "Re-Schedule" Then
 
  rqResCourseID = Request.Form("reschCourseID")
  rqResAmount = request.Form("ResAmount")
	 'If rqResCourseID <> "" Then
	
		'SQL Query For Retrieve The Prices Displaying in The Step Two'
	
		 strQuery2 = "SELECT * FROM PROJITIL_course Where courseid = '" & rqResCourseID & "'"
	
		 Rs.Open strQuery2,ConnObj
	
		 Do until Rs.EOF
			
			City      = Rs("city")
			StartDate = Rs("startdate")
			EndDate   = Rs("enddate")
			ApplicableDays = Rs("applicabledays")

			
	
			If (CDate(StartDate)-(Date()+ApplicableDays+1) >= 0) Then
				Total = Rs("afterEBdiscountwithtax")
				TotalCCAvenue = Int(Rs("afterEBdiscountwithtax"))
			Else
				Total = Rs("pricewithtax") 
				TotalCCAvenue = Int(Rs("pricewithtax"))
			End If
			
			Tax = Rs("tax")
	
		 Rs.movenext
		 Loop
		 Rs.Close					 
	
		 CourseDetails = City & " : " & FormatDateTime(StartDate,1) & " to " & FormatDateTime(EndDate,1) & " for " & Currency_Format_Front & " " & FormatNumber(Total) & " " & Currency_Format_Back
	
		CourseDate = StartDate & " to " & EndDate	
	
		If StatusNumber = 4 Then
		   StatusNumber = 4
		Else
		   StatusNumber = 1 
		End If
		
		If IsNull(rqOldResAmount) Then
			TotalResAmount = rqResAmount
		Else
			TotalResAmount = (Int(rqResAmount) + Int(rqOldResAmount))
		End If
		
		Response.Write("Res: "& TotalResAmount)
		
		'for displaying the prices in UK'
		'Actual amount and VAT'
		If (Session("country") = "United Kingdom" OR Session("country") = "India" OR Session("country") = "Australia" ) Then
		    
			'X is calculating the revised VAT percentage'
			x = (1 + (Tax/100))
			
			Response.write(X)
			
				'Calculating the VAT refunded'
				RevisedVAT1 = (TotalResAmount - (TotalResAmount/x))
				
				'Calculating the course fee in reschedule amount'
				RevCourseFee1 = TotalResAmount - RevisedVAT1
				
				'Calculating the Revised VAT'
				RevisedVAT = rqVAT + RevisedVAT1
				
				'Revised Course Fee after deducting the Revised VAT'
				RevisedCourseFee = (rqAmount + RevCourseFee1)
				
			'	Response.Write(RevisedVAT)



'			VAT_Cal1 = ((CInt(TotalWithoutTax) * Cdbl(Tax)) / 100)
'			

'			VAT_Cal2 = Cdbl(VAT_Cal1)
'			
'			If VAT_Cal2 = Fix(VAT_Cal2) Then
'			VAT = VAT_Cal2
'			Else
'			VAT = Fix(VAT_Cal2) + 1
'			End If
			
		End If		

 		CourseDetails = City & " : " & FormatDateTime(StartDate,1) & " to " & FormatDateTime(EndDate,1) & " for " & Currency_Format_Front & " " & FormatNumber(RevisedCourseFee) & " " & Currency_Format_Back
 	
	
		  strQuery3 = "INSERT INTO PROJITIL_enrolledusers (firstname,lastname,email,nameofemployeer,phoneno,coursedetails,coursedate,amount,dateofenrollment,paybefore,status,pmbok,checkreceived,checkreceiveddate,checkreceivedby,statusnumber,courseid,discountpercentage,pmbokprice,res_can_mbg_amount,country,courseType,"
		  
		  
	  IF rqFBdiscount <> "" Then
	  strQuery3 = strQuery3 & " FBdiscount,"
	  End IF
	   strQuery3 = strQuery3 &" VAT)"
		  
		   
		 strQuery3 = strQuery3 & " Values "
		 strQuery3 = strQuery3 & "('" & FirstName & "',"
		 strQuery3 = strQuery3 & "'" & LastName & "',"
		 strQuery3 = strQuery3 & "'" & Email & "',"
		 strQuery3 = strQuery3 & "'" & NameOfEmployeer & "',"
		 strQuery3 = strQuery3 & "'" & PhoneNumber & "',"
		 strQuery3 = strQuery3 & "'" & CourseDetails & "',"
		 strQuery3 = strQuery3 & "'" & CourseDate & "',"
		 strQuery3 = strQuery3 & "'" & (Int(rqAmount) + Int(rqResAmount)) & "',"
		 strQuery3 = strQuery3 & "'" & now() & "',"
		 strQuery3 = strQuery3 & "'" & Date2 & "',"
		 strQuery3 = strQuery3 & "'Active'," 
		 strQuery3 = strQuery3 & "'" & Pmbok & "',"
		 strQuery3 = strQuery3 & "'" & CheckReceived & "'," 
		 strQuery3 = strQuery3 & "'" & CheckReceivedDate & "'," 
		 strQuery3 = strQuery3 & "'" & CheckReceivedBy & "'," 
		 strQuery3 = strQuery3 & "'" & StatusNumber & "'," 
		 strQuery3 = strQuery3 & "'" & rqResCourseID & "'," 
		 strQuery3 = strQuery3 & "'" & DiscountPercentage & "'," 
		 strQuery3 = strQuery3 & "'" & PMBokPrice & "',"
		 strQuery3 = strQuery3 & "'" & TotalResAmount & "',"
		 strQuery3 = strQuery3 & "'" & Session("country") & "',"
		  strQuery3 = strQuery3 & "'" & rqcourseType & "',"
		   IF rqFBdiscount <> "" Then
	  strQuery3 = strQuery3 & "'" & rqFBdiscount & "',"
	  End If
		 strQuery3 = strQuery3 & "'" & Round(RevisedVAT,2) & "')"	
		 
		' Response.Write(strQuery3)	 
	 
	 
		 ConnObj.Execute strQuery3
		 
		  'Updating the Prep Course if users is paid for the course'
		  
		  If CheckReceived = "Yes" OR rqUS_Status = "P.O Received" OR rqUS_Status = "Under Process" Then
		  
		  Date_Valid = Month(EndDate) &"/"& Day(EndDate) &"/" & Year(EndDate)
		  
		  ConnObj.Execute "UPDATE PayPalDB SET date_valid = '"& Date_Valid &"' WHERE ID = (SELECT top 1 ID FROM PayPalDB WHERE Payer_email = '"& Email &"' ORDER BY Id Desc)"
		  
		  End IF		 
		 
		 
		 strNewUserId = "SELECT max(id) as EnrollId FROM PROJITIL_enrolledusers"
	
		 Rs.Open strNewUserId,ConnObj
	
		 do until Rs.Eof
		   newEnrollId = Rs("EnrollId")
		 Rs.Movenext
		 Loop
		 Rs.Close
	
	'Adding backoffice Comments'
		 
		 strComments = "SELECT * FROM PROJITIL_enrolledusercomments WHERE enrolluserid = '"& rqEnrollUserId &"'"
		 
		 Rs.Open strComments,ConnObj
		 
		 Do Until Rs.Eof
		 
		 strQuery1 = "Insert Into PROJITIL_enrolledusercomments (comment,enteredby,createddate,revlevel,enrolluserid)"
		 strQuery1 = strQuery1 & " Values "
		 strQuery1 = strQuery1 & "('" & StrQuoteReplace(Rs("comment")) & "',"
		 strQuery1 = strQuery1 & "'" & Rs("enteredby") & "',"
		 strQuery1 = strQuery1 & "'" & Rs("createddate") & "',"
		 strQuery1 = strQuery1 & "'" & Rs("revlevel") & "',"
		 strQuery1 = strQuery1 & "'" & newEnrollId & "')"
		
		 ConnObj.Execute strQuery1
		 
		 Rs.Movenext
		 Loop
		 Rs.Close
		
		 newComment = "Previous Course: "& rqOldCourseDet & "<br> New Course: " & CourseDetails
		 
		 strQuery1 = "Insert Into PROJITIL_enrolledusercomments (comment,enteredby,createddate,enrolluserid)"
		 strQuery1 = strQuery1 & " Values "
		 strQuery1 = strQuery1 & "('" & newComment & "',"
		 strQuery1 = strQuery1 & "'" & Session("UserId") & "',"
		 strQuery1 = strQuery1 & "'" & Now() & "',"
		 strQuery1 = strQuery1 & "'" & newEnrollId & "')"
		 
		 ConnObj.Execute strQuery1
		 
	'Adding US backoffice Comments'
		 
		 strUSComments = "SELECT * FROM PROJITIL_enroll_comments WHERE enrollid = '"& rqEnrollUserId &"'"
		 
		 Rs.Open strUSComments,ConnObj
		 
		 Do Until Rs.Eof
		 
		 strQuery1 = "Insert Into PROJITIL_enroll_comments (comment,comm_addedby,comm_date,enrollid)"
		 strQuery1 = strQuery1 & " Values "
		 strQuery1 = strQuery1 & "('" & StrQuoteReplace(Rs("comment")) & "',"
		 strQuery1 = strQuery1 & "'" & Rs("comm_addedby") & "',"
		 strQuery1 = strQuery1 & "'" & Rs("comm_date") & "',"
		 strQuery1 = strQuery1 & "'" & newEnrollId & "')"
		
		 ConnObj.Execute strQuery1
		 
		 Rs.Movenext
		 Loop
		 Rs.Close
		 
		rqResAmount = request.Form("ResAmount")
		 rqStatus = request.Form("changestatus")
		 ChangeStatusDateBy = Now() & " by " & Session("UserId")
		   
		 strQuery1 =  "Update PROJITIL_enrolledusers set status = 'Re-Schedule',changestatusdateby = '" & ChangeStatusDateBy &"',statusnumber = '2' where id = '" & rqEnrollUserId & "'"
			
		 ConnObj.Execute strQuery1
		  
		 'strAllcoatedCity = "SELECT emailid1 FROM ITIL_us_instructors WHERE city1 = '"& oldCity &"' OR city2 = '"& oldCity &"' OR city3 = '"& oldCity &"' OR city4 = '"& oldCity &"' OR city5 = '"& oldCity &"'"
'		
'		 Rs2.Open strAllcoatedCity,ConnObj
'		
'		 Do Until Rs2.EOF
'		
'			EmailId1 = Rs2("emailid1")
'	
'			EmailIds1 = EmailId1 & ","
'			
'			EmailIds2 = EmailIds2 & EmailIds1	
'		
'		 Rs2.Movenext
'		 Loop
'		 Rs2.Close	
		  
		' strAllcoatedCity1 = "SELECT emailid1 FROM ps_us_instructors WHERE city1 = '"& City &"' OR city2 = '"& City &"' OR city3 = '"& City &"' OR city4 = '"& City &"' OR city5 = '"& City &"'"
'		
'		 Rs2.Open strAllcoatedCity1,ConnObj
'		
'		 Do Until Rs2.EOF
'		
'			EmailId3 = Rs2("emailid1")
'	
'			EmailIds3 = EmailId3 & ","
'			
'			EmailIds4 = EmailIds4 & EmailIds3	
'		
'		 Rs2.Movenext
'		 Loop
'		 Rs2.Close	  
'		  
'		  EmailIds5 = EmailIds2 & "," & EmailIds4
'		  
		  strBody = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px""> </td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.PROJstudy.com/images/banners/email_headerUK-ITIL.jpg"" alt=""PROJstudy"" width=""600px"" height=""103"" /></span></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=""2"">Dear "&FirstName&" "&LastName&",<BR><BR>Greetings from PROJstudy.com!<BR><BR>We are pleased to inform you that we have rescheduled your enrollment for <u>"&oldCity&"</u> classroom  program scheduled on <u>"&oldCourseDate&"</u> to <u>"&City&"</u> classroom program scheduled on <u>"&FormatDateTime(StartDate,1)&" to "&FormatDateTime(EndDate,1)&"</u>.<br><br> Best Regards,<BR>Customer Support<BR><a href=""http://www.PROJstudy.com"" target=""_blank"">www.PROJstudy.com</a><BR>Email: itilinfo@projstudy.com "
		 ' If Session("country") = "India" Then
'		  strBody = strBody & "<BR>Ph - +91 80 4155 75 47/48/49"
'		  Else 
'		  strBody = strBody & "<BR>Ph - 888-507-6872"
'		  End If
		  strBody = strBody & "</b></font></td></tr></table></td></tr><tr height=""30px""><td> </td></tr></table></td></tr><tr height=""45px""><td> </td></tr></table>"
		  
		  response.Write(strBody)
		  
		Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
		objCDOMail.From = "itilinfo@projstudy.com"
		objCDOMail.To =  Email
		objCDOMail.Cc = "itilinfo@projstudy.com"
		'objCDOMail.Bcc = ""&EmailIds5&",t_satpathy@yahoo.com" 
		objCDOMail.Importance = 2
		objCDOMail.Subject = "Reschedule PROJstudy ITIL Classroom Course"
		objCDOMail.BodyFormat = 0
		objCDOMail.MailFormat = 0
		objCDOMail.Body =  strBody
		objCDOMail.Send
		Set objCDOMail = Nothing
		 
		  Session("message") = ("Successfully Re-Scheduled The Course")
		  Response.Redirect("ITIL-courses.asp?CourseId="&rqResCourseID)
	
	
	 'End If
' End If

End If
 

 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Re-Schedule Courses</title>
<link href="/backoffice/css/pagestyle.css" rel="stylesheet" type="text/css">
<script language="javascript">
function validate_required(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
	}

}
function validate_special(field,alerttxt)
{
	var iChars = "!#$%^&*@()+=-[]\\\';,{}|\":<>?";

	with (field)
	{
		for (var i = 0; i < value.length; i++) {
		  	if (iChars.indexOf(value.charAt(i)) != -1) {
		  	alert (alerttxt);
		  	return false;
		  	}
		}
	}
}

 function validate_number(field,alerttxt)
 {
 	var iChars = "0123456789";

 	with (field)
 	{
 		for (var i = 0; i < value.length; i++) {
 		  	if (!(iChars.indexOf(value.charAt(i)) != -1)) {
 		  	alert (alerttxt);
 		  	return false;
 		  	}
 		}
 	}
 }


function Form_Validator(theform) {

   with (theform)
   {
     if (validate_required(CanAmount,"Please enter amount")==false)
			  {CanAmount.focus();return false}
			  
			  
	if (validate_special(CanAmount,"Please remove the Special Characters in amount")==false)
 					  {CanAmount.focus();return false}

	
if (validate_number(CanAmount,"Your amount is not a numeral")==false)
			  {CanAmount.focus();return false}
			  
		}
		}

function Form_Validator1(theform) {

   with (theform)
   {	
    if(theform.reschCourseID.value == "")
   {
	  alert("Please Select the Course");
	  return (false);
   }
   
   
 if (validate_required(ResAmount,"Please enter amount")==false)
			  {ResAmount.focus();return false}
			  
			  
}
}

function Form_Validator2(theform) {

   with (theform)
   {
     if (validate_required(RefAmount,"Please enter amount")==false)
			  {RefAmount.focus();return false}
			  
			  
	if (validate_special(RefAmount,"Please remove the Special Characters in amount")==false)
 					  {RefAmount.focus();return false}

	
if (validate_number(RefAmount,"Your amount is not a numeral")==false)
			  {RefAmount.focus();return false}
			  
		}
		}


</script>
</head>
<body onblur="this.focus()"><div id="htMap">
<table border="1" width="1000px" height="400px" class="dbborder" cellspacing="0">
 <tr>
   <td colspan="3" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% = Session("country") %></span> ITILstudy Back Office</font></div></td>
 </tr>
 <tr>
  <td width="100px" valign="top" rowspan="22">
    <!--#include file="includes/leftMenu.html"-->
  </td>
 </tr>
 <tr valign="top">
  <td>
  <% 
  If rqType = "Re-Schedule" Then

'Retrive The CourseDates Page'

 
 	strQuery4 = "SELECT * FROM PROJITIL_course WHERE country = 'United Kingdom' AND status <> 'Cancelled' AND startdate BETWEEN '"&Now() - 1&"' AND DATEADD(day,180,'"&Now()&"') AND coursetype <> 'Corporate' ORDER BY city,startdate desc"

 Rs.Open strQuery4,ConnObj 
 

  
  %>
<form action="PROJITILreScheduledCourses.asp" method="post" onSubmit="return Form_Validator1(this)">
 <table border="0" width="100%" cellpadding="2" cellspacing="2" >
 <input type="hidden" name="enrollUserId" value="<% = rqEnrollUserId %>" />
 <input type="hidden" name="changestatus" value="<% = rqType %>" />
  <input type="hidden" name="Amount" value="<% = rqAmount %>" />

  <tr><td align="center" colspan="2" height="50px"><font color="#00B0EC" size="4">Re-Schedule Courses</font></td></tr>
  <tr>
   <td align="left" bgcolor="#fafafa" valign="middle"><font face="Arial"size="2">
   Re-Schedule Courses : </font></td>
   <td align="left" bgcolor="#fafafa" valign="middle">
    <select name="reschCourseID">
	 <option value="">--Select--</option>
 <% 
     Do Until Rs.EOF 

	 ApplicableDays = Rs("applicabledays")

     If (CInt(Rs("courseid")) <> CInt(rqCourseId)) Then 
      If (CDate(Rs("startdate"))-(Date()-1) >= 0) Then %>
	  
      <% If Rs("coursedates") = "Corporate" Then %>
      <% Else %>
	  
	  <option value="<% = Rs("courseid") %>">

	   <% = Rs("city") %> : <% = FormatDateTime(Rs("startdate"),1) %> to <% = FormatDateTime(Rs("enddate"),1) %> for &pound;<% If (CDate(Rs("startdate"))-(Date()+Rs("applicabledays")+1) >= 0) Then %><% = FormatNumber(Rs("afterEBdiscountwithtax")) %><% Else %><% = FormatNumber(Rs("pricewithtax")) %><% End If %>
	 
	   </option>	
  <%  
  End If
  End If 	
     End If 
     Rs.Movenext
     Loop 
	 Rs.Close %>
  </select>
	</td>
  </tr>
  <tr>
   <td align="left" bgcolor="#fafafa" valign="middle"><font face="Arial"size="2">
	 Re-schedule Amount : </font></td>
   <td align="left" bgcolor="#fafafa" valign="middle"> <input type="text" name="ResAmount"> </td>
   </tr>
  <tr>
   <td align="center" colspan="2"><input type="submit" name="type" value="Re-Schedule" class="buttonc"></td>
  </tr>
 </table>
</form>
 <% ElseIf rqType = "Cancel" Then %>
 <form action="PROJITILreScheduledCourses.asp" method="post" onSubmit="return Form_Validator(this)">
 <table border="0" width="77%" cellpadding="2" cellspacing="2" >
 <input type="hidden" name="enrollUserId" value="<% = rqEnrollUserId %>" />
 <input type="hidden" name="changestatus" value="<% = rqType %>" />
  <input type="hidden" name="CourseId" value="<% = rqCourseId %>" />

  <tr><td align="center" colspan="2" height="50px"><font color="#00B0EC" size="4">Cancellation of Courses</font></td></tr>
  <tr>
   <td align="center" bgcolor="#fafafa" valign="middle"><font face="Arial"size="2">
	Cancellation Amount : </font></td>
   <td align="left" bgcolor="#fafafa" valign="middle"> <input type="text" name="CanAmount"> </td>
   </tr>
  <tr>
   <td align="center" colspan="2"><input type="submit" name="type" value="Cancel" class="buttonc"></td>
  </tr>
 </table>
</form>
<% ElseIf rqType = "MBG" Then %>
 <form action="PROJITILreScheduledCourses.asp" method="post" onSubmit="return Form_Validator2(this)">
 <table border="0" width="77%" cellpadding="2" cellspacing="2" >
 <input type="hidden" name="enrollUserId" value="<% = rqEnrollUserId %>" />
 <input type="hidden" name="changestatus" value="<% = rqType %>" />
  <input type="hidden" name="CourseId" value="<% = rqCourseId %>" />
  <input type="hidden" name="mbg_amount" value="<% = rqMBGAmount %>" />

  <tr><td align="center" colspan="2" height="50px"><font color="#00B0EC" size="4">Money Back Gaurantee</font></td></tr>
  <tr>
   <td align="center" bgcolor="#fafafa" valign="middle"><font face="Arial"size="2">
	Refund Amount : </font></td>
   <td align="left" bgcolor="#fafafa" valign="middle"> <input type="text" name="RefAmount"> </td>
   </tr>
  <tr>
   <td align="center" colspan="2"><input type="submit" name="type" value="MBG" class="buttonc"></td>
  </tr>
 </table>
</form>
 <% End If %>

</td>
</tr>
</table>
 </body>
 </html>
