<%
 '======================================================='
'Written By : Priyanka'
'Last UpDated : 23/09/2010'
'Description :'
' Add/Edit/Delete Course Page and Enrolledusers Page'
'======================================================='
%>
<%
   If Session("UserId") = "" Then
     Response.Redirect("../backOffice/login.asp")
   Else
%>
<!--#include file="./includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<%


'===============================================================================================================================================================================
'Declare The Variables'
'===============================================================================================================================================================================

 Dim message,checkmessage
 Dim courseDate
 Dim strQuery,Rs1,Rs2,courseId,rs3,Rs4,Rs5,Rs6
 Dim arrAllRecords,firstRow,lastRow,numRows,rowcounter
 Dim arrAllQueries,rqType,rqPage,rqRow,enrollrowcounter
 Dim strQuery1,str,str1,i,rqEnrollUsers
 Dim rqEnrollPage,rqEnrollRow,enrolllastRow,enrollfirstRow,enrollnumRows
 Dim strQuery2,strQuery3,strQuery4,allMailSent,strQuery6
 Dim arrAllCities,cityNumRows,cityFirstRow,cityLastRow,cityRowCounter
 Dim strQuery5,rqEnrollUserId,maxRevLevel
 Dim instructorFirstRow,instructorLastRow,arrAllInstructors
 Dim rqCourseId,instructorRowCounter,instructorNumRows
 Dim str2,city,CourseStartDate,CourseEndDateAndCity,CourseEndDate
 Dim enrolledUsers,str3,CourseDetails,rqEditCourseId
 Dim Sql7,Rs7, rqCourse,cnt,allNumRows,iPageCurrent
 Dim Inst, Rs, rqAmount, Course,Currency_Format_Front,Currency_Format_Back
 Dim cancelmailsent,Rs8,rqCertificate,Rs9,rqCerID
 Dim strBrand,rqVendor,rqITILVendor
'Displaying The Messages After Add,Edit and Delete Course'


'===============================================================================================================================================================================
'Getting brand name : PROJstudy'
'===============================================================================================================================================================================

 onsiteclassbrand = Request.QueryString("brand")

If onsiteclassbrand <> "" Then

session("brand") = "Datrix"
session("country") = "United Kingdom"
Session("vendor") = "2"
Else
session("brand") = session("brand")
session("country") =  session("country")
 Session("vendor") =  Session("vendor")
End If
 
 
 
'===============================================================================================================================================================================
'Session msg to display successfull msges'
'=============================================================================================================================================================================== 
 
 message = Session("message")
 Session("message") = ""
 
 
 checkmessage = Session("checkmessage")
 Session("checkmessage") = ""

 
 
'===============================================================================================================================================================================
 'Currency Format Display Functions'
'=============================================================================================================================================================================== 


 Currency_Format_Front = CurrencyFormat_Front(Session("Country"))

 Currency_Format_Back = CurrencyFormat_Back(Session("Country"))
 
 
 
 
'===============================================================================================================================================================================
 'Retrive'
'===============================================================================================================================================================================

'Retrive The Types.It Means Tasks'
 rqCourse =  Request.Querystring("Course")
 rqType =  Request.Querystring("type")

'Retrive The Below Two are Pagination Purpose'

 rqPage =  Request.QueryString("page")
 rqRow  =  Request.QueryString("row")

 rqEnrollPage = Request.Querystring("enrollPage")
 rqEnrollRow = Request.QueryString("enrollRow")
 
 
  
'===============================================================================================================================================================================
 'Records'
'===============================================================================================================================================================================

 Set Rs  = Server.CreateObject("ADODB.Recordset")
 Set Rs1 = Server.CreateObject("ADODB.Recordset")
 Set Rs2 = Server.CreateObject("ADODB.Recordset")
 Set Rs3 = Server.CreateObject("ADODB.Recordset")
 Set Rs4 = Server.CreateObject("ADODB.Recordset")
 Set Rs5 = Server.CreateObject("ADODB.Recordset")
 Set Rs6 = Server.CreateObject("ADODB.Recordset")
 Set Rs7 = Server.CreateObject("ADODB.Recordset")
 Set Rs8 = Server.CreateObject("ADODB.Recordset")
 Set Rs9 = Server.CreateObject("ADODB.Recordset")
 Set Rs11 = Server.CreateObject("ADODB.Recordset")
 Set Rs12 = Server.CreateObject("ADODB.Recordset")


'===============================================================================================================================================================================
'Retriving Certification Name from course page'
'===============================================================================================================================================================================
 

If request.Form("certificate") <> "" Then
 
 rqCertificate = request.Form("certificate")
 
ElseIf request.QueryString("certificate") <> "" Then

  rqCertificate = request.QueryString("certificate")

Else

  rqCertificate = session("certificate")
   
End If

 session("certificate") = rqCertificate
 
 
'===============================================================================================================================================================================
'getting Certificationid from Certification table'
'===============================================================================================================================================================================

If session("certificate") <> "" Then
		 
			 str = "Select * from Certification where CertName = '"&session("certificate")&"' "
			 response.Write(str)
			Rs9.Open str,ConnObj
			rqCerID = Rs9("Cer_ID")
			
			session("certificateID") = rqCerID
			 response.Write(session("certificateID"))
		
End If

'===============================================================================================================================================================================
'Once the course selected from the list of table in course page'
'===============================================================================================================================================================================
 
rqEnrollUsers = Request.Querystring("enrollusers")
 
If Request.Form("CourseId") <> "" then

rqCourseId = Request.Form("CourseId")

 Else
 
rqCourseId = Request.Querystring("CourseId")

End If



'===============================================================================================================================================================================
'PastClasses'
'===============================================================================================================================================================================

If rqCourse = "PastCourses" Then 

'Sql Query For Retrive The course Details'

  If session("brand") = "All" And session("certificate") = "" then
					
		  strQuery = "SELECT courseid,courseName,city,startdate,enddate,status,coursetype,certificateId from course WHERE country = '"& session("country") &"' AND  startdate < '"& Now() &"' AND  certificateId = '"& session("certificateID") &"'"
		  
		  	strQuery = strQuery &" UNION ALL "
		
		strQuery = strQuery & "SELECT courseid,courseName,city,startdate,enddate,status,coursetype,certificateId from datrixClasses WHERE country = '"& session("country") &"' AND  startdate < '"& Now() &"' AND  certificateId = '"& session("certificateID") &"'  order by startdate desc"

			 
	ElseIf session("brand") = "All" And session("certificate") <> "" then
					 
		 strQuery = "SELECT courseid,courseName,city,startdate,enddate,status,coursetype,certificateId from course WHERE country = '"& session("country") &"' AND  startdate < '"& Now() &"' AND  certificateId = '"& session("certificateID") &"'"
		 
		 	strQuery = strQuery &" UNION ALL "
		
		strQuery = strQuery & "SELECT courseid,courseName,city,startdate,enddate,status,coursetype,certificateId from datrixClasses WHERE country = '"& session("country") &"' AND  startdate < '"& Now() &"' AND  certificateId = '"& session("certificateID") &"' order by startdate desc"
	
		
	ElseIf session("brand") = "All" And session("certificate") = "ITIL" then
					 
		 strQuery =  strQuery = "SELECT DISTINCT courseid,city,startdate,enddate,status,coursetype,certificateId,vendorId FROM datrixClasses WHERE country = '"& session("country") &"' And certificateId = '4' And startdate < '"& Now() &"'"
		 
		 
		strQuery = strQuery &" UNION ALL "
		
		strQuery = strQuery & " SELECT DISTINCT courseid,city,startdate,enddate,status,coursetype,certificateId,vendorId  FROM PROJITIL_course WHERE country = '"& session("country") &"'  And certificateId = '3' And startdate < '"& Now() &"' order by startdate asc"

	End If 


'===============================================================================================================================================================================
'FutureClasses and present classes'
'===============================================================================================================================================================================
		  

 
 ElseIf (rqCourse = "FutureCourses" OR rqCourse = "") Then 
 
 'response.Write("test")

			If session("brand") = "All" And session("certificate") = "" then
					 
		  strQuery = "SELECT courseid,courseName,city,startdate,enddate,status,coursetype,certificateId from course WHERE country = '"& session("country") &"' AND  startdate >= '"& Now() &"' AND  certificateId = '"& session("certificateID") &"'"
		  
		   strQuery = strQuery &" UNION ALL "
		
		strQuery = strQuery & "SELECT courseid,courseName,city,startdate,enddate,status,coursetype,certificateId from datrixClasses WHERE country = '"& session("country") &"' AND  startdate >= '"& Now() &"' AND  certificateId = '"& session("certificateID") &"' order by startdate asc"
		 
			 
ElseIf session("brand") = "All" And session("certificate") <> "" And session("certificate") <> "ITIL" then
					
		 strQuery = "SELECT DISTINCT courseid,courseName,city,startdate,enddate,status,coursetype,certificateId from course WHERE country = '"& session("country") &"' And startdate >= '"& Now() &"' AND  certificateId = '"& session("certificateID") &"'"
		 
		 strQuery = strQuery &" UNION ALL "
		
		strQuery = strQuery & "SELECT DISTINCT courseid,courseName,city,startdate,enddate,status,coursetype,certificateId from datrixClasses WHERE country = '"& session("country") &"' And startdate >= '"& Now() &"' AND  certificateId = '"& session("certificateID") &"' order by startdate asc"
		 
		 
ElseIf session("brand") = "All" And session("certificate") = "ITIL" then
					 
		 strQuery = "SELECT DISTINCT courseid,city,startdate,enddate,status,coursetype,certificateId,vendorId FROM datrixClasses WHERE country = '"& session("country") &"' And certificateId = '4' And startdate >= '"& Now() &"'"
		 
		strQuery = strQuery &" UNION ALL "
		
		strQuery = strQuery & " SELECT DISTINCT courseid,city,startdate,enddate,status,coursetype,certificateId,vendorId  FROM PROJITIL_course WHERE country = '"& session("country") &"'  And certificateId = '3' And startdate >= '"& Now() &"' order by startdate asc"
 
End If 
 
 
End If
	
 Rs.Open strQuery,ConnObj
 response.Write(strQuery)
 
 
'Retrive All Values From Query And Doeing Pagination'

  If Not Rs.EOF Then
		arrAllRecords = Rs.getrows
		Session("arrAllRecords") = arrAllRecords
        cnt = 1
		firstRow = 0
		lastRow = 9
		numRows = Ubound(arrAllRecords,2)
		If lastRow > numRows Then
		   lastRow = numRows
		End If
		
		allNumRows = numRows
   End If

'Pagination code'
If cnt = 1 Then 

 If Request.QueryString("page") = "" Then
	
	iPageCurrent = 1

	'arrAllRecords = Session("arrAllRecords")	
	numRows = Ubound(arrAllRecords,2)
	
	 firstRow = 0  
	 If numRows > 9 Then
	    lastRow = 9  
	 Else
	 	lastRow = numRows
	 End If 
  Else
	
	arrAllRecords = Session("arrAllRecords")	
	numRows = Ubound(arrAllRecords,2)
	
	iPageCurrent = Request.QueryString("page") 
    firstRow = ((10 * iPageCurrent)-10) 
     lastRow = firstRow + 9 

    If lastRow > numRows Then
    lastRow = numRows
   End If

    If firstRow < 0 Then
       firstRow = 0
    End If

 End if
 
End If
 
 
'===============================================================================================================================================================================
'If clicked on change certification type then session("certificate") shd be null'
'=============================================================================================================================================================================== 
 

If rqType = "selectcourse" then

 session("certificate") = ""

End if
 
 If session("certificate") = "ITIL" and session("brand") = "All" then
 
 'From the course link'
 rqITILVendor = request.QueryString("ITILVendor")

End If

'===============================================================================================================================================================================
'Sql query For Retrive The Particular Course'
'If Click one course in course page that particular course will display here'
'=============================================================================================================================================================================== 


If rqCourseId <> "" then

   If session("certificate") <> "" then

 
  If session("certificate") = "ITIL" and session("brand") = "All" then     
  
		If rqITILVendor = "Datrix" then
		
		  strQuery1 = "SELECT * FROM datrixClasses WHERE courseid = '"& rqCourseId &"'"
		 
		 Else
		
		 strQuery1 = "SELECT * FROM PROJITIL_course WHERE courseid = '"& rqCourseId &"'"
		 End If
	 
 ElseIf session("brand") = "All"  then
 
		 rqCity = request.QueryString("city")
		 rqStartDate = request.QueryString("startdate")
		 rqEndDate = request.QueryString("enddate")
		 rqCertificate = request.QueryString("certificate")
		 
		 strCertificate = "Select * from certification where CertName = '"&rqCertificate&"'"
		 Rs13.open strCertificate,ConnObj
		 
		 Do until Rs13.eof
		 
		 rqCertId = Rs13("Cer_ID")
		 
		 Rs13.Movenext
		 loop
		 Rs13.close()
				
			strQuery1 = "SELECT DISTINCT courseid,courseName,city,startdate,enddate,starthour,startminute,startsession,endhour,endminute,endsession,instructor,backupinstructor,applicabledays,hotelname,hotelphonenumber,hotelurl,hoteladdress FROM course WHERE city = '"& rqCity &"' and startdate = '"& rqStartDate &"' and enddate = '"& rqEndDate &"'  and certificateId = '"& rqCertId &"'"
		
			   strQuery1 = strQuery1 &" UNION ALL "
				
			strQuery1 = strQuery1 & "SELECT DISTINCT courseid,courseName,city,startdate,enddate,starthour,startminute,startsession,endhour,endminute,endsession,instructor,backupinstructor,applicabledays,hotelname,hotelphonenumber,hotelurl,hoteladdress FROM datrixClasses WHERE city = '"& rqCity &"' and startdate = '"& rqStartDate &"' and enddate = '"& rqEndDate &"'  and certificateId = '"& rqCertId &"'"
			
			
		 
		 End If
		 
		 Rs1.Open strQuery1,ConnObj
		 

   End If

End If

'===============================================================================================================================================================================
'Sql Query For Retrive The enrolledusers particular course'
'=============================================================================================================================================================================== 



If session("certificate") = "ITIL" and session("brand") = "All" then     
  
  
   If rqITILVendor = "Datrix" then
	
	 strQuery2 = "SELECT * FROM enrolledusers WHERE courseid = '"& rqCourseId &"' order by statusnumber asc"
	 
	 Else
	
	 strQuery2 = "SELECT * FROM PROJITIL_enrolledusers WHERE courseid = '"& rqCourseId &"'order by statusnumber asc"
	 
	 
	 End If          
  
Else  

	  strQuery2 = "SELECT * FROM enrolledusers WHERE courseid = '"& rqCourseId &"' order by statusnumber asc"


End If



  Rs2.Open strQuery2,ConnObj

   If Not Rs2.EOF Then

      arrAllQueries = Rs2.getRows
      Session("arrAllQueries") = arrAllQueries
      enrollfirstRow = 0
      enrolllastRow = 24
      enrollnumRows = Ubound(arrAllQueries,2)
      If enrolllastRow > enrollnumRows Then
         enrolllastRow = enrollnumRows
      End IF

 End IF

If rqEnrollPage = "next" Then

   arrAllQueries = Session("arrAllQueries")
   enrollnumRows = Ubound(arrAllQueries,2)


   enrollfirstRow = rqEnrollRow + 1
   enrolllastRow = enrollfirstRow + 24

   If enrollfirstRow >= enrollnumRows Then
      enrollfirstRow = rqEnrollRow + 1
      enrolllastRow = enrollfirstRow + 24
   End If

   If enrollfirstRow < 0 Then
      enrollfirstRow = 0
   End If

   If enrolllastRow > enrollnumRows Then
      enrolllastRow = enrollnumRows
   End If

End If

If rqEnrollPage = "previous" Then

   arrAllQueries = Session("arrAllQueries")
   enrollnumRows = Ubound(arrAllQueries,2)

   enrolllastRow = rqEnrollRow - 1
   enrollfirstRow = enrolllastRow - 24

   If enrollfirstRow =< 0 Then
      enrollfirstRow = 0
      enrolllastRow = enrollfirstRow + 24
   End If

   If enrolllastRow > enrollnumRows Then
      enrolllastRow = enrollnumRows
   End If

End If


'===============================================================================================================================================================================
'Sql Query For Retrive The Cities From City table'
'=============================================================================================================================================================================== 


             
  strQuery3 = "SELECT city FROM city WHERE country = '"& session("country") &"'"


  Rs3.Open strQuery3,ConnObj

  If Not Rs3.EOF Then
     arrAllCities = Rs3.getRows
     Session("arrAllCities") = arrAllCities
     cityNumRows = Ubound(arrAllCities,2)
     cityFirstRow = 0
     cityLastRow  = cityNumRows
  End If
  
  
'===============================================================================================================================================================================
'Sql Query For The Rerive The Course Details For Editing'
'=============================================================================================================================================================================== 

  rqEditCourseId = Request.Querystring("editId")


If rqEditCourseId <> "" then


  strQuery4 = "SELECT * FROM datrixClasses WHERE courseid = '" & rqEditCourseId & "'"


  Rs4.Open strQuery4,ConnObj

End If


'===============================================================================================================================================================================
'Sql Query For The Retrive The enrollusercomments for particular enrolleduser'
'=============================================================================================================================================================================== 


  rqEnrollUserId = Request.Querystring("enrollUserId")
             
   strQuery5 = "SELECT max(revlevel) FROM enrolledusercomments where enrolluserid =  '" & rqEnrollUserId & "'"

   Rs5.Open strQuery5,ConnObj

   do until Rs5.EOF
    For each i in Rs5.Fields
      maxRevLevel = i.value
      session("maxRevLevel") = maxRevLevel
     Next
   Rs5.Movenext
   Loop

  	if Not IsNull(maxRevLevel) then
  	  maxRevLevel = maxRevLevel + 1
  	  Session("maxRevLevel") = maxRevLevel
  	else
  	  maxRevLevel = 1
  	  Session("maxRevLevel") = maxRevLevel
  	end if

'===============================================================================================================================================================================
'Sql Query For Retrive The Instructor Details'
'=============================================================================================================================================================================== 

            
 strQuery6 = "SELECT firstname,lastname from instructor WHERE country = '"& session("country") &"'"
       

 Rs6.Open strQuery6,ConnObj

  If Not Rs6.EOF Then
     arrAllInstructors = Rs6.getRows
     Session("arrAllInstructors") = arrAllInstructors
     instructorNumRows = Ubound(arrAllInstructors,2)
     instructorFirstRow = 0
     instructorLastRow  = instructorNumRows
  End If	


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Datrix Classes</title>
<link href="/backoffice/css/pagestyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="calendar/zapatec.js"></script>
<script type="text/javascript" src="calendar/calendar.js"></script>
<script type="text/javascript" src="calendar/calendar-en.js"></script>
<link href="calendar/template.css" rel="stylesheet" type="text/css">
<link href="calendar/system.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function CityHint(a){
	if(a!='Live') {
	document.getElementById('TxtCity').style.display="none";
	
	}
	else
	{
	document.getElementById('TxtCity').style.display="inline";
	
	}
	
}





</script>


<script language ="javascript">

//Calculating The Taxes And Dicounts

function calculate() {

   var pricewithouttax = document.addcourse.priceWithOutTax.value;
   
   var tax = document.addcourse.tax.value;

   var earlybirddiscount = document.addcourse.earlybirddicount.value;
   
   var x = Math.ceil((pricewithouttax / 100 * tax))

   var monthly = parseInt(pricewithouttax) + parseInt(x)

   var discountwithouttax = parseInt(pricewithouttax) - parseInt(earlybirddiscount)

   var z = Math.round((discountwithouttax / 100 * tax))
   
   var discountwithtax = parseInt(discountwithouttax) + parseInt(z)

   if (!isNaN(monthly) &&   
        (monthly != Number.POSITIVE_INFINITY) &&
        (monthly != Number.NEGATIVE_INFINITY)) {
        document.addcourse.priceWithTax.value = Math.ceil(monthly);

    }

    else {
        document.addcourse.priceWithTax.value = "";
       }

    if (!isNaN(discountwithouttax) &&
        (discountwithouttax != Number.POSITIVE_INFINITY) &&
        (discountwithouttax != Number.NEGATIVE_INFINITY)) {

        document.addcourse.afterearlybirddiscountwithouttax.value = round(discountwithouttax);

    }
    // Otherwise, the user's input was probably invalid, so don't
    // display anything.
    else {
        document.addcourse.afterearlybirddiscountprice.value = "";
       }

   if (!isNaN(discountwithtax) &&
        (discountwithtax != Number.POSITIVE_INFINITY) &&
        (discountwithtax != Number.NEGATIVE_INFINITY)) {

        document.addcourse.afterearlybirddiscountwithtax.value = round(discountwithtax);

    }
    // Otherwise, the user's input was probably invalid, so don't
    // display anything.
    else {
        document.addcourse.afterearlybirddiscountprice.value = "";
       }
}

// This simple method rounds a number to two decimal places.
function round(x) {
  return Math.round(x*100)/100;
}

function validate_required(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
	}
}

function validate_special(field,alerttxt)
{
	var iChars = "!#$%^&*@()+=-[]\\\';,{}|\":<>?";

	with (field)
	{
		for (var i = 0; i < value.length; i++) {
		  	if (iChars.indexOf(value.charAt(i)) != -1) {
		  	alert (alerttxt);
		  	return false;
		  	}
		}
	}
}

 function validate_number(field,alerttxt)
 {
 	var iChars = "0123456789";

 	with (field)
 	{
 		for (var i = 0; i < value.length; i++) {
 		  	if (!(iChars.indexOf(value.charAt(i)) != -1)) {
 		  	alert (alerttxt);
 		  	return false;
 		  	}
 		}
 	}
 }

 function validate_number1(field,alerttxt)
 {
 	var iChars = "0123456789.";

 	with (field)
 	{
 		for (var i = 0; i < value.length; i++) {
 		  	if (!(iChars.indexOf(value.charAt(i)) != -1)) {
 		  	alert (alerttxt);
 		  	return false;
 		  	}
 		}
 	}
 }
 function validate_noNumber(field,alerttxt)
 {
 	var iChars = "0123456789";

 	with (field)
 	{
 		for (var i = 0; i < value.length; i++) {
 		  	if ((iChars.indexOf(value.charAt(i)) != -1)) {
 		  	alert (alerttxt);
 		  	return false;
 		  	}
 		}
 	}
 }

//URL Validation

function isValidURL(url){
    var RegExp = /^(([\w]+:)?\/\/)?(([\d\w]|%[a-fA-f\d]{2,2})+(:([\d\w]|%[a-fA-f\d]{2,2})+)?@)?([\d\w][-\d\w]{0,253}[\d\w]\.)+[\w]{2,4}(:[\d]+)?(\/([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)*(\?(&?([-+_~.\d\w]|%[a-fA-f\d]{2,2})=?)*)?(#([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)?$/;
    if(RegExp.test(url)){
        return true;
    }else{
        return false;
    }
}

function check_it() {
     var theurl=document.addcourse.hotelurl.value;
     var tomatch= /http:\/\/www.[A-Za-z0-9\.-]{3,}\.[A-Za-z]{3}/
     if (tomatch.test(theurl))
     {

         return true;
     }
     else
     {
         window.alert("URL invalid. Try again.");
         return false;
     }
}



function checkUrl(url){
  if(url.value.match(/^(http|ftp)\:\/\/\w+([\.\-]\w+)*\.\w{2,4}(\:\d+)*([\/\.\-\?\&\%\#]\w+)*\/?$/i) ||
     url.value.match(/^mailto\:\w+([\.\-]\w+)*\@\w+([\.\-]\w+)*\.\w{2,4}$/i)){
    return true;
  } else {
    alert("Please Enter The Correct Url");
    url.select();
    url.focus();
    return false;
  }
}

function validate_special1(field,alerttxt)
{
	var iChars = "/^(([\w]+:)?\/\/)?(([\d\w]|%[a-fA-f\d]{2,2})+(:([\d\w]|%[a-fA-f\d]{2,2})+)?@)?([\d\w][-\d\w]{0,253}[\d\w]\.)+[\w]{2,4}(:[\d]+)?(\/([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)*(\?(&?([-+_~.\d\w]|%[a-fA-f\d]{2,2})=?)*)?(#([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)?$/";

	with (field)
	{
		for (var i = 0; i < value.length; i++) {
		  	if(!(iChars.indexOf(value.charAt(i)) != -1)) {
		  	alert (alerttxt);
		  	return false;
		  	}
		}
	}
}


 function Form_Validator(theform)
 {

  var alertsay = "";
  
  // //Check To See If The Course  Field Is Balnk
//
//   if (theform.course.value == "--Select--")
//   {
//     alert("Please select Course Name.");
//     theform.course.focus();
//     return (false);
//   }

 <% If session("certificate") = "" Then %>  
 
 // Check If The certificate Selected Or Not

  if (theform.certificate.selectedIndex == 0)
  {
    alert("Please Select the certification type");
    theform.certificate.focus();
    return (false);
  }
  
<% End If %>  

 // Check If The  City Selected Or Not

  if (theform.city.selectedIndex == 0)
  {
    alert("Please Select the City");
    theform.city.focus();
    return (false);
  }
  
 //Check To See If The Course Start Date Field Is Balnk

   if (theform.startdate.value == "")
   {
     alert("Please enter Course Start Date.");
     theform.startdate.focus();
     return (false);
   }

//Check To See If The Course End Date Field Is Blank

   if (theform.enddate.value == "")
   {
     alert("Please enter Course End Date.");
     theform.enddate.focus();
     return (false);
   }

 //Check To See If The Startdate And Enddate Is Same

  if(theform.startdate.value == theform.enddate.value)
  {
    alert("Start Date and End Date Should Not Be Equal")
    return(false);
  }

  //Check If The Starting Hour Selected Or Not

    if (theform.startinghour.selectedIndex == 0)
    {
      alert("Please Select the Starting Hour");
      theform.startinghour.focus();
      return (false);
    }

   //Check If The Ending Hour Selected Or Not

     if (theform.startingminute.selectedIndex == 0)
     {
       alert("Please Select the Starting Minit");
       theform.startingminute.focus();
       return (false);
     }

   //Check If The Starting Hour Selected Or Not

    if (theform.endinghour.selectedIndex == 0)
    {
      alert("Please Select the Ending Hour");
      theform.endinghour.focus();
      return (false);
    }

   //Check If The Ending Hour Selected Or Not

    if (theform.endingminute.selectedIndex == 0)
    {
       alert("Please Select the Ending Minit");
       theform.endingminute.focus();
       return (false);
    }

  //Check The Starting Time and Ending Times
  
    if (theform.sessionstart.selectedIndex == theform.sessionend.selectedIndex)
    {

    if (theform.startinghour.selectedIndex > theform.endinghour.selectedIndex)
    {
       alert("EndTime Should Not Be LessThan StartTime")

       return (false);
    }
  
   if ((theform.startinghour.selectedIndex == theform.endinghour.selectedIndex) && (theform.startingminute.selectedIndex == theform.endingminute.selectedIndex))
   {
        alert("EndTime Should Not Be EqualTo StartTime")

        return (false);
    }
  
   if ((theform.startinghour.selectedIndex == theform.endinghour.selectedIndex) && (theform.startingminute.selectedIndex > theform.endingminute.selectedIndex))
    {
        alert("EndTimeMinutes ShouldNot  Be GreaterThan StartTimeMinutes")
        return (false);
    }
 }

   //Check If The Instructor Selected Or Not

     if (theform.instructor.selectedIndex == 0)
     {
       alert("Please Select the Instructor");
       theform.instructor.focus();
       return (false);
     }
	 
   //Check If The Instructor Selected Or Not

     if (theform.backupinstructor.selectedIndex == 0)
     {
       alert("Please Select the BackUp Instructor");
       theform.backupinstructor.focus();
       return (false);
     }	 
   
    //Check If The Instructor And BackUp Instructor Is Same
	
     if (theform.instructor.selectedIndex == theform.backupinstructor.selectedIndex)
     {
       alert("Instructor Name and BackUp Instructor name Same")
       theform.backupinstructor.focus();
       return (false);
     }


with (theform)
    {
		//Check If The Price WithOut Tax Field Is Blank
	
        if (validate_required(priceWithOutTax,"Please enter Price WithOut Tax")==false)
			  {priceWithOutTax.focus();return false}

		//Check If The Price WithOut Tax Field Have Special Characters

		if (validate_special(priceWithOutTax,"Please remove the Special Characters in Price WithOut Tax")==false)
					  {priceWithOutTax.focus();return false}

		//Check If The Price WithOut Tax Field Have Numerals
		
		if (validate_number(priceWithOutTax,"Your Price WithOut Tax is not a numeral")==false)
			  {priceWithOutTax.focus();return false}

		//Check If The Tax Field Is Blank
		
        if (validate_required(tax,"Please enter Tax")==false)
			  {tax.focus();return false}

		//Check If The Tax Field Have Numerals
		
		if (validate_number1(tax,"Your tax is not a numeral")==false)
			  {tax.focus();return false}

		//Check If The Tax Field Have Special Characters
				
		if (validate_special(tax,"Please remove the Special Characters in Tax")==false)
					  {tax.focus();return false}
   }

   //Check If The Tax Above 3 And Below 30
   
   if (theform.tax.value<parseFloat(0) || theform.tax.value>parseInt(30))
   {
	    alert("Please Enter Between 0 to 30");
	    theform.tax.focus();
	    return (false);
   }

 with (theform)
    {

		//Check If The Price With Tax Field Is Blank
			
        if (validate_required(priceWithTax,"Please enter Price WithOut Tax")==false)
			  {priceWithTax.focus();return false}

		//Check If The Applicable Days Field Is Blank

        if (validate_required(applicabledays,"Please enter Applicable Days")==false)
			  {applicabledays.focus();return false}

		//Check If The Applicable Days Field Have Speacial Characters

		if (validate_special(applicabledays,"Please remove the Special Characters in Applicable Days")==false)
					  {applicabledays.focus();return false}

		//Check If The Applicable Days Field Have Numerals
				
		if (validate_number(applicabledays,"Your Applicable Days is not a numeral")==false)
			  {applicabledays.focus();return false}

		//Check If The EarlyBird Discount Field Is Blank
		
        if (validate_required(earlybirddicount,"Please enter EarlyBird Discount")==false)
			  {earlybirddicount.focus();return false}

		//Check If The EarlyBird Discount Field Have Numerals
		
		if (validate_number1(earlybirddicount,"Your EarlyBird Discount is not a numeral")==false)
			  {earlybirddicount.focus();return false}

		//Check If The EarlyBird Discount Field Have Numerals
		
		if (validate_special(earlybirddicount,"Please remove the Special Characters in EarlyBird Discount")==false)
					  {earlybirddicount.focus();return false}

       

    }

 }

 //This Function1 Validate Edit Form

 function Form_Validator1(theform)
 {

  var alertsay = "";
  
   //Check If The Course Selected Or Not

  // if (theform.editCourseName.value == "")
//   {
//     alert("Please Select the Course Name");
//     theform.editCourseName.focus();
//     return (false);
//   }
//  


 //Check To See If The Startdate And Enddate Is Same

  if(theform.editstartdate.value == theform.editenddate.value)
  {
    alert("Start Date and End Date Should Not Be Equal")
    return(false);
  }

  //Check The Starting Time and Ending Times
  
  if (theform.editsessionstart.value == theform.editsessionend.value)
  {
    if ((theform.editstartinghour.value == theform.editendinghour.value) && (theform.editstartingminute.value == theform.editendingminute.value))
    {
        alert("EndTime Should Not Be EqualTo StartTime")

        return (false);
    }
  }
 
  if (theform.editsessionstart.value == theform.editsessionend.value)
  {
  
   if (theform.editstartinghour.value > theform.editendinghour.value)
   {
        alert("EndTime Should Not Be LessThan StartTime")

        return (false);
   }

 }

 if (theform.editsessionstart.value != theform.editsessionend.value)
 {

   if ((theform.editstartinghour.value == theform.editendinghour.value) && (theform.editstartingminute.value > theform.editendingminute.value))
   {
      alert("EndTimeMinutes ShouldNot Be GreaterThan StartTimeMinutes")
       return (false);
   }

 }

//Check If The City Selected Or Not

   if (theform.editinstructor.value == "")
   {
     alert("Please Select the Instructor");
     theform.editinstructor.focus();
     return (false);
   }

//Check If The City Selected Or Not

   if (theform.editbackupinstructor.value == "")
   {
     alert("Please Select the BackUp Instructor");
     theform.editbackupinstructor.focus();
     return (false);
   }

//Check If The Instructor And BackUp Instructor Is Same
	
    if (theform.editinstructor.value == theform.editbackupinstructor.value)
    {
       alert("Instructor Name and BackUp Instructor name Same")
       theform.editbackupinstructor.focus();
       return (false);
    }

with (theform)
    {
		//Check If The Price WithOut Tax Field Is Blank
			
        if (validate_required(priceWithOutTax,"Please enter Price WithOut Tax")==false)
			  {priceWithOutTax.focus();return false}

		//Check If The Price WithOut Tax Field Have Special Characters
		
		if (validate_special(priceWithOutTax,"Please remove the Special Characters in Price WithOut Tax")==false)
					  {priceWithOutTax.focus();return false}

		//Check If The Price WithOut Tax Field Have Numerals
		
		if (validate_number(priceWithOutTax,"Your Price WithOut Tax is not a numeral")==false)
			  {priceWithOutTax.focus();return false}

		//Check If The Tax Field Is Blank
		
        if (validate_required(tax,"Please enter Tax")==false)
			  {tax.focus();return false}

		//Check If The Tax Field Have Numerals
		
		if (validate_number1(tax,"Your tax is not a numeral")==false)
			  {tax.focus();return false}

		//Check If The Tax Field Have Special Characters
		
		if (validate_special(tax,"Please remove the Special Charactesr in Tax")==false)
					  {tax.focus();return false}
     }
	 
   //Check If The Tax Above 3 And Below 30
       
	 if (theform.tax.value<parseFloat(0) || theform.tax.value>parseInt(30))
	 {
	     alert("Please Enter Between 0 to 30");
	     theform.tax.focus();
	     return (false);
     }

with(theform)
    {

		//Check If The Price With Tax Field Is Blank
		
        if (validate_required(priceWithTax,"Please enter Price WithOut Tax")==false)
  	     {priceWithTax.focus();return false}

		//Check If The Applicable Days Field Is Blank
		
         if (validate_required(applicabledays,"Please enter Applicable Days")==false)
 			  {applicabledays.focus();return false}

		//Check If The Applicable Days Field Have Speacial Characters
		
 		if (validate_special(applicabledays,"Please remove the Special Characters in Applicable Days")==false)
 					  {applicabledays.focus();return false}

		//Check If The Applicable Days Field Have Numerals
		
 		if (validate_number(applicabledays,"Your Applicable Days is not a numeral")==false)
 			  {applicabledays.focus();return false}

		//Check If The EarlyBird Discount Field Is Blank
		
         if (validate_required(earlybirddicount,"Please enter EarlyBird Discount")==false)
 			  {earlybirddicount.focus();return false}

		//Check If The EarlyBird Discount Field Have Numerals
		
 		if (validate_number1(earlybirddicount,"Your EarliBird Discount is not a numeral")==false)
 			  {earlybirddicount.focus();return false}

		//Check If The EarlyBird Discount Field Have Numerals
		
 		if (validate_special(earlybirddicount,"Please remove the Special Characters in EarlyBird Discount")==false)
					  {earlybirddicount.focus();return false}

		


     }

}

//This Function For Without Clicking Radio Button In Course Page

function Form_Validator2(theform)
{

 if (theform.review.checked == "")
 {
   alert("Please Select Yes");
   return false;
 }
 
 if (theform.Paymentdate.value == "")
 {
   alert("Please Enter Check Received Date");
   theform.Paymentdate.focus();
   return false;
 }
  
  else
	 {
	
	 	var answer = confirm("Are you sure ?")

		if (answer==false)
		{
			theform.review.focus();
       		return (false);
		}
		
	  }
} 

function Form_Validator3(theform)
{
 with(theform)  
 {

   if (validate_required(notes,"Please enter Comment")==false)
      {notes.focus();return false}
   
 }  

}

function Form_Validator4(theform)
{
  if (theform.enrollStatus.selectedIndex == 0)
     {
       alert("Please Select the Enroll Status");
       theform.enrollStatus.focus();
       return (false);
     }	
	 
	  //Check To See If The Enrollstatus value is P.O.Received And POexpected value is nothing  
	   
	if (theform.enrollStatus.value == 'P.O Received' && theform.POexpected.value == "")
	  {
		alert("Please enter P.O Expected date");
		theform.POexpected.focus();
		return(false);	
	  }
  
    //Check To See If The Enrollstatus value is other then P.O.Received And POexpected value is nothing  
	   
	if (theform.enrollStatus.value != 'P.O Received' && theform.POexpected.value != "")
	  {
		alert("No need of date for this P.O Expected Date");
		theform.POexpected.focus();
		return(false);	
	  }
	 
	 else
	 {
	 	var answer = confirm("Are you sure ?")
		if (answer==false)
		{
			theform.enrollStatus.focus();
       		return (false);
		}
		
	  }
   } 
   
 //This Function Is For Dropdown Button And Confirmation Message For EnrollStatus In Course Page

function Form_Validator5(theform)
{
     if (theform.changestatus.selectedIndex == 0)
     {
       alert("Please select the status");
       theform.changestatus.focus();
       return (false);
     }	
	 else
	 {
	 	var answer = confirm("Are you sure ?")
		if (answer==false)
		{
			theform.changestatus.focus();
       		return (false);
		}
		
	  }
	  
   } 
   
 //This Function Is to confirm deleting course In Course Page
function DeleteAlert(link) {
  if(confirm("Are you sure you want to delete?"))
  {
      return true;
  }
return false;
}
//This Function Is POPUp Window For Rescheduling Courses

function openit(theform)       
{
 var courseDate = theform.enrolldate.value;
 var enrolledUserId = theform.enrollUserId.value

 if(theform.changestatus.value == "Re-Schedule" ){
  
  newWindow = window.open('reScheduledCourses.asp?courseDate='+courseDate+'&enrollUserId='+enrolledUserId, 'myWindow','toolbar,scrollbars,location,status=yes,menubar,resizable,minimizable=0,width=800,height=333,left = 175,top = 140');
  
  }
}


</script>
<script language="javascript" type="text/javascript">
<!--

function popitup(url) {
	newwindow=window.open(url,'name','toolbar=0,location=0,directories=0,status,menubar=0,scrollbars=0,minimizable=0,resizable=0,height=300,width=300,top=250,left=400');
	if (window.focus) {newwindow.focus()}
	return false;
}

// -->
<!--  PROJstudy -->
</script>
</head>
<body>
<div id="htMap">
  <table border="1" width="1150px" class="dbborder"  height="550" cellspacing="0" >
  
<!--===============================================================================================================================================================================
'Title of the page'
'===============================================================================================================================================================================-->

    <tr>
      <td colspan="3" height="35"><div align="center">
    <font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"> <% = Session("country") %></span>  Back Office</font>
    </div>
    </td>
    </tr>
    
<!--===============================================================================================================================================================================
'Left menu'
'===============================================================================================================================================================================-->
    
    <tr>
      <td width="100px" valign="top" rowspan="22"><!--#include file="includes/leftMenu.html"-->
      </td>
    </tr>
    
    
<!--===============================================================================================================================================================================
'Select certification type'
'===============================================================================================================================================================================-->
     <tr id="htMap">
       <td rowspan="22"> 
    <% If session("certificate") = "" Then %>  
    

    <form action="PROJDatrixClass.asp" name="price" method="post" onsubmit="return Form_Validator(this)">
   <table  width="100%" cellpadding="3" cellspacing="5">
     <tr align="center"><td >
      <b>Select the type of certification</b>:
                    		<select name="certificate" id="certificate" value="certificate">
                                 <option value="0" selected="selected">-- Select certificate --</option>
                                 
                                  <%  strQuery = "SELECT DISTINCT CertName FROM Certification"
                                  'response.Write(strQuery)
                                   Rs12.Open strQuery,ConnObj
               
                                  Do until Rs12.EOF
                                    
                                   %>
                                   
                               <option value="<% = Rs12("CertName")%>"><% = Rs12("CertName")%></option>
                               
                                <%   Rs12.movenext
                                     loop
                                     Rs12.close()
                                    
                                   %>
                                   
                            </select>
                    </td></tr>
                    
                    
                    
      <tr>
        <td colspan="2" align="center"><input type="submit" name="submit" value="Submit" class="buttonc" align="middle"></td>
      </tr>
</table>
</form>


<!--===============================================================================================================================================================================
'After Selecting certification type'
'===============================================================================================================================================================================-->

  
  <% elseIf session("certificate") <> ""  Then %>
  
<!--===============================================================================================================================================================================
'Add class, past classes, future classes'
'===============================================================================================================================================================================-->


    <tr id="htMap">
      <td  height="25px" > <% If Session("typeofuser") <> "CSR" Then %><a href="PROJDatrixClass.asp?type=add&certificate=<% = rqCertificate %>">Add Class </a> |  <% End If %> <a href="PROJDatrixClass.asp?Course=PastCourses&certificate=<% = rqCertificate %>">Past Classes</a> | <a href="PROJDatrixClass.asp?Course=FutureCourses&certificate=<% = rqCertificate %>">Future Classes</a> | <a href="PROJDatrixClass.asp?type=selectcourse"><span style="color:#FF3300">Change certification type</span></a></td>
    </tr>
    
    
<!--===============================================================================================================================================================================
                                                                        Add class 
'===============================================================================================================================================================================-->
    
    <% If rqType = "add" Then %>
    
    
    <tr>
      <td align="left" height="200px">
      
      <form name="addcourse" action="addEditDeletedatrixClass.asp" method="post" onsubmit="return Form_Validator(this)">
      
        <form onreset="resetDates()">
        
    <table border="0" cellpadding="5" width="1500px" align="left" cellspacing="6">
    
        <tr>
          <td align="center" colspan="4" class="h3">Add Class</td>
        </tr>
        
<% if checkmessage<>"" then %>
        
     <tr>
      <td colspan="2" align="center"><font face="Arial" size="2" color="orangered">
      	  
	  <script type="text/javascript">
	  alert("<% = checkmessage %>")
	  </script>
      
	  </font></td>
    </tr>
    
    
<% End If %>


 <tr>
        <td>Course Type:</td>
        
          <td>&nbsp;&nbsp;
          
                 <select name="coursetype" id="coursetype" onchange="CityHint(this.value);">
                 <% If Session("country") <> "Other" Then %>
                  <option value="">--Select--</option>
                  <option value="Normal">Normal</option>
                  <option value="Corporate">Corporate</option>
                  <option value="Weekend">Weekend</option>
                  <option value="Live">Live</option>
                  <% ElseIf Session("country") = "Other" Then %>
                  <option value="">--Select--</option>
                  <option value="Live">Live</option>
                  <% End IF %>
                </select>
                
          </td>
          
  </tr>
     
    
    
     
        
  <tr>
        <td>Course Name:</td>
          <td>&nbsp;&nbsp;
          <%
		  Dim Sql,RsRef
		  
		  Set RsRef = server.CreateObject("ADODB.Recordset")
		  
		  Sql = "select * from datrixCourse WHERE certificationId = '"&session("certificateID")&"' order by courseid desc"
		  ' response.Write(Sql)
	      RsRef.open Sql,ConnObj
		  %>
            <select name="course" id="course" onChange="clicked();">
              <option value="--Select--">--Select--</option>
              
              	<% do until RsRef.EOF 
			   for each i in RsRef.Fields %>
               
              <option value="<% = RsRef("courseName") %>:<% = RsRef("RefNumber") %>:<% = RsRef("Duration") %>"><% = RsRef("courseName") %> - <% = RsRef("RefNumber") %> - <% = RsRef("Duration") %></option>
              <% next
			   RsRef.movenext
		       loop %>	
            </select>
          </td>
  </tr>
        
     
     
     
        
        
 <tr>
      <td>City:</td>
          
          <td colspan="3">&nbsp;&nbsp;
            <select name="city" id="city" onChange="clicked();">
              <option>--Select--</option>
              
              <% If IsArray(arrAllCities) Then
                For cityRowCounter = cityFirstRow to cityLastRow %>
                
              <option value="<% = arrAllCities(0,cityRowCounter) %>"><% = arrAllCities(0,cityRowCounter) %></option>
              
              <% Next
          End If %> 
          
            </select>
            <span id="TxtCity" style="display:none;"> <br /> &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">Please Select Live option for the live courses</font></span>
          </td>
</tr>


        <tr>
          <td class="zpCalSubheader"> Date Begin: </td>
          <td><input autocomplete="off" name="startdate" readonly id="checkIn_date" type="text">
            <input value=" ... " id="button8a" class="buttonc" type="reset">
          </td>
          <td class="zpCalSubheader"> Date End: </td>
          <td><input autocomplete="off" name="enddate" readonly id="checkOut_date" type="text">
            <input value=" ... " id="button8b" class="buttonc" type="reset">
          </td>
        </tr>
        
        
        
        <tr>
         <td colspan="4"><b>Weekend Courses:</b></td>
        </tr>
        
        
        <tr>
          <td class="zpCalSubheader"> Course Dates: </td>
          <td><input type="text" name="coursedate" >
          </td>
        </tr>
        
        
        
        <tr>
          <td>Start Time:</td>
          <td width="350px">&nbsp;&nbsp;
            <select name="startinghour">
              <option value="">HH</option>
              <option>01</option>
              <option>02</option>
              <option>03</option>
              <option>04</option>
              <option>05</option>
              <option>06</option>
              <option>07</option>
              <option>08</option>
              <option>09</option>
              <option>10</option>
              <option>11</option>
              <option>12</option>
            </select>
            <select name="startingminute">
              <option value="">MIN</option>
              <option>00</option>
              <option>15</option>
              <option>30</option>
              <option>45</option>
            </select>
            <select name="sessionstart">
              <option>AM</option>
              <option>PM</option>
            </select>
          </td>
          
          
          <td>End Time:</td>
          <td width="600px">&nbsp;&nbsp;
            <select name="endinghour">
              <option value="">HH</option>
              <option>01</option>
              <option>02</option>
              <option>03</option>
              <option>04</option>
              <option>05</option>
              <option>06</option>
              <option>07</option>
              <option>08</option>
              <option>09</option>
              <option>10</option>
              <option>11</option>
              <option>12</option>
            </select>
            <select name="endingminute">
              <option value="">MIN</option>
              <option>00</option>
              <option>15</option>
              <option>30</option>
              <option>45</option>
            </select>
            <select name="sessionend">
              <option>AM</option>
              <option>PM</option>
            </select>
          </td>
        </tr>
        
        
        
   <% If Session("country") = "US" OR Session("country") = "Canada" OR Session("country") = "United Kingdom"  Then %>
       
       
        <tr>
        
        
          <td>Instructor:</td>
          <td>&nbsp;&nbsp;
            <select name="instructor" id="instructor" style="width:150px">
              <option value="">--Select--</option>
              <% If IsArray(arrAllInstructors) Then
          		 For instructorRowCounter = instructorFirstRow to instructorLastRow 
				 Inst = Trim(arrAllInstructors(0,instructorRowCounter)) &" "& Trim(arrAllInstructors(1,instructorRowCounter))
			  %>
              <option value="<% = Inst %>">
              <% = arrAllInstructors(0,instructorRowCounter)%>
              &nbsp;
              <% = arrAllInstructors(1,instructorRowCounter) %>
              </option>
              <% Next
          		 End If %>
            </select>
          </td>
          
          
          <td >BackUp Instructor:</td>
          <td>&nbsp;&nbsp;
            <select name="backupinstructor" id="backupinstructor" style="width:150px">
              <option value="">--Select--</option>
              <% If IsArray(arrAllInstructors) Then
                 For instructorRowCounter = instructorFirstRow to instructorLastRow 
				 Inst = Trim(arrAllInstructors(0,instructorRowCounter)) &" "& Trim(arrAllInstructors(1,instructorRowCounter))
			  %>
              <option value="<% = Inst %>">
              <% = arrAllInstructors(0,instructorRowCounter)%>
              &nbsp;
              <% = arrAllInstructors(1,instructorRowCounter) %>
              </option>
              <% Next
          End If %>
            </select>
          </td>
          
          
        </tr>
        
        
        <% Else %>
        
        
        <tr>
          <td>Instructor:</td>
          <td>&nbsp;&nbsp;
            <select name="instructor" id="instructor" style="width:150px">
              <option value="">--Select--</option>
              <% If IsArray(arrAllInstructors) Then
          		 For instructorRowCounter = instructorFirstRow to instructorLastRow 
		  		 Inst = Trim(arrAllInstructors(0,instructorRowCounter)) &" "& Trim(arrAllInstructors(1,instructorRowCounter))
		     %>
              <option value="<% = Inst %>">
              <% = arrAllInstructors(0,instructorRowCounter)%>
              &nbsp;
              <% = arrAllInstructors(1,instructorRowCounter) %>
              </option>
              <% Next
          End If %>
            </select>
          </td>
          
          
          <td >BackUp Instructor:</td>
          <td>&nbsp;&nbsp;
            <select name="backupinstructor" id="backupinstructor" style="width:150px">
              <option value="">--Select--</option>
              <% If IsArray(arrAllInstructors) Then
                 For instructorRowCounter = instructorFirstRow to instructorLastRow 
		  		 Inst = Trim(arrAllInstructors(0,instructorRowCounter)) &" "& Trim(arrAllInstructors(1,instructorRowCounter))
		  %>
              <option value="<% = Inst %>">
              <% = arrAllInstructors(0,instructorRowCounter)%>
              &nbsp;
              <% = arrAllInstructors(1,instructorRowCounter) %>
              </option>
              <% Next
          End If %>
            </select>
          </td>
        </tr>
        
        
  <% End If %>
        
        
         
        <tr>
          <td  width="250px">Hotel Name: </td>
          <td><input type="text" maxlength="200" name="hotelname"></td>
          <td  width="310px">Hotel Phone Number: </td>
          <td><input type="text" maxlength="50" name="hotelphonenumber">
            <br />
            <font face="Arial" color="red" size="2">(Ex : 0802345678 )</font></td>
        </tr>
        
        
        
        
   <form onSubmit="return checkUrl(this.hotelurl)">
          <tr>
              <td  width="250px">Hotel URL: </td>
              <td><input type="text" id="hotelurl" maxlength="300" name="hotelurl">
                <br />
                <font face="Arial" color="red" size="2">(Ex : http://www.ashoka.com)</font></td>
            </tr>
            
            
          <tr>
              <td  width="280px">Hotel Address: </td>
              <td><textarea name="hoteladdress"  rows="4" cols="25"></textarea></td>
            </tr>
            
            
            
          <tr>
              <td colspan="4" align="center"><input type="submit" name="addcourse" value="Add Course" class="buttonc" >
              </td>
            </tr>
   </form>
        
        
        
        
        
    <tr>
      <td colspan="2" align="center"><font face="Arial" size="2" color="orangered"><%=message%></font></td>
    </tr>
    
    
  </table>
  
  </form>
  
  
  </td>
  </tr>
  
  
  <% End If 


'===============================================================================================================================================================================
												                           'Edit Class'
'===============================================================================================================================================================================



 If rqType = "Edit" Then %>
 
 
  <tr>
    <td  height="200px">
    
<form name="addcourse" action="addEditDeletedatrixClass.asp" method="post" onsubmit="return Form_Validator1(this)">
    
        <table border="0" cellpadding="5" width="1500px" align="left" cellspacing="6">
         
          <tr>
            <td align="center" colspan="4" class="h3">Edit Class</td>
          </tr>
          
          
     <tr>
        <td>Course Type:</td>
          <td>&nbsp;&nbsp;
             <select name="editcoursetype" id="editcoursetype">
              <option value="<% = Rs4("coursetype") %> ">
                <% = Rs4("coursetype") %>
              <option value="" disabled="disabled">--Select--</option>
              <option value="Normal">Normal</option>
              <option value="Corporate">Corporate</option>
               <option value="Weekend">Weekend</option>
			   <option value="Live">Live</option>
            </select>
          </td>
        </tr>
        
        
        
 <tr>
            <td>Course Name:</td>
            <td>&nbsp;&nbsp;      
            <%
		   Dim Sql1,RsRef1
		  
		  Set RsRef1 = server.CreateObject("ADODB.Recordset")
		  
		  Sql1 = "select * from datrixCourse WHERE certificationId = '"&session("certificateID")&"' order by courseid desc"
	      RsRef1.open Sql1,ConnObj
		  %>
            <select name="editCourseName" id="editCourseName" onChange="clicked();">
            <option value="<% = Rs4("courseName") %>:<% = Rs4("RefNumber") %>:<% = Rs4("duration") %>" selected="selected"><% = Rs4("courseName") %> - <% = Rs4("RefNumber") %> - <% = Rs4("duration") %></option>
              <option value="--Select--" disabled="disabled">--Select--</option>
              
              	<% do until RsRef1.EOF 
			   for each i in RsRef1.Fields %>
               
              <option value="<% = RsRef1("courseName") %>:<% = RsRef1("RefNumber") %>:<% = RsRef1("Duration") %>"><% = RsRef1("courseName") %> - <% = RsRef1("RefNumber") %> - <% = RsRef1("Duration") %></option>
              <% next
			   RsRef1.movenext
		       loop %>	
            </select>   
            </td>
</tr>          
        
        
          <% do until Rs4.EOF %>
        <tr>
            <input type="hidden" name="editcourseId" value="<% = Rs4("courseid") %>">
            <td>City:</td>
            <td>&nbsp;&nbsp;
              <select name="editcity" id="city" onChange="clicked();">
                <option value="<% = Rs4("city") %> ">
                <% = Rs4("city") %>
                </option>
                <option value="" disabled="disabled">--Select--</option>
                <% If IsArray(arrAllCities) Then
           For cityRowCounter = cityFirstRow to cityLastRow %>
                <option value="<% = arrAllCities(0,cityRowCounter) %>">
                <% = arrAllCities(0,cityRowCounter) %>


                </option>
                <% Next
           End If %>
              </select><br />
              &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">Please Select Live option for the live courses if city is not yet conformed </font>
            </td>
      </tr>
      
      
      
          <tr>
            <td class="zpCalSubheader"> Date Begin: </td>
            <td><input autocomplete="off" name="editstartdate" readonly value="<% = Rs4("startdate") %>" id="checkIn_date" type="text">
              <input value=" ... " id="button8a" class="buttonc" type="reset">
            </td>
            
            
            <td class="zpCalSubheader"> Date End: </td>
            <td><input autocomplete="off" name="editenddate" readonly value="<% = Rs4("enddate") %>" id="checkOut_date" type="text">
              <input value=" ... " id="button8b" class="buttonc" type="reset">
            </td>
          </tr>
          
      
      <tr>
         <td colspan="4"><b>Weekend Courses:</b></td>
     </tr>
     
     
     <tr>
        <td class="zpCalSubheader"> Course Dates: </td>
        <td><input type="text" name="editcoursedate" value="<% = Rs4("coursedates") %>">
        </td>
   </tr>
   
   
   <tr>
       <td>Start Time:</td>
       <td width="350px" >&nbsp;&nbsp;
              <select name="editstartinghour">
                <option value="<% = Rs4("starthour") %>">
                <% = Rs4("starthour") %>
                </option>
                <option value="" >HH</option>
                <option>01</option>
                <option>02</option>
                <option>03</option>
                <option>04</option>
                <option>05</option>
                <option>06</option>
                <option>07</option>
                <option>08</option>
                <option>09</option>
                <option>10</option>
                <option>11</option>
                <option>12</option>
              </select>
              <select name="editstartingminute">
                <option value="<% = Rs4("startminute") %>">
                <% = Rs4("startminute") %>
                </option>
                <option value="" >MIN</option>
                <option>00</option>
                <option>15</option>
                <option>30</option>
                <option>45</option>
              </select>
              <select name="editsessionstart">
                <option selected="selected">
                <% = Rs4("startsession") %>
                </option>
                <option>AM</option>
                <option>PM</option>
              </select>
            </td>
            
            
            <td>End Time:</td>
            
            <td width="600px">&nbsp;&nbsp;
              <select name="editendinghour">
                <option value="<% = Rs4("endhour") %>">
                <% = Rs4("endhour") %>
                </option>
                <option value="" >HH</option>
                <option>01</option>
                <option>02</option>
                <option>03</option>
                <option>04</option>
                <option>05</option>
                <option>06</option>
                <option>07</option>
                <option>08</option>
                <option>09</option>
                <option>10</option>
                <option>11</option>
                <option>12</option>
              </select>
              <select name="editendingminute">
                <option value="<% = Rs4("endminute") %>">
                <% = Rs4("endminute") %>
                </option>
                <option value="" >MIN</option>
                <option>00</option>
                <option>15</option>
                <option>30</option>
                <option>45</option>
              </select>
              <select name="editsessionend">
                <option value="<% = Rs4("endsession") %>">
                <% = Rs4("endsession") %>
                </option>
                <option>AM</option>
                <option>PM</option>
              </select>
              </td>
     </tr>
          
          
            <% If Session("country") = "US" OR Session("country") = "Canada" OR Session("country") = "United Kingdom"  Then %>
            
            
          <tr>
          
            <td>Instructor:</td>
            
            <td>&nbsp;&nbsp;
              <select name="editinstructor" id="instructor" style="width:150px">
                <option value="<% = Rs4("instructor") %>">
                <% = Rs4("instructor") %>
                </option>
                <option value="" disabled="disabled">--Select--</option>
                <% If IsArray(arrAllInstructors) Then
          		   For instructorRowCounter = instructorFirstRow to instructorLastRow 
				   Inst = Trim(arrAllInstructors(0,instructorRowCounter)) &" "& Trim(arrAllInstructors(1,instructorRowCounter))
    		    %>
                <option value="<% = Inst %>">
                <% = arrAllInstructors(0,instructorRowCounter)%>
                &nbsp;
                <% = arrAllInstructors(1,instructorRowCounter) %>
                </option>
                <% Next
          		   End If  %>
              </select>
            </td>
            
            
            
            <td>BackUp Instructor:</td>
            <td>&nbsp;&nbsp;
              <select name="editbackupinstructor" id="backupinstructor" style="width:150px">
                <option value="<% = Rs4("backupinstructor") %>">
                <% = Rs4("backupinstructor") %>
                </option>
                <option value="" disabled="disabled">--Select--</option>
                <% If IsArray(arrAllInstructors) Then
          		   For instructorRowCounter = instructorFirstRow to instructorLastRow 
				   Inst = Trim(arrAllInstructors(0,instructorRowCounter)) &" "& Trim(arrAllInstructors(1,instructorRowCounter))
				%>
                <option value="<% = Inst %>">
                <% = arrAllInstructors(0,instructorRowCounter)%>
                &nbsp;
                <% = arrAllInstructors(1,instructorRowCounter) %>
                </option>

                <% Next
                   End If %>
              </select>
            </td>
          </tr>
          
          
          <% Else %>
          
          
          <tr>
            <td>Instructor:</td>
            <td>&nbsp;&nbsp;
              <select name="editinstructor" id="instructor" style="width:150px">
                <option value="<% = Rs4("instructor") %>">
                <% = Rs4("instructor") %>
                </option>
                <option value="" disabled="disabled">--Select--</option>
                <% If IsArray(arrAllInstructors) Then
          For instructorRowCounter = instructorFirstRow to instructorLastRow %>
                <option value="<% =Trim( arrAllInstructors(0,instructorRowCounter)) %> <% = Trim(arrAllInstructors(0,instructorRowCounter)) %>">
                <% = arrAllInstructors(0,instructorRowCounter)%>
                &nbsp;
                <% = arrAllInstructors(1,instructorRowCounter) %>
                </option>
                <% Next
          End If %>
              </select>
            </td>
            
            
            <td>BackUp Instructor:</td>
            <td>&nbsp;&nbsp;
              <select name="editbackupinstructor" id="backupinstructor" style="width:150px">
                <option value="<% = Rs4("backupinstructor") %>">
                <% = Rs4("backupinstructor") %>
                </option>
                <option value="" disabled="disabled">--Select--</option>
                <% If IsArray(arrAllInstructors) Then
          For instructorRowCounter = instructorFirstRow to instructorLastRow %>
                <option value="<% = Trim(arrAllInstructors(0,instructorRowCounter)) %> <% = Trim(arrAllInstructors(0,instructorRowCounter)) %>">
                <% = arrAllInstructors(0,instructorRowCounter)%>
                &nbsp;
                <% = arrAllInstructors(1,instructorRowCounter) %>
                </option>
                <% Next
          End If %>
              </select>
            </td>
          </tr>
          
          
          <% End If %>
          
          
           
           
          <tr>
            <td  width="250px">Hotel Name: </td>
            <td><input type="text" name="edithotelname" value="<% = Rs4("hotelname") %>"></td>
            <td  width="310px">Hotel Phone Number: </td>
            <td><input type="text" maxlength="50" name="edithotelphonenumber" value="<% = Rs4("hotelphonenumber") %>">
              <br />
              <font face="Arial" color="red" size="2">(Ex : 0802345678 )</font></td>
          </tr>
          
          
          <tr>
            <td  width="250px">Hotel URL: </td>
            <td><input type="text" maxlength="300" name="edithotelurl" value="<% = Rs4("hotelurl") %>">
              <br />
              <font face="Arial" color="red" size="2">(Ex : http://www.ashoka.com)</font></td>
          </tr>
          
          
          <tr>
            <td  width="280px">Hotel Address: </td>
            <td><textarea name="edithoteladdress"  rows="4" cols="25"><% = Rs4("hoteladdress") %>
</textarea></td>
          </tr>
          
          
          <tr>
            <td>Status : </td>
            <td><select name="status">
                <option <% If Rs4("status") = "Available" Then %> selected="selected" <% End If %> value="Available">Available</option>
                <option <% If Rs4("status") = "Avail-4ED" Then %> selected="selected" <% End If %> value="Avail-4ED">Avail-4ED</option>
                <option <% If Rs4("status") = "Full" Then %> selected="selected" <% End If %> value="Full">Full</option>
                <option <% If Rs4("status") = "Full-4ED" Then %> selected="selected" <% End If %> value="Full-4ED">Full-4ED</option>
                <option <% If Rs4("status") = "4thEdition" Then %> selected="selected" <% End If %> value="4thEdition">4thEdition</option>
                <option <% If Rs4("status") = "Cancelled" Then %> selected="selected" <% End If %> value="Cancelled">Cancelled</option>
                <option <% If Rs4("status") = "Completed" Then %> selected="selected" <% End If %> value="Completed">Completed</option>
              </select>
            </td>
          </tr>
          
          


          <tr>
            <td colspan="4" align="center"><input type="submit" name="editcourse" value="Edit Course" class="buttonc">
            </td>
         </tr>
         
         
        </table>
        
</form>
      
      </td>
  </tr>
  
  <% 
    Rs4.Movenext
    Loop 
    End If 
'===============================================================================================================================================================================
												                           'Display Class'
'===============================================================================================================================================================================

 %>
 
 
  <tr>
  
  <td height="3765" valign="top">
  
<!--===============================================================================================================================================================================
												                           'Display Class'
'===============================================================================================================================================================================-->
  
  
  <table border="0" style="margin-left:-4px;margin-top:-4px;">
  
  
  
      <tr>
        <td>
        
<!--===============================================================================================================================================================================
												                           'class drop down'
'===============================================================================================================================================================================-->


        <table border="1" cellpadding="5" cellspacing="0">
        
        
          <form name="course" action="PROJDatrixClass.asp?type=submit" method="post">
          
          
         
 <tr>
        
        <td><b>Classes:</b></td>
 			<td colspan="6"><select name="CourseId" id="courses" style="width:350px">
             <option value="">-- Select --</option>
             <% If IsArray(arrAllRecords) Then
          		 For rowcounter = firstRow to allNumRows 
				courseId = arrAllRecords(0,rowcounter) 
				
			  %>
             
                 
                 <option value="<% = courseId %>"><% = arrAllRecords(1,rowcounter) %>&nbsp;-&nbsp;<% = arrAllRecords(2,rowcounter) %>&nbsp;:&nbsp;<% = FormatDateTime(arrAllRecords(3,rowcounter),1) %>&nbsp;to&nbsp;<% = FormatDateTime(arrAllRecords(4,rowcounter),1) %></option>
             
                 
         <% Next %>
		
          		<% End If %>
                    
 				</select>
   
      <input type="submit" id="submit" value="Submit"/></td>
                
</tr>
          </form>
          
          
 <!--===============================================================================================================================================================================
												                           'class Tabel'
'===============================================================================================================================================================================-->
   
          
        <tr height="25">
        
              <td bgcolor="#A7DBFB" align="center"><b>Certification Type</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Course Type</b></td>
              <% If session("certificate") = "PRINCE2" Then %>  
              <td bgcolor="#A7DBFB" align="center"><b>Coursename</b></td>
               <% End If %>
              <td bgcolor="#A7DBFB" align="center"><b>Location</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Course</b></td>
              <% If Not Session("typeofuser") = "CSR" Then %>
              <td bgcolor="#A7DBFB" align="center"><b>Edit</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Delete</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Status</b></td>
              <% End If %>
              
         </tr>
            
            
                <% If IsArray(arrAllRecords) Then
				   FOR rowcounter = firstRow TO lastRow
                %> 
                
                
   <tr id="htMap">
            
             
            <td>
			   <% 
			  'If itil is selected'	
 
			 strBrand = "SELECT * from Certification WHERE Cer_ID = '"&arrAllRecords(7,rowcounter)&"'"
			 'response.Write(strBrand)
				Rs11.Open strBrand,ConnObj
				
				Do until Rs11.EOF
				
				rqCertName = Rs11("CertName")
				
				Rs11.Movenext
				loop
				Rs11.close

 				response.Write(rqCertName)
                 %>
           </td>
           
           
           
           <td>
               
                       <% If IsNull(arrAllRecords(6,rowcounter))  Then %>
                      Normal
                       <% Else %>
                     <% = arrAllRecords(6,rowcounter) %>
                      <% End If %>
               
        </td>
             
             
             
         <% If session("certificate") = "PRINCE2" Then %>  
      <td><% = arrAllRecords(1,rowcounter) %></td>
          <% End If %>
          
          
              <% courseId = arrAllRecords(0,rowcounter) %>
              
              
              
       <td><% = arrAllRecords(2,rowcounter) %></td>
               
               
        <td>
           <a href="PROJDatrixClass.asp?CourseId=<% = courseId %>&certificate=<% = rqCertificate %>">
                 <% = FormatDateTime(arrAllRecords(3,rowcounter),1) %>
                      to
                  <% = FormatDateTime(arrAllRecords(4,rowcounter),1) %>
          </a>    
                                 
         </td>
         
         
               <% If Not Session("typeofuser") = "CSR" Then %>
              
         <td><a href="PROJDatrixClass.asp?type=Edit&editId=<% = courseId %>&certificate=<% = rqCertificate %>">Edit</a></td>
              
              
          <td><a href="addEditDeletedatrixClass.asp?delete=<% = courseId %>&certificate=<% = rqCertificate %>" onclick="return DeleteAlert(this.href);" >Delete</a></td>
          
          
         <td><b><% = arrAllRecords(5,rowcounter) %></b></td>
          
              <% End If %>
            
  </tr>
            
            <% Next %>
            
            
            
    <tr id="htMap">
              <td colspan="8"><!--#include file="pagination.asp"-->
               <% 
			    ps = getPaginationString(page, (numRows + 1), 10, 2, "PROJDatrixClass.asp?Course="& rqCourse &"")
				  Response.Write(ps)
	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
              </td>
    </tr>
    
    
      <tr>
          <td colspan="9"><div align="center"><font face="Arial" size="2" color="orangered"><%=message%></font></div></td>
      </tr>
      
      
          </table>
          
          </td>
      </tr>
      
      
      <% End If%>
      
      
      <tr>
        <td>&nbsp;</td>
      </tr>
      
      
<%
'===============================================================================================================================================================================
									'If we Click On One Particular Course Then Full Course Details And EnrolledUsers Of That Particular Course will be Displayed'

'===============================================================================================================================================================================-->
   

 If rqCourseId <> "" Then
 
  
 %>
 
 
      <tr>
        <td colspan="8" valign="top" >
        
         <table border="1" cellspacing="0">
         
            <tr>
             <% If session("certificate") = "PRINCE2" Then %>  
              <td bgcolor="#A7DBFB" align="center"><b>Coursename</b></td>
               <% End If%>
              <td bgcolor="#A7DBFB" align="center"><b>Location</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Course</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Timing</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Instructor</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>BackUp Instructor</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Applicable Days</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Hotel Name</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Hotel Phone Number</b></td>
              <td bgcolor="#A7DBFB" align="center" width="50px"><b>Hotel URL</b></td>
              <td bgcolor="#A7DBFB" align="center"><b>Hotel Address</b></td>
            </tr>
            
            
<% do until Rs1.EOF %>
            
            
         <tr id="htMap">
         
         
             <% If session("certificate") = "PRINCE2" Then %>  
              <td><% = Rs1("courseName") %></td>
              <% End If%>   
                         
              <td align="center"><% = Rs1("city") %></td>
              
              <td>
				  <% = FormatDateTime(Rs1("startdate"),1) %>
                       to
                  <% = FormatDateTime(Rs1("enddate"),1) %>
               </td>
                              
              <td align="center">
			    <% = Rs1("starthour") %>
                :
                <% = Rs1("startminute") %>
                <% =Rs1("startsession")%>
                -
                <% = Rs1("endhour") %>
                :
                <% = Rs1("endminute")%>
                <% =Rs1("endsession")%>
                </a>
              </td>
              
              
              <td align="center"><% = Rs1("instructor") %></td>
              
              <td align="center"><% = Rs1("backupinstructor") %></td>
              
              <td align="center"><% = Rs1("applicabledays") %></td>


              <td align="center"><% = Rs1("hotelname") %></td>
              
              <td align="center"><% = Rs1("hotelphonenumber") %></td>
              
              <td align="center"><% = Rs1("hotelurl") %></td>
              
              <td align="center"><% = Rs1("hoteladdress") %></td>
            </tr>
            
          </table>
          
          </td>
      </tr>
      
      <tr>
        <td>&nbsp;</td>
      </tr>
      
      
<tr valign="top">
      
      <td width="100%" valign="top">
      
      
      <table  width="2500px" border="1" valign="top" cellspacing="0">
      
        <tr>
            <td bgcolor="#A7DBFB" align="center"><b>ID</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Enrollment For</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>First Name</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Last Name</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Email</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Name Of Employeer</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Phone Number</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Address</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Course Details</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Type of Course</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Date Of Enrollment</b></td>
<!--            <td bgcolor="#A7DBFB" align="center"><b>Candidate status</b></td>
-->        </tr>
          
          
					  <%
                      If IsArray(arrAllQueries) Then
                      For enrollrowcounter = enrollfirstRow TO enrolllastRow
                      %>
                      
                      
          <form name="checkreceived" action="DatrixenrolledDb.asp?type=review" method="post" onsubmit="return Form_Validator2(this)">
          
          
            <tr id="htMap">
    
<!-------------------------------------------------------------------------------Enrolled Id----------------------------------------------------------------------->           
              <td align="center"><% = arrAllQueries(0,enrollrowcounter) %></td>
              <input type="hidden" name="enrollUserId" value="<% = arrAllQueries(0,enrollrowcounter) %>">
              
<!-------------------------------------------------------------------------------Brand----------------------------------------------------------------------->           
			  <td align="center">Datrix</td>
              
<!-------------------------------------------------------------------------------firstname----------------------------------------------------------------------->           
              <td align="center"><% = arrAllQueries(1,enrollrowcounter) %></td>
              <input type="hidden" name="firstname" value="<% = arrAllQueries(1,enrollrowcounter) %>">
              
<!-------------------------------------------------------------------------------lastname----------------------------------------------------------------------->           
              <td align="center"><% = arrAllQueries(2,enrollrowcounter) %></td>
              <input type="hidden" name="lastname" value="<% = arrAllQueries(2,enrollrowcounter) %>">
              
<!-------------------------------------------------------------------------------email----------------------------------------------------------------------->           
              <td align="center"><% = arrAllQueries(3,enrollrowcounter) %>
              <a href="updateUserDet.asp?enrolluserid=<% = arrAllQueries(0,enrollrowcounter) %>&courseid=<% = rqCourseId %>" >Edit</a></td>
              <input type="hidden" name="email" value="<% = arrAllQueries(3,enrollrowcounter) %>">
              
<!-------------------------------------------------------------------------------employeer----------------------------------------------------------------------->           
              <td align="center"><% = arrAllQueries(4,enrollrowcounter)  %></td>
              <input type="hidden" name="employeer" value="<% = arrAllQueries(4,enrollrowcounter) %>">
              
<!-------------------------------------------------------------------------------phoneno----------------------------------------------------------------------->           
               <td align="center"><% = arrAllQueries(5,enrollrowcounter) %></td>
              <input type="hidden" name="phoneno" value="<% = arrAllQueries(5,enrollrowcounter) %>">
              
<!-------------------------------------------------------------------------------Address----------------------------------------------------------------------->           
		 <td align="center"><% = arrAllQueries(27,enrollrowcounter) %><br /><% = arrAllQueries(28,enrollrowcounter) %><br /><% = arrAllQueries(29,enrollrowcounter) %><% = arrAllQueries(30,enrollrowcounter) %><br /><% = arrAllQueries(23,enrollrowcounter) %></td>
		                
              <input type="hidden" name="phoneno" value="<% = arrAllQueries(5,enrollrowcounter) %>">
              <input type="hidden" name="CourseDetails" value="<% = arrAllQueries(6,enrollrowcounter) %>" />
              <input type="hidden" name="courseId" value="<% = arrAllQueries(20,enrollrowcounter) %>">
              
              
             
<!-------------------------------------------------------------------------------CourseDetails----------------------------------------------------------------------->           
           <td align="center"><% = Rs1("courseName") %> - <% = Rs1("city") %> : <% = FormatDateTime(Rs1("startdate"),1) %> to <% = FormatDateTime(Rs1("enddate"),1) %> for 
               <% = arrAllQueries(8,enrollrowcounter) %> </td>
              <%  courseDate = arrAllQueries(7,enrollrowcounter) %>
               <%  courseDate = arrAllQueries(7,enrollrowcounter) %>
               
               
  
   
<!-------------------------------------------------------------------------------Type of Course----------------------------------------------------------------------->         

                  
                     <td align="center"><% If arrAllQueries(45,enrollrowcounter) = "Blended Course" then %>Blended Course<% Else %>Classroom course<% End If %></td>

                   
        
<!-------------------------------------------------------------------------------Date Of Enrollment---------------------------------------------------------------------->         
              <td align="center"><% = FormatDateTime(arrAllQueries(9,enrollrowcounter),1) %></td>
              
              
<!-------------------------------------------------------------------------------Candidate status---------------------------------------------------------------------->         


  <td align="center">
<% if  (arrAllQueries(14,enrollrowcounter)  = "Confirmed" Or arrAllQueries(14,enrollrowcounter)  = "Rescheduled" Or arrAllQueries(14,enrollrowcounter)  = "Cancelled") then %>
                     
                       <b>Candidate status:</b>   <% = arrAllQueries(14,enrollrowcounter)%>      

                                     
<% Else %>
                      <b>Candidate status:</b> <select name="Candidatestatus" id="Candidatestatus">
                                      <option value="">--Select--</option>
                                     <option value="Confirmed">Confirmed</option>
                                     <option value="Rescheduled">Rescheduled</option>
                                      <option value="Cancelled">Cancelled</option>
                                     </select><br />
                            <input type = "submit" name="save" class="buttonc" value="Enter"/>   
<% End if %>

                      </td>
                                   
             
          </tr>
          
          <% 
		  cancelmailsent = arrAllQueries(51,enrollrowcounter) 
		  allMailSent = arrAllQueries(19,enrollrowcounter) 
	     	 courseId = arrAllQueries(20,enrollrowcounter) %>
          
          
          <% Next %>
          
          <tr>
            <td colspan="26" id="htMap">
			<% If Not enrollfirstRow = 0 Then %>
              <a href="PROJDatrixClass.asp?CourseId=<% = courseId %>&enrollPage=previous&enrollRow=<% = enrollfirstRow %>"> &lt;&lt;Previous</a>
            <% End If %>
            
              <% = ((enrollfirstRow + 1) & " - " & (enrolllastRow + 1) & " of " & (enrollnumRows + 1)) %>
              
              <% If Not enrollnumRows = enrolllastRow Then %>
              <a href="PROJDatrixClass.asp?CourseId=<% = courseId %>&enrollPage=next&enrollRow=<% = enrolllastRow %>"> &gt;&gt;Next</a>
              <% End If %>
            </td>
          </tr>
          
          
          <!--  <tr>
            
            <td id="htMap" style="width:140px;">
			<% 'If allMailSent = 1 Then
			
	            'Response.Write("All Mails Sent") %>
                
              <a href="javascript:void(0)" onClick="window.open('sendmails.asp?CourseId=<%' = courseId %>')">Send Mails</a>
              
            <% 'Else %>
            
              <a href="javascript:void(0)" onClick="window.open('sendmails.asp?CourseId=<% '= courseId %>')">Send Mails</a>
              <!--	 </form>-->
              
             <%' End If %>
           <!--	 </td>
           
          <td colspan="26" id="htMap">
			<% 'If cancelmailsent = 1 Then
			
	           ' Response.Write("All Cancel Mails Sent") %>
           
              <a href="javascript:void(0)" onClick="window.open('cancelMail.asp?CourseId=<%' = courseId %>')">Send Cancel Mails</a>
              
            <%' Else %>
              
              <a href="javascript:void(0)" onClick="window.open('cancelMail.asp?CourseId=<%' = courseId %>')">Send Cancel Mails</a>
              <!--	 </form>-->
              
              <% 'End If %>
              
            <!--</td>
            
          </tr>-->
          

          <% End If %>
          
          
        </table></td>
        <% Rs1.Movenext
        Loop %>
      </tr>
      
    </table>
    <% End If %>
  </td>
  </tr>
  </table>
</div>
  <% End If %>

<!-- This Script For Calendar -->
<script type="text/javascript">
   			<!--  to hide script contents from old browsers
   			var startDate;
   			var endDate;

   			function resetDates() {
   				startDate = endDate = null;
   			}

   			function filterDates1(cal) {
   				startDate = new Date(cal.date)
   				startDate.setHours(0,0,0,0)	// used for compares without TIME
   				/* If they haven't chosen an
   				end date before we'll set it to the same date as the start date This
   				way if the user scrolls in the start date 5 months forward, they don't
   				need to do it again for the end date.
   				*/

   				if (endDate == null) {
   					Zapatec.Calendar.setup({
   						inputField     :    "checkOut_date",
   						button         :    "button8b",  // What will trigger the popup of the calendar
   						ifFormat       :    "%b %d, %Y",
   						date           :     cal.date,
   						showsTime      :     false,          //no time
   						dateStatusFunc		:    disallowDateBefore, //the function to call
   						onUpdate       :    filterDates2
   					});
   				}
   			}

   			function filterDates2(cal) {
   				var date = cal.date;
   				endDate = new Date(cal.date)
   				endDate.setHours(0,0,0,0)	// used for compares without TIME
   			}

   			/*
   			* This functions return true to disallow a date
   			* and false to allow it.
   			*/


   			/*
   			* Check-Out calendar allowed dates
   			* Check-Out date can not be BEFORE Check-In date
   			* Check-Out date can not be before today
   			*/
   			function disallowDateBefore(dateCheckOut) {
   				dateCheckOut.setHours(0,0,0,0)
   				if ((startDate != null) && startDate > dateCheckOut)
   					// startDate is defined, make sure cal date is NOT before start date
   					return true;

   				var now = new Date()
   				now.setHours(0,0,0,0)
   				if (dateCheckOut < now)
   					// check out date can not be befor today if startDate NOT defined
   					return true;

   				return false;
   			}

   			/*
   			* Check-In date checking
   			* Check-In date can not be AFTER Check-Out date
   			* Check-In date can not be before today
   			*/
   			function disallowDateAfter(dateCheckIn) {
   				dateCheckIn.setHours(0,0,0,0)
   				if ((endDate != null) && dateCheckIn > endDate)
   					// endDate defined, calendar date can NOT be after endDate
   					return true;

   				var now = new Date()
   				now.setHours(0,0,0,0)

   				if (dateCheckIn < now)
   					// endDate NOT defined, calendar date can not be before today
   					return true;

   				return false;
   			}

   			// end hiding contents from old browsers  -->
   		</script>
<script type="text/javascript">
   			var disallowDateAfter
   			var disallowDateBefore
   			var filterDates1
   			var filterDates2
   			var cal = new Zapatec.Calendar.setup({

   	         inputField     :    "checkIn_date",   // id of the input field
   	         button         :    "button8a",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         dateStatusFunc    :    disallowDateAfter, //the function to call
   	         onUpdate       :    filterDates1

   			});

   	      Zapatec.Calendar.setup({
   	         inputField     :    "checkOut_date",
   	         button         :    "button8b",  // What will trigger the popup of the calendar
   	         ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         dateStatusFunc    :    disallowDateBefore, //the function to call
   	         onUpdate       :    filterDates2
   	      });

   		</script>
</form>
</body>
</html>
<%
 End If
 %>
