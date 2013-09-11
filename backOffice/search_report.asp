<%@ Language = "VBScript" %>
<% 'OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 23/09/2010'
'Description :'
' Display Cities'
'======================================================='
    server.ScriptTimeout=70
%>
<link rel="stylesheet" href="css/jq.css" />
<script type="text/javascript" src="js/jquery-latest.js"></script> 
<script type="text/javascript" src="js/jquery.tablesorter.js"></script> 
<script type="text/javascript">
    var req1 = null;
    $(document).ready(function () {
        $("#myTable").tablesorter({
            debug: true

        });
        // alert("google");
    }
   );
    function fetch_dates() {

        if (window.XMLHttpRequest) {
            req1 = new XMLHttpRequest; //mozilla/safari
        } else if (window.ActiveXObject) {
            req1 = new ActiveXObject("Microsoft.XMLHTTP"); //internet explorer
        }
        //
        //define callback handler
        if (req1) {
            //
            req1.onreadystatechange = onReadyState1;
            req1.open("GET", "get_start_date.asp", true);
            req1.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            req1.send();
        }
    }




    function onReadyState1() {
        //
        var ready1 = req1.readyState;
        var data = null;
        if (ready1 == 4) { //check ready state

            data = req1.responseText; //read response data
            //alert(data)
            //   document.write(data)
            //modified by Saubhik

            var items = data.split('<br>');
            var length = items.length;
            //alert(length)

            var childE3 = document.createElement('option'); //create option
            var E3 = document.getElementById("startdate");
            E3.appendChild(childE3); //then append it to the second dropdown list
            childE3.value = 'Select';
            childE3.innerHTML = 'Select';


            for (var i = 0; i < length - 1; i++) {
                var childEl = document.createElement('option'); //create option
                var El = document.getElementById("startdate");
                El.appendChild(childEl); //then append it to the second dropdown list
                var items1 = items[i].split(',');
                //  myString = items[i];//need

                //Split the value
                //var mySplit = myString.split(",");
                childEl.value = items1[0];
                childEl.innerHTML = items1[1];

                // childEl.value = mySplit[0];
                //childEl.innerHTML = items[i];
            }


        }
    }


    var req2 = null;
    function fetch_courseid() {

        if (window.XMLHttpRequest) {
            req2 = new XMLHttpRequest; //mozilla/safari
        } else if (window.ActiveXObject) {
            req2 = new ActiveXObject("Microsoft.XMLHTTP"); //internet explorer
        }
        //
        //define callback handler
        if (req2) {
            //
            req2.onreadystatechange = onReadyState2;
            req2.open("GET", "get_courseid.asp", true);
            req2.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            req2.send();
        }
    }




    function onReadyState2() {
        //
        var ready1 = req2.readyState;
        var data = null;
        if (ready1 == 4) { //check ready state

            data = req2.responseText; //read response data
            //alert(data)
            //   document.write(data)
            var items = data.split('<br>');
            var length = items.length;
            //alert(length)

            var childE3 = document.createElement('option'); //create option
            var E3 = document.getElementById("refno");
            E3.appendChild(childE3); //then append it to the second dropdown list
            childE3.value = 'Select';
            childE3.innerHTML = 'Select';


            for (var i = 0; i < length - 1; i++) {
                var childEl = document.createElement('option'); //create option
                var El = document.getElementById("refno");
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



    var req3 = null;
    function fetch_duration() {

        if (window.XMLHttpRequest) {
            req3 = new XMLHttpRequest; //mozilla/safari
        } else if (window.ActiveXObject) {
            req3 = new ActiveXObject("Microsoft.XMLHTTP"); //internet explorer
        }
        //
        //define callback handler
        if (req3) {
            //
            req3.onreadystatechange = onReadyState3;
            req3.open("GET", "get_duration.asp", true);
            req3.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            req3.send();
        }
    }




    function onReadyState3() {
        //
        var ready1 = req3.readyState;
        var data = null;
        if (ready1 == 4) { //check ready state

            data = req3.responseText; //read response data
            //alert(data)
            //   document.write(data)
            var items = data.split('<br>');
            var length = items.length;
            //alert(length)

            var childE3 = document.createElement('option'); //create option
            var E3 = document.getElementById("duration");
            E3.appendChild(childE3); //then append it to the second dropdown list
            childE3.value = 'Select';
            childE3.innerHTML = 'Select';


            for (var i = 0; i < length - 1; i++) {
                var childEl = document.createElement('option'); //create option
                var El = document.getElementById("duration");
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
    var req4 = null;
    function fetch_coursetype() {

        if (window.XMLHttpRequest) {
            req4 = new XMLHttpRequest; //mozilla/safari
        } else if (window.ActiveXObject) {
            req4 = new ActiveXObject("Microsoft.XMLHTTP"); //internet explorer
        }
        //
        //define callback handler
        if (req4) {
            //
            req4.onreadystatechange = onReadyState4;
            req4.open("GET", "get_coursetype.asp", true);
            req4.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            req4.send();
        }
    }




    function onReadyState4() {
        //
        var ready1 = req4.readyState;
        var data = null;
        if (ready1 == 4) { //check ready state

            data = req4.responseText; //read response data
            //alert(data)
            //   document.write(data)
            var items = data.split('<br>');
            var length = items.length;
            //alert(length)

            var childE3 = document.createElement('option'); //create option
            var E3 = document.getElementById("coursetype");
            E3.appendChild(childE3); //then append it to the second dropdown list
            childE3.value = 'Select';
            childE3.innerHTML = 'Select';


            for (var i = 0; i < length - 1; i++) {
                var childEl = document.createElement('option'); //create option
                var El = document.getElementById("coursetype");
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


    var req5 = null;
    function fetch_city() {

        if (window.XMLHttpRequest) {
            req5 = new XMLHttpRequest; //mozilla/safari
        } else if (window.ActiveXObject) {
            req5 = new ActiveXObject("Microsoft.XMLHTTP"); //internet explorer
        }
        //
        //define callback handler
        if (req5) {
            //
            req5.onreadystatechange = onReadyState5;
            req5.open("GET", "get_city.asp", true);
            req5.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            req5.send();
        }
    }




    function onReadyState5() {
        //
        var ready1 = req5.readyState;
        var data = null;
        if (ready1 == 4) { //check ready state

            data = req5.responseText; //read response data
            //alert(data)
            //   document.write(data)
            var items = data.split('<br>');
            var length = items.length;
            //alert(length)

            var childE3 = document.createElement('option'); //create option
            var E3 = document.getElementById("city");
            E3.appendChild(childE3); //then append it to the second dropdown list
            childE3.value = 'Select';
            childE3.innerHTML = 'Select';


            for (var i = 0; i < length - 1; i++) {
                var childEl = document.createElement('option'); //create option
                var El = document.getElementById("city");
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


    var req6 = null;
    function fetch_instructor() {

        if (window.XMLHttpRequest) {
            req6 = new XMLHttpRequest; //mozilla/safari
        } else if (window.ActiveXObject) {
            req6 = new ActiveXObject("Microsoft.XMLHTTP"); //internet explorer
        }
        //
        //define callback handler
        if (req6) {
            //
            req6.onreadystatechange = onReadyState6;
            req6.open("GET", "get_instructor.asp", true);
            req6.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            req6.send();
        }
    }




    function onReadyState6() {
        //
        var ready1 = req6.readyState;
        var data = null;
        if (ready1 == 4) { //check ready state

            data = req6.responseText; //read response data
            //alert(data)
            //   document.write(data)
            var items = data.split('<br>');
            var length = items.length;
            //alert(length)

            var childE3 = document.createElement('option'); //create option
            var E3 = document.getElementById("instructor");
            E3.appendChild(childE3); //then append it to the second dropdown list
            childE3.value = 'Select';
            childE3.innerHTML = 'Select';


            for (var i = 0; i < length - 1; i++) {
                var childEl = document.createElement('option'); //create option
                var El = document.getElementById("instructor");
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


    var req7 = null;
    function fetch_cid() {

        if (window.XMLHttpRequest) {
            req7 = new XMLHttpRequest; //mozilla/safari
        } else if (window.ActiveXObject) {
            req7 = new ActiveXObject("Microsoft.XMLHTTP"); //internet explorer
        }
        //
        //define callback handler
        if (req7) {
            //
            req7.onreadystatechange = onReadyState7;
            req7.open("GET", "get_certificateid.asp", true);
            req7.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            req7.send();
        }
    }




    function onReadyState7() {
        //
        var ready1 = req7.readyState;
        var data = null;
        if (ready1 == 4) { //check ready state

            data = req7.responseText; //read response data
            //alert(data)
            //   document.write(data)
            var items = data.split('<br>');
            var length = items.length;
            //alert(length)

            var childE3 = document.createElement('option'); //create option
            var E3 = document.getElementById("cid");
            E3.appendChild(childE3); //then append it to the second dropdown list
            childE3.value = 'Select';
            childE3.innerHTML = 'Select';


            for (var i = 0; i < length ; i++) {
                var childEl = document.createElement('option'); //create option
                var El = document.getElementById("cid");
                El.appendChild(childEl); //then append it to the second dropdown list

                myString = items[i];//need

                //Split the value
                var mySplit = myString.split(",");
                childEl.value = mySplit[0];
                childEl.innerHTML = mySplit[1];

                // childEl.value = mySplit[0];
                //childEl.innerHTML = items[i];
            }


        }
    }

    function set_available() {

        alert("google")
    }

</script>
<% If not  Session("UserId") = "" Then %>
<!--#include virtual="./includes/connection.asp"-->


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
 <title>search_report</title>
 <link href="/backoffice/css/pagestyle.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        #cid {
            width: 111px;
            height: 29px;
        }
    </style>
</head>
<body onload="fetch_dates(),fetch_courseid(),fetch_duration(),fetch_city(),fetch_instructor(),fetch_cid()"><div id="htMap">
<table border="1" height="550" cellspacing="0" class="dbborder" width="1000px" id="MyTable">
 <tr>
   <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% if Session("country") = "" And session("brand") = "" then %>
     
  
         <% elseif Session("country") = "" And session("brand") <> "" then %>
   
		      <span style="color:#FF3300"><% =Session("brand") %></span>
       
	     <% else %>
     
		       <span style="color:#FF3300"><% =Session("brand") %>&nbsp;<% =Session("country") %></span>
         
	     <% end if %> 
     </span>Back Office</font></div></td>
 </tr>
 <tr>
  <td width="100px" valign="top" rowspan="22">
    <!--#include file="includes/leftMenu.html"-->
  </td>
 </tr>
 
 <tr><td>
     <table><td>
          <form name="b" action="search_report.asp" method="get" >
              <input type="hidden" name="t1" value="page1" />
              <style>
.inputStylingTable td{
	padding:10px;
	border:solid 1px #ddd;
	vertical-align:middle;
}
.inputStylingTable td.lebelForTextField{
	border-right:none;
	text-align:right;
    font-weight:bold;
}
.inputStylingTable td.ForTextField{
	border-left:none;
	text-align:left;
}
</style><br />
<table border="0" cellspacing="0" cellpadding="0" style="max-width:1000px; border-collapse:collapse; width: 101%;" class="inputStylingTable">
  <!--<tr>
    <td width="20%" class="lebelForTextField">Search for Event ID</td>
    <td colspan="3"  class="ForTextField">
            <input id="eventid" type="text" name="eventid" />&nbsp;&nbsp;
            <input id="Submit1" type="submit" value="submit" class="buttonc"/></td>
    </tr>-->
  <tr>
    <td class="lebelForTextField">Search By Course Code</td>
    <td colspan="3" class="ForTextField"><select name="refno" id="refno"></select>&nbsp;&nbsp;&nbsp;&nbsp;
             <input id="" type="submit" value="Submit" class="buttonc" /></td>
    </tr>
  <tr>
    <td width="20%" class="lebelForTextField">Search by Course Start Date</td>
    <td width="30%" class="ForTextField"><select name="startdate" id="startdate"></select>&nbsp;&nbsp; <input id="Submit2" type="submit" value="submit" class="buttonc"/></td>
    <td rowspan="5" class="auto-style1">Search by Certification Type<br />
      </td>
    <td rowspan="5" width="30%" class="ForTextField"><select name="cid" id="cid"></select><input id="Submit5" type="submit" value="submit" class="buttonc" /></td>
  </tr>
  <tr>
    <td class="lebelForTextField">Search by Course Durations </td>
    <td class="ForTextField"><select name="duration" id="duration"></select>&nbsp;&nbsp;&nbsp; <input id="Submit3" type="submit" value="submit" class="buttonc" /></td>
    </tr>
  <tr>
    <td class="lebelForTextField">Search by Course Type</td>
    <td class="ForTextField"><select name="coursetype" id="coursetype"><option value="select">Select</option><option value="Public">Public</option><option value="Private">Private</option><option value="Live">Live</option></select>&nbsp;&nbsp;&nbsp;&nbsp; <input id="Submit4" type="submit" class="buttonc" value="submit" /></td>
    </tr>
  <tr>
    <td class="lebelForTextField">Search by City</td>
    <td class="ForTextField"><select name="city" id="city"></select>&nbsp;&nbsp;&nbsp;&nbsp; <input id="Submit6" type="submit" value="submit" class="buttonc" /></td>
    </tr>
  <tr>
    <td class="lebelForTextField">Search by Instructor</td>
    <td class="ForTextField"> <select name="instructor" id="instructor"></select>&nbsp;&nbsp;&nbsp; <input id="Submit7" type="submit" value="submit"  class="buttonc"/></td>
    </tr>
</table>              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
              
              <br />
              
         <a href="search_report.asp">Clear Search</a></form>
                      </td>
       <tr>      <td>&nbsp;</td>
         </tr>
     </table>

<%

'Declare The Variables'
Dim strCourseIds, strEnrollments, strPaid ,strPayment
Dim objRs, objRs1,PO_Received ,PaymentDeclined ,paymentstatus
Dim CourseId, City, StartDate, EndDate ,UnderProcess, Course
Dim TotalEnrollments, Paid, State_Code, Instructor, strCountry
DIm strCoursePROJ, strCourseDatrix,strEnrollmentsDatrix
Dim firstRow,lastRow,numRows,rowcounter,TotalEnrollmentsDatrix
Dim arrAllRecords,allNumRows,rqQuote

Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")


'Display the queries country wise'
	strCountry = "(course.country = '"&Session("country")&"')"


Session.Timeout = 10
    
       session("params")="" 
    
'strCourseIds = "SELECT courseid, city, startdate, enddate FROM ps_course WHERE country = 'US' AND status <> 'Cancelled' AND status <> 'Completed' ORDER BY startdate"
  ' session("params")="eventid="&request.QueryString("eventid")&"&t1=page1&refno=P209-F&cid=Select&startdate=Select&duration=Select&coursetype=select&city=Select&instructor=Select"
    if request.QueryString("eventid")<>"" then
    courseid=request.QueryString("eventid")
    Session("courseid")=courseid
    session("params")="eventid="&request.QueryString("eventid")
  ' response.Write(session("params"))
     strCourseIds = "SELECT course.courseid, course.courseName, course.city, course.startdate, course.enddate, city.state_code, course.instructor,course.hoteladdress FROM course course, city city,proj_locations loc WHERE  course.city = city.city And "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' And course.vendorId = '1' And course.certificateId = '1' and course.courseid='"&courseid&"' Union SELECT course.courseid, course.courseName, course.city, course.startdate, course.enddate, city.state_code, course.instructor,course.hoteladdress FROM datrixClasses course, city city,proj_locations loc WHERE course.courseid='"&courseid&"' and course.city = city.city And "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' And course.vendorId = '2' And course.certificateId = '2' order by course.startdate, course.city asc"
    'response.Write(strCourseIds)
    ' else if request.QueryString("startdate")<>"" then
    elseif request.QueryString("refno")<>"Select" and request.QueryString("refno")<>""  then
    refno=request.QueryString("refno")
    Session("refno")=refno
     session("params")="refno="&request.QueryString("refno")
   strCourseIds = "SELECT course.courseid, course.courseName, course.city, course.startdate, course.enddate, city.state_code, course.instructor,course.hoteladdress FROM course course, city city,proj_locations loc WHERE   course.city = city.city And "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' And course.vendorId = '1' And course.certificateId = '1' and course.RefNumber='"&refno&"' Union SELECT course.courseid, course.courseName, course.city, course.startdate, course.enddate, city.state_code, course.instructor,course.hoteladdress FROM datrixClasses course, city city,proj_locations loc where   course.city = city.city And "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' And  course.RefNumber='"&refno&"' and course.vendorId = '2' And course.certificateId = '2' order by course.startdate, course.city asc"
    ' response.Write(strCourseIds)
 
    elseif request.QueryString("cid")<>"Select"  and request.QueryString("cid")<>"" and request.QueryString("startdate")<>"Select"  and request.QueryString("startdate")<>"" then
    startdate=request.QueryString("startdate")
    cid=request.QueryString("cid")
    session("cid")=cid
    Session("start")=startdate
     session("params")="cid="&cid&"&startdate="&startdate
     strCourseIds = "SELECT course.courseid, course.courseName, course.city, course.startdate, course.enddate, city.state_code, course.instructor,course.hoteladdress FROM course course, city city,proj_locations loc WHERE   course.city = city.city And "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' and course.certificateId = '"&cid&"'  and course.startdate='"&startdate&"' Union SELECT course.courseid, course.courseName, course.city, course.startdate, course.enddate, city.state_code, course.instructor,course.hoteladdress FROM datrixClasses course, city city,proj_locations loc WHERE   course.city = city.city And "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' and course.certificateId = '"&cid&"' and course.startdate='"&startdate&"' order by course.startdate, course.city asc"
   ' response.Write(strCourseIds)
  
      elseif request.QueryString("startdate")<>"Select"  and request.QueryString("startdate")<>"" then
    startdate=request.QueryString("startdate")
    Session("start")=startdate
      session("params")="startdate="&startdate
     strCourseIds = "SELECT course.courseid, course.courseName, course.city, course.startdate, course.enddate, city.state_code, course.instructor,course.hoteladdress FROM course course, city city,proj_locations loc WHERE   course.city = city.city And "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' And course.vendorId = '1' And course.certificateId = '1'  and course.startdate='"&startdate&"' Union SELECT course.courseid, course.courseName, course.city, course.startdate, course.enddate, city.state_code, course.instructor,course.hoteladdress FROM datrixClasses course, city city,proj_locations loc WHERE   course.city = city.city And "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' And course.vendorId = '2'  and course.certificateId = '2' and course.startdate='"&startdate&"' order by course.startdate, course.city asc"
    'response.Write(strCourseIds)
  
      elseif request.QueryString("cid")<>"Select"  and request.QueryString("cid")<>"" and request.QueryString("duration")<>"Select" and request.QueryString("duration")<>"" then
      duration=request.QueryString("duration")
      cid=request.QueryString("cid")
    session("cid")=cid
     Session("duration")=duration
     session("params")="duration="&duration&"&cid="&cid
     strCourseIds = "SELECT distinct course.courseid, course.courseName, course.city, course.startdate, course.enddate, city.state_code, course.instructor,course.hoteladdress FROM datrixClasses course, city city,proj_locations loc WHERE    course.duration='"&duration&"' and course.city = city.city And "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' and course.certificateId = '"&cid&"'  order by course.startdate, course.city asc"
   'response.Write(strCourseIds)

     elseif request.QueryString("duration")<>"Select" and request.QueryString("duration")<>"" then
     duration=request.QueryString("duration")
     Session("duration")=duration
     session("params")="duration="&duration
     strCourseIds = "SELECT distinct course.courseid, course.courseName, course.city, course.startdate, course.enddate, city.state_code, course.instructor,course.hoteladdress FROM datrixClasses course, city city,proj_locations loc WHERE    course.duration='"&duration&"' and course.city = city.city And "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' And course.vendorId = '2' And course.certificateId = '2'  order by course.startdate, course.city asc"
   'response.Write(strCourseIds)
     
    elseif request.QueryString("cid")<>"Select"  and request.QueryString("cid")<>"" and request.QueryString("coursetype")<>"select" and request.QueryString("coursetype")<>""  then
    coursetype=request.QueryString("coursetype")
    cid=request.QueryString("cid")
    session("cid")=cid
    Session("coursetype")=coursetype
    session("params")="cid="&cid&"&coursetype="&coursetype
    
    strCourseIds = "SELECT distinct course.courseid,course.courseName, course.city, course.startdate, course.enddate, city.state_code, course.instructor,course.hoteladdress FROM datrixClasses course, city city,proj_locations loc WHERE   course.coursetype='"&coursetype&"' and course.city = city.city And "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' and course.certificateId = '"&cid&"'  order by course.startdate, course.city asc"
    'response.Write(strCourseIds)
    
    elseif request.QueryString("coursetype")<>"select" and request.QueryString("coursetype")<>""  then
    coursetype=request.QueryString("coursetype")
    Session("coursetype")=coursetype
    strCourseIds = "SELECT distinct course.courseid,course.courseName, course.city, course.startdate, course.enddate, city.state_code, course.instructor,course.hoteladdress FROM datrixClasses course, city city,proj_locations loc WHERE   course.coursetype='"&coursetype&"' and course.city = city.city And "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' And course.vendorId = '2' And course.certificateId = '2'  order by course.startdate, course.city asc"
    'response.Write(strCourseIds)

   session("params")="coursetype="&coursetype
    elseif request.QueryString("cid")<>"Select"  and request.QueryString("cid")<>"" and request.QueryString("city")<>"Select" and request.QueryString("city")<>"" then
    city=request.QueryString("city")
    cid=request.QueryString("cid")
   session("cid")=cid

     'response.Write(strCourseIds)
   ' Session("courseid")=courseid
    Session("city")=city
     session("params")="cid="&cid&"&city="&city
    strCourseIds = "SELECT distinct course.courseid,course.courseName, course.city, course.startdate, course.enddate, city.state_code, course.instructor,course.hoteladdress FROM datrixClasses course, city city,proj_locations loc WHERE    course.city = city.city  and course.city='"&city&"' And  "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' and  course.certificateId = '"&cid&"'  order by course.startdate, course.city asc"
    
    'response.Write(strCourseIds)
  
     elseif request.QueryString("city")<>"Select" and request.QueryString("city")<>"" then
     city=request.QueryString("city")
     'response.Write(strCourseIds)
   ' Session("courseid")=courseid
    Session("city")=city
    session("params")="city="&city
    strCourseIds = "SELECT distinct course.courseid,course.courseName, course.city, course.startdate, course.enddate, city.state_code, course.instructor,course.hoteladdress FROM datrixClasses course, city city,proj_locations loc WHERE    course.city = city.city  and course.city='"&city&"' And  "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' And course.vendorId = '2' And course.certificateId = '2'  order by course.startdate, course.city asc"
    
    'response.Write(strCourseIds)
    elseif request.QueryString("cid")<>"Select"  and request.QueryString("cid")<>"" and request.QueryString("instructor")<>"Select" and request.QueryString("instructor")<>"" then
   instructor=request.QueryString("instructor")
    cid=request.QueryString("cid")
    session("cid")=cid
    Session("instructor")=instructor
    strCourseIds = "SELECT distinct course.courseid,course.courseName, course.city, course.startdate, course.enddate, city.state_code, course.instructor,course.hoteladdress FROM datrixClasses course, city city,proj_locations loc WHERE   course.instructor='"&instructor&"' and course.city = city.city   And  "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"'  and  course.certificateId = '"&cid&"'   order by course.startdate, course.city asc"
    'response.Write(strCourseIds)
    session("params")="cid="&cid&"&instructor="&instructor
    elseif request.QueryString("instructor")<>"Select" and request.QueryString("instructor")<>"" then
   instructor=request.QueryString("instructor")
    Session("instructor")=instructor
    session("params")="instructor="&instructor
    
    strCourseIds = "SELECT distinct course.courseid,course.courseName, course.city, course.startdate, course.enddate, city.state_code, course.instructor,course.hoteladdress FROM datrixClasses course, city city,proj_locations loc WHERE   course.instructor='"&instructor&"' and course.city = city.city   And  "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' And course.vendorId = '2' And course.certificateId = '2'  order by course.startdate, course.city asc"
   ' response.Write(strCourseIds)
    else
     strCourseIds = "SELECT course.courseid, course.courseName, course.city, course.startdate, course.enddate, city.state_code, course.instructor,course.hoteladdress FROM course course, city city,proj_locations loc WHERE  course.city = city.city And "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' And course.vendorId = '1' And course.certificateId = '1'  Union SELECT course.courseid, course.courseName, course.city, course.startdate, course.enddate, city.state_code, course.instructor,course.hoteladdress FROM datrixClasses course, city city,proj_locations loc where  course.city = city.city And "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' And course.vendorId = '2' And course.certificateId = '2'  order by course.startdate, course.city asc"
     session("params")="" 
    
    ' response.Write(strCourseIds)
 '      end if   
    end if
objRs.Open strCourseIds,ConnObj

'Retrive All Values From Query And Doeing Pagination'
					
					  If Not objRs.EOF Then
						arrAllRecords = objRs.getrows
						Session("arrAllRecords") = arrAllRecords
	          dim arrall
           arrall=Session("arrAllRecords")	
    				 cnt = 1
						firstRow = 0
						lastRow = 49
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
						 If numRows > 49 Then
							lastRow = 49  
						 Else
							lastRow = numRows
						 End If 
					  Else
						
						arrAllRecords = Session("arrAllRecords")	
						numRows = Ubound(arrAllRecords,2)
						
						iPageCurrent = Request.QueryString("page") 
						firstRow = ((50 * iPageCurrent)-50) 
						 lastRow = firstRow + 49 
					
						If lastRow > numRows Then   
						lastRow = numRows
					   End If
					
						If firstRow < 0 Then
						   firstRow = 0
						End If
					
					 End if
					 End If
					
                         session("iPageCurrent")=iPageCurrent
            
%>
    <form action="update_late_availibility.asp" method="post">
     <table  border="1"   cellspacing="2" class="dbborder" width="1000px" cellpadding="5"><tr>
       <td colspan="3" style="width:100px" ><input type="submit" name="update" value="Make Late Availibility" /></td>
       <td colspan="3" style="width:100px" ><input type="submit" name="update" value="Disable Late Availibility" /></td>

<td colspan="6" align="center" style="width:100px; color:#06F;"><b>PROJstudy</b></td>
<td colspan="2" align="center" style="width:100px;color:#06F;"><b>Datrix</b></td>
         </tr></table>
   <style>
       .dbborder td,.dbborder th {
           border:solid #ccc 1px;
            font-size:80%;

            }

       #refno {
           height: 24px;
           width: 117px;
       }
       #startdate {
           height: 17px;
           width: 69px;
       }
       #duration {
           height: 25px;
           width: 65px;
       }
       #coursetype {
           height: 27px;
           width: 61px;
       }
       #city {
           height: 17px;
           width: 58px;
       }
       #instructor {
           height: 16px;
           width: 61px;
       }

       .auto-style1 {
           width: 20%;
       }

       .auto-style2 {
           width: 15px;
       }
       .auto-style3 {
           width: 46px;
       }

   </style>
 <table id="myTable" border="0"   cellspacing="2"  class="dbborder" width="1000px" cellpadding="5" style="border-collapse:collapse">
   

        <thead>
              <tr>
                  <th width="50px" >Select </th>
    <th width="50px">City  </th>
    <th width="50px">Hotel Address</th>
                  
    <th width="200px"><b>Class Date</b></th>
    <th width="200px"><b>Instructor<font color="red" size="2">*</font></b></th>	
    <th width="50px"><b>Total Enrollments</b></th>
    <th class="auto-style3"><b>Payment Made</b></th>	
	<th width="50px"><b>P.O Received</b></th>
    <th width="50px"><b>Payment Declined</b></th>	
	<th width="50px"><b>Under Process</b></th>	
	<th width="50px"><b>Not Paid</b></th>
    <th width="50px"><b>Total Enrollments</b></th>
	<th width="50px"><b>Quote Id</b></th>
    <td width="50px"><b>Revenue</b></td>
     <td width="50px"><b>Costs</b></td>
     <th width="50px"><b>Margin&uarr;&darr;</b></th>
     <th width="50px"><b>Profit(%)&uarr;&darr;</b></th>
           
   <th width="50px"><b>Places Remaining&uarr;&darr;</b></th>
	<th class="auto-style2"><b>Days Remaining&uarr;&darr;</b></th>
  
  
              </tr>
            </thead>
<tbody>
  <%   If IsArray(arrAllRecords) Then
          For rowcounter = firstRow TO lastRow
		  
		 
     CourseId = arrAllRecords(0,rowcounter)
     ' response.Write(CourseId)
	 Course   = arrAllRecords(1,rowcounter)
	 City = Trim(arrAllRecords(2,rowcounter))
	 StartDate = arrAllRecords(3,rowcounter)
	 EndDate = arrAllRecords(4,rowcounter)
     State_Code = arrAllRecords(5,rowcounter)
	 Instructor = arrAllRecords(6,rowcounter)
     proj_loc=arrAllRecords(7,rowcounter)
     new_start_date= FormatDateTime(StartDate,2)
      new_end_date= FormatDateTime(EndDate,2)
      new_format=new_start_date&" to "&new_end_date
     ' response.Write(new_format)
  
          'query to get count of all remaining class

	 strcount_remain="select distinct count(*) how_many_remain from enrolledusers a where  a.checkreceived='Yes' and a.courseid='"&courseid&"'"
      'get output and print
    '  response.Write(strcount_remain)
  
		 objRs1.Open strcount_remain,ConnObj
		 
if not objRs1.EOF then
			count_remain = objRs1("how_many_remain")
		end if 
      'objRs1.Movenext
		 'Loop
		 objRs1.Close
	 total_cap="select b.capacity from proj_locations b,datrixClasses c where b.locationaddress='"&proj_loc&"' and b.location='"&City&"'"
    '  response.Write(total_cap)
       objRs1.Open total_cap,ConnObj
		 
		 if not objRs1.EOF then
			total_c = objRs1("capacity")
		 'objRs1.Movenext
		 'Loop
		end if 
      objRs1.Close

      days_remain="select (DATEDIFF(day,SYSDATETIME(),c.startdate)-1) as day_r from enrolledusers a,proj_locations b,datrixClasses c where  c.courseid='"&courseid&"'"
      'get output and print
     'response.Write(days_remain)
  
		 objRs1.Open days_remain,ConnObj
		 
		 if not objRs1.EOF then
			day_remain = objRs1("day_r")
		 'objRs1.Movenext
		 'Loop
		end if 
      objRs1.Close
	 

		 strEnrollments = "SELECT count(*) AS Total FROM enrolledusers WHERE vendorId = '1' And certificateId = '1' And courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule' And (us_status Is Null OR us_status = 'Active')"
		 objRs1.Open strEnrollments,ConnObj
		 
		 if not objRs1.EOF then
			TotalEnrollments = objRs1("Total")
		end if 
      'objRs1.Movenext
		 'Loop
		 objRs1.Close
		 
		 strPaid = "SELECT count(*) AS Paid FROM enrolledusers WHERE  vendorId = '1' And certificateId = '1' And checkreceived = 'Yes' AND courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule'"
		 objRs1.Open strPaid,ConnObj	 
	
		 if not objRs1.EOF then
			Paid = objRs1("Paid")
		 'objRs1.Movenext
		 'Loop
		end if
       objRs1.Close
		
       
		 strPayment = "SELECT us_status FROM enrolledusers WHERE vendorId = '1' And certificateId = '1' And  courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule'"
		 
		 objRs1.Open strPayment,ConnObj	 
	
		 if not objRs1.EOF then
		  
		 paymentstatus = objRs1("us_status")
		 
		 Select case paymentstatus
		 
		 case "P.O Received"
		 
		 PO_Received = PO_Received + 1
		 
		 case "Payment Declined"
		 PaymentDeclined = PaymentDeclined + 1
		 
		 case "Under Process"
		 UnderProcess = UnderProcess + 1
		 
		 End Select
		 end if
		' objRs1.Movenext
		 'Loop
		 objRs1.Close
		 
		 
		 
		 
		 	 strEnrollmentsDatrix = "SELECT count(*) AS Total FROM enrolledusers WHERE vendorId = '2' And certificateId = '2' And courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule' And (us_status Is Null OR us_status = 'Active')"
		 objRs1.Open strEnrollmentsDatrix,ConnObj
		 
		 if not objRs1.EOF then
			TotalEnrollmentsDatrix = objRs1("Total")
			'response.Write(TotalEnrollments)
		end if 
      'objRs1.Movenext
		 'Loop
		 objRs1.Close
		 
		 strPaidDatrix = "SELECT quoteId FROM enrolledusers WHERE  vendorId = '2' And certificateId = '2' And courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule' And (us_status Is Null OR us_status = 'Active')"
		 
		 objRs1.Open strPaidDatrix,ConnObj	 
		if not objRs1.EOF then
			rqQuote = objRs1("quoteId")
      end if
		' objRs1.Movenext
		 'Loop
		 objRs1.Close
     
      
   %>

  <tr>
      <td><input type="checkbox" name="id"  value="<%=courseid %>" /></td>
    <td><% = City %></td>
      <td><% = proj_loc %></td>

    <td><% = Course %> - <% = FormatDateTime(StartDate,1) %> to <% = FormatDateTime(EndDate,1) %></td>
    <td><% = Instructor %></td>
	<td><% = TotalEnrollments %></td>
    <td class="auto-style3"><% = Paid %></td>
	<td><% = Int(PO_Received) %></td>
    <td><% = Int(PaymentDeclined) %></td>
	<td><% = Int(UnderProcess) %></td>	
	<td><% = (TotalEnrollments - (Paid + PO_Received + PaymentDeclined + UnderProcess)) %></td>
    <td><% = Int(TotalEnrollmentsDatrix) %></td>	
	<td><% = rqQuote %></td>
  <td>
                <%
                     'added by Saubhik (Calculation of revenue,cost,Margin and Profits %
                     Set Rs14 = Server.CreateObject("ADODB.Recordset")
                    
                    
      get_revenue_query = "select sum(CONVERT(float,REPLACE(amount,',',''))) as revenue from enrolledusers where courseid='"&courseid&"'"
          '          response.Write(get_revenue_query)
      Rs14.open get_revenue_query,ConnObj


      If Not Rs14.EOF Then
         revenue=Rs14("revenue")
                     %>
                <%= revenue%>
                <% end if %>
                
            </td>

       <td>
           <%
                    Set Rs15 = Server.CreateObject("ADODB.Recordset")
                Set Rs16 = Server.CreateObject("ADODB.Recordset")
               get_total_no_paid="select count(*) as total from enrolledusers where courseid='"&courseid&"'"
             Rs15.open get_total_no_paid,ConnObj
               
           If Not Rs15.EOF Then
            total=Rs15("total")
            
               end if
            total_cost=""
               
             get_cost_query="select b.cost as cost from datrixClasses a,QW_category b where a.RefNumber=b.VendorPartNumber and b.ItemType='Public Course' and a.courseid='"&courseid&"'"
            
             Rs16.open get_cost_query,ConnObj
               
           If Not Rs16.EOF Then
            tcost=Rs16("cost")
              ' response.Write(tcost&"<br>")
            end if      
            if tcost<>"" then   
              total_cost=CDbl(total)*Cdbl(tcost)
               else
               total_cost=""
               end if
               if revenue<>"" then
                %>
           <%=total_cost %>
           <% end if %>
       </td>
       <td>
           <%
                if revenue<>"" and total_cost<>"" then
                margin=CDbl(revenue)-CDbl(total_cost)
                    %>
           <%=margin %>
           <%

               end if
                %>

       </td>
       <td>
           <%
                if revenue<>"" and margin<>"" and revenue<>"0"   then
                profit=(CDbl(margin)/CDbl(revenue))*(100)
                    %>
           <%=FormatNumber(profit,2) %> 
           <%

               end if
                %>

       </td>
         <td>
        <% 
             if total_c<>"" then
               if count_remain=""  then
                count_remain=total_c
               else
               count_remain=total_c-count_remain
               end if 

            else
            total_c=""
            count_remain=""
            end if
           
             %>
        <%= count_remain %></td>
  <td class="auto-style2"><% if day_remain="" then day_remain="Not assigned" end if%>
      <%=day_remain %></td>
  </tr>

  <%
      response.Flush()
  'Making it zero'

  PO_Received = 0
  PaymentDeclined = 0
  UnderProcess = 0
  count_remain=""
      total_c=""
      day_remain=""
      revenue=""
                total_cost=""
                margin=""
                profit=""
            
      %>
  <% Next
      
       %>
   <tbody>
      <tr><td colspan="17"> 
           <!--#include file="pagination.asp"-->
               <%
                 
                   if request.QueryString("courseid")<>"" then
                 ps = getPaginationString(page, (numRows+1), 50, 2, "search_report.asp?eventid="&Session("courseid")&"&id="& arrall(0,numRows)&"")
			session("params")="eventid="&Session("courseid")&"&id="& arrall(0,numRows)&"&page="&  session("iPageCurrent")
                  	  Response.Write(ps)

	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows)) %>
        <%    BlGetOurVenuesCities = BlGetOurVenuesCities 
            
            elseif request.QueryString("refno")<>"Select" and request.QueryString("refno")<>""  then
                 ps = getPaginationString(page, (numRows+1), 50, 2, "search_report.asp?refno="&Session("refno")&"&id="& arrall(0,numRows)&"")
			session("params")="refno="&Session("refno")&"&id="& arrall(0,numRows)&"&page="&  session("iPageCurrent")
            	  Response.Write(ps)
	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows)) %>
        <%    BlGetOurVenuesCities = BlGetOurVenuesCities 

            elseif request.QueryString("startdate")<>"Select" and request.QueryString("startdate")<>""  and  request.QueryString("cid")<>"Select"  and request.QueryString("cid")<>"" then
                 ps = getPaginationString(page, (numRows+1), 50, 2, "search_report.asp?startdate="&Session("start")&"&id="& arrall(0,numRows)&"&cid="&request.QueryString("cid"))
			session("params")=	"startdate="&Session("start")&"&id="& arrall(0,numRows)&"&cid="&request.QueryString("cid")&"&page="&session("iPageCurrent")

              Response.Write(ps)

	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows)) %>
        <%    BlGetOurVenuesCities = BlGetOurVenuesCities 

          
              elseif request.QueryString("startdate")<>"Select" and request.QueryString("startdate")<>""   then
                 ps = getPaginationString(page, (numRows+1), 50, 2, "search_report.asp?startdate="&Session("start")&"&id="& arrall(0,numRows)&"")
			session("params")=	"startdate="&Session("start")&"&id="& arrall(0,numRows)&"&page="&session("iPageCurrent")
              Response.Write(ps)

	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows)) %>
        <%    BlGetOurVenuesCities = BlGetOurVenuesCities 

        
                  elseif request.QueryString("duration")<>"Select" and request.QueryString("duration")<>"" and  request.QueryString("cid")<>"Select"  and request.QueryString("cid")<>"" then
                 ps = getPaginationString(page, (numRows+1), 50, 2, "search_report.asp?duration="&Session("duration")&"&id="& arrall(0,numRows)&"&cid="&request.QueryString("cid"))
			Response.Write(ps)
            session("params")="duration="&Session("duration")&"&id="& arrall(0,numRows)&"&page="&session("iPageCurrent")&"&cid="&request.QueryString("cid")
	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows)) %>
        <%    BlGetOurVenuesCities = BlGetOurVenuesCities 


              
              elseif request.QueryString("duration")<>"Select" and request.QueryString("duration")<>"" then
                 ps = getPaginationString(page, (numRows+1), 50, 2, "search_report.asp?duration="&Session("duration")&"&id="& arrall(0,numRows)&"")
				  Response.Write(ps)
            session("params")="duration="&Session("duration")&"&id="& arrall(0,numRows)&"&page="&session("iPageCurrent")
	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows)) %>
        <%    BlGetOurVenuesCities = BlGetOurVenuesCities 


            elseif request.QueryString("coursetype")<>"select" and request.QueryString("coursetype")<>""   and  request.QueryString("cid")<>"Select"  and request.QueryString("cid")<>"" then
            
            
                 ps = getPaginationString(page, (numRows+1), 50, 2, "search_report.asp?coursetype="&Session("coursetype")&"&id="& arrall(0,numRows)&"&cid="&request.QueryString("cid"))
				  Response.Write(ps)
            session("params")="coursetype="&Session("coursetype")&"&id="& arrall(0,numRows)&"&page="&session("iPageCurrent")&"&cid="&request.QueryString("cid")
	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows)) %>
        <%    BlGetOurVenuesCities = BlGetOurVenuesCities 


            elseif request.QueryString("coursetype")<>"select" and request.QueryString("coursetype")<>""  then
            
            
                 ps = getPaginationString(page, (numRows+1), 50, 2, "search_report.asp?coursetype="&Session("coursetype")&"&id="& arrall(0,numRows)&"")
			  Response.Write(ps)
            session("params")="coursetype="&Session("coursetype")&"&id="& arrall(0,numRows)&"&page="&session("iPageCurrent")
	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows)) %>
        <%    BlGetOurVenuesCities = BlGetOurVenuesCities 

               elseif request.QueryString("city")<>"Select" and request.QueryString("city")<>"" and  request.QueryString("cid")<>"Select"  and request.QueryString("cid")<>"" then
                 ps = getPaginationString(page, (numRows+1), 50, 2, "search_report.asp?city="&Session("city")&"&id="& arrall(0,numRows)&"&cid="&request.QueryString("cid"))
            session("params")="city="&Session("city")&"&id="& arrall(0,numRows)&"&page="&session("iPageCurrent")&"&cid="&request.QueryString("cid")
				  Response.Write(ps)
	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows)) %>
        <%    BlGetOurVenuesCities = BlGetOurVenuesCities 


            elseif request.QueryString("city")<>"Select" and request.QueryString("city")<>"" then
                 ps = getPaginationString(page, (numRows+1), 50, 2, "search_report.asp?city="&Session("city")&"&id="& arrall(0,numRows)&"")
            session("params")="city="&Session("city")&"&id="& arrall(0,numRows)&"&page="&session("iPageCurrent")
		  Response.Write(ps)
	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows)) %>
        <%    BlGetOurVenuesCities = BlGetOurVenuesCities 

              elseif request.QueryString("instructor")<>"Select" and request.QueryString("instructor")<>"" and  request.QueryString("cid")<>"Select"  and request.QueryString("cid")<>""  then
                 ps = getPaginationString(page, (numRows+1), 50, 2, "search_report.asp?instructor="&Session("instructor")&"&id="& arrall(0,numRows)&"&cid="&request.QueryString("cid"))
				  Response.Write(ps)
            session("params")="instructor="&Session("instructor")&"&id="& arrall(0,numRows)&"&page="&session("iPageCurrent")&"&cid="&request.QueryString("cid")
	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows)) %>
        <%    BlGetOurVenuesCities = BlGetOurVenuesCities 

          

            elseif request.QueryString("instructor")<>"Select" and request.QueryString("instructor")<>"" then
                 ps = getPaginationString(page, (numRows+1), 50, 2, "search_report.asp?instructor="&Session("instructor")&"&id="& arrall(0,numRows)&"")
				  Response.Write(ps)
            session("params")="instructor="&Session("instructor")&"&id="& arrall(0,numRows)&"&page="&session("iPageCurrent")
	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows)) %>
        <%    BlGetOurVenuesCities = BlGetOurVenuesCities 

            end if
         
             %>
		
		 </td></tr>
	</tbody>
      </tbody>
  
   <% End If 
		
  '     response.Write( "edws" &session("params"))

     ConnObj.Close %>
     
    </table>

 </td>
</tr>
	

</table>
        </form>
</div>
</body>
</html>
<%
 Else
 Response.Redirect("../backOffice/login.asp")
 End If
%>
<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
    _uacct = "UA-2189649-1";
    urchinTracker();
</script>
