<% 
'Declaring variables'
'Dim objRs,objRs1,strQuery,rqEnrollUserId,POExpected,rqCourseId
'Dim rqCourseName,rqCity,rqstartdate,rqenddate
Dim firstName,lastName,email,company,coursedet,strBody,cancel_sentMail,rqEnrollUserId

'Creating Record objects'	
Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")


If Request.Querystring("CourseId") <> "" Then

	rqCourseId  =  Request.Querystring("CourseId")
	
Else

	rqCourseId  =  Request.Form("CourseId")
	
End If
rqType = Request.QueryString("type")

If rqType = "" Then


strBody = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF"">" 
						IF Session("country") = "India" Then
						strBody= strBody & "<span><img src=""http://www.PROJstudy.com/images/banners/email_headerIN.jpg"" alt=""PROJstudy"" width=""600px"" height=""103""  /></span>" 
						ElseIf Session("country")="United Kingdom" Then 
						strBody= strBody &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerUK.jpg"" alt=""PROJstudy"" width=""600px"" height=""103""  /></span>"
						ElseIf Session("country")="Australia" Then
						strBody= strBody &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerAUS.jpg"" alt=""PROJstudy"" width=""600px"" height=""103""  /></span>"
						Else
						strBody= strBody &"<span><img src=""http://www.PROJstudy.com/images/banners/email_header.jpg"" alt=""PROJstudy"" width=""600px"" height=""103""  /></span>"
						End if
		strBody= strBody &"<tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "&firstName&" "&lastName&",<br><br>Greetings from PROJstudy!<BR><BR>We regret to inform you that in spite of our best efforts, we will not be able to conduct the physical PRINCE2 classroom training to be held at ""<City>"" from ""<From date>"" to ""<To Date>"".<br><br>However, we are offering you an equally good alternative – our PRINCE2 Live Class, which will be held on the same dates as the classroom course. Hence, you do not need to make any changes to your planned schedule. You can get trained and certified in the same time as a regular classroom course, but from the comfort and convenience of your home or office. The live, real-time training is conducted online through state-of-the-art technology and by one of our APMG accredited, expert instructors. You can interact directly with the instructor and get all your questions answered – just like in classroom training. You can even take the exam online from your home at no additional cost.<br><br>We are offering you a discount of &pound;40 towards Foundation and &pound;35 towards Practitioner course - <b>a total discount of &pound;75</b> for the full course if you decide to opt for the Live Class. <br><br><b>Our Live Class will include the following:</b><br><ol type=""1""><li>5 day live virtual training led by APMG Accredited Instructor.</li><li>PRINCE2 exam – can be taken online at home or at a PROJstudy venue.</li><li>A free headset will be provided for audio communication with the instructor</li><li>All study materials such as the official APMG PRINCE2 Manual, PROJstudy Workbook, Chapter test booklet, APMG Practitioner case studies, process chart, process diagram and APMG sample papers will be shipped to your residence.</li><li>The only requirement for the Live class is access to internet.</li></ol><br><b>To learn more about PROJstudy Live Class, please <a href=""http://www.projstudy.com/PRINCE2/PRINCE2-Courses/PRINCE2-Live-Courses.asp"">click here</a></b>. <br><br>You have 2 other options:<br><ol type=""1""><li>Reschedule to a future programme:  You can opt to reschedule to a future class in any location.</li><li>Ask for full refund: You also have the option to ask us for a full refund of your payment made towards PROJstudy Classroom Training Programme.</li></ol><br><br>Please email us with your decision or any queries you may have at <a href=""mailto:marketing@projstudy.com"" target=""_blank"">marketing@PROJstudy.com.</a> You can also call us at 0800 0337 947.<BR><BR>Best Regards,<br><BR>Customer Support<br>www.PROJstudy.com<BR>Email: marketing@projstudy.com</font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"



End IF 



If rqType = "preview" then

   'Retive The body and emailids and course date in This Page'

	body = Request.form("QueryReply")
	rqCourseId = Request.Form("courseId") 
	
	
End If



If rqType = "sendmail" Then



rqBody =  Request.Form("body")
   rqCourseId = Request.Form("courseId")   


'Retriving the last mail send date'
strQuery = "SELECT courseid, courseName, city, startdate,enddate,status FROM course WHERE status = 'Cancelled' and  courseid = '" & rqCourseId &"' Order by courseid desc"

objRs.Open strQuery,ConnObj
'response.Write(strQuery)
Do until objRs.EOF

	rqCourseId = objRs("courseid")
	rqCourseName = objRs("courseName")
	rqCity = objRs("city")
	rqstartdate = objRs("startdate")
	rqenddate = objRs("enddate")
	rqStatus = objRs("status")

	'Retriving the last mail send date'
	strQuery = "SELECT id,firstname, lastname, email, nameofemployeer, coursedetails,cancel_sentMail FROM enrolledusers WHERE courseid = '" & rqCourseId &"' and checkreceived = 'Yes' Order by id desc"
	
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

	
	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
	objCDOMail.From = "marketing@projstudy.com"
	objCDOMail.To =  "<" & email & ">"
	objCDOMail.BCc =  "marketing@projstudy.com,edusyssidhardha@gmail.com,edusyssantosh@gmail.com,edusyskavitha@gmail.com,edusysgregory@gmail.com,"
	objCDOMail.Importance = 2
	objCDOMail.Subject = "Important: PROJstudy PRINCE2 Training Information"
	objCDOMail.BodyFormat = 0
	objCDOMail.MailFormat = 0
	objCDOMail.Body =  rqBody
	objCDOMail.Send
	Set objCDOMail = Nothing
	

	'Inserting date into the facultymailsent table because based on this emails will send daily'
	ConnObj.Execute "UPDATE enrolledusers SET cancel_sentMail = '1' WHERE id = '" & rqEnrollUserId &"'"
	'response.Write(strQuery)
	
			
	End If
	
	
End If


	objRs1.Movenext
	Loop
	objRs1.Close

	
	Response.write("Successfully send mails")
	

			
objRs.Movenext
Loop
objRs.Close	

End IF


If rqType <> "sendmail" Then
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Send Mails</title>
<link href="/backoffice/css/pagestyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="htMap">
  <table width="620" height="580" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#00B0EC" class="dbborder" >
    <tr>
      <td width="547" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="2">
          <form  method="post" action="cancelMail.asp?type=preview">
            <input type="hidden" name="courseId" value="<% = rqCourseId %>" />
            <tr>
              <td colspan="2" bgcolor="#00B0EC">Email Template </td>
            </tr>
            <tr class="rowOdd">
              <td>Subject : </td>
              <td>Important: PROJstudy PRINCE2 Training Information</td>
            </tr>
            <tr class="rowEven">
            
              <td colspan="2"><textarea name="QueryReply" cols="75" rows="25"><% If strBody = "" Then %><% = body %><% Else %><% = strBody %><% End If %></textarea></td>
            </tr>
            <tr class="rowOdd">
              <td colspan="2" align="center"><input name="Submit" type="submit" class="buttonc" value="Preview" />
              </td>
            </tr>
          </form>
          <form method="post" action="cancelMail.asp?type=sendmail" />
        
            <tr>
              <td>
                <input type="hidden" name="body" value= '<% = body %>' />
                <input type="hidden" name="courseId" value="<% = rqCourseId %>" />
              </td>
              <% 'response.Write(body) %>
            </tr>
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
              <td colspan="2" align="center">
			    <input name="Submit3" type="submit" class="buttonc" name="sendmail" value="Send Mail" />
              </td>
            </tr>
          </form>
          <tr class="rowEven">
            <td colspan="2">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <% If rqType = "preview" Then %>
    <tr>
      <td colspan="3"><% 
     Response.Write(body)%></td>
    </tr>
	<% End If %>
  </table>
</div>
</body>
</html>
<% End IF %>
