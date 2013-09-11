<%@ Language = "VBScript" %>
<% 'OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 23/09/2010'
'Description :'
' Add/Edit/Delete Course Page '
'======================================================='
%>
<% 
   If Session("UserId")  = "" Then
     Response.Redirect("../backOffice/login.asp")
   Else
%>
<!--#include file="includes/connection.asp"-->
<%
'------------------------------------------------------'
'Insert New Course'
'------------------------------------------------------'

 'Declare The Variables'
 Dim strQuery1,rs1
 Dim rqCity, rqCourseName
 Dim rqStartDate
 Dim rqEndDate
 Dim rqStartHour
 Dim rqStartMin
 Dim rqStartSession
 Dim rqEndHour
 Dim rqEndMin
 Dim rqEndSession
 Dim rqPriceWithoutTax
 Dim rqTax
 Dim rqPriceWithTax
 Dim rqStatus
 Dim rqInstructor
 Dim rqBackUpInstructor
 Dim rqApplicableDays
 Dim rqEarlyBirdDiscount
 Dim rqAfterEBDiscountWithoutTax
 Dim rqAfterEBDiscountWithTax
 Dim rqHotelName
 Dim rqHotelPhoneNumber
 Dim rqHotelUrl
 Dim rqHotelAddress
 Dim strQuery
 Dim addCourse
 Dim rqCourseId
 Dim editCourse
 Dim reSheduleCourse
 Dim rsQuery,strCourses,generate,rqdate,strEnding,iCount,Currency_Format_Front,Currency_Format_Back,ApplicableDays,bgColor,fsoObject

 Dim rqEditCity,rqEditCourseName
 Dim rqEditStartDate,editStartDate
 Dim rqEditEndDate,editEndDate
 Dim rqEditStartHour
 Dim rqEditStartMin
 Dim rqEditStartSession
 Dim rqEditEndHour
 Dim rqEditEndMin
 Dim rqEditEndSession
 Dim rqEditPriceWithoutTax
 Dim rqEditTax,rqEditCourseDates
 Dim rqEditPriceWithTax
 Dim rqEditInstructor
 Dim rqEditBackUpInstructor
 Dim rqEditCourseId, strGetQuery
 Dim rqEditApplicableDays
 Dim rqEditEarlyBirdDiscount
 Dim rqEditAfterEBDiscountWithoutTax
 Dim rqEditAfterEBDiscountWithTax
 Dim rqEditHotelName,rqEditofferText
 Dim rqEditHotelPhoneNumber, courseDate
 Dim rqEditHotelUrl,StartDate, EndDate, lastRow, rowCounter
 Dim rqEditHotelAddress ,rqCourseDates, numRows, firstRow
 Dim rqDeleteId ,todayDate,Rs, rsQues, arrAllCourses
 
 
 
 Set Rs  = Server.CreateObject("ADODB.Recordset")
 Set rsQues  = Server.CreateObject("ADODB.Recordset")
  
'Retrive The Values From course.asp Page'

  addCourse = Request.Form("addcourse")
  reSheduleCourse = Request.Form("reschedule")
  rqEditCourseId = Request.Form("editcourseId")
  editCourse = Request.Form("editcourse")

'Retrive The New Course Details From course.asp Page'

 rqCity            =  Request.Form("city")
 rqStartDate 	   =  Request.Form("startdate")
 rqEndDate		   =  Request.Form("enddate")
 rqStartHour	   =  Request.Form("startinghour")
 rqStartMin		   =  Request.Form("startingminute")
 rqStartSession	   =  Request.Form("sessionstart")
 rqEndHour		   =  Request.Form("endinghour")
 rqEndMin		   =  Request.Form("endingminute")
 rqEndSession	   =  Request.Form("sessionend")
 rqPriceWithoutTax =  Request.Form("priceWithOutTax")
 rqTax			   =  Request.Form("tax")
 rqPriceWithTax    =  Request.Form("priceWithTax")
 rqInstructor      =  Trim(Request.Form("instructor"))
 rqBackUpInstructor=  Trim(Request.Form("backupinstructor"))
 rqApplicableDays    = Request.Form("applicabledays")
 rqEarlyBirdDiscount = Request.Form("earlybirddicount")
 rqAfterEBDiscountWithouttax   = Request.Form("afterearlybirddiscountwithouttax")
 rqAfterEBDiscountWithTax   = Request.Form("afterearlybirddiscountwithtax")
 rqHotelName         =  Replace(Request.Form("hotelname"),"'","''")
 rqHotelPhoneNumber  =  Request.Form("hotelphonenumber")
 rqHotelUrl          =  Request.Form("hotelurl") 
 rqHotelAddress      =  Replace(Request.Form("hoteladdress"),"'","''")
 rqCourseDates      =  Replace(Request.Form("coursedate"),"'","''")
 rqCourseType        =  Request.Form("coursetype")
 rqCourseName      =  Request.Form("course")
 
 If instr(rqCourseName,":") then
 
 rqCourseName2 = split(rqCourseName,":")
 
 rqCourseName      =  rqCourseName2(0)
 rqRefNumber       =  rqCourseName2(1)
 rqDuration        =  rqCourseName2(2)
 
 
 End If

 'formatting date
 todayDate = (YEAR(now()) & "-" & (Month(now())) & "-" & (DAY(now()))) 
  StartDate = (YEAR(rqStartDate) & "-" & (Month(rqStartDate)) & "-" & (DAY(rqStartDate)))
   EndDate = (YEAR(rqEndDate) & "-" & (Month(rqEndDate)) & "-" & (DAY(rqEndDate))) 
 

If addCourse = "Add Course" Then

 set rs1=server.CreateObject("adodb.recordset")	
 strQuery1="Select * from course where city='"& rqCity &"' and startdate='"&rqStartDate&"' and enddate = '"&rqEndDate&"' AND coursetype = '"& rqCourseType &"' AND Country = '"& session("country") &"' AND certificateId = '"& session("certificateID") &"' and vendorId = '"&Session("vendor")&"'"	
 
 'Response.Write(strQuery1)
 rs1.open strQuery1,ConnObj
	
 if rs1.eof and rs1.bof then 

strQuery ="INSERT INTO course (city,courseName, startdate,enddate,starthour,startminute,startsession,endhour,endminute,endsession,pricewithouttax,tax,pricewithtax,instructor,backupinstructor,applicabledays,earlybirddiscount,afterEBdiscountwithouttax,afterEBdiscountwithtax,hotelname,hotelphonenumber,hotelurl,hoteladdress,createddate,country,coursedates,coursetype,RefNumber,duration,certificateId,vendorId,status)"
 strQuery = strQuery & " Values "
 strQuery = strQuery & "('" & rqCity & "',"
 strQuery = strQuery & "'" & rqCourseName & "',"
 strQuery = strQuery & "'" & StartDate & "',"
 strQuery = strQuery & "'" & EndDate & "',"
 strQuery = strQuery & "'" & rqStartHour & "',"
 strQuery = strQuery & "'" & rqStartMin & "',"
 strQuery = strQuery & "'" & rqStartSession & "',"
 strQuery = strQuery & "'" & rqEndHour & "',"
 strQuery = strQuery & "'" & rqEndMin & "',"
 strQuery = strQuery & "'" & rqEndSession & "',"
 strQuery = strQuery & "'" & rqPriceWithoutTax & "',"
 strQuery = strQuery & "'" & rqTax & "',"
 strQuery = strQuery & "'" & rqPriceWithTax & "',"
 strQuery = strQuery & "'" & rqInstructor & "',"
 strQuery = strQuery & "'" & rqBackUpInstructor	 & "',"
 strQuery = strQuery & "'" & rqApplicableDays & "',"
 strQuery = strQuery & "'" & rqEarlyBirdDiscount & "',"
 strQuery = strQuery & "'" & rqAfterEBDiscountWithouttax & "',"
 strQuery = strQuery & "'" & rqAfterEBDiscountWithtax & "',"
 strQuery = strQuery & "'" & rqHotelName & "',"
 strQuery = strQuery & "'" & rqHotelPhoneNumber & "',"
 strQuery = strQuery & "'" & rqHotelUrl & "',"
 strQuery = strQuery & "'" & rqHotelAddress & "',"
 strQuery = strQuery & "'" & todayDate & "',"
 If session("country") = "Global" OR session("country") = "Other" Then
 strQuery = strQuery & "'Other',"
 Else
 strQuery = strQuery & "'" & session("country") & "',"
 End If
 strQuery = strQuery & "'" & rqCourseDates & "',"
 strQuery = strQuery & "'" & rqCourseType & "',"
 strQuery = strQuery & "'" & rqRefNumber & "',"  
 strQuery = strQuery & "'" & rqDuration & "'," 
 strQuery = strQuery & "'" & session("certificateID") & "',"
 strQuery = strQuery & "'" & session("vendor") & "',"
 strQuery = strQuery & "'Available')" 
	response.Write(strQuery)			 	
 Rs.Open strQuery,ConnObj
	response.Write(strQuery)			 	
 'Getting values
 
 If Session("vendor") = 1 Then
	

					strGetQuery = "SELECT course.*, city.state_code, course.startdate, course.enddate FROM course course, city city Where course.city = '"&rqCity&"' and city.city = '"&rqCity&"' And  (course.startdate ='"&StartDate&"' or  course.enddate ='"&EndDate&"')  And course.country = '" & session("country") & "' AND city.country = '" & session("country") & "' And course.createddate = '"&todayDate&"'  And course.courseName= 'Foundation and Practitioner' AND course.certificateId = '"& session("certificateID") &"' and course.vendorId = '"&Session("vendor")&"'  and  course.status <> 'Cancelled'  ORDER BY month(course.startdate) ,course.city DESC"
					
ElseIf Session("vendor") = 2 Then

			strGetQuery = "SELECT course.*, city.state_code, course.startdate, course.enddate FROM course course, city city Where course.city = '"&rqCity&"' and city.city = '"&rqCity&"' And  (course.startdate ='"&StartDate&"' or  course.enddate ='"&EndDate&"')  And course.country = '" & session("country") & "' AND city.country = '" & session("country") & "' And course.createddate = '"&todayDate&"'  And course.courseName= '"&rqCourseName&"' AND course.certificateId = '"& session("certificateID") &"' and course.vendorId = '"&Session("vendor")&"'  and  course.status <> 'Cancelled'  ORDER BY month(course.startdate) ,course.city DESC"
	
End If
					 
					 
					
				    Rs.Open strGetQuery,ConnObj
					
					
					 	
	
					 If Not Rs.EOF Then
			
						arrAllCourses = Rs.getrows
						Session("arrAllCourses") = arrAllCourses
						numRows = Ubound(arrAllCourses,2)
						firstRow = 0
						lastRow = numRows
					  End If
	
					  Rs.Close
 

 If IsArray(arrAllCourses)  Then
		
	For rowCounter = firstRow to lastRow 
	
		courseDate = arrAllCourses(3,rowCounter)
		Response.Write(courseDate)
		

 If Session("vendor") = 1 Then
 
	 strQuery = "UPDATE course SET classdate = '"& courseDate &"' WHERE city = '"&arrAllCourses(2,rowCounter)&"' and startdate between '"&cdate(courseDate)&"' and '"&cdate(courseDate+4)&"' and country = '" & session("country") & "' AND certificateId = '"& session("certificateID") &"' and vendorId = '"&Session("vendor")&"'"
						
ElseIf Session("vendor") = 2 Then

 strQuery = "UPDATE course SET classdate = '"& courseDate &"' WHERE city = '"&arrAllCourses(2,rowCounter)&"' and startdate = '"&cdate(courseDate)&"' and country = '" & session("country") & "' AND certificateId = '"& session("certificateID") &"' and vendorId = '"&Session("vendor")&"'"
						
			
End If
					 
		 
 
		    
			rsQues.Open strQuery,connObj
			Response.Write(strQuery & "<br>")
	
			
	 Next	
	 End IF
		



'response.Write(strQuery)
 Session("message") = "You Have Successfully Added Course"


 Response.Redirect("courses.asp?certificate="&session("certificate")&"")
 
 
  else

session("checkmessage")= "The city  " & rqCity & "  for the Particular date: " & CDate(rqStartDate) & " already exists"
Response.Redirect("courses.asp?type=add&certificate="&session("certificate")&"")


End If
End If

'------------------------------------------------------'
'Edit/Re-Schedule Course Details'
'------------------------------------------------------'

 'Retrive The Edit Course Details From course.asp Page'
 
 rqEditCity            =  Request.Form("editcity")
 rqEditCourseName      =  Request.Form("editCourseName")
 rqEditStartDate 	   =  Request.Form("editstartdate")
 rqEditEndDate		   =  Request.Form("editenddate")
 rqEditStartHour	   =  Request.Form("editstartinghour")
 rqEditStartMin		   =  Request.Form("editstartingminute")
 rqEditStartSession	   =  Request.Form("editsessionstart")
 rqEditEndHour		   =  Request.Form("editendinghour")
 rqEditEndMin		   =  Request.Form("editendingminute")
 rqEditEndSession	   =  Request.Form("editsessionend")
 rqEditPriceWithoutTax =  Request.Form("priceWithOutTax")
 rqEditTax			   =  Request.Form("tax")
 rqEditPriceWithTax    =  Request.Form("priceWithTax")
 rqEditInstructor      =  Trim(Request.Form("editinstructor"))
 rqEditBackUpInstructor=  Trim(Request.Form("editbackupinstructor"))
 rqEditApplicableDays    = Request.Form("applicabledays")
 rqEditEarlyBirdDiscount = Request.Form("earlybirddicount")
 rqEditAfterEBDiscountWithoutTax   = Request.Form("afterearlybirddiscountwithouttax")
 rqEditAfterEBDiscountWithTax   = Request.Form("afterearlybirddiscountwithtax")
 rqEditHotelName         =  Replace(Request.Form("edithotelname"),"'","''")
 rqEditHotelPhoneNumber  =  Request.Form("edithotelphonenumber")
 rqEditHotelUrl          =  Request.Form("edithotelurl") 
 rqEditHotelAddress      =  Replace(Request.Form("edithoteladdress"),"'","''")
 rqStatus                 =  Request.Form("status")
 rqEditCourseDates      =  Replace(Request.Form("editcoursedate"),"'","''")
 rqEditCourseType        =  Request.Form("editcoursetype")
 rqEditofferText       =  Replace(Request.Form("offerText"),"'","''")
 rqEditdiscount        =  Request.Form("editdiscount")
 rqEditDuration =  Request.Form("duration")
 rqEditRefNumber =  Request.Form("RefNumber")

 
 
 'Converting date format - YYYY-MM-DD' 
	     editStartDate = (YEAR(rqEditStartDate) & "-" & (Month(rqEditStartDate)) & "-" & (DAY(rqEditStartDate)))
		 'response.Write(editStartDate)
		 editEndDate = (YEAR(rqEditEndDate) & "-" & (Month(rqEditEndDate)) & "-" & (DAY(rqEditEndDate)))
		 'response.Write(editEndDate)
		 


If editCourse = "Edit Course" Then

 strQuery = "UPDATE course SET"
 strQuery = strQuery & " city = '" & rqEditCity  & "',"
 strQuery = strQuery & " courseName = '" & rqEditCourseName  & "',"
 strQuery = strQuery & " startdate = '" & editStartDate &"',"
 strQuery = strQuery & " enddate = '"& editEndDate & "',"
 strQuery = strQuery & " starthour = '"& rqEditStartHour & "',"
 strQuery = strQuery & " startminute = '"& rqEditStartMin & "',"
 strQuery = strQuery & " startsession = '"& rqEditStartSession & "',"
 strQuery = strQuery & " endhour = '"& rqEditEndHour & "',"
 strQuery = strQuery & " endminute = '"& rqEditEndMin & "',"
 strQuery = strQuery & " endsession = '"& rqEditEndSession & "',"
 strQuery = strQuery & " pricewithouttax = '"& rqEditPriceWithoutTax &"',"
 strQuery = strQuery & " tax='"& rqEditTax &"',"
 strQuery = strQuery & " pricewithtax = '"& rqEditPriceWithTax & "',"
 strQuery = strQuery & " instructor = '" & rqEditInstructor	 & "',"
 strQuery = strQuery & " backupinstructor = '" & rqEditBackUpInstructor	 & "',"
 strQuery = strQuery & " applicabledays = '" & rqEditApplicableDays	 & "',"
 strQuery = strQuery & " earlybirddiscount = '" & rqEditEarlyBirdDiscount	 & "',"
 strQuery = strQuery & " afterEBdiscountwithouttax = '" & rqEditAfterEBDiscountWithoutTax	 & "',"
 strQuery = strQuery & " afterEBdiscountwithtax = '" & rqEditAfterEBDiscountWithTax & "',"
 strQuery = strQuery & " hotelname = '" & rqEditHotelName & "',"
 strQuery = strQuery & " hotelphonenumber = '" & rqEditHotelPhoneNumber & "',"
 strQuery = strQuery & " hotelurl = '" & rqEditHotelUrl & "',"
 strQuery = strQuery & " hoteladdress = '" & rqEditHotelAddress & "',"
 strQuery = strQuery & " coursedates = '" & rqEditCourseDates & "',"
 strQuery = strQuery & " coursetype = '" & rqEditCourseType & "'," 
 strQuery = strQuery & " offerText = '" & rqEditofferText & "',"  
 strQuery = strQuery & " discount = '" & rqEditdiscount & "',"
 strQuery = strQuery & " RefNumber = '" & rqEditRefNumber & "',"
 strQuery = strQuery & " duration = '" & rqEditDuration & "',"
 strQuery = strQuery & " certificateId = '" & session("certificateID") & "'," 
 strQuery = strQuery & " vendorId = '" & session("vendor") & "'," 
 strQuery = strQuery & " status = '" & rqStatus & "'" 
 strQuery = strQuery & " WHERE courseid = '" & rqEditCourseId &"'"
 
 Rs.Open strQuery,ConnObj
 
 
 'If course is cancelled tehn email as to be sent'
 
' If rqStatus = "Cancelled" Then
 %>
  
<%
'End If

 

 'Getting values
 
  If Session("vendor") = 1 Then
	
				strGetQuery = "SELECT course.*, city.state_code, course.startdate, course.enddate FROM course course, city city Where course.city = '"&rqEditCity&"' and city.city = '"&rqEditCity&"' And  (course.startdate ='"&rqEditStartDate&"' or  course.enddate ='"&rqEditEndDate&"')  And course.country = '" & session("country") & "' AND city.country = '" & session("country") & "' And course.courseName= 'Foundation and Practitioner' AND course.certificateId = '"& session("certificateID") &"' and course.vendorId = '"&Session("vendor")&"' and  course.status <> 'Cancelled'  ORDER BY month(course.startdate) ,course.city DESC"
					
ElseIf Session("vendor") = 2 Then

			strGetQuery = "SELECT course.*, city.state_code, course.startdate, course.enddate FROM course course, city city Where course.city = '"&rqEditCity&"' and city.city = '"&rqEditCity&"' And  (course.startdate ='"&rqEditStartDate&"' or  course.enddate ='"&rqEditEndDate&"')  And course.country = '" & session("country") & "' AND city.country = '" & session("country") & "' And course.courseName= '"&rqCourseName&"' AND course.certificateId = '"& session("certificateID") &"' and course.vendorId = '"&Session("vendor")&"' and  course.status <> 'Cancelled'  ORDER BY month(course.startdate) ,course.city DESC"
			
End If
					 
					
				    Rs.Open strGetQuery,ConnObj
					 	
					 If Not Rs.EOF Then
			
						arrAllCourses = Rs.getrows
						Session("arrAllCourses") = arrAllCourses
						numRows = Ubound(arrAllCourses,2)
						firstRow = 0
						lastRow = numRows
					  End If
	
					  Rs.Close
 

 If IsArray(arrAllCourses)  Then
		
	For rowCounter = firstRow to lastRow 
	
		courseDate = arrAllCourses(3,rowCounter)
		Response.Write(courseDate)
		
If Session("vendor") = 1 Then
 
	 strQuery = "UPDATE course SET classdate = '"& courseDate &"' WHERE city = '"&arrAllCourses(2,rowCounter)&"' and startdate between '"&cdate(courseDate)&"' and '"&cdate(courseDate+4)&"' and country = '" & session("country") & "' and courseid = '" & rqEditCourseId &"' AND certificateId = '"& session("certificateID") &"' and vendorId = '"&Session("vendor")&"'"

						
ElseIf Session("vendor") = 2 Then

 strQuery = "UPDATE course SET classdate = '"& courseDate &"' WHERE city = '"&arrAllCourses(2,rowCounter)&"' and startdate = '"&cdate(courseDate)&"' and country = '" & session("country") & "' and courseid = '" & rqEditCourseId &"' AND certificateId = '"& session("certificateID") &"' and vendorId = '"&Session("vendor")&"'"
						
			
End If	 
 
						
		    
	
			rsQues.Open strQuery,connObj
			
	 Next	
	 End IF
		


'response.Write(strQuery)
 Session("message") = "You Have Successfully Edited Course"

 Response.Redirect("courses.asp?certificate="&session("certificate")&"")

End If

'Retrive The Delete Id From course.asp Page'

 rqDeleteId = Request.Querystring("delete")

If rqDeleteId <> "" Then

 strQuery = "DELETE FROM course WHERE courseid = '" & rqDeleteId & "' AND certificateId = '"& session("certificateID") &"' and vendorId = '"&Session("vendor")&"'"

 Rs.Open strQuery,ConnObj

Session("message") = "You Have Successfully Deleted The Course"


Response.Redirect("courses.asp?certificate="&session("certificate")&"")

End If


''Rs.Close
ConnObj.Close
End If
%>