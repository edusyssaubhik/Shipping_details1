<%@ Language = "VBScript" %>
<%' OPTION EXPLICIT %>
<%
 'Written By : Priyanka'
 'Last UpaDated: 26/05/2011'
 'Description :'
 'Purpose : Sending Exam Result'
%>
<%
   If Session("UserId")  = "" Then
     Response.Redirect("/backoffice/login.asp")
   Else
%>
<!--#include virtual ="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->

<%
''Declare The Variables
Dim rqEnrollUserId
Dim rqFirstName,Address
Dim rqLastName,courseDetails
Dim rqType,Course
Dim subject
Dim body
Dim rqTempNo
Dim StrQuery1,strQuery2,strQuery3
Dim FirstName
Dim LastName
Dim EmailId
Dim rqEnrollEmailId
Dim CourseDate,str,startDate,i,sstartDate
Dim Rs1
Dim todaysDate
Dim rqEmail,rqPhoneNumber,rqNameOfEmployeer,rqCourseDetails,dtax,coursePrice
Dim Total,Date2,rqCourse
Dim str1,str2,Price,rqSendEmail,City,rqCity

'Replace method
Function StrQuoteReplace(strValue)
StrQuoteReplace = Replace(strValue, "'","""")
End Function 

set Rs = Server.CreateObject("ADODB.Recordset")
set Rs1 = Server.CreateObject("ADODB.Recordset")
set Rs2 = Server.CreateObject("ADODB.Recordset")
Set Rs3 = Server.CreateObject("ADODB.Recordset")
Set instructorRs = Server.CreateObject("ADODB.Recordset")
Set instructorEmailRs = Server.CreateObject("ADODB.Recordset")
'Retirve The EnrolledUSerId From Courses.asp Page'

rqEnrollUserId  =  Request.Querystring("enrollUserId")
rqCourse = request.QueryString("course")
Session("course") = rqCourse
'Currency Format Display Functions'

 Currency_Format_Front = CurrencyFormat_Front(Session("Country"))

 Currency_Format_Back = CurrencyFormat_Back(Session("Country"))
					 
'Sql Query For Retive the Firstname, Lastname and Emailid'

strQuery = "SELECT id,firstname,lastname,email,nameofemployeer,coursedetails,coursedate,phoneno,jobtitle,street,city,state1,postalCode,country,Foundation,Practitioner,courseid from enrolledusers WHERE id = '" & rqEnrollUserId & "'"
Rs.Open strQuery,ConnObj

Do Until Rs.EOF

 Session("ID") = Rs("id")
 Session("FirstName") = Rs("firstname")
 Session("Lastname")  = Rs("lastname")
 Session("EmailId")   = Trim(Rs("email"))
 Session("NameOfEmployer")   = Rs("nameofemployeer")
  Course   = Rs("coursedetails")
  Session("CourseDate") = Rs("coursedate")
 Session("PhoneNo")   = Rs("phoneno")
 Session("street")   = Rs("street")
 Session("city")   = Rs("city")
 Session("state1") = Rs("state1")
 Session("postalCode") = Rs("postalCode")
 Session("country") = Rs("country")
 Session("jobtitle") = Rs("jobtitle")
 Session("Foundation") = Rs("Foundation")
 Session("Practitioner") = Rs("Practitioner")
 Session("Specific_courseid") = Rs("courseid")
 


'Query for selecting the instructor for perticular course using course id'
strQuery_instructor = "Select instructor from course WHERE courseid = '"& Session("Specific_courseid") &"'"
instructorRs.Open strQuery_instructor,ConnObj

If Not instructorRs.EOF then

Instructor = instructorRs("instructor")

  If Instructor <> "To be decided" AND Instructor <> "Yet to be decided" Then

   Session("FromName") = instructorRs("instructor")
 
	Else
	
	Session("FromName") = "PROJstudy PRINCE2" 
	 
	End If

End If

instructorRs.close

 
 
 Address = Session("street")&"<br>"&Session("city")&"<br>"&Session("postalCode")&"<br>"&Session("state1")&"<br>"&Session("country")
 

courseDetails = Split(Course," ")

Session("Coursedetails") = courseDetails(0)

'Session("CourseDate") = courseDetails(13)&" "&courseDetails(14)&" "&courseDetails(15)
'Session("location") = courseDetails(6)

'response.Write(courseDetails(2))
'response.Write("c")
'response.Write(courseDetails(4))
'response.Write("d")
'response.Write(courseDetails(5))
'response.Write("e")
'response.Write(courseDetails(6))
' response.Write("f")
' response.Write(courseDetails(7))
' response.Write("g")
'response.Write(courseDetails(8))
' response.Write("h")
'response.Write(courseDetails(9))
' response.Write("i")
' response.Write(courseDetails(10))
' response.Write("j")
' response.Write(courseDetails(11))
' response.Write("k")
' response.Write(courseDetails(12))
 'response.Write("l")
 'response.Write(courseDetails(13))
 'response.Write("m")
 'response.Write(courseDetails(14))
 'response.Write("n")
 'response.Write(courseDetails(15))
' response.Write("o")
' response.Write(courseDetails(16))
' response.Write("p")
' response.Write(courseDetails(17))
' response.Write("q")
' response.Write(courseDetails(18))
' response.Write("r")

Rs.Movenext
Loop

Rs.Close


rqType = Request.QueryString("type")




 subject="PROJstudy PRINCE2 Exam Result"

 body = "<table width=""100%"" border=""0"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span>" 
                        IF Session("country") = "India" then
						body= body &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerIN.jpg"" alt=""PROJstudy"" /></span>"
						ElseIF Session("country") = "United Kingdom" then
						body= body &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerUK.jpg"" alt=""PROJstudy"" /></span>"
						ElseIF Session("country") = "Australia"   then
						body= body &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerAUS.jpg"" alt=""PROJstudy"" /></span>"
						Else
                       body= body & "<span><img src=""http://www.PROJstudy.com/images/banners/email_header.jpg"" alt=""PROJstudy"" /></span>" 
                        End If
						
						body= body &"</td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""4"" cellspacing=""4"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "&Session("FirstName")&" "&Session("Lastname")&","
						
						IF (Session("Foundation") >= "35" And Session("course") = "Foundation") OR (Session("Practitioner") >= "44" And Session("course") = "Practitioner") Then
						 body = body & "<tr><td align=""left"" colspan=""2"" align=""center""><br>Congratulations from <a href=""http://www.PROJstudy.com/"" target=""_blank"">PROJstudy.com!</a></td></tr>"
  body = body & "<tr><td align=""left"" colspan=""2"" align=""center"">We are pleased to inform that you have passed the PRINCE2<sup>&reg;</sup> "&Session("course")&" exam conducted on ----------- in -----------.You answered" 
  If Session("course") = "Foundation" Then 
   body = body & " "&Session("Foundation")&" out of 70"
   ElseIf Session("course") = "Practitioner"  Then
    body = body & " "&Session("Practitioner")&" out of 80"
   End If
    body = body & " questions correctly.<br><br>Your PRINCE2<sup>&reg;</sup> "&Session("course")&"  certificate is under process and you would be informed as soon as it is shipped to you.<br></td></tr>"
  body = body & "<tr><td align=""left"" colspan=""2"">As per our records, your mailing address is : <br><br><div align=""left"">"&StrQuoteReplace(Address)&"</div></td></tr>"
  body = body & "<tr><td align=""left"" colspan=""2"">Kindly confirm your mailing address and contact number so that we could ship you the certificate.</td></tr>"
  
  body = body & "<tr><td align=""left"" colspan=""2"">We hope you enjoyed your experience with PROJstudy.com. If you liked our course structure and methodology, you can refer your friends for PROJstudy PRINCE2 classroom courses.<br><br>"
  IF Session("country") = "Australia" OR Session("country") = "United Kingdom" Then
 body = body & " To connect with us on Facebook please visit <a href =""http://www.facebook.com/projstudy"">http://www.facebook.com/projstudy</a><br><br>"
 End If 
 body = body & "Click on the button to ""Refer Friend"".<br><br></td></tr>"  
  body = body & "<tr><td align=""left"" colspan=""2""><form name=""referFriend"" action=""http://www.projstudy.com/insertReferFrnd.asp""  method=""post""><input type=""hidden"" name=""refEmailID"" value="&Session("EmailId")&"><input type=""hidden"" name=""refName"" value="&Session("FirstName")&">Friend`s Email:  <input type=""text"" name=""frndEmailID1"">&nbsp; &nbsp; Name(optional):  <input type=""text"" name=""frndName1""><br /><br>  Friend`s Email:  <input type=""text"" name=""frndEmailID2"">  &nbsp; &nbsp; Name(optional):  <input type=""text"" name=""frndName2"">  <br /><br>  Friend`s Email:  <input type=""text"" name=""frndEmailID3""> &nbsp; &nbsp;  Name(optional):  <input type=""text"" name=""frndName3""><br /><br /><div align=""center""><input type=""submit"" value=""Refer Friend"" /></div></form></td></tr>"  
  IF Session("country") = "India" Then
   body = body & "<tr><td align=""left"" colspan=""2"">If you have any queries contact us at adminsupport@projstudy.com or +91 80 41557547.</td></tr>" 
						ElseIf Session("country")="United Kingdom" Then 
   body = body & "<tr><td align=""left"" colspan=""2"">If you have any queries contact us at adminsupport@projstudy.com or +44(0) 8000 337 947.</td></tr>" 
						ElseIf Session("country")="Australia" Then 
   body = body & "<tr><td align=""left"" colspan=""2"">If you have any queries contact us at adminsupport@projstudy.com or +61 2 8896 4313.</td></tr>" 
				ElseIf Session("country")="Other" or Session("CountryOrigin") = "Hong Kong" OR  Session("CountryOrigin") = "Singapore" OR  Session("CountryOrigin") = "UAE" Then
   body = body & "<tr><td align=""left"" colspan=""2"">If you have any queries contact us at adminsupport@projstudy.com.</td></tr>" 
						End if
   
   ElseIF  (Session("Foundation") < "35" And Session("course") = "Foundation")  OR (Session("Practitioner") < "44" And Session("course") = "Practitioner") Then
   
   	  IF Session("country") =  "United Kingdom" OR  Session("country") =  "Australia" or Session("CountryOrigin") = "Hong Kong" OR  Session("CountryOrigin") = "Singapore" OR  Session("CountryOrigin") = "UAE" Then

    body = body & "<tr><td align=""left"" colspan=""2"" align=""center"">We are sorry to inform you that you did not pass the PRINCE2 "&Session("course")&" exam conducted on ------- in ---------- You answered"
	else
	    body = body & "<tr><td align=""left"" colspan=""2"" align=""center"">We are sorry to inform that you could not clear the PRINCE2<sup>&reg;</sup>"&Session("course")&" exam conducted on ------- in ----------. You answered"
		
    End IF
	
	 IF  Session("course") = "Foundation"  Then
	 
	      IF Session("country") =  "United Kingdom" OR  Session("country") =  "Australia" or Session("CountryOrigin") = "Hong Kong" OR  Session("CountryOrigin") = "Singapore" OR  Session("CountryOrigin") = "UAE" Then
	      body = body &" "&Session("Foundation")&" out of 70 questions correctly.</td></tr>"
		  Else
		  body = body &" "&Session("Foundation")&" out of 70 questions correctly, whereas the required passing marks were 35 out of 70.</td></tr>"
		  End If

	 ELseIf Session("course") = "Practitioner"  Then
	 
	    IF Session("country") =  "United Kingdom" OR  Session("country") =  "Australia" or Session("CountryOrigin") = "Hong Kong" OR  Session("CountryOrigin") = "Singapore" OR  Session("CountryOrigin") = "UAE" Then
	      body = body &" "&Session("Practitioner")&" out of 80 questions correctly.</td></tr>"
		  body = body & "<tr><td align=""left"" colspan=""2"" align=""center""><br>Your PRINCE2<sup>&reg;</sup> Foundation certificate is under process and you would be informed as soon as it is shipped to you.<br><br>As per our records, your mailing address is :<br><br><div align=""left"">"&Address&"</div><br><br>Kindly confirm your mailing address and contact number so that we could ship you the certificate.</td></tr>"
		  else
		   body = body &" "&Session("Practitioner")&" out of 80 questions correctly, whereas the required passing marks were 44 out of 80.</td></tr>"
		   body = body & "<tr><td align=""left"" colspan=""2"" align=""center""><br>Your PRINCE2<sup>&reg;</sup> Foundation certificate is under process and you would be informed as soon as it is shipped to you.<br><br>As per our records, your mailing address is :<br><br><div align=""left"">"&Address&"</div><br><br>Kindly confirm your mailing address and contact number so that we could ship you the certificate.</td></tr>"
		   End If
		   
	 End IF
	 
 IF Session("country") =  "United Kingdom" Then
 
   IF  Session("course") = "Foundation"  Then
	  
  body = body & "<tr><td align=""left"" colspan=""2"" align=""center""><br>PROJstudy offers an Exam Retake Guarantee for those delegates who don’t pass their PRINCE2 exams on the first attempt after attending PROJstudy’s PRINCE2 Classroom training. To know more please visit.  <a href=""http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp"" target=""_blank"">(http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp)</a>.<br><br></td></tr>"
  
  body = body & "<tr><td align=""left"" colspan=""2"">We recommend that you go over all the course material that was provided to you by PROJstudy and spend at least 3 hours of concentrated study on the subject each day. Please ensure that you cover all the Themes, Principles and Processes more thoroughly. When you decide to retake the exam you can do so during our classroom programs.</td></tr>"  
  
  
  
   ELseIf Session("course") = "Practitioner"  Then
	 
  body = body & "<tr><td align=""left"" colspan=""2"">We recommend that you go over all the course material that was provided to you by PROJstudy and spend at least 3 hours of concentrated study on the subject each day. Please ensure that you cover all the Themes, Principles and Processes more thoroughly. </td></tr>"  
  
    End IF
	
	  body = body & "<tr><td align=""left"" colspan=""2"">If you do require any additional guidance we can always connect you with one of instructors who will be able to clear your doubts.</td></tr>"  
  body = body & "<tr><td align=""left"" colspan=""2"">We wish you all the best for the PRINCE2 exam </td></tr>"  
   body = body & "<tr><td align=""left"" colspan=""2"">If you have any queries contact us at adminsupport@projstudy.com or 0800 0337 947.</td></tr>" 

	 
 ElseIf  Session("country") =  "Australia" or Session("country") = "Hong Kong" OR  Session("country") = "Singapore" OR  Session("country") = "UAE" Then
	 
	  
  body = body & "<tr><td align=""left"" colspan=""2"" align=""center""><br>PROJstudy offers an Exam Retake Guarantee for those delegates who do not pass their PRINCE2 exams on the first attempt after attending PROJstudy’s PRINCE2 Classroom training. To know more please visit.  <a href=""http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp"" target=""_blank"">(http://www.projstudy.com/PRINCE2-Training/examRetakeGuarantee.asp)</a>.<br><br></td></tr>"
  
  body = body & "<tr><td align=""left"" colspan=""2"">We recommend that you go over all the course material that was provided to you by PROJstudy and spend at least 3 hours of concentrated study on the subject each day. Please ensure that you cover all the Themes, Principles and Processes more thoroughly. When you decide to retake the exam you can do so during our classroom programs.</td></tr>"  
  
  body = body & "<tr><td align=""left"" colspan=""2"">If you do require any additional guidance we can always connect you with one of instructors who will be able to clear your doubts.</td></tr>"  
  body = body & "<tr><td align=""left"" colspan=""2"">We wish you all the best for the PRINCE2 exam </td></tr>"  
   body = body & "<tr><td align=""left"" colspan=""2"">If you have any queries contact us at adminsupport@projstudy.com or 0800 0337 947.</td></tr>" 
   
  ElseIf Session("country") =  "India" OR Session("country") =  "Other" Then
  
  body = body & "<tr><td align=""left"" colspan=""2"">We recommend that you go through over all the course material that was provided to you by PROJstudy and spend at least 3 hours of concentrated study on the subject each day. Please ensure that you cover all the Themes, Principles and Processes more thoroughly.</td></tr>"
 
   body = body & "<tr><td align=""left"" colspan=""2"">If you have any queries contact us at adminsupport@projstudy.com or +91 80 41557547.</td></tr>"
   
   End If
   
   End If

  body = body & "<tr><td colspan=""3""><br><font face=""Arial"" size=2><b>Best Regards,</b></td></tr>"
   
  body = body & "<tr><td colspan=""3""><font face=""Arial"" size=2>Customer Support<br><a href=""http://www.PROJstudy.com"" target=""_blank"">www.PROJstudy.com</a><br />Email: <a href=""mailto: adminsupport@projstudy.com"">adminsupport@projstudy.com</a><br /><br/><hr><div align=""center""><font size=""1px"">PRINCE2<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.<br>The Swirl logo™ is a trade mark of the Cabinet Office.</font></div></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"
  
  
  'IF Session("country") =  "United Kingdom" Then
'  
'  IF (Session("Foundation") >= "35" And Session("course") = "Foundation") OR (Session("Practitioner") > "44" And Session("course") = "Practitioner") Then
'  
'  '======================   2nd mail olny who passed ============================================================= '
'  
'   body1 = "<table width=""100%"" border=""0"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span>" 
'                        IF Session("country") = "India" then
'						body1= body1 &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerIN.jpg"" alt=""PROJstudy"" /></span>"
'						ElseIF Session("country") = "United Kingdom" then
'						body1= body1 &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerUK.jpg"" alt=""PROJstudy"" /></span>"
'						ElseIF Session("country") = "Australia"   then
'						body1= body1 &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerAUS.jpg"" alt=""PROJstudy"" /></span>"
'						Else
'                       body1= body1 & "<span><img src=""http://www.PROJstudy.com/images/banners/email_header.jpg"" alt=""PROJstudy"" /></span>" 
'                        End If
'						
'						body1= body1 &"</td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""4"" cellspacing=""4"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "&Session("FirstName")&" "&Session("Lastname")&","
'						
'						 body1 = body1 & "<tr><td align=""left"" colspan=""2"" align=""center""><br><br>Congratulations!</td></tr>"
'  body1 = body1 & "<tr><td align=""left"" colspan=""2"" align=""center"">We are pleased to inform that you have passed the PRINCE2<sup>&reg;</sup> "&Session("course")&" exam conducted on ----------- in -----------.<br></td></tr>" 
'  
'    body1 = body1 & "<tr><td align=""left"" colspan=""2"" align=""center"">We are also trying to build an independent feedback system for ourselves. I would really appreciate if you could spare a few minutes and share your valuable feedback which in turn will help us improve.<br></td></tr>"
'  body1 = body1 & "<tr><td align=""left"" colspan=""2""><b>Please login to the following page to share your feedback:</b> </td></tr>"
'  body1 = body1 & "<tr><td align=""left"" colspan=""2""><a href=""http://www.trustpilot.co.uk/users/connect?redirect=/review/projstudy.com""><b>Click here</b></a> to share your feedback on Trustpilot. It just takes a minute!</td></tr>"
'  
'  body1 = body1 & "<tr><td align=""left"" colspan=""2"">I hope you enjoyed your experience with PROJstudy.com. If you liked our course structure and methodology, you can refer your friends for our PRINCE2 classroom courses by visiting this page: <b> <a href=""http://www.PROJstudy.com/refer-Friends.asp?refEmail="&Session("EmailId")&""" target=""_blank"">Refer Your Friends</a></b></td></tr>"
'  
' 
'   body1 = body1 & "<tr><td align=""left"" colspan=""2"">If you have any queries contact us at adminsupport@projstudy  or +44(0) 8000 337 947.</td></tr>"
'   
'  body1 = body1 & "<tr><td colspan=""3""><br><font face=""Arial"" size=2><b>Best Regards,</b></td></tr>"
'   
'  body1 = body1 & "<tr><td colspan=""3""><font face=""Arial"" size=2>"&Session("FromName")&"<br>APMG Accredited PRINCE2 Instructor<br /><br/></font></div></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"
'  
' 
' 
'  
'    '======================  Ends 2nd mail olny who passed ============================================================= '
'  
'  End If
'  End If
  	   
If rqType = "preview" then
	
'Retrive The EnrollUserId,subject and body from this Page'

   rqEnrollUserId = Request.Form("enrollUserId")
   subject = Request.form("subject")
   body    = Request.form("QueryReply")
   body1    = Request.form("QueryReply1")
  rqCourse = Request.Form("course")
  Session("course") = rqCourse

End If

'Send Email'

if rqType = "sendmail" Then

   Dim objCDOMail
   Dim rqBody
   Dim rqSubject
   Session("course") = rqCourse

'Retrive The enrolluserid from this page'  
 
   rqEnrollUserId = Request.Form("enrolluserid")
   rqCity = Request.Form("city")
   rqBody    =  Request.Form("body")
   rqBody1    =  Request.Form("body1")
   rqSubject =  "PROJstudy PRINCE2 Exam Result"
   rqSendEmail = Request.Form("emailid")
   rqCourse = Request.Form("course")
  

	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")

	objCDOMail.From = "PROJstudy<marketing@projstudy.com>"

	objCDOMail.To =  rqSendEmail
	
	'If Session("country") is India then cc send to salesindia@pmstudy.com otherwise send to marketing@pmstudy.com'
	
	objCDOMail.Cc = "marketing@projstudy.com"

	
	objCDOMail.Bcc = "t_satpathy@yahoo.com" 
	'objCDOMail.Bcc = "edusyssidhardha@gmail.com" 
	
	'Importance of the e-mail (0=Low, 1=Normal, 2=High)
	
	objCDOMail.Importance = 2
	
	objCDOMail.Subject = rqSubject

	objCDOMail.BodyFormat = 0

	objCDOMail.MailFormat = 0

	objCDOMail.Body = rqBody

	objCDOMail.Send

	Set objCDOMail = Nothing
	

'IF rqBody1 <> "" Then
'
'	
'	Set objCDOMail123 = Server.CreateObject("CDONTS.NewMail")
'
'	objCDOMail123.From = ""&Session("FromName")&" <marketing@projstudy.com>"
'
'	objCDOMail123.To =  rqSendEmail
'	
'	'If Session("country") is India then cc send to salesindia@pmstudy.com otherwise send to marketing@pmstudy.com'
'	
'	objCDOMail123.Cc = "marketing@projstudy.com"
'
'	
'	objCDOMail123.Bcc = "t_satpathy@yahoo.com" 
'	'objCDOMail123.Bcc = "edusyssidhardha@gmail.com" 
'	
'	'Importance of the e-mail (0=Low, 1=Normal, 2=High)
'	
'	objCDOMail123.Importance = 2
'	
'	objCDOMail123.Subject = "PRINCE2 Exam Result - Share your Feedback"
'
'	objCDOMail123.BodyFormat = 0
'
'	objCDOMail123.MailFormat = 0
'
'	objCDOMail123.Body = rqBody1
'
'	objCDOMail123.Send
'
'	Set objCDOMail123 = Nothing
'
'	
'End If	
	

'Sql Query For If You Send Email I am entering into database 1 for in courses.asp Page we want display a message "Check received email sent"'
if rqCourse="Foundation"  then

    strQuery2 = "Update enrolledusers Set FounexamResultSent = '1' where  id = '" & rqEnrollUserId &  "'"
	'response.Write(strQuery2)
    Rs2.Open strQuery2,ConnObj
	
ElseIf rqCourse="Practitioner" then
	strQuery3 = "Update enrolledusers Set pracexamResultSent = '1' where id = '" & rqEnrollUserId & "'" 
	'response.Write(strQuery3)
    Rs2.Open strQuery3,ConnObj
	
End If
	
    Response.write("Successfully sent mail")	
Else


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>PROJstudy PRINCE2 Exam Result</title>
<link href="./css/pagestyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="htMap">
  <table width="700" height="580" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#00B0EC" class="dbborder" >
    <tr>
      <td width="547" valign="top"><table width="100%" cellspacing="0" cellpadding="2">
          <form id="form1" name="form1" method="post" action="examResult.asp?type=preview">
            <input type="hidden" name="enrollUserId" value="<%= rqEnrollUserId %>" />
            <input type="hidden" name="city" value="<%= City %>" />
            <input type="hidden" name="course" value="<%= rqCourse %>" />
			

            <tr>
              <td colspan="2" bgcolor="#00B0EC">Send Exam Result </td>
            </tr>
            <tr class="rowEven">
              <td width="28%">To : </td>
              <td width="72%"><% = Session("FirstName") %>
                &nbsp;
                <% = Session("LastName") %>
                <
                <% = Session("EmailId") %>
                <%= rqSendEmail %>
                ></td>
            </tr>
            <tr class="rowOdd">
              <td>Subject : </td>
              <td> PROJstudy PRINCE2 Exam Result</td>
            </tr>
            <tr class="rowEven">
              <td colspan="2"><textarea name="QueryReply" cols="90" rows="25"><%= body %></textarea>
              </td>
            </tr>
             <tr class="rowEven">
              <td>&nbsp;</td>
              <td></td>
            </tr>
             <tr class="rowEven">
              <td colspan="2"><textarea name="QueryReply1" cols="90" rows="25"><%= body1 %></textarea>
              </td>
            </tr>
            
            <tr class="rowEven">
              <td>&nbsp;</td>
              <td></td>
            </tr>
            <tr class="rowOdd">
              <td colspan="2" align="center"><input name="Submit" type="submit" class="buttonc" value="Preview" /></td>
            </tr>
          </form>
          <form  method="post" action="examResult.asp?type=sendmail">
            <input type="hidden" name="body" value='<%= body %>' />
            <input type="hidden" name="body1" value='<%= body1 %>' />
            <input type="hidden" name="enrolluserid" value="<%= rqEnrollUserId %>" />
            <input type="hidden" name="emailid" value="<%= Session("EmailId") %>" />
            <input type="hidden" name="city" value="<%= rqCity %>" />
            <input type="hidden" name="course" value="<%= rqCourse %>" />
            <tr class="rowEven">
              <td colspan="2">&nbsp;</td>
            </tr>
            <tr class="rowEven">
              <td colspan="2" bgcolor="#00B0EC">Send Mail </td>
            </tr>
            <tr class="rowEven">
              <td>&nbsp;</td>
              <td></td>
            </tr>
            <tr class="rowOdd">
              <td colspan="2" align="center"><input type="submit" class="buttonc" name="sendmail" value="Send Mail" />
              </td>
            </tr>
          </form>
          <tr class="rowEven">
            <td colspan="2">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <% if rqType = "preview" Then %>
    <tr>
      <td colspan="3"><%Response.write(subject & "<br/><br/>")
				Response.write(body) &"<br><br>"& Response.write(body1)%></td>
    </tr>
    <% End If %>
  </table>
</div>
</body>
</html>
<%	End If
End If
%>
