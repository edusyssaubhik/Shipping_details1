<%@ Language = "VBScript" %>
<%' OPTION EXPLICIT %>
<%
 'Written By : Bharath'
 'Last UpaDated: 12/11/2007'
 'Description :'
 'Purpose : Sending Payment Received Email'
%>
<%
   If Session("UserId")  = "" Then
     Response.Redirect("../login.asp")
   Else
%>
<!--#include virtual ="/includes/connection.asp"-->
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
Dim Total,Date2,RsPoint
Dim str1,str2,Price,rqSendEmail,City,rqCity,rqcoursetype

set Rs = Server.CreateObject("ADODB.Recordset")
set Rs1 = Server.CreateObject("ADODB.Recordset")
set Rs2 = Server.CreateObject("ADODB.Recordset")
Set Rs3 = Server.CreateObject("ADODB.Recordset")
Set Rs4 = Server.CreateObject("ADODB.Recordset")
Set RsPoint  = Server.CreateObject("ADODB.Recordset")

'Retirve The EnrolledUSerId From Courses.asp Page'

rqEnrollUserId  =  Request.Querystring("enrollUserId")
rqcoursetype = Request.QueryString("coursetype")

'Currency Format Display Functions'

 Currency_Format_Front = CurrencyFormat_Front(Session("Country"))

 Currency_Format_Back = CurrencyFormat_Back(Session("Country"))
					 
'Sql Query For Retive the Firstname, Lastname and Emailid'

strQuery = "SELECT id,firstname,lastname,email,nameofemployeer,phoneno,coursedate,coursedetails,PRINCE2Manual,courseid,amount,VAT,VAT_Invoice,PRINCE2price,typeOfCourse,checkrecmailsent,FBdiscount from enrolledusers WHERE id = '" & rqEnrollUserId & "'"

Rs.Open strQuery,ConnObj

Do Until Rs.EOF

 Session("ID") = Rs("id")
 Session("FirstName") = Replace(Rs("firstname"), "'", "")
 Session("Lastname")  = Replace(Rs("lastname"), "'", "")
 Session("EmailId")   = Trim(Rs("email"))
 Session("NameOfEmployer")   = Rs("nameofemployeer")
 Session("PhoneNo")   = Rs("phoneno")
 Session("Coursedetails")   = Rs("coursedetails")
 Session("EmailId")   = Rs("email")
 Session("CourseDate") = Rs("coursedate")
 Session("PMBOK") = Rs("PRINCE2Manual")
 Session("courseid") = Rs("courseid")
 Session("Total") = Rs("amount")
 Session("VAT") = Rs("VAT")
 Session("VATInvoice") = Rs("VAT_Invoice")
 Session("PRINCE2price") = Rs("PRINCE2price")
 Session("typeOfCourse") = Rs("typeOfCourse")
 Session("checkrecmailsent") = Rs("checkrecmailsent")
 Session("FBdiscount") = Rs("FBdiscount")
  
  If (Session("country") = "United Kingdom" OR Session("country") = "India" OR Session("country") = "Australia") Then
							
	If Not IsNull(Rs("VAT")) Then
	
	VAT = Rs("VAT")
	
	Else
	
	VAT = 0
	
	End If
	
			If Session("FBdiscount") <> "" Then
			
			
				If Session("PRINCE2price")  <> "" Then
			
				Session("TotalPrice") = ((Int(Rs("Amount")) + Int(Rs("PRINCE2price"))) - Session("FBdiscount"))+Int(VAT)
				
				Else
				Session("TotalPrice") = (Int(Rs("Amount"))- int(Session("FBdiscount"))) + Int(VAT) 
				End If
				
		  Else
			
			   If Session("PRINCE2price")  <> "" Then
			
			      Session("TotalPrice") = Int(Rs("Amount")) + Int(Rs("PRINCE2price")) + Int(VAT) 
				
			  Else
				
			     Session("TotalPrice") = Int(Rs("Amount")) + Int(VAT) 
				 
			  End If
			
			
		End If
	
	Session("DisAmount") = Rs("Amount")
	Session("VAT") = VAT
	
 Else 

	Session("Total") = Rs("Amount")
	
 End If
  
Rs.Movenext
Loop

Rs.Close

  
  'Sql Query For Retive the Firstname, Lastname and Emailid'

strQuery = "SELECT payer_email,date_entered,date_valid,ITIL_code from ITIL_blended WHERE payer_email = '" & Session("EmailId") & "'"
Rs4.Open strQuery,ConnObj

Do Until Rs4.EOF

 Session("payer_email") = Rs4("payer_email")
 Session("date_entered")  = Rs4("date_entered")
 Session("date_valid")   = Rs4("date_valid")
 Session("ITIL_code")   = Rs4("ITIL_code")
 
Rs4.Movenext
Loop
Rs4.Close
  

'SQL Query For Retrieve The Prices and Put Into Email'

 strQuery1 = "SELECT * FROM course Where courseid = '" & Session("courseid") & "'"
 Rs1.Open strQuery1,ConnObj

 Do until Rs1.EOF
	
	StartDate = Rs1("startdate")
	City      = Rs1("city")
	Tax = Rs1("tax")

 Rs1.movenext
 Loop
 
 Rs1.Close

rqType = Request.QueryString("type")

      If Session("country") <> "United Kingdom" Then 
 subject="Payment Received"
      ElseIf Session("country") = "United Kingdom" Then 
	  if rqcoursetype = "Live" Then
  subject=" Payment Receipt: Live class program" 
      else
	   subject=" VAT INVOICE"
	   End If
      End If 

 body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF"">" 
						IF Session("country") = "India" Then
						body= body & "<span><img src=""http://www.PROJstudy.com/images/banners/email_headerIN.jpg"" alt=""PROJstudy"" /></span>" 
						ElseIf Session("country")="United Kingdom" Then 
						body= body &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerUK.jpg"" alt=""PROJstudy"" /></span>"
						ElseIf Session("country")="Australia" Then
						body= body &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerAUS.jpg"" alt=""PROJstudy"" /></span>"
						Else
						body= body &"<span><img src=""http://www.PROJstudy.com/images/banners/email_header.jpg"" alt=""PROJstudy"" /></span>"
						End if
						body= body &"</td></tr>"
						
				If Session("country")<> "United Kingdom" And Session("country")<> "Australia" Then 
				
					  body = body & "<tr><td><table align=""center"" border=""0"" width=""580px""><tr><td align=""center""><font face=""Arial"" size=""3"" color=""#0359b4""><b>Payment Receipt</b></font></td></tr>"
					  
			   ElseIf Session("country") = "United Kingdom" Then 
			   
			    if rqcoursetype = "Live" Then
  body = body & "<tr><td><table align=""center"" border=""0"" width=""580px""><tr><td align=""center""><font face=""Arial"" size=""3"" color=""#0359b4""><b>VAT INVOICE (Payment Receipt)</b></font></td></tr>"
      else
	body = body & "<tr><td><table align=""center"" border=""0"" width=""580px""><tr><td align=""center""><font face=""Arial"" size=""3"" color=""#0359b4""><b>VAT INVOICE</b></font></td></tr>"
	   End If
			   
					
					
			   ElseIf Session("country") = "Australia" Then 
			   
					body = body & "<tr><td><table align=""center"" border=""0"" width=""580px""><tr><td align=""center""><font face=""Arial"" size=""3"" color=""#0359b4""><b>GST INVOICE</b></font></td></tr>"
					
			   End If
			   
  body = body & "<tr><td align=""right"" colspan=""2""><font face=""Arial"" size=""2""><b>" & FormatDateTime(Now(),1) & "</b></font>"
  
  If Session("country") = "United Kingdom" Then
  
  body = body & "<br><font face=""Arial"" size=""2""><b>Invoice #: PROJ" & Session("VATInvoice") &"</b></font>"
  
  End If
  
  body = body & "</td></tr>"
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Enroll ID : " & Session("ID") & "</font></td></tr>"
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name : " & Session("FirstName") & "&nbsp; " & Session("Lastname") & "</font></td></tr>"
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Email : " & Session("EmailId") & " </font></td></tr>"
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Phone Number : " & Session("PhoneNo") & "</font></td></tr>"
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name of Employer/Business : " & Session("NameOfEmployer") & "</font></td></tr>"
     if rqcoursetype = "Live" Then
  body = body & "<tr><td align=""left""><br><font face=""Arial"" size=""2"">Thank you for enrolling in PROJstudy Live class Training Program.</font></td></tr>"
  Else
   body = body & "<tr><td align=""left""><br><font face=""Arial"" size=""2"">Thank you for enrolling in PROJstudy.com classroom training.</font></td></tr>"
   End If
  body = body & "<tr><td align=""left"" colspan=""2""><br><font face=""Arial"" size=""2"">Details of your course and Payment:</font><br><table border=""1"" cellspacing=""0"" align=""center"" width=""570px"">"
  
  body = body & "<tr><td width=""60%""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Details</font></b></td><td width=""15%"" align=""center""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Payment</font></b></td></tr>"
   if rqcoursetype = "Live" Then
  body = body & "<tr><td><font face=""Arial"" size=""2""><b>PROJstudy Live ClassTraining Program<br>" & Session("Coursedetails") & "</b>"
   Else   
  body = body & "<tr><td><font face=""Arial"" size=""2""><b>PROJstudy Classroom Training<br>" & Session("Coursedetails") & "</b>"
  End If
  
'Without VAT'  
If Session("VAT") <> "" AND Session("VAT") <> 0  Then 

	If Session("country") = "United Kingdom"  Then 
	
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("Total") ) & " " & Currency_Format_Back
		body = body &"</b></td></tr>"
		
		'PRINCE2 manual price display'
		If Session("PMBOK") = "Yes" Then
		body = body &"<tr><td><font face=""Arial"" size=""2""><b>PRINCE2 Manual Price <font color=""red"">*</font> </b>"
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		 body = body & Currency_Format_Front & " " & FormatNumber(Session("PRINCE2price")) & "" & Currency_Format_Back
		body = body &"</b></td></tr>"
		End If
		
		'Fb discount'
		If Session("FBdiscount") <> "" Then
		body = body &"<tr><td><font face=""Arial"" size=""2""><b>Discount<font color=""red"">*</font> </b>"
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		 body = body & Currency_Format_Front & " " & FormatNumber(Session("FBdiscount")) & "" & Currency_Format_Back
		body = body &"</b></td></tr>"
		End If
		
		'VAT'
		body = body &"<tr><td><font face=""Arial"" size=""2""><b> VAT: @ 20% <font color=""red"">*</font> </b>"
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("VAT")) & "" & Currency_Format_Back
		body = body &"</b></td></tr>"
		
		'Total price'
		body = body & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("TotalPrice")) & " " & Currency_Format_Back
		body = body & "</b></font></td></tr></table><br></td></tr>"	
	
	'Bharath Code'
	
	ElseIf  Session("country") = "Australia"  Then 
	
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("Total") ) & " " & Currency_Format_Back
		body = body &"</b></td></tr>"
		
		'Fb discount'
		If Session("FBdiscount") = "25" Then
		body = body &"<tr><td><font face=""Arial"" size=""2""><b>Facebook Discount<font color=""red"">*</font> </b>"
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		 body = body & Currency_Format_Front & " " & FormatNumber(25) & "" & Currency_Format_Back
		body = body &"</b></td></tr>"
		End If
		
		'GST'
		body = body &"<tr><td><font face=""Arial"" size=""2""><b> GST: @ 10% <font color=""red"">*</font> </b>"
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("VAT")) & "" & Currency_Format_Back
		body = body &"</b></td></tr>"
		
		'Total price'
		body = body & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("TotalPrice")) & " " & Currency_Format_Back
		body = body & "</b></font></td></tr></table><br></td></tr>"	
		
	ElseIf  Session("country") = "India"  Then 
	
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("Total") ) & " " & Currency_Format_Back
		body = body &"</b></td></tr>"
		
		'PRINCE2 manual price display'
		If Session("PMBOK") = "Yes" Then
		body = body &"<tr><td><font face=""Arial"" size=""2""><b>PRINCE2 Manual Price <font color=""red"">*</font> </b>"
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		 body = body & Currency_Format_Front & " " & FormatNumber(Session("PRINCE2price")) & "" & Currency_Format_Back
		body = body &"</b></td></tr>"
		End If
	
		'Tax'
		body = body &"<tr><td><font face=""Arial"" size=""2""><b>Tax: @ 12.36%<font color=""red"">*</font> </b>"
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		 body = body & Currency_Format_Front & " " & FormatNumber(Session("VAT")) & "" & Currency_Format_Back
		body = body &"</b></td></tr>"
		
		'Total price'
		body = body & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("TotalPrice")) & " " & Currency_Format_Back
		body = body & "</b></font></td></tr></table><br></td></tr>"	
		
	End If

'Without VAT'
ElseIf Session("VAT") = 0  Or ISNull(Session("VAT")) Or Session("VAT") = "" Then 


	  If Session("country") = "Australia"  Then 
	
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("Total") ) & " " & Currency_Format_Back
		body = body &"</b></td></tr>"
		
		'Total price'
		body = body & "<tr><td><font face=""Arial"" size=""2""><b>Total (GST: @ 10%)</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("Total")) & " " & Currency_Format_Back
		body = body & "</b></font></td></tr></table><br></td></tr>"	
	
	
	
	  ElseIf Session("country") = "United Kingdom" Then
	
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("Total")) & " " & Currency_Format_Back
		body = body &"</b></td></tr>"
		
		'PRINCE2 manual price display'
		If Session("PMBOK") = "Yes" Then
		body = body &"<tr><td><font face=""Arial"" size=""2""><b>PRINCE2 Manual Price <font color=""red"">*</font> </b>"
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		 body = body & Currency_Format_Front & " " & FormatNumber(Session("PRINCE2price")) & "" & Currency_Format_Back
		body = body &"</b></td></tr>"
		End If
		
		'Total price'
		body = body & "<tr><td colspan=""2"">&nbsp;</td></tr>"
		body = body & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("TotalPrice")) & " " & Currency_Format_Back
		body = body & "</b></font></td></tr></table><br></td></tr>"				   				   
	
	ElseIf Session("country") = "India"  Then 
	
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("Total")) & " " & Currency_Format_Back
		body = body &"</b></td></tr>"
		
		'PRINCE2 manual price display'
		If Session("PMBOK") = "Yes" Then
		body = body &"<tr><td><font face=""Arial"" size=""2""><b>PRINCE2 Manual Price <font color=""red"">*</font> </b>"
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		 body = body & Currency_Format_Front & " " & FormatNumber(Session("PRINCE2price")) & "" & Currency_Format_Back
		body = body &"</b></td></tr>"
		End If
		
		'Total price'
		body = body & "<tr><td colspan=""2"">&nbsp;</td></tr>"
		body = body & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & Currency_Format_Front & " " & FormatNumber(Session("TotalPrice")) & " " & Currency_Format_Back
		body = body & "</b></font></td></tr></table><br></td></tr>"
				
							'Bharath Commented code'	   
	'ElseIf Session("country") = "Australia" Then 
	'body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
	'body = body & Currency_Format_Front & " " & FormatNumber(Session("Total")) & " " & Currency_Format_Back
	'body = body &"</b></td></tr>"
	'If Session("PMBOK") = "Yes" Then
	'body = body &"<tr><td><font face=""Arial"" size=""2""><b>PRINCE2 Manual Price <font color=""red"">*</font> </b>"
	'body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
	' body = body & Currency_Format_Front & " " & FormatNumber(Session("PRINCE2price")) & "" & Currency_Format_Back
	'body = body &"</b></td></tr>"
	'End If
	'body = body & "<tr><td colspan=""2"">&nbsp;</td></tr>"
	'body = body & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
	'body = body & Currency_Format_Front & " " & FormatNumber(Session("Total")) & " " & Currency_Format_Back
	'body = body & "</b></font></td></tr></table><br></td></tr>"	
	
	ElseIf Session("country") = "Hong Kong" OR  Session("country") = "Singapore" OR  Session("country") = "UAE" Then 
		
		body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
		body = body & "&nbsp;&nbsp;"&Currency_Format_Front & " " & FormatNumber(Session("Total")) & " " & Currency_Format_Back
		body = body &"</b></td></tr>"
	    body = body & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>&nbsp;&nbsp;"&Currency_Format_Front & " " & FormatNumber(Session("Total")) & " " & Currency_Format_Back& "</b></td></tr>" 
	    body = body & "</b></font></td></tr></table><br></td></tr>"
					    

					   
	End If
	
	

End If 

If Session("country") = "United Kingdom" Then
  body = body &"<tr><td><font color=""red"">*</font> VAT Registration Number: GB 117 6616 13<br></td></tr>"
ElseIf Session("country") = "Australia" Then
  body = body &"<tr><td><font color=""red"">*</font> GST Registration Number: ABN 55 152 303 038<br></td></tr>" 
End If

if rqcoursetype = "Live" Then

body = body & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""3""><b><font color=""#008000""><br><br>We look forward to having you as a delegate with <a href=""www.projstudy.com"" target=""_blank"">PROJstudy</a>!!!</font><br><br></td></tr>"

End IF

  body = body & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><br>We acknowledge with thanks receipt of your cheque number -------------- dated ----------- towards the course fee for "
  if rqcoursetype = "Live" Then
   body = body & " PROJstudy Live Class Training Program "
   
   Else
   body = body & " the PROJstudy classroom training program "
  End If
    body = body & " starting from <b>"& FormatDateTime(StartDate,1) &"</b></font><br><br></td></tr>"
  
  
  if rqcoursetype = "Live" Then

body = body & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><br>For PROJstudy Live class Training Program terms and conditions,  <a href=""http://www.projstudy.com/PRINCE2/Live-termsAndConditions.asp"" target=""_blank"">click here</a>.</font></td></tr>"


  
'If Session("country") = "United Kingdom" OR Session("country") = "Australia" Then
' body = body &"<tr><td>You are also entitled to a 30% discount on our ITIL blended course and your discount code is " &  Session("ITIL_code") & ", which can be accessed till " &  Session("date_valid") & " through <a href=""http://www.itilstudy.com/enroll.asp"" target="""">http://www.itilstudy.com/enroll.asp</a><br></td></tr>"
'End If
Else

  body = body & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><br>For PROJstudy classroom training program’s terms and conditions, please visit the link - <a href=""http://www.projstudy.com/termsAndConditions.asp"" target=""_blank"">http://www.PROJstudy.com/termsAndConditions.asp</a>.</font></td></tr>"
  
  
  End IF
  body = body & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><br>We look forward to your participation in our"
  
  if rqcoursetype = "Live" Then
   body = body & " PROJstudy Live Class Training Program. </font></td></tr>"
   
   Else
   body = body & " PROJstudy classroom program.</font></td></tr>"
  End If
 
  body = body & "<tr><td colspan=""3""><br><font face=""Arial"" size=2><b>Best Regards,</b></td></tr>"
  
  body = body & "<tr><td colspan=""3""><br><font face=""Arial"" size=2>Customer Support</td></tr>"
  
  body = body & "<tr><td colspan=""3""><font face=""Arial"" size=2>PROJstudy.com"
  
 If Session("country") = "United Kingdom" Then
 
 body = body & " <tr><td colspan=""3""><hr></hr></td></tr><tr><td align=""center""><font size=""1px"">Edusys Services Private Limited<br>29th Floor | One Canada Square | Canary Wharf | London - E14 5DY | United Kingdom<br>Phone: 0800 0337 947<br>Email: marketing@projstudy.com, Website: www.projstudy.com<br>PRINCE2<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.<br>The Swirl logo™ is a trade mark of the Cabinet Office.</font></td></tr>"
 
 ElseIf Session("country") = "India" Then
 
	body = body & "<tr><td colspan=""3""><hr></hr></td></tr><tr><td align=""center""><font size=""1px"">EDUsys Services Private Limited,<br>Santosh Towers,4th Main,100 Ft. Ring Road, J.P. Nagar 4th Phase,Bangalore - 560078, India<br>PRINCE2<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.<br>The Swirl logo™ is a trade mark of the Cabinet Office.</font></td></tr>"
 
  ElseIf Session("country") = "Australia" Then
 body = body & "<br /><br/><hr><div align=""center""><font size=""1px"">PRINCE2<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.<br>The Swirl logo™ is a trade mark of the Cabinet Office.</font></div><br /></td></tr>"
 End If
  body = body & "</table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr>"
  
  
  	   
If rqType = "preview" then
	
'Retrive The EnrollUserId,subject and body from this Page'

   rqEnrollUserId = Request.Form("enrollUserId")
   rqCity = Request.Form("city")
   subject = Request.form("subject")
   body    = Request.form("QueryReply")
   rqCheckrecmailsent = Request.form("checkrecmailsent")

End If

'Send Email'

if rqType = "sendmail" Then

   Dim objCDOMail
   Dim rqBody
   Dim rqSubject

'Retrive The enrolluserid from this page'  
 
   rqEnrollUserId = Request.Form("enrolluserid")
   rqCity = Request.Form("city")
   rqBody    =  Request.Form("body")
   rqSubject =  "Payment Received"
   rqSendEmail = Request.Form("emailid")
   rqCheckrecmailsent = Request.form("checkrecmailsent")
   
  ' If Isnull(rqCheckrecmailsent) or rqCheckrecmailsent = "" or rqCheckrecmailsent <> "1"  Then

	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")

	objCDOMail.From = "marketing@projstudy.com"

	objCDOMail.To =  rqSendEmail
	
	'If Session("country") is India then cc send to salesindia@pmstudy.com otherwise send to marketing@pmstudy.com'
	
	'objCDOMail.Cc = "marketing@projstudy.com"

	IF Session("typeOfCourse") = "Suite" Then
	
	objCDOMail.Bcc = "itilinfo@projstudy.com, projstudy-leadership@googlegroups.com,marketing@projstudy.com" 
	
	Else
	
	objCDOMail.Bcc = "marketing@projstudy.com,t_satpathy@yahoo.com, edusysgaurav@gmail.com, edusysayan@gmail.com, projstudy-leadership@googlegroups.com" 
	
	End If
	
	'Importance of the e-mail (0=Low, 1=Normal, 2=High)
	
	objCDOMail.Importance = 2
	
	objCDOMail.Subject = rqSubject

	objCDOMail.BodyFormat = 0

	objCDOMail.MailFormat = 0

	objCDOMail.Body = rqBody

	objCDOMail.Send

	Set objCDOMail = Nothing

'response.Write(rqBody)
	
'Sql Query For If You Send Email I am entering into database 1 for in courses.asp Page we want display a message "Check received email sent"'

    strQuery2 = "Update enrolledusers Set checkrecmailsent = '1' where  id = '" & rqEnrollUserId & "'"
	'response.Write(strQuery2)
    Rs2.Open strQuery2,ConnObj
	
    
'End If

If Session("country")="United Kingdom" Then  
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
						
					  strBody = strBody & "<tr><td><table width=""600px"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12""><tr><td><font face=""Arial"" size=""2"">Dear " & Session("FirstName") & " " & Session("Lastname") & ",<br><br>Thank you for choosing PROJstudy – the best choice for PRINCE2 training. <br /><br />While you embark on your journey, we invite you to our new industry leading referral program. You can now help your friends to get the best of training for the prestigious PRINCE2 training while both you and your friends earn <b>attractive rewards</b> along the way. And the benefits are unlimited – you can refer as many friends/colleagues as you want!<br><br><b>Here is how the referral program works:</b><br><br>Each friend you refer to PROJstudy, who completes a PRINCE2 Foundation+Practitioner classroom course with us, will earn you a <b>&pound; 20 gift voucher</b> from <a href=""http://www.amazon.co.uk"" target=""_blank"">www.amazon.co.uk</a> and your friend will get a <b>discount of &pound; 20</b> on the course price. The benefits for all courses are shown below:<br><br><table border=""1"" cellspacing=""0"" cellpadding=""0"" width=""100%"" align=""center""><tr><td width=""40"" valign=""bottom""><p align=""center""><b>PRINCE2 Course </b></p></td><td width=""50""  valign=""bottom""><p align=""center""><b>Gift Voucher Benefits <br />(For You)</b></p></td><td width=""50"" valign=""top""><p align=""center""><b>Course Discount<br />(For Your Friend)</b></p></td></tr><tr><td><p align=""center"">Foundation + Practitioner</p></td><td ><p align=""center"">&pound; 20</p></td><td><p align=""center"">&pound; 20</p></td></tr><tr><td ><p align=""center"">Practitioner</p></td><td><p align=""center"">&pound; 10</p></td><td ><p align=""center"">&pound; 10</p></td></tr><tr><td><p align=""center"">Foundation</p></td><td ><p align=""center"">&pound; 8</p></td><td><p align=""center"">&pound; 8</p></td></tr></table><br><br>The moment your first friend completes the classroom course, you will receive the gift vouchers which you can redeem for anything you like on <a href=""http://www.amazon.co.uk"" target=""_blank"">www.amazon.co.uk.</a><br><br>Your friend needs to complete the course within 6 months from the time of receiving the invitation for the referral program. So Hurry up! <br><br>To refer your friends, <a href=""http://www.PROJstudy.com/refer-Friends.asp?refEmail="&rqSendEmail&""" target=""_blank"">click here</a><br><br> OR<br><br>Share this link with them through email, Twitter or Facebook: <b>http://www.PROJstudy.com/referral.asp?tag="&GenTag&"</b><br><br>If you have any questions, feel free to call us at 0800 0337 947 or email us at <a href=""mailto:marketing@projstudy.com."">marketing@projstudy.com</a><br><br>Best Regards,<br><br>Marketing Team<br><a href=""http://www.PROJstudy.com"" target=""_blank"">www.PROJstudy.com</a></font></td></tr></table></td></tr></table></td></tr><tr><td height=""45%"">&nbsp;</td></tr></table>"

'     response.Write(strBody)
	
	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
	objCDOMail.From = """PROJstudy PRINCE2"" <marketing@projstudy.com>"
	objCDOMail.To =  rqSendEmail
	objCDOMail.Cc = "marketing@projstudy.com"
	'Importance of the e-mail (0=Low, 1=Normal, 2=High)
	objCDOMail.Importance = 2
	objCDOMail.Subject = "Welcome to our new Industry leading Referral Program. Earn Unlimited Benefits! "
	objCDOMail.BodyFormat = 0
	objCDOMail.MailFormat = 0
	objCDOMail.Body = strBody
	objCDOMail.Send
	Set objCDOMail = Nothing
	
 End If 

Else


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Payment Received Mail</title>
<link href="./css/pagestyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="htMap">
  <table width="700" height="580" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#00B0EC" class="dbborder" >
    <tr>
      <td width="547" valign="top"><table width="100%" cellspacing="0" cellpadding="2">
          <form id="form1" name="form1" method="post" action="paymentreceivedemail.asp?type=preview">
            <input type="hidden" name="enrollUserId" value="<%= rqEnrollUserId %>" />
            <input type="hidden" name="city" value="<%= City %>" />
            <input type="hidden" name="checkrecmailsent" value="<% = Session("checkrecmailsent") %>" />
            
            
            <tr>
              <td colspan="2" bgcolor="#00B0EC">Send Payment Received Mail </td>
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
              <% If Session("country") <> "United Kingdom" Then %>
               <td> Payment Received </td> 
                <% ElseIf Session("country") = "United Kingdom" Then %>
              <td> VAT INVOICE </td>
              <% End If %>
            </tr>
            <tr class="rowEven">
              <td colspan="2"><textarea name="QueryReply" cols="90" rows="25"><%= body %></textarea>
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
          <form  method="post" action="paymentreceivedemail.asp?type=sendmail">
            <input type="hidden" name="body" value='<%= body %>' />
            <input type="hidden" name="enrolluserid" value="<%= rqEnrollUserId %>" />
            <input type="hidden" name="emailid" value="<%= Session("EmailId") %>" />
            <input type="hidden" name="city" value="<%= rqCity %>" />
            <input type="hidden" name="checkrecmailsent" value="<%= Session("checkrecmailsent") %>" />

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
				Response.write(body)%></td>
    </tr>
    <% End If %>
  </table>
</div>
</body>
</html>
<%	End If
End If
%>
