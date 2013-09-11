<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<%'***** include  validation file **************' %>

<!-- #include virtual = "/includes/formvalidation.asp"-->
<%
'If course id is nothing then redirect to enrollClass.asp page'
rqCourseId =  Request.Form("courseid")
rqPRINCE2CourseId = Request.Form("PRINCE2courseId")

'Session("CountryOrigin") = "United Kingdom"

%>
<!-- Body Starts -->
<%
'Declare Local Variables'
Dim rqCourseId, rqFirstName, rqLastName, rqEmail, rqNameOfEmployeer,rqTax
Dim rqPhoneNumber, rqCourseDetails, rqPriceWithTax, rqPriceWithOutTax,Rs1
Dim objRs, todaysDate, PayBefore, Currency_Format_Front, Currency_Format_Back
Dim strCourseDet, City, StartDate, EndDate, ApplicableDays, Country,rqSuiteCourseName
Dim HotelName, HotelPhNo, HotelURL, HotelAddress, TotalWithoutTax, Total, Tax
Dim VAT_Cal1, VAT_Cal2, VAT, strBody,rqStreet,rqCity,rqState,rqPostalCode,Rs4
Dim strCity, stateCode, CourseDetails, CourseDate, EnrolledCourse, strInsertEnrollDet

'Replace method
Function StrQuoteReplace(strValue)
StrQuoteReplace = Replace(strValue, "'", "''")
End Function

Session("CountryOrigin") = "United Kingdom"

                     Set Rs  = Server.CreateObject("ADODB.Recordset")
					 Set Rs1 = Server.CreateObject("ADODB.Recordset")
					 Set Rs2 = Server.CreateObject("ADODB.Recordset")
					 Set Rs3 = Server.CreateObject("ADODB.Recordset")
					 Set Rs4 = Server.CreateObject("ADODB.Recordset")
					 Set objRs = Server.CreateObject("ADODB.Recordset")
					 
					 'Retrive The Enrolluser Details Through Form'
					 rqVender = Request.Form("Vendar")
					 rqcourse_Type    =  Request.Form("course_Type")
					 rqCourse         =   Request.Form("course")
					 rqFirstName 		= 	Request.Form("firstname")
					 rqLastName 		= 	Request.Form("lastname")
					 rqEmail 			= 	Request.Form("email")
					 rqNameOfEmployeer  =   Replace(Request.Form("employer"),"'","''")
					 rqPhoneNumber 		=   Request.Form("phoneno")
					 rqJobTitle 		=   Request.Form("jobTitle")
					 rqStreet           =   Replace(Request.Form("street"),"'","''")
					 rqCity             =   Replace(Request.Form("city"),"'","''")
					 rqState 		    =   Replace(Request.Form("state1"),"'","''")
					 rqPostalCode 		=   Request.Form("postalCode")
					 rqSpeReq           =   Replace(Request.Form("speReq"),"'","''")
					 rqPRINCE2CourseDetails 	=   Request.Form("PRINCE2Course")
					 rqITILCourseDetails 	    =   Request.Form("ITILCourse")
					 rqPriceWithTax 	=   Request.Form("pricewithtax")
					 rqPriceWithOutTax  =   Request.Form("pricewithouttax")
					 rqCertificate      =   Replace(Request.Form("certificate"),"'","''")
					 rqExamDate         =   Request.Form("examDate")
					 rqExamRollDate     =   Request.Form("rollNo")
                     rqVAT              =   Request.Form("VAT")
					 rqManual           =   Request.Form("manual")
					 rqCourseName        =   Request.Form("courseName")
					  rqSuiteCoursePrice = Request.Form("SuiteCoursePrice")
					  rqSuiteCourseName = Request.Form("SuiteCourseName")
					 

					 'Dispaly The Today Date'
					  todaysDate = now()

					'Increment 5 Days and Display That'
					  PayBefore = DateAdd("d", +4,CDate(todaysDate))

					  


					'Put Into Session Displaying Purpose'
					 
					 Session("Suite_FirstName")        =  rqFirstName
					 Session("LastName")         =  rqLastName
					 Session("Email")            =  rqEmail
					 Session("NameOfEmployeer")  =  rqNameOfEmployeer
					 Session("PhoneNumber")      =  rqPhoneNumber
					 Session("Course")           =  rqCourseDetails
					 Session("Certificate")      =  rqCertificate
					 Session("ExamDate")         =  rqExamDate
					 Session("ExamRollDate")     =  rqExamRollDate
					 
					  'Currency Format Display Functions'

					 Currency_Format_Front = CurrencyFormat_Front("United Kingdom")

					 Currency_Format_Back = CurrencyFormat_Back("United Kingdom")
					 
					 
 If rqCourse = "ITIL" Then 

					 'SQL Query For Retrieve The Prices Displaying in The enrolClass'
					 strQuery3 = "SELECT * FROM PROJITIL_course Where courseid = '" & rqCourseId & "'"

					 Rs4.Open strQuery3,ConnObj
					
					
					 Do until Rs4.EOF
						
						ITILCity      = Rs4("city")
						ITILStartDate = Rs4("startdate")
						ITILEndDate   = Rs4("enddate")
						ITILApplicableDays = Rs4("applicabledays")
						ITILCountry = Rs4("country")
						ITILHotelName = Rs4("hotelname")
						ITILHotelPhNo = Rs4("hotelphonenumber")
						ITILHotelURL = Rs4("hotelurl")
						ITILHotelAddress = Trim(Rs4("hoteladdress"))
			     
							 

				
								ITILTotal =  Session("rqSuiteCoursePrice")
							
							
							ITILTax = Rs4("tax")
							
							
							
					   'for displaying the prices in UK'
                       'Actual amount and VAT'
                             
                               SuiteVAT1 = Round(((CInt(ITILTotal) * Cdbl(Tax)) / 100))
                               Total = Int(ITILTotal) + Cdbl(SuiteVAT1)

								
						
					
				
					 	Rs4.movenext
						Loop
						Rs4.Close
						
						
						
							CourseDetailsITIL = ITILCity & " : " & FormatDateTime(ITILStartDate,1) & " to " & FormatDateTime(ITILEndDate,1) 
							
					
						
						CourseDate = ITILStartDate & " to " & ITILEndDate
						
						EnrolledCourse = ITILCity & " : " & FormatDateTime(ITILStartDate,1) & " to " & FormatDateTime(ITILEndDate,1)
						
				
						
ElseIf rqCourse = "PRINCE2" Then 	


TotalUK = 0

WithTaxTotal = 0


	'SQL Query For Retrieve The Prices Displaying in The enrolClass'
					 strQuery2 = "SELECT * FROM course Where courseid = '" & rqCourseId & "'"
					 'response.Write(strQuery2)
					 Rs2.Open strQuery2,ConnObj
					
					 Do until Rs2.EOF
						
						City      = Rs2("city")
						CourseName = Rs2("courseName")
						StartDate = Rs2("startdate")
						EndDate   = Rs2("enddate")
						ApplicableDays = Rs2("applicabledays")
						Country = Rs2("country")
						HotelName = Rs2("hotelname")
						HotelPhNo = Rs2("hotelphonenumber")
						HotelURL = Rs2("hotelurl")
						HotelAddress = Trim(Rs2("hoteladdress"))
						Tax = Rs2("tax")
						TotalUK = Rs2("pricewithouttax") 
						WithTaxTotal = Rs2("pricewithtax") 
						Rs2.movenext
						Loop
				
						
											
						TotalTax = (WithTaxTotal - TotalUK)
									
							'Response.Write(TotalUK)	
								
					 'For display the course details formatting the course like Raleigh : Saturday, April 17, 2010 to Tuesday, April 20, 2010 for $ 1,800.00'
					 CourseDetailsPRINCE2 = CourseName & " - " & City & " : " & FormatDateTime(StartDate,1) & " to " & FormatDateTime(EndDate,1) 
					 
					 'CourseDetailsPRINCE2 = CourseDetailsPRINCE2 & FormatNumber(TotalUK) & " " & Currency_Format_Back
					 
					 CourseDate    = StartDate & " to " & EndDate
					  
					 EnrolledCourse = City & " : " & FormatDateTime(StartDate,1) & " to " & FormatDateTime(EndDate,1)

				 					
					'If You Fill The Registration Form In Step2 That User Details Insert Here'
					todayDate = (YEAR(Now()) & "-" & (Month(Now())) & "-" & (DAY(Now())))
	
					
					'SQL Query For Inserting The Values Into DataBase'

End IF

					 strQuery1 = "INSERT INTO enrolledusers (firstname,lastname,email,nameofemployeer,phoneno,coursedetails,coursedate,amount,dateofenrollment, paybefore,    status,PRINCE2Manual,courseid,statusnumber,PRINCE2price,discountpercentage,country,jobtitle,street,city,state1,postalCode,"
					 If rqCourse = "PRINCE2" Then 
					 strQuery1 = strQuery1 & "nameoncertificate,examdate,examrollno,"
					 End If
					 
					 strQuery1 = strQuery1 & "VAT,typeOfCourse,speReq,certificateId,vendorId,Vender)"
					 strQuery1 = strQuery1 & " Values "
					 strQuery1 = strQuery1 & "('" & StrQuoteReplace(rqFirstName) & "',"
					 strQuery1 = strQuery1 & "'" & StrQuoteReplace(rqLastName) & "',"
					 strQuery1 = strQuery1 & "'" & StrQuoteReplace(rqEmail) & "',"
					 strQuery1 = strQuery1 & "'" & StrQuoteReplace(rqNameOfEmployeer) & "',"
					 strQuery1 = strQuery1 & "'" & rqPhoneNumber & "',"
					 If rqCourse = "ITIL" Then 
					 strQuery1 = strQuery1 & "'" & CourseDetailsITIL & "',"
					 ElseIf rqCourse = "PRINCE2" Then 	
					 strQuery1 = strQuery1 & "'" & CourseDetailsPRINCE2 & "',"
					 End If
					 strQuery1 = strQuery1 & "'" & CourseDate & "',"
					 If rqCourse = "ITIL" Then 
					 strQuery1 = strQuery1 & "'" & Total & "',"
					 ElseIf rqCourse = "PRINCE2" Then 
					 strQuery1 = strQuery1 & "'" & TotalUK & "',"
					 End If
					 strQuery1 = strQuery1 & "'" & todayDate & "',"
					 strQuery1 = strQuery1 & "'" & todayDate & "',"
					 strQuery1 = strQuery1 & "'Active',"
					 If rqCourse = "ITIL" Then
					 strQuery1 = strQuery1 & "'No',"
					 ElseIf rqCourse = "PRINCE2" Then 
					 If rqManual = "Yes" Then
					 strQuery1 = strQuery1 & "'Yes',"
					 Else
					 strQuery1 = strQuery1 & "'No',"
					 End If
					 End If
					 strQuery1 = strQuery1 & "'" & rqCourseId & "',"
					 strQuery1 = strQuery1 & "'1',"
					 If rqCourse = "ITIL" Then
					 strQuery1 = strQuery1 & "'0',"
					 ElseIf rqCourse = "PRINCE2" Then 
					 If rqManual = "Yes" Then
						 strQuery1 = strQuery1 & "'55',"
					 Else
					     strQuery1 = strQuery1 & "'0',"
					 End If 
					 End If
					 strQuery1 = strQuery1 & "'0',"
					 strQuery1 = strQuery1 & "'United Kingdom',"
					 strQuery1 = strQuery1 & "'" & rqJobTitle & "',"
					 strQuery1 = strQuery1 & "'" & rqStreet & "',"
					 strQuery1 = strQuery1 & "'" & rqCity & "',"
					 strQuery1 = strQuery1 & "'" & rqState & "',"
					 strQuery1 = strQuery1 & "'" & rqPostalCode & "',"
					 If rqCourse = "PRINCE2" Then 
					 strQuery1 = strQuery1 & "'" & rqCertificate & "'," 
					 strQuery1 = strQuery1 & "'" & rqExamDate  & "'," 
					 strQuery1 = strQuery1 & "'" & rqExamRollDate & "',"
					 End If 
					 If rqCourse = "ITIL" Then
					 strQuery1 = strQuery1 & "'" & SuiteVAT1 & "',"
					 ElseIf rqCourse = "PRINCE2" Then 
					 strQuery1 = strQuery1 & "'" & TotalTax & "',"
					 End If
					 strQuery1 = strQuery1 & "'"& rqcourse_Type &"',"
					 strQuery1 = strQuery1 & "'" & rqSpeReq & "',"
					 If rqCourse = "ITIL" Then
					 strQuery1 = strQuery1 & "'4',"
					 ElseIf rqCourse = "PRINCE2" Then 
					 strQuery1 = strQuery1 & "'2',"
					 End If
					 If rqCourse = "ITIL" Then
					 strQuery1 = strQuery1 & "'2',"
					 ElseIf rqCourse = "PRINCE2" Then 
					 strQuery1 = strQuery1 & "'2',"
					 End If
					 strQuery1 = strQuery1 & "'" & rqVender & "')"
					 
					Rs1.Open strQuery1,ConnObj
					
				
				 If rqCourse = "ITIL" Then
					strEnollID = "SELECT max(id) as EnrollId FROM enrolledusers where certificateId = '4' and vendorId = '2'"
				 ElseIf rqCourse = "PRINCE2" Then 
					 strEnollID = "SELECT max(id) as EnrollId FROM enrolledusers where certificateId = '2' and vendorId = '2'"
				End If	
						objRs.Open strEnollID,ConnObj
						
						do until objRs.Eof
						
							 Session("EnrollId") = objRs("EnrollId")
						
						objRs.Movenext
						Loop
						objRs.Close
						
				'For display the course details formatting the course like Raleigh : Saturday, April 17, 2010 to Tuesday, April 20, 2010 for $ 1,800.00'
				
				
					
					 'Send proforma invoice email'
				
				strBody = "<table width=""100%"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td>&nbsp;</td></tr><tr><td><table width=""600px"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""595px"" bgcolor=""#FFFFFF"">"
				
				        'Email Heading'
					    IF Session("CountryOrigin") = "India" Then
					       strBody = strBody & "<span><img src=""http://www.PROJstudy.com/images/banners/email_headerIN.jpg"" alt=""PROJstudy"" /></span>"
					    ElseIf Session("CountryOrigin")="United Kingdom" Then
						   strBody = strBody & "<span><img src=""http://www.PROJstudy.com/images/banners/email_headerUK.jpg"" alt=""PROJstudy"" /></span>"
					    ElseIf Session("CountryOrigin")="Australia" Then
						   strBody = strBody & "<span><img src=""http://www.PROJstudy.com/images/banners/email_headerAUS.jpg"" alt=""PROJstudy"" /></span>"
					    Else
						  strBody = strBody & "<span><img src=""http://www.PROJstudy.com/images/banners/email_header.jpg"" alt=""PROJstudy"" /></span>"
						End if
						  
					  strBody = strBody & "</td></tr>"
					  
					  'Email Heading'
					  If Session("CountryOrigin") <> "United Kingdom" Then 
					  strBody = strBody & "<tr><td align=""center"" colspan=""2"" width=""540px""><table border=""0"" align=""center"" width=""520px""><tr><td align=""center""><br><br><font face=""Arial"" size=""3"" color=""#0359b4""><b>COURSE ENROLMENT DETAILS (INVOICE)</b></font></td></tr>"
					   ElseIf Session("CountryOrigin") = "United Kingdom" Then 
					    strBody = strBody & "<tr><td align=""center"" colspan=""2"" width=""540px""><table border=""0"" align=""center"" width=""520px""><tr><td align=""center""><br><br><font face=""Arial"" size=""3"" color=""#0359b4""><b>PROFORMA INVOICE</b></font></td></tr>"
						End If
						
					  strBody = strBody & "<tr><td align=""right"" colspan=""2""><font face=""Arial"" size=""2""><b>" & FormatDateTime(todaysDate,1) & "</b></font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Enrol ID : " & Session("EnrollId") & "</font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name : " & rqFirstName & "&nbsp; " & rqLastName & "</font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Email : " & rqEmail & " </font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Phone Number : " & rqPhoneNumber & "</font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name of Employer/Business : " & rqNameOfEmployeer & "</font></td></tr>"
					  strBody = strBody & "<tr><td align=""left"" colspan=""2""><br><font face=""Arial"" size=""2"">Details of your course and Payment:</font><br><table border=""1"" cellspacing=""0"" align=""center"" width=""560px"">"
					  strBody = strBody & "<tr><td width=""60%""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Details</font></b></td><td width=""15%"" align=""center""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Payment</font></b></td></tr>"
					  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>PROJstudy PRINCE2<sup>&reg;</sup> Classroom Training<br> " & CourseDetails & "  </b>"
					
					'Price without tax for only 3 countries'
			
			
					  strBody = strBody &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
					  strBody = strBody & "&nbsp;&nbsp;"&Currency_Format_Front & " " & FormatNumber(TotalUK) & " " & Currency_Format_Back
					  strBody = strBody &"</b></td></tr>"
					  
					  'Manual Price for India and UK'
					  
					 
					 
					
					 
					
					 
					 'Displaying tax for India, Aus and UK'
					  If Session("CountryOrigin") = "United Kingdom" Then 
					  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>VAT @ 20% <font color=""red"">*</font> </b>"
					  ElseIf Session("CountryOrigin") = "India" Then 
					  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>Add: Tax @ 12.36% <font color=""red"">*</font> </b>"
					  ElseIf Session("CountryOrigin") = "Australia" Then 
					  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>Add: GST @ 10% <font color=""red"">*</font> </b>"
					  End If
					   strBody = strBody &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
					  strBody = strBody & "&nbsp;&nbsp;"&Currency_Format_Front & " " & TotalTax & ".00 " & Currency_Format_Back
					  
					  strBody = strBody &"</b></td></tr>"
					
					  strBody = strBody & "<tr><td colspan=""2"">&nbsp;</td></tr>"		  
					  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>Total Course fee</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>&nbsp;&nbsp;"
					 
					    strBody = strBody & "&nbsp;&nbsp;"&Currency_Format_Front & " " & FormatNumber(TotalManual) & " " & Currency_Format_Back
					  strBody = strBody & "</b></font></td></tr></table><br></td></tr>"
		
			
			         'showing in the mail hotel details '
					  If Not IsNull(HotelAddress) And HotelAddress <> "" Then
					  strBody = strBody & "<tr><td align=""left"" colspan=""2""><table border=""0"" width=""100%""><tr><td width=""170px"" valign=""top""><font face=""Arial"" size=""2""><b>Venue Details:</b></font></td><td width=""830px"">"& HotelName &"<br>" & HotelAddress &" "& City &"<br>"
					  If HotelPhNo <> "" Then
					  strBody = strBody & "Ph: "& HotelPhNo &"<br>"
					  End If
					  strBody = strBody & "<a href="& HotelURL &" target=""_blank"">"& HotelURL &"</a></td></tr></table></td></tr>"
					  End If
					 
					  strBody = strBody & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><b>Please Note:</b></font>"
					  If Session("CountryOrigin") = "United Kingdom" Then
					  strBody = strBody & " This is not a VAT Invoice<br>"
					  strBody = strBody & "<font color=""red"">*</font> VAT Registration Number: GB 117 6616 13<br><br>"
					  ElseIf Session("CountryOrigin") = "Australia" Then
					  strBody = strBody & " This is not a GST Invoice<br>"
					  strBody = strBody & "<font color=""red"">*</font> GST Registration Number: ABN 55 152 303 038<br><br>"
					  End If
					  
					  strBody = strBody & "<font face=""Arial"" size=""2""> Full payment of the enrolment fee <b>(" 
					  If Session("CountryOrigin") = "United Kingdom" OR Session("CountryOrigin") = "India" OR Session("CountryOrigin") = "Australia" Then 
					   strBody = strBody & Currency_Format_Front & " " & FormatNumber(TotalManual) & " " & Currency_Format_Back & "</b>)" 
					  
					  End IF
					  strBody = strBody & "should be done through </font></td></tr><tr><td align=""left"">"
					  strBody = strBody & "</td></tr>"
					  strBody = strBody & "<tr><td align=""left"" >"
					  
					  'UK payment gateways = google checkout'
					  If Session("CountryOrigin") = "United Kingdom"  Then
					  strBody = strBody & "<li><font face=""Arial"" size=""2""><b>Google Checkout </b></font>"
					  strBody = strBody & "&nbsp;&nbsp;<a href=""http://www.PROJstudy.com/PRINCE2/payment.asp?enrollUserID="& Session("EnrollId") &"&Country="& Session("CountryOrigin") &"""><font face=""Arial"" size=""3"" color=""#0359b4""><b>Buy Now</b></font></a></li>"
					  End If
					  
					  'payment gateways = Paypal'
					 
					  strBody = strBody & "<tr><td align=""center"" colspan=""3""><font face=""Arial"" color = ""green"" size=""3"">We look forward to having you as a delegate with PROJstudy.com Classroom Training!!!</font></td></tr>"
	 				  strBody = strBody & "<tr><td align=""left""><br><font face=""Arial"" size=2>Best Regards,</font></td></tr>"
	 				  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=2>Customer Support<br>"
	 				  strBody = strBody & "<a href=""http://www.PROJstudy.com"" target=""_blank"">www.PROJstudy.com</a><br>"
					 
					  strBody = strBody & "Email: marketing@projstudy.com</font><br><br><hr></hr><div align=""center""><font size=""1px"">"
					
					  strBody = strBody & "<br>PRINCE2<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.<br>The Swirl logo™ is a trade mark of the Cabinet Office.<br/></font></div></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr></table></td></tr><tr><td height=""45%"">&nbsp;</td></tr></table>"
					 
					 		'Response.Write(strBody)
 
  				   Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
			        objCDOMail.From = "marketing@projstudy.com"
					If Session("CountryOrigin") <> "United Kingdom" Then  
				    objCDOMail.To =  "<" & rqEmail & ">"
					 End IF
				    objCDOMail.cc = "marketing@projstudy.com, adminsupport@projstudy.com"
				    objCDOMail.Bcc = "t_satpathy@yahoo.com, edusysgaurav@gmail.com, edusysayan@gmail.com, projstudy-leadership@googlegroups.com"
   				    objCDOMail.Importance = 2
					objCDOMail.Subject = "Enrolment From Datrix for PROJstudy.com Classroom Coaching"
					objCDOMail.BodyFormat = 0
			        objCDOMail.MailFormat = 0
					objCDOMail.Body =  strBody
					objCDOMail.Send
					set objCDOMail = Nothing
			


						
				Session("message") = "Enrollment Done Successfully"
				
				Response.Redirect("/backoffice/Datrix-enrollment.asp")
				
					
					
%>


                         
                  