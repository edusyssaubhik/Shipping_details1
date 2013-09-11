<!--#include virtual="/metatags/enroll_metatag.html"-->

<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->

<%'***** include  validation file **************' %>

<%
'If course id is nothing then redirect to enrollClass.asp page'
rqQuoteID =  Request.Form("QuoteID")
rqPRINCE2CourseId = Request.Form("PRINCE2courseId")
rqCourseId =  Request.Form("courseid")
rqcertificationId = Request.form("certId")
    
'Session("CountryOrigin") = "United Kingdom"

%>
<!-- Body Starts -->
<%
'Declare Local Variables'
Dim rqCourseId, rqFirstName, rqLastName, rqEmail, rqNameOfEmployeer,rqTax
Dim rqPhoneNumber, rqCourseDetails, rqPriceWithTax, rqPriceWithOutTax
Dim objRs, todaysDate, PayBefore, Currency_Format_Front, Currency_Format_Back
Dim strCourseDet, City, StartDate, EndDate, ApplicableDays, Country,rqSuiteCourseName
Dim HotelName, HotelPhNo, HotelURL, HotelAddress, TotalWithoutTax, Total, Tax
Dim VAT_Cal1, VAT_Cal2, VAT, strBody,rqStreet,rqCity,rqState,rqPostalCode,Rs4
Dim strCity, stateCode, CourseDetails, CourseDate, EnrolledCourse, strInsertEnrollDet
dim rqcomment,rqcompany
 dim  rqmanual
dim rqmanualDate
rqcompany =  Request.Form("company")
     
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
    'added by Saubhik           
                     rqcomment=Request.form("comment")
                     rqmanual=Request.form("manual")
	                 rqmanualDate=Request.form("manualDate")			
                 	 rqCourse         =   Request.Form("course")
					 rqFirstName 		= 	Request.Form("firstname")
					 rqLastName 		= 	Request.Form("lastname")
					 rqEmail 			= 	Request.Form("email")
					 rqQuoteId          =   Request.Form("QuoteID")
					 rqNameOfEmployeer  =   Replace(Request.Form("company"),"'","''")
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
					 

				
					

TotalUK = 0

WithTaxTotal = 0


	'SQL Query For Retrieve The Prices Displaying in The enrolClass'
					 strQuery2 = "SELECT * FROM datrixclasses Where courseid = '" & rqCourseId & "'"
					' response.Write(strQuery2)
					 Rs2.Open strQuery2,ConnObj
'					response.Write(connobj)
					 Do until Rs2.EOF
						
						City      = Rs2("city")
						CourseName = Rs2("courseName")
' response.Write(courseName& City)
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
				response.Write(StartDate)
					 'For display the course details formatting the course like Raleigh : Saturday, April 17, 2010 to Tuesday, April 20, 2010 for $ 1,800.00'
					 CourseDetails = CourseName & " - " & City & " : " & FormatDateTime(StartDate,1) & " to " & FormatDateTime(EndDate,1) 
					 					response.Write(CourseDetails) 
					 CourseDate    = StartDate & " to " & EndDate
					  
					 EnrolledCourse = City & " : " & FormatDateTime(StartDate,1) & " to " & FormatDateTime(EndDate,1)

				 					
					'If You Fill The Registration Form In Step2 That User Details Insert Here'
					todayDate = (YEAR(Now()) & "-" & (Month(Now())) & "-" & (DAY(Now())))
	
					
					'SQL Query For Inserting The Values Into DataBase'
					 strQuery1 = "INSERT INTO enrolledusers (firstname,lastname,email,nameofemployeer,phoneno,coursedetails,coursedate,amount,dateofenrollment, paybefore,status,PRINCE2Manual,courseid,statusnumber,PRINCE2price,discountpercentage,country,jobtitle,street,city,state1,postalCode,nameoncertificate,examdate,examrollno,VAT,typeOfCourse,certificateId, vendorId,speReq,Vender,quoteId,comment,manualsent_date)"
			
			         'Response.Write(strQuery1)
			
					 strQuery1 = strQuery1 & " Values "
					 strQuery1 = strQuery1 & "('" & rqFirstName & "',"
					 strQuery1 = strQuery1 & "'" & rqLastName & "',"
					 strQuery1 = strQuery1 & "'" & rqEmail & "',"
					 strQuery1 = strQuery1 & "'" & rqNameOfEmployeer & "',"
					 strQuery1 = strQuery1 & "'" & rqPhoneNumber & "',"
					 strQuery1 = strQuery1 & "'" & CourseDetails & "',"
					 strQuery1 = strQuery1 & "'" & CourseDate & "',"
					 strQuery1 = strQuery1 & "'0',"
					 strQuery1 = strQuery1 & "'" & todayDate & "',"
					 strQuery1 = strQuery1 & "'" & todayDate & "',"
					 strQuery1 = strQuery1 & "'Active',"
					 strQuery1 = strQuery1 & "'" &rqmanual &"',"
					 strQuery1 = strQuery1 & "'" & rqCourseId & "',"
					 strQuery1 = strQuery1 & "'1',"
					 strQuery1 = strQuery1 & "'0',"
					 strQuery1 = strQuery1 & "'0',"
					 strQuery1 = strQuery1 & "'United Kingdom',"
					 strQuery1 = strQuery1 & "'" & rqJobTitle & "',"
					 strQuery1 = strQuery1 & "'" & rqStreet & "',"
					 strQuery1 = strQuery1 & "'" & rqCity & "',"
					 strQuery1 = strQuery1 & "'" & rqState & "',"
					 strQuery1 = strQuery1 & "'" & rqPostalCode & "',"
					 strQuery1 = strQuery1 & "'" & rqCertificate & "'," 
					 strQuery1 = strQuery1 & "'" & rqExamDate  & "'," 
					 strQuery1 = strQuery1 & "'" & rqExamRollDate & "'," 
					 strQuery1 = strQuery1 & "'0',"
					 strQuery1 = strQuery1 & "'"& rqcourse_Type &"',"
					 strQuery1 = strQuery1 & "'"&rqcertificationId&"',"
					 strQuery1 = strQuery1 & "'2',"
					 strQuery1 = strQuery1 & "'" & rqSpeReq & "',"
					 strQuery1 = strQuery1 & "'" & rqVender & "',"
					 strQuery1 = strQuery1 & "'" & rqQuoteId & "',"
                     strQuery1 = strQuery1 & "'" & rqcomment & "',"
                     strQuery1 = strQuery1 & "'" & Cdate(rqmanualDate) & "')"
					 
					'Response.Write(strQuery1)
					Rs1.Open strQuery1,ConnObj
				
				
					strEnollID = "SELECT max(id) as EnrollId FROM enrolledusers"
						
						objRs.Open strEnollID,ConnObj
						
						do until objRs.Eof
						
							 Session("EnrollId") = objRs("EnrollId")
						
						objRs.Movenext
						Loop
						objRs.Close
						
				'For display the course details formatting the course like Raleigh : Saturday, April 17, 2010 to Tuesday, April 20, 2010 for $ 1,800.00'
						

						

						
					 'Send proforma invoice email'
				
				strBody = "<table width=""100%"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td>&nbsp;</td></tr><tr><td><table width=""600px"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""595px"" bgcolor=""#FFFFFF""><span><img src=""http://www.PROJstudy.com/images/banners/email_headerDatrix.jpg"" alt=""Datrix"" /></span></td></tr>"
					  
					  'Email Heading'
			 strBody = strBody & "<tr><td align=""center"" colspan=""2"" width=""540px""><table border=""0"" align=""center"" width=""520px""><tr><td align=""center""><font face=""Arial"" size=""3"" color=""#0359b4""><b>PROFORMA INVOICE</b></font></td></tr>"
						
					  strBody = strBody & "<tr><td align=""right"" colspan=""2""><font face=""Arial"" size=""2""><b>" & FormatDateTime(todaysDate,1) & "</b></font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Enrol ID : " & Session("EnrollId") & "</font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name : " & rqFirstName & "&nbsp; " & rqLastName & "</font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Email : " & rqEmail & " </font></td></tr>"
					  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=""2"">Phone Number : " & rqPhoneNumber & "</font></td></tr>"
					  
					  
					  strBody = strBody & "<tr><td align=""left"" colspan=""2""><br><font face=""Arial"" size=""2"">Details of the course and Payment:</font><br><table border=""1"" cellspacing=""0"" align=""center"" width=""560px""><tr><td width=""60%""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Details</font></b></td></tr>"
					  strBody = strBody & "<tr><td><font face=""Arial"" size=""2""><b>Datrix Classroom Training<br> " & CourseDetails & "  </b>"
					  strBody = strBody &"</b></td></tr></table>"
					 
					  strBody = strBody & "<tr><td align=""left"" >"
					
	 				  strBody = strBody & "<tr><td align=""left""><br><font face=""Arial"" size=2>Best Regards,</font></td></tr>"
	 				  strBody = strBody & "<tr><td align=""left""><font face=""Arial"" size=2>Customer Support<br>"
	 				  strBody = strBody & "<a href=""http://www.PROJstudy.com"" target=""_blank"">www.DatrixTraining.com</a><br>"
					 
					  strBody = strBody & "Email: contact@datrixtraining.com</font><br><br><hr></hr><div align=""center""><font size=""1px"">"
					
					  strBody = strBody & "<br>PRINCE2<sup>&reg;</sup> is a registered trade mark of the Cabinet Office.<br>The Swirl logo™ is a trade mark of the Cabinet Office.<br/></font></div></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr></table></td></tr><tr><td height=""45%"">&nbsp;</td></tr></table>"
					 
					 		'Response.Write(strBody)
 
  				   Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
			        objCDOMail.From = "marketing@projstudy.com"
				    objCDOMail.To =  "adminsupport@projstudy.com"'"ChrisJ@datrixtraining.com,LParker@datrixtraining.com"
				    objCDOMail.cc = "marketing@projstudy.com"
				    objCDOMail.Bcc = "t_satpathy@yahoo.com, edusysgaurav@gmail.com, edusysayan@gmail.com, projstudy-leadership@googlegroups.com,edusyssidhardha@gmail.com"
   				    objCDOMail.Importance = 2
					objCDOMail.Subject = "Enrolment From Datrix for PROJstudy.com Classroom Coaching"
					objCDOMail.BodyFormat = 0
			        objCDOMail.MailFormat = 0
					objCDOMail.Body =  strBody
					objCDOMail.Send
					set objCDOMail = Nothing
	
				
				Session("message") = "Enrollment Done Successfully"
				Response.Redirect("/backOffice/Datrix-enrollment.asp")
				
				
					
					
%>


                         
                  