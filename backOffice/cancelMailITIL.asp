<% 
'Declaring variables'
'Dim objRs,objRs1,strQuery,rqEnrollUserId,POExpected,rqCourseId
'Dim rqCourseName,rqCity,rqstartdate,rqenddate
Dim firstName,lastName,email,company,coursedet,strBody,cancel_sentMail,rqEnrollUserId

'Creating Record objects'	
Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")

'Retriving the last mail send date'
strQuery = "SELECT courseid, city, startdate,enddate,status FROM PROJITIL_course WHERE status = 'Cancelled' and  courseid = '" & rqEditCourseId &"' Order by courseid desc"

objRs.Open strQuery,ConnObj
'response.Write(strQuery)
Do until objRs.EOF

	rqCourseId = objRs("courseid")
	rqCity = objRs("city")
	rqstartdate = objRs("startdate")
	rqenddate = objRs("enddate")
	rqStatus = objRs("status")

	'Retriving the last mail send date'
	strQuery = "SELECT id,firstname, lastname, email, nameofemployeer, coursedetails,cancel_sentMail FROM PROJITIL_enrolledusers WHERE courseid = '" & rqEditCourseId &"' and checkreceived = 'Yes' Order by id desc"
	
	objRs1.Open strQuery,ConnObj
	'response.Write(strQuery)
	Do until objRs1.EOF
	    rqEnrollUserId = objRs1("id")
		firstName = objRs1("firstname")
		lastName = objRs1("lastname")
		email = objRs1("email")
		company = objRs1("nameofemployeer")
		coursedet = objRs1("coursedetails")
		cancel_sentMail = objRs1("cancel_sentMail")
	
	'Comparing the dates'
If rqStatus = "Cancelled" Then

	If Isnull(cancel_sentMail) Then
	
	strBody = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF"">" 
					  IF Session("country") = "India" Then
					  strBody= strBody & "<span><img src=""http://www.PROJstudy.com/images/banners/email_headerUK-ITIL.jpg"" alt=""PROJstudy"" width=""600px"" height=""103""  /></span>" 
					  ElseIf Session("country")="United Kingdom" Then 
					  strBody= strBody &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerUK-ITIL.jpg"" alt=""PROJstudy"" width=""600px"" height=""103""  /></span>"
					  ElseIf Session("country")="Australia" Then
					  strBody= strBody &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerUK-ITIL.jpg"" alt=""PROJstudy"" width=""600px"" height=""103""  /></span>"
					  Else
					  strBody= strBody &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerUK-ITIL.jpg"" alt=""PROJstudy"" width=""600px"" height=""103""  /></span>"
					  End if
						strBody= strBody &"<tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "&firstName&" "&lastName&",<br><br>Greetings from PROJstudy!<BR><BR>This is to announce the cancellation of PROJstudy ITIL Foundation classroom training scheduled to be held at "&rqCity&" from "&FormatDateTime(rqstartdate,1)&" to "&FormatDateTime(rqenddate,1)&".We have had to do this despite our best efforts to conduct the programme as scheduled.<br><br>We have put forth, our <a href=""http://www.projstudy.com/ITIL/termsAndConditions.asp"" target = ""_blank"">cancellation policy</a>  applicable when we cancel a classroom programme:<br><br>We may cancel any particular class because of last minute instructor illness or force majeure events (like floods, earthquakes, political instability, etc.).<br><br>We can offer you the following options:<ul type=""1.""><li>Reschedule to a future class in any location: You can opt to reschedule to a future class in any location. The amount paid for the present PROJstudy programme will be applied towards the future programme.</li><li>Ask for full refund: You also have the option to ask us for a full refund of your payment made towards PROJstudy Classroom Training Programme.</li></ul>Please let us know whether you would like to reschedule your enrolment or would prefer a full refund of the payment made towards classroom training by sending an email to <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@projstudy.com</a>.  If you prefer to reschedule, let us know the location and date of the programme that you would like to attend.<br><brWe apologize for this change that’s beyond our control. We look forward to having you as our delegate.<BR><BR>Best Regards,<br><BR>Custmer Support<br>www.PROJstudy.com<BR>Email: marketing@projstudy.com</font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"
	'response.Write(strBody)
	
	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
	objCDOMail.From = "marketing@projstudy.com"
	objCDOMail.To =  "<" & email & ">"
	objCDOMail.BCc =  "marketing@projstudy.com,edusyssidhardha@gmail.com,edusyssantosh@gmail.com,edusyskavitha@gmail.com,edusysgregory@gmail.com"
	objCDOMail.Importance = 2
	objCDOMail.Subject = "Cancellation of PROJstudy ITIL Foundation Class"
	objCDOMail.BodyFormat = 0
	objCDOMail.MailFormat = 0
	objCDOMail.Body =  strBody
	objCDOMail.Send
	Set objCDOMail = Nothing
	

	'Inserting date into the facultymailsent table because based on this emails will send daily'
	ConnObj.Execute "UPDATE PROJITIL_enrolledusers SET cancel_sentMail = '1' WHERE id = '" & rqEnrollUserId &"'"
	'response.Write(strQuery)
	
			
	End If
	
	
End If


	objRs1.Movenext
	Loop
	objRs1.Close

	
	Response.Redirect("ITIL-courses.asp")
	

			
objRs.Movenext
Loop
objRs.Close	
%>
