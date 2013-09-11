<%@ Language = "VBScript" %>
<%
 'Written By : Bharath'
 'Created Date: 12/11/2007'
 'Modified By : Bharath'
 'Last UpaDated: 04/02/2012'
 'Description :'
 'Purpose : Sending Payment Received Email'
%>
<%
   If Session("UserId")  = "" Then
     Response.Redirect("../login.asp")
   Else
%>
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/connectionRef.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<%
''Declare The Variables
Dim rqEnrollUserId
Dim rqFirstName
Dim rqLastName
Dim rqType
Dim subject
Dim body
Dim rqTempNo
Dim StrQuery1,strQuery2
Dim FirstName
Dim LastName
Dim EmailId
Dim rqEnrollEmailId
Dim CourseDate,str,startDate,i,sstartDate
Dim Rs1
Dim todaysDate
Dim rqEmail,rqPhoneNumber,rqNameOfEmployeer,rqCourseDetails,dtax,coursePrice
Dim Total,Date2
Dim str1,str2,Price,rqSendEmail,City,rqCity

Set Rs = Server.CreateObject("ADODB.Recordset")
set Rs1 = Server.CreateObject("ADODB.Recordset")
set Rs2 = Server.CreateObject("ADODB.Recordset")
Set Rs3 = Server.CreateObject("ADODB.Recordset")

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "")
End Function


'Retirve The EnrolledUSerId From Courses.asp Page'

rqEnrollUserId  =  Request.Querystring("enrollUserId")

'Currency Format Display Functions'

 Currency_Format_Front = CurrencyFormat_Front(Session("Country"))

 Currency_Format_Back = CurrencyFormat_Back(Session("Country"))
					 
'Sql Query For Retive the Firstname, Lastname and Emailid'

strQuery = "SELECT id,firstname,lastname,email,nameofemployeer,phoneno,coursedate,coursedetails,courseid,amount,VAT, VAT_Invoice from enrolledusers WHERE id = '" & rqEnrollUserId & "'"

Rs.Open strQuery,ConnObj

Do Until Rs.EOF

 Session("ID") = Rs("id")
 Session("FirstName") = Rs("firstname")
 Session("Lastname")  = Rs("lastname")
 Session("EmailId")   = Trim(Rs("email"))
 Session("NameOfEmployer")   = StrQuoteReplace(Rs("nameofemployeer"))
 Session("PhoneNo")   = Rs("phoneno")
 Session("Coursedetails")   = Rs("coursedetails")
 Session("EmailId")   = Rs("email")
 Session("CourseDate") = Rs("coursedate")
 Session("courseid") = Rs("courseid")
 Session("DisAmount") = Rs("Amount")
 Session("VATInvoice") = Rs("VAT_Invoice")
 
 
 	'Checking the VAT is null'
	

Rs.Movenext
Loop

Rs.Close

'SQL Query For Retrieve The Prices and Put Into Email'

 
'******************** Here starts the mail sending in PMstudy Refrall module *******************************'	
	

%>
<!--#include virtual="/includes/GenRefTag.asp"-->
<%
	
	
	
	strBody = strBody & "<table width=""100%"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td>&nbsp;</td></tr><tr><td><table width=""500px"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""595px"" bgcolor=""#FFFFFF"">" 
						IF Session("country") = "India" Then
						strBody= strBody & "<span><img src=""http://www.PROJstudy.com/images/banners/email_headerIN.jpg"" alt=""PROJstudy"" /></span>" 
						ElseIf Session("country")="United Kingdom" Then 
						strBody= strBody &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerUK.jpg"" alt=""PROJstudy"" /></span>"
						ElseIf Session("country")="Australia" Then
						strBody= strBody &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerAUS.jpg"" alt=""PROJstudy"" /></span>"
						Else
						strBody= strBody &"<span><img src=""http://www.PROJstudy.com/images/banners/email_header.jpg"" alt=""PROJstudy"" /></span>"
						End if
						strBody= strBody &"</td></tr>"
						
					    strBody = strBody & "<tr><td><table width=""600px"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12""><tr><td><font face=""Arial"" size=""2"">Dear " & Session("FirstName") & " " & Session("Lastname") & ",<br><br>Thank you for choosing PROJstudy – the best choice for PRINCE2 training. <br /><br />While you embark on your journey, we invite you to our new industry leading referral program. You can now help your friends to get the best of training for the prestigious PRINCE2 training while both you and your friends earn <b>attractive rewards</b> along the way. And the benefits are unlimited – you can refer as many friends/colleagues as you want!<br><br><b>Here is how the referral program works:</b><br><br>Each friend you refer to PROJstudy, who completes a PRINCE2 Foundation+Practitioner classroom course with us, will earn you a <b>&pound; 20 gift voucher</b> from <a href=""http://www.amazon.co.uk"" target=""_blank"">www.amazon.co.uk</a> and your friend will get a <b>discount of &pound; 20</b> on the course price. The benefits for all courses are shown below:<br><br><table border=""1"" cellspacing=""0"" cellpadding=""0"" width=""100%"" align=""center""><tr><td width=""40"" valign=""bottom""><p align=""center""><b>PRINCE2 Course </b></p></td><td width=""50""  valign=""bottom""><p align=""center""><b>Gift Voucher Benefits <br />(For You)</b></p></td><td width=""50"" valign=""top""><p align=""center""><b>Course Discount<br />(For Your Friend)</b></p></td></tr><tr><td><p align=""center"">Foundation + Practitioner</p></td><td ><p align=""center"">&pound; 20</p></td><td><p align=""center"">&pound; 20</p></td></tr><tr><td ><p align=""center"">Practitioner</p></td><td><p align=""center"">&pound; 10</p></td><td ><p align=""center"">&pound; 10</p></td></tr><tr><td><p align=""center"">Foundation</p></td><td ><p align=""center"">&pound; 8</p></td><td><p align=""center"">&pound; 8</p></td></tr></table><br><br>The moment your first friend completes the classroom course, you will receive the gift vouchers which you can redeem for anything you like on <a href=""http://www.amazon.co.uk"" target=""_blank"">www.amazon.co.uk.</a><br><br>Your friend needs to complete the course within 6 months from the time of receiving the invitation for the referral program. So Hurry up! <br><br>To refer your friends, <a href=""http://www.PROJstudy.com/refer-Friends.asp?refEmail="&Session("EmailId")&""" target=""_blank"">click here</a><br><br> OR<br><br>Share this link with them through email, Twitter or Facebook: <b>http://www.PROJstudy.com/referral.asp?tag="&GenTag&"</b><br><br>If you have any questions, feel free to call us at 0800 0337 947 or email us at <a href=""mailto:marketing@projstudy.com."">marketing@projstudy.com</a><br><br>Best Regards,<br><br>Marketing Team<br><a href=""http://www.PROJstudy.com"" target=""_blank"">www.PROJstudy.com</a></font></td></tr></table></td></tr></table></td></tr><tr><td height=""45%"">&nbsp;</td></tr></table>"
	

     'response.Write(strBody)
	
    Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
	objCDOMail.From = """PROJstudy PRINCE2"" <marketing@projstudy.com>"
	objCDOMail.To =   Session("EmailId")
	objCDOMail.Cc = "marketing@projstudy.com"
	objCDOMail.BCc = "edusyspriyanka@gmail.com,edusyssidhardha@gmail.com"
	'Importance of the e-mail (0=Low, 1=Normal, 2=High)
	objCDOMail.Importance = 2
	objCDOMail.Subject = "Welcome to our new Industry leading Referral Program. Earn Unlimited Benefits! "
	objCDOMail.BodyFormat = 0
	objCDOMail.MailFormat = 0
	objCDOMail.Body = strBody
	objCDOMail.Send
	Set objCDOMail = Nothing
	
	
'******************** Here End the mail sending in pMstudy Refrall module *******************************'	
		
	   Response.write("Successfully send mail")

End If %>
  </table>

