<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
 'Written By : Priyanka'
 'Last UpaDated: 10/03/2010'
 'Description :'
 'Purpose : Sending Course Details Email'
%>
<%
   If Session("UserId")  = "" Then
     Response.Redirect("./backOffice//login.asp")
   Else
%>
<!--#include virtual ="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<%
''Declare The Variables
Dim rqCourseDate
Dim rqFirstName
Dim rqLastName
Dim rqType
Dim subject
Dim body,courseName,noOfDays
Dim rqTempNo,str
Dim strQuery,strQuery1,strQuery2,strQuery3
Dim Rs1,Rs2,Rs3,Rs
Dim FirstName
Dim LastName
Dim EmailId
Dim rqEnrollEmailId
Dim arrAllNames
Dim firstRow
Dim lastRow
Dim numRows
Dim rowCounter
Dim emailIDs
Dim rqEmailIds
Dim startDate
Dim endDate
Dim startingHour,startingMinute,startingSession
Dim endingHour,endingMinute,endingSession
Dim hotelName,hotelURL,hotelAddress,hotelPhoneNo
Dim sstartDate,eendDate,rqCourseId,courseDate
Dim strFirstLet,strFirstRest,strFirstName
Dim strLastLet,strLastRest,strLastName

Set Rs  = Server.CreateObject("ADODB.Recordset")
Set Rs1 = Server.CreateObject("ADODB.Recordset")
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Set Rs3 = Server.CreateObject("ADODB.Recordset")

'Retrive The CourseId From courses.asp Page'

If Request.Querystring("CourseId") <> "" Then

	rqCourseId  =  Request.Querystring("CourseId")
	
Else

	rqCourseId  =  Request.Form("CourseId")
	
End If

'Retrive The type from this page example Preview and sendemail'

rqType = Request.QueryString("type")



	'Sql Query For Retrive The firstname lastname and email and put into Array'
	
	strQuery = "SELECT firstname,lastname,email,coursedate FROM enrolledusers WHERE courseid = '" & rqCourseId & "' AND ((checkreceived = 'Yes' AND status = 'Active') OR (us_status = 'P.O Received' And status = 'Active'))"
	'response.Write(strQuery)
	Rs.Open strQuery,ConnObj
	
	If Not Rs.EOF Then
	
	 arrAllNames = Rs.getrows
	 numRows  =  Ubound(arrAllNames,2)
	 firstRow = 0
	 lastRow  = numRows
	
	End If
	
	'Retrive The EmailIds Who Paid'
	
	If IsArray(arrAllNames) Then
	
		For rowCounter = firstRow to lastRow
		
			emailIDs = arrAllNames(2,rowCounter)
		
		Next
		
	End If
	
	'Retrive The EmailIds From this Page'
	
	If rqType = "" Then
	
		'Sql Query for Retrive The Course Details'
		
		strQuery1 = "SELECT * FROM course WHERE courseid = '" & rqCourseId & "'"
		
		Rs1.Open strQuery1,ConnObj
		
		Do Until Rs1.EOF
		
		 startingHour    =  Rs1("starthour")
		 startingMinute  =  Rs1("startminute")
		 startingSession =  Rs1("startsession")
		 endingHour      =  Rs1("endhour")
		 endingMinute    =  Rs1("endminute")
		 endingSession   =  Rs1("endsession")
		 startDate 		 =  Rs1("startdate")
		 endDate		 =  Rs1("enddate")
		 hotelName       =  Rs1("hotelname")
		 hotelPhoneNo    =  Rs1("hotelphonenumber")
		 hotelURL        =  Rs1("hotelurl")
		 hotelAddress    =  Rs1("hoteladdress")
		 courseName      =  Rs1("courseName")
		 
		 
		 
		Rs1.Movenext
		Loop
		
	IF trim(courseName) = "Foundation" Then
		 
		 noOfDays = 3

	ElseIF trim(courseName) = "Practitioner" Then
		 
		 noOfDays = 2
		 
   ElseIF trim(courseName) = "Foundation and Practitioner" Then
		
		 noOfDays = 5
		 
	    End IF

			subject="Venue details for PROJstudy PRINCE2 Classroom Training (www.PROJstudy.com)"
			body = "<font face=""Arial"" size=""2""><BR><BR>Greetings from PROJstudy.com! <BR><BR>Thank you for selecting PROJstudy to assist you in preparing for the PRINCE2 Certification exam.<BR><BR>The program venue details are provided below: <BR><BR><B><U>Program Details</U></B><BR><BR>Program: PROJstudy PRINCE2 Classroom Training<BR><BR>Duration: "& FormatDateTime(startDate,1) &" to "& FormatDateTime(endDate,1) &"<BR><BR>Class time: "&startingHour&":"&startingMinute&"&nbsp; "& startingSession &" - "& endingHour &":"& endingMinute &" &nbsp; "& endingSession &"<BR><BR><table border=""0"" cellpadding=""3""><tr><td valign=""top""><font face=""Arial"" size=""2"">Venue : </font></td><td><font face=""Arial"" size=""2"">"& hotelName &"<br>"& hotelAddress
			If hotelPhoneNo <> "" Then 
			body = body & "<br>Ph: "&hotelPhoneNo
			End If
			body = body & "</font></td></tr></table><BR>Contact Person (Banquet Executive) : ___________ <BR><BR>Please note that you should arrive at the venue at least 15 minutes before the class commences on the first day of the training i.e. "& FormatDateTime(startDate,1) &"." 
			If session("country") <> "Australia" Then
			body = body & "You would be provided refreshments during breaks for the "&noOfDays&" days of training. Lunch is not included."
			End If
			body = body & "<BR><BR>For any queries, please email us at adminsupport@projstudy.com - we look forward to your feedback and suggestions.<br><br>We hope you are enjoying your experience with PROJstudy.com.<BR><BR>Best Regards,<BR>Customer Support<BR><a href=""http://www.PROJstudy.com"" target=""_blank"">www.PROJstudy.com</a><BR>Email id : <a href=""mailto:adminsupport@projstudy.com"" target=""_blank"">adminsupport@projstudy.com</a></font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"
		
End If


	
'If Click Preview In This Page Its Come Here'

If rqType = "preview" then

   'Retive The body and emailids and course date in This Page'

	body = Request.form("QueryReply")
	emailIDs = Request.Form("emailids")
	rqCourseId = Request.Form("courseId") 
    noOfDays   = Request.Form("noOfDays")
	response.Write(noOfDays)
End If
	
'Send Email'

If rqType = "sendmail" Then

   Dim objCDOMail
   Dim rqBody
   Dim rqSubject
   
   rqBody =  Request.Form("body")
   subject = "Venue details for PRINCE2 Classroom Training (www.PROJstudy.com)"
   rqEmailIds = Request.Form("emailids")
   rqCourseId = Request.Form("courseId")   
   
   'Sql Query For If You Send Email I am entering into database 1 for in courses.asp Page we want display a message "All Mails Sent"'
	
   strQuery2 = "UPDATE enrolledusers SET allmailsent = '1' WHERE courseid = '" & rqCourseId & "'"
	
   Rs2.Open strQuery2,ConnObj

   	strQuery3 = "SELECT firstname,lastname,email,coursedate FROM enrolledusers WHERE courseid = '" & rqCourseId & "' AND ((checkreceived = 'Yes' AND status = 'Active') OR (us_status = 'P.O Received' And status = 'Active'))"
	
	Rs3.Open strQuery3,ConnObj
	
	Do Until Rs3.EOF  
	  
	   EmailId = Trim(Rs3("email"))
	   
	   FirstName = Rs3("firstname")
	   LastName  = Rs3("lastname")

       strFirstLet = UCase(Left(FirstName, 1))
	   strFirstRest = Right(FirstName, Len(FirstName) - 1)
	   
	   strFirstName = strFirstLet & strFirstRest
	   
       strLastLet = UCase(Left(LastName, 1))
	   strLastRest = Right(LastName, Len(LastName) - 1)
	   
	   strLastName = strLastLet & strLastRest	   
	   
	 str =   "<table width=""100%"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr height=""45px""><td>&nbsp;</td></tr><tr><td><table width=""600px"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""595px"" bgcolor=""#FFFFFF"">" 
						IF Session("country") = "India" Then
						str= str & "<span><img src=""http://www.PROJstudy.com/images/banners/email_headerIN.jpg"" alt=""PROJstudy"" /></span>" 
						ElseIf Session("country")="United Kingdom" Then 
						str= str &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerUK.jpg"" alt=""PROJstudy"" /></span>"
						ElseIf Session("country")="Australia" Then 
						str= str &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerAUS.jpg"" alt=""PROJstudy"" /></span>"
						Else
						str= str &"<span><img src=""http://www.PROJstudy.com/images/banners/email_header.jpg"" alt=""PROJstudy"" /></span>"
						End if
						str= str &"</td></tr><tr><td align=""center"" colspan=""2"" width=""560px""><table border=""0"" align=""center"" width=""560px""><tr><td><br><font face=""Arial"" size=""2"">Dear "& strFirstName &"&nbsp;"& strLastName &",</font>"& rqBody 
	   
	 Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
	
	 objCDOMail.From = "marketing@projstudy.com"
	
	   objCDOMail.To =  ""&EmailId&""

		objCDOMail.Cc = "marketing@projstudy.com"
	   'Importance of the e-mail (0=Low, 1=Normal, 2=High)
	   objCDOMail.Importance = 2
	   objCDOMail.Subject = ""&subject&""
	   objCDOMail.BodyFormat = 0
	   objCDOMail.MailFormat = 0
	   objCDOMail.Body  = ""&str&""
	   'response.Write(str)
	   objCDOMail.Importance = 2
	   objCDOMail.Send
	

	   Set objCDOMail = Nothing
	   
	   Rs3.Movenext
	   Loop
	   Rs3.Close

	   Response.write("Successfully send mails")
	   
End If

If emailIDs <> "" and rqType <> "sendmail" Then
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
          <form  method="post" action="sendmails.asp?type=preview">
            <input type="hidden" name="courseId" value="<% = rqCourseId %>" />
            <tr>
              <td colspan="2" bgcolor="#00B0EC">Email Template </td>
            </tr>
            <tr class="rowEven">
              <td width="28%">To : </td>
              <td width="72%">
			  <% If IsArray(arrAllNames) Then
	             For rowCounter = firstRow to lastRow
        	     emailIDs = (arrAllNames(2,rowCounter))
	          %>
              <% = (emailIDs & ",") %>
                <input type="hidden" name="emailids" value="<% = emailIDs %>" />
              <% Next
       			 Else %>
              <% =  rqEmailIds %>
              <% End If %>
              </td>
            </tr>
            <tr class="rowOdd">
              <td>Subject : </td>
              <td>Venue details for PRINCE2 Classroom Training (www.PROJstudy.com)</td>
            </tr>
            <tr class="rowEven">
              <td colspan="2"><textarea name="QueryReply" cols="75" rows="25"><% = body %></textarea></td>
            </tr>
            <tr class="rowOdd">
              <td colspan="2" align="center"><input name="Submit" type="submit" class="buttonc" value="Preview" />
              </td>
            </tr>
          </form>
          <form method="post" action="sendmails.asp?type=sendmail">
            <tr>
              <td><input type="hidden" name="body" value='<% = body %>' />
                <input type="hidden" name="emailids" value='<% = emailIDs %>' />
                <input type="hidden" name="courseId" value='<% = rqCourseId %>' />
                <input type="hidden" name="noOfDays" value='<% = noOfDays %>' />
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
      <td colspan="3"><% Response.write(subject & "<br/><br/>")
     Response.Write(body)%></td>
    </tr>
	<% End If %>
  </table>
</div>
</body>
</html>
<% Else 
If rqType <> "sendmail" Then%>
No One Paid
<% End If %>
<%	
End If
End If 
%>
