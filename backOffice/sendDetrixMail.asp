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
dim accountmanager
dim bookedby
dim bookedon
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
	
	strQuery = "SELECT firstname,lastname,email,coursedate FROM enrolledusers WHERE courseid = '" & rqCourseId & "' AND  status = 'Active' AND (us_status <> 'Dummy' OR us_status IS NuLL) "
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
		
		strQuery1 = "SELECT * FROM datrixclasses WHERE courseid = '" & rqCourseId & "'"
		
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
		 accountmanager=Rs1("accountmanager")
		 bookedby=Rs1("bookedby")
		 bookedon=Rs1("bookedon")
		Rs1.Movenext
		Loop
		
	IF trim(courseName) = "Foundation" Then
		 
		 noOfDays = 3

	ElseIF trim(courseName) = "Practitioner" Then
		 
		 noOfDays = 2
		 
   ElseIF trim(courseName) = "Foundation and Practitioner" Then
		
		 noOfDays = 5
		 
	    End IF

	   		subject="Joining Instuctions: Datrix training"
			body = "<font face=""Arial"" size=""2""><BR>Thank you for selecting Datrix Training Limited as your training provider. Our aim is to <BR>provide you with an enjoyable and educational environment for your training course. Please<BR>read these joining instructions very carefully. Should you find any errors, or something<BR>about which you are uncertain, please contact our Course Administration Team on 01772 623467.<br><B><U>COURSE DETAILS</U></B><BR><BR>The training course is: "&courseName&"<BR>The course will commence on: "& FormatDateTime(startDate,1) &"<br>The course will start at: "&startingHour&":"&startingMinute&"&nbsp; "& startingSession &"<br>The course will end on: "& FormatDateTime(endDate,1) &" at "& endingHour &":"& endingMinute &" &nbsp; "& endingSession &"<BR><br>The Venue will be: "& hotelName &","& hotelAddress&"<br>Account Manager:"&accountmanager&"<br>Booked by: "&bookedby&"<br>Booked on: "&bookedon&"<br>Invoice Number:N/A"
			body = body & "<BR><BR>You can find a map and directions to the venue here: http://www.datrixtraining.com/about-us/our-venues/ <br><br>You can find pre-course reading here: http://www.datrixtraining.com/pre-course-reading/ <br>Following serious fraud allegations, The APMG have introduced a new measure to which all<br>delegates who intend to take an exam must adhere to:<br>'Candidates must provide photographic ID before the start of the exam, which must be <br>checked for each candidate on public courses. For in-house courses, candidates’ identity can<br>be verified by a manager.'<br>Invigilators will be required to check the identifications and verify the authenticity on the<br> candidate list provided to them.<br><br>Invigilators will be required to check the identifications and verify the authenticity on the<br> candidate list provided to them.Please do ensure that you bring your photographic ID along with you to the course to<br> prevent any delays once the exam is due to commence.<br>If you should have any queries, please contact your account manager on 0800 781 0626 or<br> the administration team on 01772 623467.<br><br><br>The dress code for the training course is smart and casual.<br>If you have any specific requirements for your course, such as special access, equipment or<br> dietary needs, please contact us as soon as possible and we will endeavour to accommodate<br> your wishes.<br><br>Kind Regards <br><br>Datrix Training<br>************************************************************************<br>*****************<div>This message is sent in strict confidence for the addressee only. It may contain legally <br>privileged information. The contents are not to be disclosed to anyone other than the <br>addressee. If you are not the intended recipient, please notify us immediately and <br>remove the e mail and any attachments from your system. You must take full <br>responsibility for virus checking this e mail and any attachments. Any opinion stated in <br>this e mail or any attachments are those of the individual senderand not Datrix Training <br>Ltd or Datrix Training (London) Ltd.<br><br>********************************************************************<br>****************"
		session("body")=body
End If


	
'If Click Preview In This Page Its Come Here'

If rqType = "preview" then

   'Retive The body and emailids and course date in This Page'

	body = Request.form("QueryReply")
	emailIDs = Request.Form("emailid")
	rqCourseId = Request.Form("courseId") 
    noOfDays   = Request.Form("noOfDays")
    	session("body")=body
     session("emailids")=emailIDs
	'response.Write(noOfDays)
End If
	
'Send Email'

If rqType = "sendmail" Then

   Dim objCDOMail
   Dim rqBody
   Dim rqSubject
   
   rqBody =  Request.Form("body")
   subject = "Joining Instuctions: Datrix training"
   rqEmailIds = Request.Form("emailids")
   rqCourseId = Request.Form("courseId")   
   
   'Sql Query For If You Send Email I am entering into database 1 for in courses.asp Page we want display a message "All Mails Sent"'
	
   strQuery2 = "UPDATE enrolledusers SET allmailsent = '1' WHERE courseid = '" & rqCourseId & "'"
	
   Rs2.Open strQuery2,ConnObj

   	strQuery3 = "SELECT firstname,lastname,email,coursedate FROM enrolledusers WHERE courseid = '" & rqCourseId & "' AND  status = 'Active' AND (us_status <> 'Dummy' OR us_status IS NuLL) "
	
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
	  if instr(session("emailids"),EmailId) then
    'response.Write(EmailId)
	 Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
	
	 objCDOMail.From = "operations@datrixtraining.com"
	
	   objCDOMail.To =  ""&EmailId&""

		'objCDOMail.Cc = "edusyssaubhik@gmail.com"
	   'Importance of the e-mail (0=Low, 1=Normal, 2=High)
	   objCDOMail.Importance = 2
	   objCDOMail.Subject = ""&subject&""
	   objCDOMail.BodyFormat = 0
	   objCDOMail.MailFormat = 0
	   objCDOMail.Body  = "<img src=""http://www.projstudy.com/Quotewerks/images/email_headerDatrix.jpg""></img><br><br><font face=""Arial"" size=""2"">Dear "&FirstName &" "&LastName&"</font><BR>"&session("body")&""
	   'response.Write(str)
	   objCDOMail.Importance = 2
	   objCDOMail.Send
	

	   Set objCDOMail = Nothing
	end if   
	   Rs3.Movenext
	   Loop
	   Rs3.Close
    session("body")=""
    session("emailids")=""
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
          <form  method="post" action="sendDetrixMail.asp?type=preview">
            <input type="hidden" name="courseId" value="<% = rqCourseId %>" />
            <tr>
              <td colspan="2" bgcolor="#00B0EC">Email Template </td>
            </tr>
            <tr class="rowEven">
              <td width="28%">To : </td>
              <td width="72%">
			  <% dim emails
                  If IsArray(arrAllNames) Then
	             For rowCounter = firstRow to lastRow
        	     emailIDs = (arrAllNames(2,rowCounter))
	             emails=emails&emailIDs&","
                   %>
                <input type="hidden" name="emailids" value="<% = emailIDs %>" />
              <% Next
                  emails=left(emails,len(emails)-1)
                  if session("emailids")<>"" then
                  emails=session("emailids")
                  end if
       			 %>
                 <textarea name="emailid" style="height: 48px; width: 440px"><%=session("emailids") %></textarea>
              
                   <%
                  Else %>
              <% =  rqEmailIds %>
                 <% emails=rqEmailIds
                  if session("emailids")<>"" then
                  emails=session("emailids")
                  end if
                     %> 
                 <input type="text" name="emailid" value="<%=session("emailids") %>" />
             
                   <% End If 
                  session("emailids")=emails
                  %>
              </td>
            </tr>
            <tr class="rowOdd">
              <td>Subject : </td>
              <td>Venue details for Datrix Classroom Training (www.datrix-training.com)</td>
            </tr>
            <tr class="rowEven">
              <td colspan="2"><textarea name="QueryReply" cols="75" rows="25"><% = body %></textarea></td>
            </tr>
            <tr class="rowOdd">
              <td colspan="2" align="center"><input name="Submit" type="submit" class="buttonc" value="Preview" />
              </td>
            </tr>
          </form>
          <form method="post" action="sendDetrixMail.asp?type=sendmail">
            <tr>
              <td>
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
      <td colspan="3"><%  Response.write(subject & "<br/><br/>")
     Response.Write(session("body"))%></td>
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
