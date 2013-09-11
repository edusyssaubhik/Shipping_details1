<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/inneraboutusbanner.html"-->
<!--#include virtual = "/includes/connection.asp"-->

<%
' ----------------------------------------------------------------------------------
'	Recordset varables
' ----------------------------------------------------------------------------------
	Set objRs = Server.CreateObject("ADODB.Recordset")
' ----------------------------------------------------------------------------------
'	Variable declaration
' ----------------------------------------------------------------------------------
	Dim CandidateName, Email, phoneNo, DatePassed, strQuery
	Dim Score, Country
	
	
' ----------------------------------------------------------------------------------
'	 declaration
' ----------------------------------------------------------------------------------
 
        CandidateName   =     request.Form("candidateName")
		Email           =     request.Form("email")
		DatePassed      =     request.Form("datePassed")
        phoneNo         =     request.Form("phNo")
        rqType          =     request.Form("type")
		Score           =     request.Form("score")
		City            =     request.Form("city")
		Country         =     request.Form("country")

		
 	   
	   
	   
' ----------------------------------------------------------------------------------
'	 Inserting details of complaint log
' ----------------------------------------------------------------------------------
	    
   		If rqType = "Submit" Then
   
		   strQuery = "INSERT INTO recruitment (candidate_Name, email, phoneno, Pracpassed_date, score, city, country)"
		   strQuery = strQuery & " values "
		   strQuery = strQuery & "('" & CandidateName & "',"
		   strQuery = strQuery & "' " & Email & " ',"
		   strQuery = strQuery & "'" & phoneNo & "',"
		   strQuery = strQuery & "'" & DatePassed & "',"
		   strQuery = strQuery & "'" & Score & "',"
		   strQuery = strQuery & "'" & City & "',"
		   strQuery = strQuery & "'" & Country & "')"
	

		   ConnObj.Execute strQuery
		   
'		   
'		   strQuery1 = "SELECT top 1 complaint_no FROM support_complaint Where country = '" & Session("CountryOrigin") & "' ORDER BY complaint_no DESC"
'		   
'		   objRs.open strQuery1, ConnObj
'		   
'		   Do Until objRs.EOF
'		   
'		   	Complaint_No = objRs("complaint_no")
'		   
'		   objRs.Movenext
'		   Loop
'		   objRs.Close
		   
		   %>
		  <div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
    
    <td height="235" align="left" valign="top" bgcolor="#FFFFFF">
    
    <table width="100%" border="0" cellspacing="0" cellpadding="8">
      <tr>
        <td width="2%" class="Header">&nbsp;</td>
        <td width="25%" class="PageTitle">&nbsp;</td>
        <td width="70%" class="PageTitle">Recruitment</td>
      </tr>
      <tr>
      
      <!--#include virtual="/includes/innerLeftMenu.asp"-->
      <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
      <br />
      <div style="margin-top:-12px;">
        <!-- Content Start From Here-->
        
      <%
	   'Getting ip address'
	   
	  
sIPAddress = Request.ServerVariables("HTTP_X_FORWARDED_FOR")

If sIPAddress="" Then sIPAddress = Request.ServerVariables("REMOTE_ADDR")

	strQuery11 = "http://geoip1.maxmind.com/b?l=4tAUhyTgUD6d" & _
		"&i=" & sipaddress
	set objHtp = Server.CreateObject("Msxml2.ServerXMLHTTP")
	objHtp.open "GET", strQuery11, false
	objHtp.send
	sipAddress = sipAddress + ";" + objHtp.ResponseText %>
    
    
		<% strText = "Dear "&CandidateName&",<BR><BR>Thank you! A confirmation mail has been sent to your email id provided."
		
		Response.Write(strText)
	   
		   
		    'Email Template'
		body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.PROJstudy.com/images/banners/email_headerUK.jpg"" alt=""PROJstudy"" /></span><br></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Dear "& CandidateName &",<br><br>Greetings from PROJstudy!<br><br>Thank you for your interest in PROJstudy.com and for submitting your details for our review. While this is an automated response, please be assured that the details are reviewed by us, and forwarded to the hiring managers.<br><br>If the details provided meets our requirements, our hiring managers will contact you<br><br>Sincerely,<br>PROJstudy.com (Edusys Services Private Limited)<br>Email: instructors@projstudy.com</font></td></tr></table></td></tr><tr><td align=""center""><hr><font size=""1px"">The Swirl logo™ is a trade mark of the Cabinet Office.<br>PRINCE2<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.</font></td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"
		
		'Response.Write(body)

		Dim objCDOMail     
		'Holds the CDONTS NewMail Object
		'Create the e-mail server object
		Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
		'Who the e-mail is from
		objCDOMail.From =  "instructors@projstudy.com"
		'Who the e-mail is sent to
		objCDOMail.To = ""&Email&""
		'bcc
	     objCDOMail.Bcc = "instructors@projstudy.com,marketing@pojstudy.com"
		'Set the subject of the e-mail
		objCDOMail.Subject = "Thank you for providing details to PROJstudy"
		'Set the e-mail body format (0=HTML 1=Text)
		objCDOMail.BodyFormat = 0
		'Set the mail format (0=MIME 1=Text)
		objCDOMail.MailFormat = 0
		'Set the main body of the e-mail
		objCDOMail.Body = body
		'Importance of the e-mail (0=Low, 1=Normal, 2=High)
		objCDOMail.Importance = 2
		'Send the e-mail
		objCDOMail.Send
		'Close the server object
		Set objCDOMail = Nothing
		

		 
		   
	   
'=========================================================='
'Sending email to instructor@projstudy.com
'=========================================================='
						
	
		strBody1 = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.PROJstudy.com/images/banners/email_headerUK.jpg"" alt=""PROJstudy"" /></span><br></td></tr><tr><td colspan=""2"" width=""580px""><table border=""0"" cellpadding=""10"" width=""580px""><tr><td valign=""top""><font face=""Arial"" size=2>Hi,<BR><BR>We have received the details of a interested candidate. Following is the details provided. <BR><BR>Name: "&CandidateName&" <BR><BR>Email:  "&Email&"<BR><BR>Phone Number: "&phoneNo&"<BR><BR>Date Passed Practitioner Exam: "&FormatDateTime(DatePassed,1)&"<BR><BR>Score:"&Score&"<BR><BR>City: "&City&"<BR><BR>Country: "&Country&".<BR><BR>Best Regards, <BR>Custmer Support<br>www.PROJstudy.com<BR>Email: marketing@projstudy.com</font></td></tr></table></td></tr></table></td></tr></table>"&sIPAddress
		
		'Response.Write(strBody1)
		
		Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
		objCDOMail.From = "marketing@pojstudy.com"
		objCDOMail.To =  "instructors@projstudy.com"
		objCDOMail.cc = "marketing@projstudy.com"
		objCDOMail.Importance = 2
		objCDOMail.Subject = "Prospective Faculty Details"
		objCDOMail.BodyFormat = 0
		objCDOMail.MailFormat = 0
		objCDOMail.Body =  strBody1
		objCDOMail.Send
		Set objCDOMail = Nothing
		

     End If
	 
    %>
  </td></tr>
        </table>
<!-- Content End From Here-->
		<!--#include virtual="/includes/connectionClose.asp"-->
      </div>

<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
