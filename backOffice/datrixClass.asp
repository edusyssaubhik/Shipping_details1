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
<!--#include virtual="./includes/connection.asp"-->
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

			 str = "Select * from Certification where CertName = '"&session("certificate")&"' and  Ven_ID = '"&Session("vendor")&"'"
			Rs9.Open str,ConnObj
			rqCerID = Rs9("Cer_ID")

			session("certificateID") = rqCerID

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

		 strQuery = "SELECT courseid,courseName,city,startdate,enddate,status,coursetype,certificateId from datrixClasses WHERE country = '"& session("country") &"' AND  startdate < '"& Now() &"' and vendorId = '"&Session("vendor")&"' and certificateId = '"&session("certificateID")&"' order by startdate desc"



'===============================================================================================================================================================================
'FutureClasses and present classes'
'===============================================================================================================================================================================



 ElseIf (rqCourse = "FutureCourses" OR rqCourse = "") Then

 'response.Write("test")


		   strQuery = "SELECT courseid,courseName,city,startdate,enddate,status,coursetype,certificateId from datrixClasses WHERE country = '"& session("country") &"' AND  startdate >= '"& Now() &"' and vendorId = '"&Session("vendor")&"' and certificateId = '"&session("certificateID")&"'  order by startdate asc"


End If

 Rs.Open strQuery,ConnObj
 'response.Write(strQuery)


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


'===============================================================================================================================================================================
'Sql query For Retrive The Particular Course'
'If Click one course in course page that particular course will display here'
'===============================================================================================================================================================================


If rqCourseId <> "" then

   If session("certificate") <> "" then

    strQuery1 = "SELECT * FROM datrixClasses WHERE courseid = '"& rqCourseId &"'"

  Rs1.Open strQuery1,ConnObj

   End If

End If

'===============================================================================================================================================================================
'Sql Query For Retrive The enrolledusers particular course'
'===============================================================================================================================================================================



	  strQuery2 = "SELECT * FROM enrolledusers WHERE courseid = '"& rqCourseId &"' and vendorId='2' order by statusnumber asc"



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


   strQuery6 = "SELECT firstname,lastname from instructor WHERE country = '"& session("country") &"' and vendorId = '"&Session("vendor")&"'"


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

<script language="JavaScript" type="text/javascript" src="js/getValues.js"></script>
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


function clicked()
{
    //alert("hello");
    //ajax call
    var city=  document.getElementById('city').value


    xmlHttp = GetXmlHttpObject();
    if (xmlHttp == null) {
        alert("Your browser does not support AJAX!");
        return;
    }
    var url = "/backoffice/get_venue.asp";
    url = url + "?city=" + city;
    xmlHttp.onreadystatechange=stateChanged;
    xmlHttp.open("GET",url,true);
    xmlHttp.send();


}


function stateChanged()
{
    
    if (xmlHttp.readyState == 4) {
      
        data = xmlHttp.responseText; //read response data
        //alert(data)
        //   document.write(data)
        var items = data.split('~');
        var length = items.length;
        //alert(length)
        var childEl2 = document.createElement('option'); //create option
        var so = document.getElementById('hotels');
        while (so.hasChildNodes()) { //removes items from dropdown if some already exist

            so.removeChild(so.firstChild);

        }
           
        var childE3 = document.createElement('option'); //create option
        var E3 = document.getElementById("hotels");
        E3.appendChild(childE3); //then append it to the second dropdown list
    //    document.getElementById("vanue").value="";
        childE3.value = 'Select';
        childE3.innerHTML = '----Select-----';


        for (var i = 0; i < length ; i++) {
            var childEl = document.createElement('option'); //create option
            var El = document.getElementById("hotels");
            El.appendChild(childEl); //then append it to the second dropdown list

            //  myString = items[i];//need

            //Split the value
            //var mySplit = myString.split(",");
            childEl.value = items[i];
            childEl.innerHTML = items[i];

            // childEl.value = mySplit[0];
            //childEl.innerHTML = items[i];
        }

    }
}

function GetXmlHttpObject() {
    var xmlHttp = null;
    try {
        // Firefox, Opera 8.0+, Safari
        xmlHttp = new XMLHttpRequest();
    }
    catch (e) {
        // Internet Explorer
        try {
            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch (e) {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
    }
    return xmlHttp;
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



with (theform)
    {
		
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

	

    }

 }


 //This Function1 Validate Edit Form

 function Form_Validator1(theform)
 {

  var alertsay = "";


 

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



with (theform)
    {
		
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
function set_hotel()
{
    document.getElementById("vanue").value= document.getElementById("hotels").value
}
function openit(theform)
{
 var courseDate = theform.enrolldate.value;
 var enrolledUserId = theform.enrollUserId.value

 if(theform.changestatus.value == "Re-Schedule" ){

  newWindow = window.open('reScheduledCourses.asp?courseDate='+courseDate+'&enrollUserId='+enrolledUserId, 'myWindow','toolbar,scrollbars,location,status=yes,menubar,resizable,minimizable=0,width=800,height=333,left = 175,top = 140');

  }
}

function more_dates()
{
    
 //   alert("d")
    for(var i=0;i<9;i++)
    {
        var x="show_more"+i
        document.getElementById(x).style.display=""
       
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
    <style type="text/css">
        .auto-style1 {
            height: 47px;
        }
        #hotels {
            width: 214px;
        }
    </style>
</head>
<body>
<div id="htMap">
  <table border="1" width="1150px" class="dbborder"  height="550" cellspacing="0" >

<!--===============================================================================================================================================================================
'Title of the page'
'===============================================================================================================================================================================-->

    <tr>
      <td colspan="3" height="35"><div align="center">
    <font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% =Session("brand") %>&nbsp;<% = Session("country") %></span>  Back Office</font>
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


    <form action="datrixClass.asp" name="price" method="post" onsubmit="return Form_Validator(this)">
   <table  width="100%" cellpadding="3" cellspacing="5">
     <tr align="center"><td >
      <b>Select the type of certification</b>:
                    		<select name="certificate" id="certificate" value="certificate">
                                 <option value="0" selected="selected">-- Select certificate --</option>

                                  <%  strQuery = "SELECT DISTINCT CertName FROM Certification WHERE Ven_ID = '"&Session("vendor") &"'"
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
      <td  height="25px" > <% If Session("typeofuser") <> "CSR" Then %><a href="datrixClass.asp?type=add&certificate=<% = rqCertificate %>">Add Class </a> |  <% End If %> <a href="datrixClass.asp?Course=PastCourses&certificate=<% = rqCertificate %>">Past Classes</a> | <a href="datrixClass.asp?Course=FutureCourses&certificate=<% = rqCertificate %>">Future Classes</a> | <a href="datrixClass.asp?type=selectcourse"><span style="color:#FF3300">Change certification type</span></a></td>
    </tr>


<!--===============================================================================================================================================================================
                                                                        Add class
'===============================================================================================================================================================================-->

    <% If rqType = "add" Then %>


    <tr >
      <td align="left" height="200px">

      <form name="addcourse" action="addEditDeletedatrixClass.asp" method="post" onsubmit="return Form_Validator(this)">

        <form onreset="resetDates()">

    <table border="0" cellpadding="5"  align="left" style="min-width:940px;" cellspacing="6">

        <tr>
          <td align="center" colspan="4" class="h3">Add Class</td>
        </tr>

<% if checkmessage<>"" then %>

     <tr>
      <td colspan="4" align="center" ><font face="Arial" size="2" color="orangered">

	  <script type="text/javascript">
	  alert("<% = checkmessage %>")
	  </script>

	  </font></td>
    </tr>


<% End If %>

 

 <tr>
        <td>Event Type:</td>

          <td colspan="3">&nbsp;&nbsp;

                 <select name="coursetype" id="coursetype" onchange="CityHint(this.value);">
                 <% If Session("country") <> "Other" Then %>
                  <option value="">--Select--</option>
                  <option value="Normal">Public Course</option>
                  <option value="Private ">Private Course</option>
                  <!--<option value="Corporate">Corporate</option>-->
                  <option value="Live">Live</option>
                  <% ElseIf Session("country") = "Other" Then %>
                  <option value="">--Select--</option>
                  <option value="Live">Live</option>
                  <% End IF %>
                </select>

          </td>

  </tr>




        <tr>
        <td >Course Name:</td>
          <td colspan="3">&nbsp;&nbsp;
          <%
		   Dim SqlCourses,RsCourses

		  Set RsCourses = server.CreateObject("ADODB.Recordset")



		  SqlCourses = "select * from datrixCourse where certificationId = '"&session("certificateID")&"' order by courseid desc"
		  ' response.Write(Sql)'
	      RsCourses.open SqlCourses,ConnObj

		%>

            <!--<select name="course" id="course" style="display:block;" onchange="location.reload();">-->
            <select name="course" id="course" style="display:block;">
              <option   value="--Select--">--Select--</option>
             
              	<% do until RsCourses.EOF %>

              <option value="<% = RsCourses("courseName") %>:<% = RsCourses("RefNumber") %>:<% = RsCourses("Duration") %>"  courseid = "<% = RsCourses("courseid") %>"><% = RsCourses("courseName") %> - <% = RsCourses("RefNumber") %> - <% = RsCourses("Duration") %></option>
              <% RsCourses.Movenext
			     loop

				  RsCourses.close()%>
            </select>
          </td>
  </tr>


          

 <tr>
      <td>Venue:</td>

          <td colspan="3">&nbsp;&nbsp;
            <select name="city" id="city" onChange="clicked();" >
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
          <td class="zpCalSubheader">Start Date:</td>
          <td><input autocomplete="off" name="startdate"  id="checkIn_date" type="text" onChange="findValue(this.value);">
            <input value=" ... " id="button8a" class="buttonc" type="reset">
          </td>
              <td class="auto-style1">End Date: </td>
          <td class="auto-style1">

          <input autocomplete="off" name="enddate"  id="checkOut_date" type="text">
            <input value=" ... " id="button8b" class="buttonc" type="reset">
          </td>
            </tr>




        <tr>
            <td colspan="4">
                <a href="#" onclick="more_dates()">Add more 5 to 10 dates</a>
            </td>

        </tr>
       
            
           <tr id="show_more0" style="display:none">
             <td  class="zpCalSubheader"> Start Date: </td>
          <td><input name="startdate1"  id="checkIn_date1" type="text" onchange="findValue1(1)">
            <input value=" ... " id="button8c" class="buttonc" type="reset">
          </td>
          <td class="auto-style1">End Date</td>
       <td><input type="text" name="enddate1" readonly="readonly" id="checkOut_date1" /></td>     
       &nbsp;</td>
          </td>
         
       <td>

       </td>     
        </tr>
      
      <tr id="show_more1" style="display:none">
             <td  class="zpCalSubheader"> Start Date: </td>
          <td><input name="startdate2"  id="checkIn_date2" type="text" onchange="findValue1(2)">
            <input value=" ... " id="button8e" class="buttonc" type="reset">
          </td>
          <td class="auto-style1">End Date</td>
       <td><input type="text" name="enddate2" readonly="readonly" id="checkOut_date2"  /></td>     
      
             </tr>
        <tr id="show_more2" style="display:none">
         <td  class="zpCalSubheader"> Start Date: </td>
          <td><input name="startdate3"  id="checkIn_date3" type="text" onchange="findValue1(3)">
            <input value=" ... " id="button8g" class="buttonc" type="reset">
          </td>
          <td class="auto-style1">End Date</td>
       <td><input type="text" name="enddate3" readonly="readonly" id="checkOut_date3"  /></td>     
       </tr>
        <tr id="show_more3" style="display:none">
        <td  class="zpCalSubheader"> Start Date: </td>
          <td><input name="startdate4"  id="checkIn_date4" type="text" onchange="findValue1(4)">
            <input value=" ... " id="button8i" class="buttonc" type="reset">
          </td>
          <td class="auto-style1">End Date</td>
       <td><input type="text" name="enddate4" readonly="readonly" id="checkOut_date4"  /></td>     
        </tr>
        <tr id="show_more4" style="display:none">
        <td  class="zpCalSubheader"> Start Date: </td>
          <td><input name="startdate5"  id="checkIn_date5" type="text" onchange="findValue1(5)">
            <input value=" ... " id="button8k" class="buttonc" type="reset">
          </td>
          <td class="auto-style1">End Date</td>
       <td><input type="text" name="enddate5" readonly="readonly" id="checkOut_date5"  /></td>     
        </tr>
     <tr id="show_more5" style="display:none">
          <td class="zpCalSubheader"> Start Date: </td>
          <td><input autocomplete="off" name="startdate6" readonly="readonly" id="checkIn_date6" type="text"  onchange="findValue1(6)">
            <input value=" ... " id="button8m" class="buttonc" type="reset">
          </td>
          <td class="zpCalSubheader"> End Date: </td>
          <td class="auto-style1"><input autocomplete="off" readonly="readonly" name="enddate6" readonly id="checkOut_date6" type="text" >&nbsp;
          </td>

        </tr>
        <tr id="show_more6" style="display:none">
          <td class="zpCalSubheader"> Start Date: </td>
          <td><input autocomplete="off" name="startdate7" readonly="readonly" id="checkIn_date7" type="text"  onchange="findValue1(7)">
            <input value=" ... " id="button8o" class="buttonc" type="reset">
          </td>
          <td class="zpCalSubheader"> End Date: </td>
          <td class="auto-style1"><input autocomplete="off" readonly="readonly" name="enddate7" readonly="readonly" id="checkOut_date7" type="text">&nbsp;
          </td>

        </tr>
        <tr id="show_more7" style="display:none">
          <td class="zpCalSubheader"> Start Date: </td>
          <td><input autocomplete="off" name="startdate8" readonly="readonly" id="checkIn_date8" type="text"  onchange="findValue1(8)">
            <input value=" ... " id="button8q" class="buttonc" type="reset">
          </td>
          <td class="zpCalSubheader"> End Date: </td>
          <td class="auto-style1"><input autocomplete="off" name="enddate8" readonly="readonly" id="checkOut_date8" type="text">&nbsp;
          </td>

        </tr>
        <tr id="show_more8" style="display:none">
          <td class="zpCalSubheader"> Start Date: </td>
          <td><input autocomplete="off" name="startdate9" readonly="readonly" id="checkIn_date9" type="text"  onchange="findValue1(9)">
            <input value=" ... " id="button8s" class="buttonc" type="reset">
          </td>
          <td class="zpCalSubheader"> End Date: </td>
          <td class="auto-style1"><input autocomplete="off" name="enddate9" readonly="readonly" id="checkOut_date9" type="text">&nbsp;
          </td>

        </tr>
          


        <tr id = "datrixCourse1"  >
          <td>Start Time:</td>
          <td >&nbsp;&nbsp;
            <select name="startinghour" id="startinghour">
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
            <select name="startingminute" id="startingminute">
              <option value="">MIN</option>
              <option>00</option>
              <option>15</option>
              <option>30</option>
              <option>45</option>
            </select>
            <select name="sessionstart" id="sessionstart">
              <option>AM</option>
              <option>PM</option>
            </select>
          </td>
          
          
          <td>End Time:</td>
          <td width="600px" >&nbsp;&nbsp;
            <select name="endinghour" id="endinghour">
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
            <select name="endingminute" id="endingminute">
              <option value="">MIN</option>
              <option>00</option>
              <option>15</option>
              <option>30</option>
              <option>45</option>
            </select>
            <select name="sessionend" id="sessionend">
              <option>AM</option>
              <option>PM</option>
            </select>
          </td>
        </tr>




          <td>Instructor:</td>
          <td>&nbsp;&nbsp;
            <select name="instructor" id="Select1" style="width:150px">
                 <option value="TBC">TBC</option>
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


          <td >BackUp Instructor:</td>
          <td>&nbsp;&nbsp;
            <select name="backupinstructor" id="Select2" style="width:150px">
               <option value="TBC">TBC</option>
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

        <tr>
          <td  width="250px">Hotel Name: </td>
          <td><input type="text" maxlength="200" name="hotelname"></td>
          <td  width="310px">Hotel Phone Number: </td>
          <td><input type="text" maxlength="50" name="hotelphonenumber">
            <br />
            <font face="Arial" color="red" size="2">(Ex : 0802345678 )</font></td>
        </tr>




   



   
          <tr>
              <td  width="250px">Hotel URL: </td>
              <td><input type="text" id="hotelurl" maxlength="300" name="hotelurl">
                <br />
                <font face="Arial" color="red" size="2">(Ex : http://www.ashoka.com)</font></td>
          <td width="250px">Account Manager </td>
              <td><input type="text" name="accountmanager" /></td>  
          </tr>


          <tr>
              <td  width="280px">Select Hotel Address: </td>
              <td>
                  <br />
                  <select id="hotels" name="hotels" onchange="set_hotel()" ></select><br />
                  <textarea name="hoteladdress" id="vanue"  rows="4" cols="25" readonly="readonly"></textarea></td>
          <td width="250px">Booked By</td>
              <td><input type="text" name="bookedby" /></td>  
          </tr>

                    

        <% 'RsRef.Movenext
		      ' loop %>
              
                     



       <tr  id = "datrixCourse2" >
          <td >Price WithOut Tax:</td>
          <td><input type="text" name="priceWithOutTax" id="priceWithOutTax" size="20" maxlength="15" onchange="calculate()">
            <br>
            &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">(Ex : 650 )</font></td>
            <td >Booked on:</td>
          <td><input type="text" name="bookedon" id="bookedon" size="20" ><input value=" ... " id="button8lx" class="buttonc" type="reset">
         </td>
       
      
          </tr>


        <tr  id = "datrixCourse3">
          <td>Price With Tax:</td>
          <td><input type="text" name="priceWithTax" id="priceWithTax" size="20" readonly="true">
            <br>
            &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2"></font></td>
       <td >Tax:</td>
          <td><input type="text" name="tax" id="tax" size="20" maxlength="6"  value="20" onchange="calculate()">
            <br>
            &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">(Ex : 20 )</font> </td>
       
              </tr>

<tr>
          <td>EarlyBird Discount:</td>
          <td><input type="text" name="earlybirddicount" maxlength="10" onchange="calculate()" size="20" value="0">
            <br>
            &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">(Ex : 750 )</font></td>
          <td >Applicable Days:</td>
          <td><input type="text" name="applicabledays" maxlength="10" size="20" value="0">
            <br>
            &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">(Ex : 10 )</font></td>
        </tr>


        <tr>
          <td  width="250px">Price After EarlyBird Discount(WithOut Tax):</td>
          <td><input type="text" name="afterearlybirddiscountwithouttax" readonly="true" value="0"></td>
          <td  width="290px">Price After EarlyBird Discount(With Tax):</td>
          <td><input type="text" name="afterearlybirddiscountwithtax" readonly="true" value="0"></td>
        </tr>

         <tr>



          <tr>
              <td colspan="4" align="center"><input type="submit" name="addcourse" value="Add Course" class="buttonc"  onclick="checkUrl(this.hotelurl)" >
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
        <td>Event Type:</td>
          <td>&nbsp;&nbsp;
             <select name="editcoursetype" id="editcoursetype">
              <option value="<% = Rs4("coursetype") %> ">
                <% = Rs4("coursetype") %>
              <option value="" disabled="disabled">--Select--</option>
              <% If Session("country") <> "Other" Then %>
                  <option value="">--Select--</option>
                  <option value="Normal">Public Course</option>
                  <option value="Private ">Private Course</option>
                 <!--<option value="Corporate">Corporate</option>-->
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
              &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">Please Select Live option for the live courses if city is not yet confirmed </font>
            </td>
      </tr>



         <tr>
          <td class="zpCalSubheader">Start Date:</td>
          <td><input autocomplete="off" name="editstartdate"  readonly value="<% = Rs4("startdate") %>" id="checkIn_date" type="text" onchange="calculateDate();">
        <input value=" ... " id="Reset1" class="buttonc" type="reset">
          </td>
          <td class="zpCalSubheader">End Date: </td>
          <td>

          <input autocomplete="off" name="editenddate"  readonly value="<% = Rs4("enddate") %>" id="checkOut_date" type="text">
        <input value=" ... " id="Reset2" class="buttonc" type="reset">
          </td>
        </tr>






     


   <tr>
       <td>Start Time:</td>
       <td width="350px" >&nbsp;&nbsp;
              <select name="editstartinghour">
                <option value="<% = Rs4("starthour") %>"><% = Rs4("starthour") %></option>
              <option disabled="disabled">HH</option>
            </select>

            <select name="editstartingminute">
          <option value="<% = Rs4("startminute") %>"><% = Rs4("startminute") %></option>
              <option disabled="disabled">MIN</option>
            </select>

            <select name="editsessionstart">
          <option value="<% = Rs4("startsession") %>"><% = Rs4("startsession") %></option>
              </select>
              
            </td>


            <td>End Time:</td>

            <td width="600px">&nbsp;&nbsp;
              <select name="editendinghour">
                 <option value="<% = Rs4("endhour") %>"><% = Rs4("endhour") %></option>
              <option disabled="disabled">HH</option>
            </select>
            <select name="editendingminute">
          <option value="<% = Rs4("endminute") %>"><% = Rs4("endminute") %></option>
              <option disabled="disabled">MIN</option>
            </select>
            <select name="editsessionend">
          <option value="<% = Rs4("endsession") %>"><% = Rs4("endsession") %></option>
             
              </select>
              </td>
     </tr>



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
          <td  width="250px">Account Manager: </td>
              <td><input type="text" maxlength="300" name="accountmanager" value="<% = Rs4("accountmanager") %>"></td>
          </tr>


          <tr>
            <td  width="280px">Hotel Address: </td>
            <td><textarea name="edithoteladdress"  rows="4" cols="25"><% =Rs4("hoteladdress") %>></textarea></td>
          <td  width="250px">booked by: </td>
              <td><input type="text" maxlength="300" name="bookedby" value="<% = Rs4("bookedby") %>"></td>
          
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
          <td  width="250px">booked on: </td>
              <td><input type="text" maxlength="300" name="bookedon" id="bookedon" value="<% = Rs4("bookedon") %>"><input value=" ... " id="button8lx" class="buttonc" type="reset"></td>
           </tr>

  <tr>
            <td>Price WithOut Tax:</td>
            <td><input type="text" name="priceWithOutTax" maxlength="15" size="20"  onchange="calculate()" value="<% = Rs4("pricewithouttax") %>">
              <br>
              &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">(Ex : 6250 )</font></td>
            <td>Tax:</td>
            <td><input type="text" name="tax" size="20" maxlength="6" onchange="calculate()" value="<% = Rs4("tax") %>">
              <br>
              &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">(Ex : 20% )</font> </td>
          </tr>
          
          
          <tr>
            <td>Price With Tax:</td>
            <td><input type="text" name="priceWithTax" value="<% = Rs4("pricewithtax") %>"size="20" readonly="true">
              <br>
              &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2"></font></td>
          </tr>
          
          
          <tr>
            <td>EarlyBird Discount:</td>
            <td><input type="text" name="earlybirddicount" maxlength="10" onchange="calculate()" value="<% = Rs4("earlybirddiscount") %>" size="20">
              <br>
              &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">(Ex : 1000 )</font></td>
            <td>Applicable Days:</td>
            <td><input type="text" name="applicabledays" maxlength="10" value="<% = Rs4("applicabledays") %>" >
              <br>
              &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">(Ex : 10 )</font></td>
          </tr>
          
          
          <tr>
            <td  width="250px">Price After EarlyBird Discount(WithOut Tax):</td>
            <td><input type="text" name="afterearlybirddiscountwithouttax" value="<% = Rs4("afterEBdiscountwithouttax") %>" readonly="true" ></td>
            <td  width="280px">Price After EarlyBird Discount(With Tax):</td>
            <td><input type="text" name="afterearlybirddiscountwithtax" value="<% = Rs4("afterEBdiscountwithtax") %>" readonly="true" ></td>
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


          <form name="course" action="datrixClass.asp?type=submit" method="post">



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
           <a href="datrixClass.asp?CourseId=<% = courseId %>&certificate=<% = rqCertificate %>">
                 <% = FormatDateTime(arrAllRecords(3,rowcounter),1) %>
                      to
                  <% = FormatDateTime(arrAllRecords(4,rowcounter),1) %>
          </a>

         </td>


               <% If Not Session("typeofuser") = "CSR" Then %>

         <td><a href="datrixClass.asp?type=Edit&editId=<% = courseId %>&certificate=<% = rqCertificate %>">Edit</a></td>


          <td><a href="addEditDeletedatrixClass.asp?delete=<% = courseId %>&certificate=<% = rqCertificate %>" onclick="return DeleteAlert(this.href);" >Delete</a></td>


         <td><b><% = arrAllRecords(5,rowcounter) %></b></td>

              <% End If %>

  </tr>

            <% Next %>



    <tr id="htMap">
              <td colspan="8"><!--#include file="pagination.asp"-->
               <%
			    ps = getPaginationString(page, (numRows + 1), 10, 2, "datrixClass.asp?Course="& rqCourse &"")
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
            <!--<td bgcolor="#A7DBFB" align="center"><b>Enrollment For</b></td>-->
            <td bgcolor="#A7DBFB" align="center"><b>First Name</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Last Name</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Email</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Client Name</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Phone Number</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Address</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Course Details</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Type of Course</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Date Of Enrollment</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Manual</b></td>
            <td bgcolor="#A7DBFB" align="center"><b> Type of Course</b></td>
       </tr>


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
			  <!--<td align="center">Datrix</td>-->

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
      <% if arrAllQueries(16,enrollrowcounter)="Yes" then%>
      Yes,<%=arrAllQueries(62,enrollrowcounter) %>
      <% end if %>
<% 'if  (arrAllQueries(14,enrollrowcounter)  = "Confirmed" Or arrAllQueries(14,enrollrowcounter)  = "Rescheduled" Or arrAllQueries(14,enrollrowcounter)  = "Cancelled") then %>

                      


<% 'Else %>
    <!--                  <b>Candidate status:</b> <select name="Candidatestatus" id="Candidatestatus">
                                      <option value="">--Select--</option>
                                     <option value="Confirmed">Confirmed</option>
                                     <option value="Rescheduled">Rescheduled</option>
                                      <option value="Cancelled">Cancelled</option>
                                     </select><br />
                            <input type = "submit" name="save" class="buttonc" value="Enter"/>-->
<% 'End if %>

                      </td>
                <td>

<%=arrAllQueries(45,enrollrowcounter) %>
                

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
              <a href="datrixClass.asp?CourseId=<% = courseId %>&enrollPage=previous&enrollRow=<% = enrollfirstRow %>"> &lt;&lt;Previous</a>
            <% End If %>

              <% = ((enrollfirstRow + 1) & " - " & (enrolllastRow + 1) & " of " & (enrollnumRows + 1)) %>

              <% If Not enrollnumRows = enrolllastRow Then %>
              <a href="datrixClass.asp?CourseId=<% = courseId %>&enrollPage=next&enrollRow=<% = enrolllastRow %>"> &gt;&gt;Next</a>
              <% End If %>
            <a href="javascript:void(0)" onClick="window.open('sendDetrixMail.asp?CourseId=<% = courseId %>')">joining instructions </a>&nbsp;&nbsp;  <a href="javascript:void(0)" onClick="window.open('generateReport.asp?CourseId=<% = courseId %>')">delegate list</a></td>
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
   						ifFormat       :    "%Y,%b,%d",
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
   	         ifFormat       :     "%Y,%b,%d",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         dateStatusFunc    :    disallowDateAfter, //the function to call
   	         onUpdate       :    filterDates1

   			});

   	      Zapatec.Calendar.setup({
   	         inputField     :    "checkOut_date",
   	         button         :    "button8b",  // What will trigger the popup of the calendar
   	         ifFormat       :     "%Y,%b,%d",       // format of the input field: Mar 18, 2005
   	         showsTime      :     false,          //no time
   	         dateStatusFunc    :    disallowDateBefore, //the function to call
   	         onUpdate       :    filterDates2
   	      });

   		</script>

<!-- This Script For Calendar -->
<script type="text/javascript">
   			<!--  to hide script contents from old browsers
    var startDate;
    var endDate;
    var startDate1;
    var endDate1;
    var startDate2;
    var endDate2;
    var startDate3;
    var endDate3;
    var startDate4;
    var endDate4;
    var startDate5;
    var endDate5;
    var startDate6;
    var endDate6;
    var startDate7;
    var endDate7;
    
    var startDate8;
    var endDate8;
    var startDate9;
    var endDate9;
    function resetDates() {
        startDate = endDate = null;
        startDate1 = endDate1 = null;
        startDate2 = endDate2 = null;
        startDate3 = endDate3 = null;
        startDate4 = endDate4 = null;
        startDate5 = endDate5 = null;
        startDate6 = endDate6 = null;
        startDate7 = endDate7 = null;
        startDate8 = endDate8 = null;
        startDate9 = endDate9 = null;
        //startDate = endDate = null;
   	

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

    //for 2nd
    function filterDates3(cal1) {
        startDate1 = new Date(cal1.date)
        startDate1.setHours(0,0,0,0)	// used for compares without TIME
        /* If they haven't chosen an
        end date before we'll set it to the same date as the start date This
        way if the user scrolls in the start date 5 months forward, they don't
        need to do it again for the end date.
        */
        //  document.write(endDate1)

        //alert(endDate1)
        if (endDate1 == null) {
            Zapatec.Calendar.setup({
                inputField     :    "checkOut_date1",
                button         :    "button8d",  // What will trigger the popup of the calendar
                ifFormat       :    "%b %d, %Y",
                date           :     cal1.date,
                showsTime      :     false,          //no time
                dateStatusFunc		:    disallowDateBefore1, //the function to call
                onUpdate       :    filterDates4
            });
        }
   			
    }
    function filterDates4(cal1) {
        var date = cal1.date;
        endDate1 = new Date(cal1.date)
        endDate1.setHours(0,0,0,0)	// used for compares without TIME
    }
    
    //3rd

    function filterDates5(cal2) {
        startDate2 = new Date(cal2.date)
        startDate2.setHours(0,0,0,0)	// used for compares without TIME
        /* If they haven't chosen an
        end date before we'll set it to the same date as the start date This
        way if the user scrolls in the start date 5 months forward, they don't
        need to do it again for the end date.
        */
        //  document.write(endDate2)

        //alert(endDate2)
        if (endDate2 == null) {
            Zapatec.Calendar.setup({
                inputField     :    "checkOut_date2",
                button         :    "button8f",  // What will trigger the popup of the calendar
                ifFormat       :    "%b %d, %Y",
                date           :     cal2.date,
                showsTime      :     false,          //no time
                dateStatusFunc		:    disallowDateBefore2, //the function to call
                onUpdate       :    filterDates6
            });
        }
   			
    }
    function filterDates6(cal2) {
        var date = cal2.date;
        endDate2 = new Date(cal2.date)
        endDate2.setHours(0,0,0,0)	// used for compares without TIME
    }
    
    //4th
    function filterDates7(cal3) {
        startDate3 = new Date(cal3.date)
        startDate3.setHours(0,0,0,0)	// used for compares without TIME
        /* If they haven't chosen an
        end date before we'll set it to the same date as the start date This
        way if the user scrolls in the start date 5 months forward, they don't
        need to do it again for the end date.
        */
        //  document.write(endDate)

        //alert(endDate)
        if (endDate3 == null) {
            Zapatec.Calendar.setup({
                inputField     :    "checkOut_date3",
                button         :    "button8h",  // What will trigger the popup of the calendar
                ifFormat       :    "%b %d, %Y",
                date           :     cal3.date,
                showsTime      :     false,          //no time
                dateStatusFunc		:    disallowDateBefore3, //the function to call
                onUpdate       :    filterDates8
            });
        }
   			
    }
    function filterDates8(cal3) {
        var date = cal3.date;
        endDate3 = new Date(cal3.date)
        endDate3.setHours(0,0,0,0)	// used for compares without TIME
    }
    

    function filterDates9(cal4) {
        startDate4 = new Date(cal4.date)
        startDate4.setHours(0,0,0,0)	// used for compares without TIME
        /* If they haven't chosen an
        end date before we'll set it to the same date as the start date This
        way if the user scrolls in the start date 5 months forward, they don't
        need to do it again for the end date.
        */
        //  document.write(endDate)

        //alert(endDate)
        if (endDate4 == null) {
            Zapatec.Calendar.setup({
                inputField     :    "checkOut_date4",
                button         :    "button8j",  // What will trigger the popup of the calendar
                ifFormat       :    "%b %d, %Y",
                date           :     cal4.date,
                showsTime      :     false,          //no time
                dateStatusFunc		:    disallowDateBefore4, //the function to call
                onUpdate       :    filterDates10
            });
        }
   			
    }
    function filterDates10(cal4) {
        var date = cal4.date;
        endDate4 = new Date(cal4.date)
        endDate4.setHours(0,0,0,0)	// used for compares without TIME
    }
    

    
    function filterDates11(cal5) {
        startDate5 = new Date(cal5.date)
        startDate5.setHours(0,0,0,0)	// used for compares without TIME
        /* If they haven't chosen an
        end date before we'll set it to the same date as the start date This
        way if the user scrolls in the start date 5 months forward, they don't
        need to do it again for the end date.
        */
        //  document.write(endDate)

        //alert(endDate)
        if (endDate5 == null) {
            Zapatec.Calendar.setup({
                inputField     :    "checkOut_date5",
                button         :    "button8l",  // What will trigger the popup of the calendar
                ifFormat       :    "%b %d, %Y",
                date           :     cal5.date,
                showsTime      :     false,          //no time
                dateStatusFunc		:    disallowDateBefore5, //the function to call
                onUpdate       :    filterDates12
            });
        }
   			
    }
    function filterDates12(cal5) {
        var date = cal5.date;
        endDate5 = new Date(cal5.date)
        endDate5.setHours(0,0,0,0)	// used for compares without TIME
    }
    
    function filterDates13(cal6) {
        startDate6 = new Date(cal6.date)
        startDate6.setHours(0,0,0,0)	// used for compares without TIME
        /* If they haven't chosen an
        end date before we'll set it to the same date as the start date This
        way if the user scrolls in the start date 5 months forward, they don't
        need to do it again for the end date.
        */
        //  document.write(endDate)

        //alert(endDate)
        if (endDate6 == null) {
            Zapatec.Calendar.setup({
                inputField     :    "checkOut_date6",
                button         :    "button8n",  // What will trigger the popup of the calendar
                ifFormat       :    "%b %d, %Y",
                date           :     cal6.date,
                showsTime      :     false,          //no time
                dateStatusFunc		:    disallowDateBefore6, //the function to call
                onUpdate       :    filterDates14
            });
        }
   			
    }
    function filterDates14(cal6) {
        var date = cal6.date;
        endDate6 = new Date(cal6.date)
        endDate6.setHours(0,0,0,0)	// used for compares without TIME
    }
    

    function filterDates15(cal7) {
        startDate7 = new Date(cal7.date)
        startDate7.setHours(0,0,0,0)	// used for compares without TIME
        /* If they haven't chosen an
        end date before we'll set it to the same date as the start date This
        way if the user scrolls in the start date 5 months forward, they don't
        need to do it again for the end date.
        */
        //  document.write(endDate)

        //alert(endDate)
        if (endDate7 == null) {
            Zapatec.Calendar.setup({
                inputField     :    "checkOut_date7",
                button         :    "button8p",  // What will trigger the popup of the calendar
                ifFormat       :    "%b %d, %Y",
                date           :     cal7.date,
                showsTime      :     false,          //no time
                dateStatusFunc		:    disallowDateBefore7, //the function to call
                onUpdate       :    filterDates16
            });
        }
   			
    }
    function filterDates16(cal7) {
        var date = cal7.date;
        endDate7 = new Date(cal7.date)
        endDate7.setHours(0,0,0,0)	// used for compares without TIME
    }
    

    function filterDates17(cal8) {
        startDate8 = new Date(cal8.date)
        startDate8.setHours(0,0,0,0)	// used for compares without TIME
        /* If they haven't chosen an
        end date before we'll set it to the same date as the start date This
        way if the user scrolls in the start date 5 months forward, they don't
        need to do it again for the end date.
        */
        //  document.write(endDate)

        //alert(endDate)
        if (endDate8 == null) {
            Zapatec.Calendar.setup({
                inputField     :    "checkOut_date8",
                button         :    "button8r",  // What will trigger the popup of the calendar
                ifFormat       :    "%b %d, %Y",
                date           :     cal8.date,
                showsTime      :     false,          //no time
                dateStatusFunc		:    disallowDateBefore8, //the function to call
                onUpdate       :    filterDates18
            });
        }
   			
    }
    function filterDates18(cal8) {
        var date = cal8.date;
        endDate8 = new Date(cal8.date)
        endDate8.setHours(0,0,0,0)	// used for compares without TIME
    }
    

    
    function filterDates19(cal9) {
        startDate9 = new Date(cal9.date)
        startDate9.setHours(0,0,0,0)	// used for compares without TIME
        /* If they haven't chosen an
        end date before we'll set it to the same date as the start date This
        way if the user scrolls in the start date 5 months forward, they don't
        need to do it again for the end date.
        */
        //  document.write(endDate)

        //alert(endDate)
        if (endDate9 == null) {
            Zapatec.Calendar.setup({
                inputField     :    "checkOut_date9",
                button         :    "button8t",  // What will trigger the popup of the calendar
                ifFormat       :    "%b %d, %Y",
                date           :     cal9.date,
                showsTime      :     false,          //no time
                dateStatusFunc		:    disallowDateBefore9, //the function to call
                onUpdate       :    filterDates20
            });
        }
   			
    }
    function filterDates20(cal9) {
        var date = cal9.date;
        endDate9 = new Date(cal9.date)
        endDate9.setHours(0,0,0,0)	// used for compares without TIME
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

    function disallowDateBefore1(dateCheckOut) {
        dateCheckOut.setHours(0,0,0,0)
        if ((startDate1 != null) && startDate1 > dateCheckOut)
            // startDate is defined, make sure cal date is NOT before start date
            return true;

        var now = new Date()
        now.setHours(0,0,0,0)
        if (dateCheckOut < now)
            // check out date can not be befor today if startDate NOT defined
            return true;

        return false;
    }

    function disallowDateBefore2(dateCheckOut) {
        dateCheckOut.setHours(0,0,0,0)
        if ((startDate2 != null) && startDate2 > dateCheckOut)
            // startDate is defined, make sure cal date is NOT before start date
            return true;

        var now = new Date()
        now.setHours(0,0,0,0)
        if (dateCheckOut < now)
            // check out date can not be befor today if startDate NOT defined
            return true;

        return false;
    }
    function disallowDateBefore3(dateCheckOut) {
        dateCheckOut.setHours(0,0,0,0)
        if ((startDate3 != null) && startDate3 > dateCheckOut)
            // startDate is defined, make sure cal date is NOT before start date
            return true;

        var now = new Date()
        now.setHours(0,0,0,0)
        if (dateCheckOut < now)
            // check out date can not be befor today if startDate NOT defined
            return true;

        return false;
    }
    function disallowDateBefore4(dateCheckOut) {
        dateCheckOut.setHours(0,0,0,0)
        if ((startDate4 != null) && startDate4 > dateCheckOut)
            // startDate is defined, make sure cal date is NOT before start date
            return true;

        var now = new Date()
        now.setHours(0,0,0,0)
        if (dateCheckOut < now)
            // check out date can not be befor today if startDate NOT defined
            return true;

        return false;
    }
    function disallowDateBefore5(dateCheckOut) {
        dateCheckOut.setHours(0,0,0,0)
        if ((startDate5 != null) && startDate5 > dateCheckOut)
            // startDate is defined, make sure cal date is NOT before start date
            return true;

        var now = new Date()
        now.setHours(0,0,0,0)
        if (dateCheckOut < now)
            // check out date can not be befor today if startDate NOT defined
            return true;

        return false;
    }
    function disallowDateBefore6(dateCheckOut) {
        dateCheckOut.setHours(0,0,0,0)
        if ((startDate6 != null) && startDate6 > dateCheckOut)
            // startDate is defined, make sure cal date is NOT before start date
            return true;

        var now = new Date()
        now.setHours(0,0,0,0)
        if (dateCheckOut < now)
            // check out date can not be befor today if startDate NOT defined
            return true;

        return false;
    }
    function disallowDateBefore7(dateCheckOut) {
        dateCheckOut.setHours(0,0,0,0)
        if ((startDate7 != null) && startDate7 > dateCheckOut)
            // startDate is defined, make sure cal date is NOT before start date
            return true;

        var now = new Date()
        now.setHours(0,0,0,0)
        if (dateCheckOut < now)
            // check out date can not be befor today if startDate NOT defined
            return true;

        return false;
    }
    function disallowDateBefore8(dateCheckOut) {
        dateCheckOut.setHours(0,0,0,0)
        if ((startDate8!= null) && startDate8 > dateCheckOut)
            // startDate is defined, make sure cal date is NOT before start date
            return true;

        var now = new Date()
        now.setHours(0,0,0,0)
        if (dateCheckOut < now)
            // check out date can not be befor today if startDate NOT defined
            return true;

        return false;
    }
    function disallowDateBefore9(dateCheckOut) {
        dateCheckOut.setHours(0,0,0,0)
        if ((startDate9 != null) && startDate9 > dateCheckOut)
            // startDate is defined, make sure cal date is NOT before start date
            return true;

        var now = new Date()
        now.setHours(0,0,0,0)
        if (dateCheckOut < now)
            // check out date can not be befor today if startDate NOT defined
            return true;

        return false;
    }

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
    /*
    * Check-In date checking
    * Check-In date can not be AFTER Check-Out date
    * Check-In date can not be before today
    */
    function disallowDateAfter1(dateCheckIn) {
        dateCheckIn.setHours(0,0,0,0)
        if ((endDate1 != null) && dateCheckIn > endDate1)
            // endDate defined, calendar date can NOT be after endDate
            return true;

        var now = new Date()
        now.setHours(0,0,0,0)

        if (dateCheckIn < now)
            // endDate NOT defined, calendar date can not be before today
            return true;

        return false;
    }

    function disallowDateAfter2(dateCheckIn) {
        dateCheckIn.setHours(0,0,0,0)
        if ((endDate2 != null) && dateCheckIn > endDate2)
            // endDate defined, calendar date can NOT be after endDate
            return true;

        var now = new Date()
        now.setHours(0,0,0,0)

        if (dateCheckIn < now)
            // endDate NOT defined, calendar date can not be before today
            return true;

        return false;
    }

    function disallowDateAfter3(dateCheckIn) {
        dateCheckIn.setHours(0,0,0,0)
        if ((endDate3 != null) && dateCheckIn > endDate3)
            // endDate defined, calendar date can NOT be after endDate
            return true;

        var now = new Date()
        now.setHours(0,0,0,0)

        if (dateCheckIn < now)
            // endDate NOT defined, calendar date can not be before today
            return true;

        return false;
    }

    function disallowDateAfter4(dateCheckIn) {
        dateCheckIn.setHours(0,0,0,0)
        if ((endDate4 != null) && dateCheckIn > endDate4)
            // endDate defined, calendar date can NOT be after endDate
            return true;

        var now = new Date()
        now.setHours(0,0,0,0)

        if (dateCheckIn < now)
            // endDate NOT defined, calendar date can not be before today
            return true;

        return false;
    }

    function disallowDateAfter5(dateCheckIn) {
        dateCheckIn.setHours(0,0,0,0)
        if ((endDate5 != null) && dateCheckIn > endDate5)
            // endDate defined, calendar date can NOT be after endDate
            return true;

        var now = new Date()
        now.setHours(0,0,0,0)

        if (dateCheckIn < now)
            // endDate NOT defined, calendar date can not be before today
            return true;

        return false;
    }

    function disallowDateAfter6(dateCheckIn) {
        dateCheckIn.setHours(0,0,0,0)
        if ((endDate6 != null) && dateCheckIn > endDate6)
            // endDate defined, calendar date can NOT be after endDate
            return true;

        var now = new Date()
        now.setHours(0,0,0,0)

        if (dateCheckIn < now)
            // endDate NOT defined, calendar date can not be before today
            return true;

        return false;
    }

    function disallowDateAfter7(dateCheckIn) {
        dateCheckIn.setHours(0,0,0,0)
        if ((endDate7 != null) && dateCheckIn > endDate7)
            // endDate defined, calendar date can NOT be after endDate
            return true;

        var now = new Date()
        now.setHours(0,0,0,0)

        if (dateCheckIn < now)
            // endDate NOT defined, calendar date can not be before today
            return true;

        return false;
    }


    function disallowDateAfter8(dateCheckIn) {
        dateCheckIn.setHours(0,0,0,0)
        if ((endDate8 != null) && dateCheckIn > endDate8)
            // endDate defined, calendar date can NOT be after endDate
            return true;

        var now = new Date()
        now.setHours(0,0,0,0)

        if (dateCheckIn < now)
            // endDate NOT defined, calendar date can not be before today
            return true;

        return false;
    }


    function disallowDateAfter9(dateCheckIn) {
        dateCheckIn.setHours(0,0,0,0)
        if ((endDate9 != null) && dateCheckIn > endDate9)
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
    var disallowDateAfter1
    var disallowDateBefore
    var disallowDateBefore1
    var filterDates1
    var filterDates2
    var filterDates3
    var filterDates4
    var filterDates5
    var filterDates6
    var filterDates7
    var filterDates8
    var filterDates9
    var filterDates10
    var filterDates11
    var filterDates12
    var filterDates13
    var filterDates14
    var filterDates15
    var filterDates16
    var filterDates17
    var filterDates18
    var filterDates19
    var filterDates20
    var calx = new Zapatec.Calendar.setup({

        inputField     :    "bookedon",   // id of the input field
        button         :    "button8lx",  // What will trigger the popup of the calendar
        ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime      :     false,          //no time
        //dateStatusFunc    :    disallowDateAfter, //the function to call
        onUpdate       :    filterDates1

    });
		
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
    var cal1 = new Zapatec.Calendar.setup({

        inputField     :    "checkIn_date1",   // id of the input field
        button         :    "button8c",  // What will trigger the popup of the calendar
        ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime      :     false,          //no time
        dateStatusFunc    :    disallowDateAfter1, //the function to call
        onUpdate       :    filterDates3

    });

    Zapatec.Calendar.setup({
        inputField     :    "checkOut_date1",
        button         :    "button8d",  // What will trigger the popup of the calendar
        ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime      :     false,          //no time
        dateStatusFunc    :    disallowDateBefore1, //the function to call
        onUpdate       :    filterDates4
    });
  
    var cal2 = new Zapatec.Calendar.setup({

        inputField     :    "checkIn_date2",   // id of the input field
        button         :    "button8e",  // What will trigger the popup of the calendar
        ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime      :     false,          //no time
        dateStatusFunc    :    disallowDateAfter2, //the function to call
        onUpdate       :    filterDates5

    });

    Zapatec.Calendar.setup({
        inputField     :    "checkOut_date2",
        button         :    "button8f",  // What will trigger the popup of the calendar
        ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime      :     false,          //no time
        dateStatusFunc    :    disallowDateBefore2, //the function to call
        onUpdate       :    filterDates6
    });
  
    var cal3 = new Zapatec.Calendar.setup({

        inputField     :    "checkIn_date3",   // id of the input field
        button         :    "button8g",  // What will trigger the popup of the calendar
        ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime      :     false,          //no time
        dateStatusFunc    :    disallowDateAfter3, //the function to call
        onUpdate       :    filterDates7

    });

    Zapatec.Calendar.setup({
        inputField     :    "checkOut_date3",
        button         :    "button8h",  // What will trigger the popup of the calendar
        ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime      :     false,          //no time
        dateStatusFunc    :    disallowDateBefore3, //the function to call
        onUpdate       :    filterDates8
    });
    var cal4 = new Zapatec.Calendar.setup({

        inputField     :    "checkIn_date4",   // id of the input field
        button         :    "button8i",  // What will trigger the popup of the calendar
        ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime      :     false,          //no time
        dateStatusFunc    :    disallowDateAfter4, //the function to call
        onUpdate       :    filterDates9

    });

    Zapatec.Calendar.setup({
        inputField     :    "checkOut_date4",
        button         :    "button8j",  // What will trigger the popup of the calendar
        ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime      :     false,          //no time
        dateStatusFunc    :    disallowDateBefore4, //the function to call
        onUpdate       :    filterDates10
    });
    var cal5 = new Zapatec.Calendar.setup({

        inputField     :    "checkIn_date5",   // id of the input field
        button         :    "button8k",  // What will trigger the popup of the calendar
        ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime      :     false,          //no time
        dateStatusFunc    :    disallowDateAfter5, //the function to call
        onUpdate       :    filterDates11

    });

    Zapatec.Calendar.setup({
        inputField     :    "checkOut_date5",
        button         :    "button8l",  // What will trigger the popup of the calendar
        ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime      :     false,          //no time
        dateStatusFunc    :    disallowDateBefore5, //the function to call
        onUpdate       :    filterDates12
    });
    var cal6 = new Zapatec.Calendar.setup({

        inputField     :    "checkIn_date6",   // id of the input field
        button         :    "button8m",  // What will trigger the popup of the calendar
        ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime      :     false,          //no time
        dateStatusFunc    :    disallowDateAfter6, //the function to call
        onUpdate       :    filterDates13

    });

    Zapatec.Calendar.setup({
        inputField     :    "checkOut_date6",
        button         :    "button8n",  // What will trigger the popup of the calendar
        ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime      :     false,          //no time
        dateStatusFunc    :    disallowDateBefore6, //the function to call
        onUpdate       :    filterDates14
    });
    var cal7 = new Zapatec.Calendar.setup({

        inputField     :    "checkIn_date7",   // id of the input field
        button         :    "button8o",  // What will trigger the popup of the calendar
        ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime      :     false,          //no time
        dateStatusFunc    :    disallowDateAfter7, //the function to call
        onUpdate       :    filterDates15

    });

    Zapatec.Calendar.setup({
        inputField     :    "checkOut_date7",
        button         :    "button8p",  // What will trigger the popup of the calendar
        ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime      :     false,          //no time
        dateStatusFunc    :    disallowDateBefore7, //the function to call
        onUpdate       :    filterDates16
    });
    var cal8 = new Zapatec.Calendar.setup({

        inputField     :    "checkIn_date8",   // id of the input field
        button         :    "button8q",  // What will trigger the popup of the calendar
        ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime      :     false,          //no time
        dateStatusFunc    :    disallowDateAfter8, //the function to call
        onUpdate       :    filterDates17

    });

    Zapatec.Calendar.setup({
        inputField     :    "checkOut_date8",
        button         :    "button8r",  // What will trigger the popup of the calendar
        ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime      :     false,          //no time
        dateStatusFunc    :    disallowDateBefore8, //the function to call
        onUpdate       :    filterDates18
    });
    var cal9= new Zapatec.Calendar.setup({

        inputField     :    "checkIn_date9",   // id of the input field
        button         :    "button8s",  // What will trigger the popup of the calendar
        ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime      :     false,          //no time
        dateStatusFunc    :    disallowDateAfter9, //the function to call
        onUpdate       :    filterDates19

    });

    Zapatec.Calendar.setup({
        inputField     :    "checkOut_date9",
        button         :    "button8t",  // What will trigger the popup of the calendar
        ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime      :     false,          //no time
        dateStatusFunc    :    disallowDateBefore9, //the function to call
        onUpdate       :    filterDates20
    });
  
    
    /* for(i=1;i<=17;i+=2)
   	      {
   	          var id="checkIn_date"+i;
   	          var cal = new Zapatec.Calendar.setup({

   	              inputField     :    "checkOut_date1",   // id of the input field
   	              button         :    "button8a",  // What will trigger the popup of the calendar
   	              ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
   	              showsTime      :     false,          //no time
   	              dateStatusFunc    :    disallowDateAfter, //the function to call
   	              onUpdate       :    filterDates1

   	          });
   	      }
   	      for(i=2;i<=16;i+=2)
   	      {
   	          var id1="checkOut_date"+i
              Zapatec.Calendar.setup({
                  inputField     :   id1 ,
                  button         :    "button8b",  // What will trigger the popup of the calendar
                  ifFormat       :    "%b %d, %Y",       // format of the input field: Mar 18, 2005
                  showsTime      :     false,          //no time
                  dateStatusFunc    :    disallowDateBefore, //the function to call
                  onUpdate       :    filterDates2
              });*/
   	      
   		</script>
</form>
</body>
</html>
<%
 End If
 %>
