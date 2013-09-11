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
<!--#include virtual="/includes/connection.asp"-->
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
 dim rqaccountmanager,rqbookedby,rqbookedon
 
 
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

    If Request.Form("enddate1") <> "" then
 rqEndDate		   =  Request.Form("enddate1")
    Else
 rqEndDate		   =  Request.Form("enddate")
    End If

    If Request.Form("startinghour1") <> "" then
 rqStartHour	   =  Request.Form("startinghour1")
    Else
 rqStartHour	   =  Request.Form("startinghour")
    End If

     If Request.Form("startingminute1") <> "" then
 rqStartMin		   =  Request.Form("startingminute1")
    Else
 rqStartMin		   =  Request.Form("startingminute")
    End If

    If Request.Form("sessionstart1") <> "" then
 rqStartSession	   =  Request.Form("sessionstart1")
    Else
 rqStartSession	   =  Request.Form("sessionstart")
    End If

     If Request.Form("endinghour1") <> "" then
 rqEndHour		   =  Request.Form("endinghour1")
    Else
 rqEndHour		   =  Request.Form("endinghour")
    End If

     If Request.Form("endingminute1") <> "" then
 rqEndMin	   =  Request.Form("endingminute1")
    Else
 rqEndMin	   =  Request.Form("endingminute")
    End If

     If Request.Form("sessionend1") <> "" then
 rqEndSession	   =  Request.Form("sessionend1")
    Else
 rqEndSession	   =  Request.Form("sessionend")
    End If

     If Request.Form("priceWithOutTax1") <> "" then
 rqPriceWithoutTax =  Request.Form("priceWithOutTax1")
 rqTax			   =  Request.Form("tax1")
 rqPriceWithTax    =  Request.Form("priceWithTax1")
    Else
rqPriceWithoutTax =  Request.Form("priceWithOutTax")
 rqTax			   =  Request.Form("tax")
 rqPriceWithTax    =  Request.Form("priceWithTax")
    End If
 
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
rqaccountmanager=Request.Form("accountmanager")
    rqbookedby=Request.Form("bookedby")
    rqbookedon=Request.Form("bookedon")
  if rqbookedon<>"" then
     rqbookedon=rqbookedon
    else
    rqbookedon=cdate(now())
    end if
    If instr(rqCourseName,":") then
  
 rqCourseName2 = split(rqCourseName,":")
 
 rqCourseName      =  rqCourseName2(0)
 rqCourseName = replace(rqCourseName, "®", "&reg;") 
    response.Write(rqCourseName) 
 rqRefNumber       =  rqCourseName2(1)
 rqDuration        =  rqCourseName2(2)
 
 
 End If 
     'response.Write(rqEndDate)
 'formatting date
 todayDate = (YEAR(now()) & "-" & (Month(now())) & "-" & (DAY(now()))) 
  StartDate = (YEAR(rqStartDate) & "-" & (Month(rqStartDate)) & "-" & (DAY(rqStartDate)))
   'EndDate = (YEAR(rqEndDate) & "-" & (Month(rqEndDate)) & "-" & (DAY(rqEndDate))) 
 response.Write(EndDate)
   
If addCourse = "Add Course" Then
    dim x
    dim flag
    flag=0
 set rs1=server.CreateObject("adodb.recordset")	
 for i=0 to 9
    
    if i=0 then
    rqStartDate=Request.Form("startdate")
    rqEndDate=Request.Form("enddate")
    else
   rqStartDate=Request.Form("startdate"&i)
   rqEndDate=Request.Form("enddate"&i)
    end if

   'StartDate = (YEAR(rqStartDate) & "-" & (Month(rqStartDate)) & "-" & (DAY(rqStartDate)))
   'EndDate = (YEAR(rqEndDate) & "-" & (Month(rqEndDate)) & "-" & (DAY(rqEndDate))) 
   ' EndDate=rqEndDate
 if rqStartDate<>"" and rqEndDate<>"" then
   '' response.Write(i)
       StartDate = (YEAR(rqStartDate) & "-" & (Month(rqStartDate)) & "-" & (DAY(rqStartDate)))
       EndDate = (YEAR(rqEndDate) & "-" & (Month(rqEndDate)) & "-" & (DAY(rqEndDate))) 
 
       strQuery1="Select * from datrixClasses where city='"& rqCity &"' and startdate='"&StartDate&"' and enddate = '"&EndDate&"' AND RefNumber = '"&rqRefNumber&"' AND coursetype = '"& rqCourseType &"' AND certificateId = '"& session("certificateID") &"' and vendorId = '"&Session("vendor")&"'"	
 
    rs1.open strQuery1,ConnObj
 
 while not rs1.eof   
      flag=1
    exit for
  wend

    Rs1.close   
    end if
    'Rs1.close
    next
 if flag=1 then    
session("checkmessage")= "The city  " & rqCity & "  for the Particular date: " & CDate(rqStartDate) & " already exists"
response.Write(session("checkmessage"))
'Response.Redirect("datrixClass.asp?type=add&certificate="&session("certificate")&"")
    else
 
    'the new dates will insert here as flag=0
    
    for j=0 to 9
    if j=0 then
    rqStartDate=Request.Form("startdate")
    rqEndDate=Request.Form("enddate")
    else
   rqStartDate=Request.Form("startdate"&j)
   rqEndDate=Request.Form("enddate"&j)
    end if

   ' EndDate=rqEndDate
  if rqStartDate<>"" and rqEndDate<>"" then
 
    response.Write("<br>")
     StartDate = (YEAR(rqStartDate) & "-" & (Month(rqStartDate)) & "-" & (DAY(rqStartDate)))
     EndDate = (YEAR(rqEndDate) & "-" & (Month(rqEndDate)) & "-" & (DAY(rqEndDate))) 
    response.Write(j&" -->")
    response.Write(StartDate&"  ")
    response.Write(EndDate) 
 'Response.Write(strQuery1)
	


 strQuery ="INSERT INTO datrixClasses (city,courseName, startdate,enddate,starthour,startminute,startsession,endhour,endminute,endsession,instructor,backupinstructor,applicabledays,hotelname,hotelphonenumber,hotelurl,hoteladdress,createddate,country,coursedates, classdate,coursetype,RefNumber,duration,pricewithouttax,tax,pricewithtax,earlybirddiscount,afterEBdiscountwithouttax,afterEBdiscountwithtax,certificateId,vendorId,status,accountmanager,bookedby,bookedon)"
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
 strQuery = strQuery & "'" & rqInstructor & "',"
 strQuery = strQuery & "'" & rqBackUpInstructor	 & "',"
 strQuery = strQuery & "'" & rqApplicableDays & "',"
 strQuery = strQuery & "'" & rqHotelName & "',"
 strQuery = strQuery & "'" & rqHotelPhoneNumber & "',"
 strQuery = strQuery & "'" & rqHotelUrl & "',"
 strQuery = strQuery & "'" & rqHotelAddress & "',"
 strQuery = strQuery & "'" & todayDate & "',"
 strQuery = strQuery & "'United Kingdom',"
 strQuery = strQuery & "'" & rqCourseDates & "',"
 strQuery = strQuery & "'" & StartDate & "',"
 strQuery = strQuery & "'" & rqCourseType & "',"
 strQuery = strQuery & "'" & rqRefNumber & "',"  
 strQuery = strQuery & "'" & rqDuration & "'," 
strQuery = strQuery & "'" & rqPriceWithoutTax & "'," 
strQuery = strQuery & "'" & rqTax & "'," 
strQuery = strQuery & "'" & rqPriceWithTax & "'," 
strQuery = strQuery & "'" & rqEarlyBirdDiscount & "'," 
strQuery = strQuery & "'" & rqAfterEBDiscountWithouttax & "'," 
strQuery = strQuery & "'" & rqAfterEBDiscountWithTax & "'," 
strQuery = strQuery & "'" & session("certificateID") & "',"
strQuery = strQuery & "'" & session("vendor") & "',"
strQuery = strQuery & "'Available'," 
 strQuery = strQuery & "'" & rqaccountmanager & "',"
    strQuery = strQuery & "'" & rqbookedby & "',"
    strQuery = strQuery & "'" & Cdate(rqbookedon) & "')"
      response.Write(strQuery)  
 Rs.Open strQuery,ConnObj

 
   StartDate=""
    EndDate=""
    rqStartDate=""
    'Request.Form("startdate"&j)
    rqEndDate=""
    'Request.Form("enddate"&j)
   

response.Write("corrct")
    end if

    next
   
 Session("message") = "You Have Successfully Added Course"


 Response.Redirect("datrixClass.asp?certificate="&session("certificate")&"")
 
       end if

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
rqaccountmanager=Request.Form("accountmanager")
    rqbookedby=Request.Form("bookedby")
    rqbookedon=Request.Form("bookedon")
    if rqbookedon<>"" then
     rqbookedon=rqbookedon
    else
    rqbookedon=cdate(now())
    end if
   If instr(rqEditCourseName,":") then
 
 rqCourseName2 = split(rqEditCourseName,":")
 
 rqEditCourseName      =  rqCourseName2(0)
 rqEditRefNumber       =  rqCourseName2(1)
 rqEditDuration        =  rqCourseName2(2)
 
 
 End If 


 
 
 'Converting date format - YYYY-MM-DD' 
	     editStartDate = (YEAR(rqEditStartDate) & "-" & (Month(rqEditStartDate)) & "-" & (DAY(rqEditStartDate)))
		 'response.Write(editStartDate)
		 editEndDate = (YEAR(rqEditEndDate) & "-" & (Month(rqEditEndDate)) & "-" & (DAY(rqEditEndDate)))
		 'response.Write(editEndDate)
		 


If editCourse = "Edit Course" Then


 strQuery = "UPDATE datrixClasses SET"
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
 strQuery = strQuery & " instructor = '" & rqEditInstructor	 & "',"
 strQuery = strQuery & " backupinstructor = '" & rqEditBackUpInstructor	 & "',"
 strQuery = strQuery & " applicabledays = '" & rqEditApplicableDays	 & "',"
 strQuery = strQuery & " hotelname = '" & rqEditHotelName & "',"
 strQuery = strQuery & " hotelphonenumber = '" & rqEditHotelPhoneNumber & "',"
 strQuery = strQuery & " hotelurl = '" & rqEditHotelUrl & "',"
 strQuery = strQuery & " hoteladdress = '" & rqEditHotelAddress & "',"
 strQuery = strQuery & " coursedates = '" & rqEditCourseDates & "',"
 strQuery = strQuery & " coursetype = '" & rqEditCourseType & "'," 
 strQuery = strQuery & " RefNumber = '" & rqEditRefNumber & "',"
 strQuery = strQuery & " duration = '" & rqEditDuration & "',"
 strQuery = strQuery & " pricewithouttax = '" & rqPriceWithoutTax & "'," 
 strQuery = strQuery & " tax ='" & rqTax & "'," 
 strQuery = strQuery & " pricewithtax ='" & rqPriceWithTax & "'," 
 strQuery = strQuery & " earlybirddiscount='" & rqEarlyBirdDiscount & "'," 
 strQuery = strQuery & " afterEBdiscountwithouttax='" & rqAfterEBDiscountWithouttax & "'," 
 strQuery = strQuery & " afterEBdiscountwithtax='" & rqAfterEBDiscountWithTax & "'," 
 strQuery = strQuery & " certificateId = '" & session("certificateID") & "'," 
 strQuery = strQuery & " vendorId = '" & session("vendor") & "'," 
 strQuery = strQuery & " status = '" & rqStatus & "', "
    strQuery = strQuery & " accountmanager = '" & rqaccountmanager & "', "
    strQuery = strQuery & " bookedby = '" & rqbookedby & "', "
    strQuery = strQuery & " bookedon = '" & cdate(rqbookedon) & "' " 
 strQuery = strQuery & " WHERE courseid = '" & rqEditCourseId &"'"
 Rs.Open strQuery,ConnObj


'response.Write(strQuery)
 Session("message") = "You Have Successfully Edited Class"

 Response.Redirect("datrixClass.asp?certificate="&session("certificate")&"")

End If

'Retrive The Delete Id From course.asp Page'

 rqDeleteId = Request.Querystring("delete")

If rqDeleteId <> "" Then

  strQuery = "DELETE FROM datrixClasses WHERE courseid = '" & rqDeleteId & "' AND certificateId = '"& session("certificateID") &"' and vendorId = '"&Session("vendor")&"'"

 Rs.Open strQuery,ConnObj

Session("message") = "You Have Successfully Deleted The Class"


Response.Redirect("datrixClass.asp?certificate="&session("certificate")&"")

End If


''Rs.Close
ConnObj.Close
End If
%>