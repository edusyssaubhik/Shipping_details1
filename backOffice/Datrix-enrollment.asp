<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 'OPTION EXPLICIT %>
<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
'Written By : Bharath'
'Created Date : 02nd Feb 2011
'Last UpDated : 02nd Feb 2011'
'Description :'
'This page is adding UK calls to the database'
'CRM'
'======================================================='

message = Session("message")
 Session("message") = ""

'Declare the local variables'
Dim strUSState, objRs, strUKCounties
Dim PreQuoteID,iLength ,strQuery

'PreQuoteID = Request.QueryString("QuoteID")
'If PreQuoteID <> "" Then
'iLength = Len(PreQuoteID)
'QuoteID = Right(PreQuoteID, (CInt(iLength) - 5))
'End IF


QuoteID = Request.QueryString("QuoteID")
rqState = Request.QueryString("State")

'Creatting the record set'
Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")
Set Rs12 = Server.CreateObject("ADODB.Recordset")

strUKCounties = "SELECT states FROM states WHERE country = 'United Kingdom' ORDER BY states"

objRs.Open strUKCounties, ConnObj

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Enrollment For PROJstudy</title>
<style type="text/css">
body {
	background: white;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #646464;
	text-align: left;
}
    .auto-style1 {
        height: 27px;
    }
    .auto-style2 {
        height: 36px;
    }
</style>
 <script language="JavaScript" type="text/javascript" src="./js/Datrix-courses.js"></script>
    <link href="css/pagestyle.css" rel="stylesheet" type="text/css">
   <script type="text/javascript" src="calendar/zapatec.js"></script>
<script type="text/javascript" src="calendar/calendar.js"></script>
<script type="text/javascript" src="calendar/calendar-en.js"></script>
    <link href="calendar/template.css" rel="stylesheet" type="text/css">
<link href="calendar/system.css" rel="stylesheet" type="text/css">

<script language="javascript">

    function echeck(str) {

        var str1 = str.value
        var at = "@"
        var dot = "."
        var lat = str1.indexOf(at)
        var lstr = str1.length
        var ldot = str1.indexOf(dot)
        if (str1.indexOf(at) == -1) {
            alert("Invalid E-mail ID")
            return false
        }

        if (str1.indexOf(at) == -1 || str1.indexOf(at) == 0 || str1.indexOf(at) == lstr) {
            alert("Invalid E-mail ID")
            return false
        }

        if (str1.indexOf(dot) == -1 || str1.indexOf(dot) == 0 || str1.indexOf(dot) == lstr) {
            alert("Invalid E-mail ID")
            return false
        }


        if (str1.indexOf(at, (lat + 1)) != -1) {
            alert("Invalid E-mail ID")
            return false
        }

        if (str1.substring(lat - 1, lat) == dot || str1.substring(lat + 1, lat + 2) == dot) {
            alert("Invalid E-mail ID")
            return false
        }

        if (str1.indexOf(dot, (lat + 2)) == -1) {
            alert("Invalid E-mail ID")
            return false
        }

        if (str1.indexOf(" ") != -1) {
            alert("Invalid E-mail ID")
            return false
        }

        if (str1.indexOf(",") != -1) {
            alert("Invalid E-mail ID")
            return false
        }

        return true
    }

    function date_visible(x) {
        if (x == "Yes") {
          //  alert(x)
            document.getElementById("l1").disabled = false
             document.getElementById("checkIn_date").disabled =false
             document.getElementById("button8a").disabled = false
        }
        else if (x == "No") {
        //    alert(x)
            document.getElementById("l1").disabled = false;

            document.getElementById("checkIn_date").disabled=true;//..visibility = "false"
            document.getElementById("button8a").disabled = true;

        }
    }

    /*Phone number validation*/
    function validate_number(field, alerttxt) {
        var iChars = "0123456789-()";

        with (field) {
            for (var i = 0; i < value.length; i++) {
                if (!(iChars.indexOf(value.charAt(i)) != -1)) {
                    alert(alerttxt);
                    return false;
                }
            }
        }
    }


    function Form_Validator(theform) {

        if (theform.phoneno.value == "") {
            alert("Please enter the phone number.");
            theform.phoneno.focus();
            return (false);
        }

        if (theform.country.value == "") {
            alert("Please select Country.");
            theform.country.focus();
            return (false);
        }
        if (theform.emailid.value == "") {
            alert("Please enter the email id.");
            theform.emailid.focus();
            return (false);
        }

        if (theform.question.value == "") {
            alert("Please enter the question.");
            theform.question.focus();
            return (false);
        }

        with (theform) {
            if (echeck(emailid) == false)
            { emailid.focus(); return false }

        }

    }

    function clicked() {
        alert('Only email support is provided to online students. So, please email adminsupport@PMstudy.com for queries relating to online courses.');
    }
</script>
</head>
<body>
<div>
<% If message <> "" then %>
 <script type="text/javascript">
     alert("<% = message %>")


	  </script>
      
      <% End IF %>
      
      
      <% If rqState = "" Then %>
  <table border="1" cellpadding="5" cellspacing="0" align="center" width="45%">
    <tr>
      <td align="center">PROJstudy Enrollment Form</td>
    </tr>
    <tr>
      <td><form name="addcalls" action="Datrix-enrollsuccess.asp" method="post" onsubmit="return Form_Validator(this)">
          <table border="0" cellpadding="5" cellspacing="0" width="100%">
          <tr>
              <td width="20%"><b>Enrollment From :</b></td>
              <td width="60%">
                <input type="radio" id="Vendar" name="Vendar" value="2" checked="checked" />
                Datrix &nbsp;  </td>
            </tr>  
            <tr>
              <td width="20%"><b>Enrolling For :</b></td>
              <td width="60%">
              <select name="course" id="course" onchange="findCourse(this.value)">
                                 <option value="0" selected="selected">-- Select certificate --</option>

                                  <%  strQuery = "SELECT DISTINCT CertName,Cer_ID FROM Certification WHERE Ven_ID = '2'"
                                  'response.Write(strQuery)
                                   Rs12.Open strQuery,ConnObj

                                  Do until Rs12.EOF

                                   %>

                               <option value="<% = Rs12("CertName")%>" certificationId ="<% = Rs12("Cer_ID")%>" ><% = Rs12("CertName")%></option>

                                <%   Rs12.movenext
                                     loop
                                     Rs12.close()

                                   %>

                            </select>
             
                </td>
            </tr>         
            <tr>
              <td width="20%" class="auto-style2"><b>Course Type :</b></td>
              <td width="60%" class="auto-style2">
             
            P<input type="checkbox" name="course_type" value="P" />&nbsp;
                F<input type="checkbox" name="course_type" value="F"/>&nbsp;
                C<input type="checkbox" name="course_type" value="C" />
                &nbsp;RR<input type="checkbox" name="course_type" value="RR" />
                &nbsp;EO<input type="checkbox" name="course_type" value="EO"/>  
     </td>
            </tr>
            <tr><td colspan="2"><span id="loader" style=" margin-top:300px; bottom: 0px; right: 500px; left: 570px; width:25%; height: 100px; margin:auto;  background-repeat:repeat; background-image: url(/images/buttons/loading-bg.png); display:block; position:absolute; vertical-align:middle; text-align:center; font-family:Verdana, Geneva, sans-serif; color:#ffffff"><img src="/images/buttons/loading.gif" Width="40" align="middle" height="30" style="padding-top:30px;" /><br><br><font color="#FFFFFF">Loading...</font></span></td></tr>
            <tr id="Hidecourse">
                  <td><b>Course Enrolling in:</b></td>
                  <td><select><option value="">-----Select------</option></select>
                  </td>
                 
				   </tr>
           <tr><td id="txtHint1" colspan="2"></td></tr>
            <tr>
              <td><b> First Name :</b></td>
              <td><input type="text" name="firstname" /></td>
            </tr>
             <tr>
              <td><b> Last Name :</b></td>
              <td><input type="text" name="lastname" /></td>
            </tr>
            <tr>
              <td><b>Phone Number :</b></td>
              <td><input type="text" name="phoneno" /></td>
            </tr>
             <tr>
              <td><b>EmailId :</b></td>
              <td><input type="text" name="email" /></td>
            </tr> 
             <tr>
              <td><b>Client Name:</b></td>
              <td><input type="text" name="company" /></td>
            </tr>  
             <tr>
              <td><b>Manual Sent:</b></td>
              <td><input type="radio" name="manual"  value="Yes" onclick="date_visible(this.value)" />Yes</td>
              <td><input type="radio" name="manual"  value="No" onclick="date_visible(this.value)" />No</td>
            </tr>  
             <tr>
              <td><label id="l1"><b>Manual Sent Date:</b></label></td>
              <td><input type="text" name="manualDate" id="checkIn_date"  /><input value=" ... " id="button8a" class="buttonc" type="reset"></td>
            </tr>  
            <tr>
              <td><b>County:</b></td>
              <td><input type="text" name="state1"  /></td>
            </tr>
            <tr>
              <td><b>City :</b></td>
              <td><input type="text" name="city" />
              </td>
            </tr>
             <tr>
              <td><b>Quote ID : </b></td> 
              <% If QuoteID <> "" Then  %>
              <td><input type="text" name="QuoteID" value="<% = QuoteID %>" readonly="readonly" /></td>
              <% Else %>
                <td><input type="text" name="QuoteID"/></td>
                <% End If %>
            </tr>
                      
            <tr>
              <td>&nbsp;</td>
              <td><input type="submit" name="Submit" value="Submit" />
                &nbsp;
                <input type="reset" name="reset" value="Reset" /></td>
            </tr>
          </table>
        </form></td>
    </tr>
  </table>
  <% ElseIf rqState = "View" Then %>
  
  <%
  
  
  strEnrollments = "SELECT * FROM enrolledusers WHERE quoteId = '"& QuoteID &"'"

'Response.Write(strEnrollments)
objRs1.Open strEnrollments, ConnObj

If Not objRs1.EOF Then
	   arrAllUsers = objRs1.getrows
	   firstRow = 0
		lastRow = 9
		numRows = Ubound(arrAllUsers,2)
		If lastRow > numRows Then
		   lastRow = numRows
		End If
		
		allNumRows = numRows
	  cnt = 1
End If 
  
  
  
  
  %>
  
    <table border="1" cellpadding="0" cellspacing="0" align="center" width="45%">
    
    <tr>
      <td align="center">Enrollment details for Quote # : <% = PreQuoteID %></td>
    </tr>
    <tr>
      <td>
          <table cellpadding="5" cellspacing="0" width="100%" border="1">
          
            <tr>
            <td><b>ID</b></td>
            <td><b>Enrollment For</b></td>
            <td><b>First Name</b></td>
            <td><b>Last Name</b></td>
            <td><b>Email</b></td>
            <td><b>Phone Number</b></td>
            <td><b>Course Details</b></td>              
            <td><b>QuoteID</b></td>
           
          </tr>
          <% If IsArray(arrAllUsers) Then
          For enrollrowcounter = firstRow TO lastRow %>
          <tr>
          
           <td align="center" class="auto-style1"><% = arrAllUsers(0,enrollrowcounter) %></td>
          <% If  IsNULL(arrAllUsers(56,enrollrowcounter)) OR arrAllUsers(56,enrollrowcounter) = "" OR arrAllUsers(56,enrollrowcounter) = "1" OR arrAllUsers(58,enrollrowcounter) = "1" Then %>
				<td align="center" class="auto-style1"> PROJstudy</td>
                <% Else %>
                <td align="center" class="auto-style1"> Datrix</td>
                <% End IF %>
            <td align="center" class="auto-style1"><% = arrAllUsers(1,enrollrowcounter) %></td>
            <td align="center" class="auto-style1"><% = arrAllUsers(2,enrollrowcounter) %></td>
            <td align="center" class="auto-style1"><% = arrAllUsers(3,enrollrowcounter)  %></td>
            <td align="center" class="auto-style1"><% = arrAllUsers(5,enrollrowcounter) %></td>
            <td align="center" class="auto-style1"><% = arrAllUsers(6,enrollrowcounter) %></td>
            <td align="center" class="auto-style1"><% = arrAllUsers(60,enrollrowcounter) %></td>
            </tr>
            <% Next %>
            <% Else %>
            <tr>
            <td colspan="8">No Records for the Specific Quote Id</td></tr>
            <% End If %>
            
          </table>
          </td>
    </tr>
  </table>
  
  
  <% End If %>
  
</div>
<!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>
<script>
document.getElementById('loader').style.display='none';
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
        startDate.setHours(0, 0, 0, 0)	// used for compares without TIME
        /* If they haven't chosen an
        end date before we'll set it to the same date as the start date This
        way if the user scrolls in the start date 5 months forward, they don't
        need to do it again for the end date.
        */

        if (endDate == null) {
            Zapatec.Calendar.setup({
                inputField: "checkOut_date",
                button: "button8b",  // What will trigger the popup of the calendar
                ifFormat: "%b %d, %Y",
                date: cal.date,
                showsTime: false,          //no time
                //      dateStatusFunc: disallowDateBefore, //the function to call
                onUpdate: filterDates2
            });
        }
    }

    function filterDates2(cal) {
        var date = cal.date;
        endDate = new Date(cal.date)
        endDate.setHours(0, 0, 0, 0)	// used for compares without TIME
    }

    //for 2nd
    function filterDates3(cal1) {
        startDate1 = new Date(cal1.date)
        startDate1.setHours(0, 0, 0, 0)	// used for compares without TIME
        /* If they haven't chosen an
        end date before we'll set it to the same date as the start date This
        way if the user scrolls in the start date 5 months forward, they don't
        need to do it again for the end date.
        */
        //  document.write(endDate1)

        //alert(endDate1)
        if (endDate1 == null) {
            Zapatec.Calendar.setup({
                inputField: "checkOut_date1",
                button: "button8d",  // What will trigger the popup of the calendar
                ifFormat: "%b %d, %Y",
                date: cal1.date,
                showsTime: false,          //no time
                dateStatusFunc: disallowDateBefore1, //the function to call
                onUpdate: filterDates4
            });
        }

    }
    function filterDates4(cal1) {
        var date = cal1.date;
        endDate1 = new Date(cal1.date)
        endDate1.setHours(0, 0, 0, 0)	// used for compares without TIME
    }

    //3rd

    function filterDates5(cal2) {
        startDate2 = new Date(cal2.date)
        startDate2.setHours(0, 0, 0, 0)	// used for compares without TIME
        /* If they haven't chosen an
        end date before we'll set it to the same date as the start date This
        way if the user scrolls in the start date 5 months forward, they don't
        need to do it again for the end date.
        */
        //  document.write(endDate2)

        //alert(endDate2)
        if (endDate2 == null) {
            Zapatec.Calendar.setup({
                inputField: "checkOut_date2",
                button: "button8f",  // What will trigger the popup of the calendar
                ifFormat: "%b %d, %Y",
                date: cal2.date,
                showsTime: false,          //no time
                dateStatusFunc: disallowDateBefore2, //the function to call
                onUpdate: filterDates6
            });
        }

    }
    function filterDates6(cal2) {
        var date = cal2.date;
        endDate2 = new Date(cal2.date)
        endDate2.setHours(0, 0, 0, 0)	// used for compares without TIME
    }

    //4th
    function filterDates7(cal3) {
        startDate3 = new Date(cal3.date)
        startDate3.setHours(0, 0, 0, 0)	// used for compares without TIME
        /* If they haven't chosen an
        end date before we'll set it to the same date as the start date This
        way if the user scrolls in the start date 5 months forward, they don't
        need to do it again for the end date.
        */
        //  document.write(endDate)

        //alert(endDate)
        if (endDate3 == null) {
            Zapatec.Calendar.setup({
                inputField: "checkOut_date3",
                button: "button8h",  // What will trigger the popup of the calendar
                ifFormat: "%b %d, %Y",
                date: cal3.date,
                showsTime: false,          //no time
                dateStatusFunc: disallowDateBefore3, //the function to call
                onUpdate: filterDates8
            });
        }

    }
    function filterDates8(cal3) {
        var date = cal3.date;
        endDate3 = new Date(cal3.date)
        endDate3.setHours(0, 0, 0, 0)	// used for compares without TIME
    }


    function filterDates9(cal4) {
        startDate4 = new Date(cal4.date)
        startDate4.setHours(0, 0, 0, 0)	// used for compares without TIME
        /* If they haven't chosen an
        end date before we'll set it to the same date as the start date This
        way if the user scrolls in the start date 5 months forward, they don't
        need to do it again for the end date.
        */
        //  document.write(endDate)

        //alert(endDate)
        if (endDate4 == null) {
            Zapatec.Calendar.setup({
                inputField: "checkOut_date4",
                button: "button8j",  // What will trigger the popup of the calendar
                ifFormat: "%b %d, %Y",
                date: cal4.date,
                showsTime: false,          //no time
                dateStatusFunc: disallowDateBefore4, //the function to call
                onUpdate: filterDates10
            });
        }

    }
    function filterDates10(cal4) {
        var date = cal4.date;
        endDate4 = new Date(cal4.date)
        endDate4.setHours(0, 0, 0, 0)	// used for compares without TIME
    }



    function filterDates11(cal5) {
        startDate5 = new Date(cal5.date)
        startDate5.setHours(0, 0, 0, 0)	// used for compares without TIME
        /* If they haven't chosen an
        end date before we'll set it to the same date as the start date This
        way if the user scrolls in the start date 5 months forward, they don't
        need to do it again for the end date.
        */
        //  document.write(endDate)

        //alert(endDate)
        if (endDate5 == null) {
            Zapatec.Calendar.setup({
                inputField: "checkOut_date5",
                button: "button8l",  // What will trigger the popup of the calendar
                ifFormat: "%b %d, %Y",
                date: cal5.date,
                showsTime: false,          //no time
                dateStatusFunc: disallowDateBefore5, //the function to call
                onUpdate: filterDates12
            });
        }

    }
    function filterDates12(cal5) {
        var date = cal5.date;
        endDate5 = new Date(cal5.date)
        endDate5.setHours(0, 0, 0, 0)	// used for compares without TIME
    }

    function filterDates13(cal6) {
        startDate6 = new Date(cal6.date)
        startDate6.setHours(0, 0, 0, 0)	// used for compares without TIME
        /* If they haven't chosen an
        end date before we'll set it to the same date as the start date This
        way if the user scrolls in the start date 5 months forward, they don't
        need to do it again for the end date.
        */
        //  document.write(endDate)

        //alert(endDate)
        if (endDate6 == null) {
            Zapatec.Calendar.setup({
                inputField: "checkOut_date6",
                button: "button8n",  // What will trigger the popup of the calendar
                ifFormat: "%b %d, %Y",
                date: cal6.date,
                showsTime: false,          //no time
                dateStatusFunc: disallowDateBefore6, //the function to call
                onUpdate: filterDates14
            });
        }

    }
    function filterDates14(cal6) {
        var date = cal6.date;
        endDate6 = new Date(cal6.date)
        endDate6.setHours(0, 0, 0, 0)	// used for compares without TIME
    }


    function filterDates15(cal7) {
        startDate7 = new Date(cal7.date)
        startDate7.setHours(0, 0, 0, 0)	// used for compares without TIME
        /* If they haven't chosen an
        end date before we'll set it to the same date as the start date This
        way if the user scrolls in the start date 5 months forward, they don't
        need to do it again for the end date.
        */
        //  document.write(endDate)

        //alert(endDate)
        if (endDate7 == null) {
            Zapatec.Calendar.setup({
                inputField: "checkOut_date7",
                button: "button8p",  // What will trigger the popup of the calendar
                ifFormat: "%b %d, %Y",
                date: cal7.date,
                showsTime: false,          //no time
                dateStatusFunc: disallowDateBefore7, //the function to call
                onUpdate: filterDates16
            });
        }

    }
    function filterDates16(cal7) {
        var date = cal7.date;
        endDate7 = new Date(cal7.date)
        endDate7.setHours(0, 0, 0, 0)	// used for compares without TIME
    }


    function filterDates17(cal8) {
        startDate8 = new Date(cal8.date)
        startDate8.setHours(0, 0, 0, 0)	// used for compares without TIME
        /* If they haven't chosen an
        end date before we'll set it to the same date as the start date This
        way if the user scrolls in the start date 5 months forward, they don't
        need to do it again for the end date.
        */
        //  document.write(endDate)

        //alert(endDate)
        if (endDate8 == null) {
            Zapatec.Calendar.setup({
                inputField: "checkOut_date8",
                button: "button8r",  // What will trigger the popup of the calendar
                ifFormat: "%b %d, %Y",
                date: cal8.date,
                showsTime: false,          //no time
                dateStatusFunc: disallowDateBefore8, //the function to call
                onUpdate: filterDates18
            });
        }

    }
    function filterDates18(cal8) {
        var date = cal8.date;
        endDate8 = new Date(cal8.date)
        endDate8.setHours(0, 0, 0, 0)	// used for compares without TIME
    }



    function filterDates19(cal9) {
        startDate9 = new Date(cal9.date)
        startDate9.setHours(0, 0, 0, 0)	// used for compares without TIME
        /* If they haven't chosen an
        end date before we'll set it to the same date as the start date This
        way if the user scrolls in the start date 5 months forward, they don't
        need to do it again for the end date.
        */
        //  document.write(endDate)

        //alert(endDate)
        if (endDate9 == null) {
            Zapatec.Calendar.setup({
                inputField: "checkOut_date9",
                button: "button8t",  // What will trigger the popup of the calendar
                ifFormat: "%b %d, %Y",
                date: cal9.date,
                showsTime: false,          //no time
                dateStatusFunc: disallowDateBefore9, //the function to call
                onUpdate: filterDates20
            });
        }

    }
    function filterDates20(cal9) {
        var date = cal9.date;
        endDate9 = new Date(cal9.date)
        endDate9.setHours(0, 0, 0, 0)	// used for compares without TIME
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
        dateCheckOut.setHours(0, 0, 0, 0)
        if ((startDate != null) && startDate > dateCheckOut)
            // startDate is defined, make sure cal date is NOT before start date
            return true;

        var now = new Date()
        now.setHours(0, 0, 0, 0)
        if (dateCheckOut < now)
            // check out date can not be befor today if startDate NOT defined
            return true;

        return false;
    }

    function disallowDateBefore1(dateCheckOut) {
        dateCheckOut.setHours(0, 0, 0, 0)
        if ((startDate1 != null) && startDate1 > dateCheckOut)
            // startDate is defined, make sure cal date is NOT before start date
            return true;

        var now = new Date()
        now.setHours(0, 0, 0, 0)
        if (dateCheckOut < now)
            // check out date can not be befor today if startDate NOT defined
            return true;

        return false;
    }

    function disallowDateBefore2(dateCheckOut) {
        dateCheckOut.setHours(0, 0, 0, 0)
        if ((startDate2 != null) && startDate2 > dateCheckOut)
            // startDate is defined, make sure cal date is NOT before start date
            return true;

        var now = new Date()
        now.setHours(0, 0, 0, 0)
        if (dateCheckOut < now)
            // check out date can not be befor today if startDate NOT defined
            return true;

        return false;
    }
    function disallowDateBefore3(dateCheckOut) {
        dateCheckOut.setHours(0, 0, 0, 0)
        if ((startDate3 != null) && startDate3 > dateCheckOut)
            // startDate is defined, make sure cal date is NOT before start date
            return true;

        var now = new Date()
        now.setHours(0, 0, 0, 0)
        if (dateCheckOut < now)
            // check out date can not be befor today if startDate NOT defined
            return true;

        return false;
    }
    function disallowDateBefore4(dateCheckOut) {
        dateCheckOut.setHours(0, 0, 0, 0)
        if ((startDate4 != null) && startDate4 > dateCheckOut)
            // startDate is defined, make sure cal date is NOT before start date
            return true;

        var now = new Date()
        now.setHours(0, 0, 0, 0)
        if (dateCheckOut < now)
            // check out date can not be befor today if startDate NOT defined
            return true;

        return false;
    }
    function disallowDateBefore5(dateCheckOut) {
        dateCheckOut.setHours(0, 0, 0, 0)
        if ((startDate5 != null) && startDate5 > dateCheckOut)
            // startDate is defined, make sure cal date is NOT before start date
            return true;

        var now = new Date()
        now.setHours(0, 0, 0, 0)
        if (dateCheckOut < now)
            // check out date can not be befor today if startDate NOT defined
            return true;

        return false;
    }
    function disallowDateBefore6(dateCheckOut) {
        dateCheckOut.setHours(0, 0, 0, 0)
        if ((startDate6 != null) && startDate6 > dateCheckOut)
            // startDate is defined, make sure cal date is NOT before start date
            return true;

        var now = new Date()
        now.setHours(0, 0, 0, 0)
        if (dateCheckOut < now)
            // check out date can not be befor today if startDate NOT defined
            return true;

        return false;
    }
    function disallowDateBefore7(dateCheckOut) {
        dateCheckOut.setHours(0, 0, 0, 0)
        if ((startDate7 != null) && startDate7 > dateCheckOut)
            // startDate is defined, make sure cal date is NOT before start date
            return true;

        var now = new Date()
        now.setHours(0, 0, 0, 0)
        if (dateCheckOut < now)
            // check out date can not be befor today if startDate NOT defined
            return true;

        return false;
    }
    function disallowDateBefore8(dateCheckOut) {
        dateCheckOut.setHours(0, 0, 0, 0)
        if ((startDate8 != null) && startDate8 > dateCheckOut)
            // startDate is defined, make sure cal date is NOT before start date
            return true;

        var now = new Date()
        now.setHours(0, 0, 0, 0)
        if (dateCheckOut < now)
            // check out date can not be befor today if startDate NOT defined
            return true;

        return false;
    }
    function disallowDateBefore9(dateCheckOut) {
        dateCheckOut.setHours(0, 0, 0, 0)
        if ((startDate9 != null) && startDate9 > dateCheckOut)
            // startDate is defined, make sure cal date is NOT before start date
            return true;

        var now = new Date()
        now.setHours(0, 0, 0, 0)
        if (dateCheckOut < now)
            // check out date can not be befor today if startDate NOT defined
            return true;

        return false;
    }

    function disallowDateAfter(dateCheckIn) {
        dateCheckIn.setHours(0, 0, 0, 0)
        if ((endDate != null) && dateCheckIn > endDate)
            // endDate defined, calendar date can NOT be after endDate
            return true;

        var now = new Date()
        now.setHours(0, 0, 0, 0)

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
        dateCheckIn.setHours(0, 0, 0, 0)
        if ((endDate1 != null) && dateCheckIn > endDate1)
            // endDate defined, calendar date can NOT be after endDate
            return true;

        var now = new Date()
        now.setHours(0, 0, 0, 0)

        if (dateCheckIn < now)
            // endDate NOT defined, calendar date can not be before today
            return true;

        return false;
    }

    function disallowDateAfter2(dateCheckIn) {
        dateCheckIn.setHours(0, 0, 0, 0)
        if ((endDate2 != null) && dateCheckIn > endDate2)
            // endDate defined, calendar date can NOT be after endDate
            return true;

        var now = new Date()
        now.setHours(0, 0, 0, 0)

        if (dateCheckIn < now)
            // endDate NOT defined, calendar date can not be before today
            return true;

        return false;
    }

    function disallowDateAfter3(dateCheckIn) {
        dateCheckIn.setHours(0, 0, 0, 0)
        if ((endDate3 != null) && dateCheckIn > endDate3)
            // endDate defined, calendar date can NOT be after endDate
            return true;

        var now = new Date()
        now.setHours(0, 0, 0, 0)

        if (dateCheckIn < now)
            // endDate NOT defined, calendar date can not be before today
            return true;

        return false;
    }

    function disallowDateAfter4(dateCheckIn) {
        dateCheckIn.setHours(0, 0, 0, 0)
        if ((endDate4 != null) && dateCheckIn > endDate4)
            // endDate defined, calendar date can NOT be after endDate
            return true;

        var now = new Date()
        now.setHours(0, 0, 0, 0)

        if (dateCheckIn < now)
            // endDate NOT defined, calendar date can not be before today
            return true;

        return false;
    }

    function disallowDateAfter5(dateCheckIn) {
        dateCheckIn.setHours(0, 0, 0, 0)
        if ((endDate5 != null) && dateCheckIn > endDate5)
            // endDate defined, calendar date can NOT be after endDate
            return true;

        var now = new Date()
        now.setHours(0, 0, 0, 0)

        if (dateCheckIn < now)
            // endDate NOT defined, calendar date can not be before today
            return true;

        return false;
    }

    function disallowDateAfter6(dateCheckIn) {
        dateCheckIn.setHours(0, 0, 0, 0)
        if ((endDate6 != null) && dateCheckIn > endDate6)
            // endDate defined, calendar date can NOT be after endDate
            return true;

        var now = new Date()
        now.setHours(0, 0, 0, 0)

        if (dateCheckIn < now)
            // endDate NOT defined, calendar date can not be before today
            return true;

        return false;
    }

    function disallowDateAfter7(dateCheckIn) {
        dateCheckIn.setHours(0, 0, 0, 0)
        if ((endDate7 != null) && dateCheckIn > endDate7)
            // endDate defined, calendar date can NOT be after endDate
            return true;

        var now = new Date()
        now.setHours(0, 0, 0, 0)

        if (dateCheckIn < now)
            // endDate NOT defined, calendar date can not be before today
            return true;

        return false;
    }


    function disallowDateAfter8(dateCheckIn) {
        dateCheckIn.setHours(0, 0, 0, 0)
        if ((endDate8 != null) && dateCheckIn > endDate8)
            // endDate defined, calendar date can NOT be after endDate
            return true;

        var now = new Date()
        now.setHours(0, 0, 0, 0)

        if (dateCheckIn < now)
            // endDate NOT defined, calendar date can not be before today
            return true;

        return false;
    }


    function disallowDateAfter9(dateCheckIn) {
        dateCheckIn.setHours(0, 0, 0, 0)
        if ((endDate9 != null) && dateCheckIn > endDate9)
            // endDate defined, calendar date can NOT be after endDate
            return true;

        var now = new Date()
        now.setHours(0, 0, 0, 0)

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

    var cal = new Zapatec.Calendar.setup({

        inputField: "checkIn_date",   // id of the input field
        button: "button8a",  // What will trigger the popup of the calendar
        ifFormat: "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime: false,          //no time
        //dateStatusFunc: disallowDateAfter, //the function to call
        onUpdate: filterDates1

    });

    Zapatec.Calendar.setup({
        inputField: "checkOut_date",
        button: "button8b",  // What will trigger the popup of the calendar
        ifFormat: "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime: false,          //no time
        //dateStatusFunc: disallowDateBefore, //the function to call
        onUpdate: filterDates2
    });
    var cal1 = new Zapatec.Calendar.setup({

        inputField: "checkIn_date1",   // id of the input field
        button: "button8c",  // What will trigger the popup of the calendar
        ifFormat: "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime: false,          //no time
        dateStatusFunc: disallowDateAfter1, //the function to call
        onUpdate: filterDates3

    });

    Zapatec.Calendar.setup({
        inputField: "checkOut_date1",
        button: "button8d",  // What will trigger the popup of the calendar
        ifFormat: "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime: false,          //no time
        dateStatusFunc: disallowDateBefore1, //the function to call
        onUpdate: filterDates4
    });

    var cal2 = new Zapatec.Calendar.setup({

        inputField: "checkIn_date2",   // id of the input field
        button: "button8e",  // What will trigger the popup of the calendar
        ifFormat: "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime: false,          //no time
        dateStatusFunc: disallowDateAfter2, //the function to call
        onUpdate: filterDates5

    });

    Zapatec.Calendar.setup({
        inputField: "checkOut_date2",
        button: "button8f",  // What will trigger the popup of the calendar
        ifFormat: "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime: false,          //no time
        dateStatusFunc: disallowDateBefore2, //the function to call
        onUpdate: filterDates6
    });

    var cal3 = new Zapatec.Calendar.setup({

        inputField: "checkIn_date3",   // id of the input field
        button: "button8g",  // What will trigger the popup of the calendar
        ifFormat: "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime: false,          //no time
        dateStatusFunc: disallowDateAfter3, //the function to call
        onUpdate: filterDates7

    });

    Zapatec.Calendar.setup({
        inputField: "checkOut_date3",
        button: "button8h",  // What will trigger the popup of the calendar
        ifFormat: "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime: false,          //no time
        dateStatusFunc: disallowDateBefore3, //the function to call
        onUpdate: filterDates8
    });
    var cal4 = new Zapatec.Calendar.setup({

        inputField: "checkIn_date4",   // id of the input field
        button: "button8i",  // What will trigger the popup of the calendar
        ifFormat: "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime: false,          //no time
        dateStatusFunc: disallowDateAfter4, //the function to call
        onUpdate: filterDates9

    });

    Zapatec.Calendar.setup({
        inputField: "checkOut_date4",
        button: "button8j",  // What will trigger the popup of the calendar
        ifFormat: "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime: false,          //no time
        dateStatusFunc: disallowDateBefore4, //the function to call
        onUpdate: filterDates10
    });
    var cal5 = new Zapatec.Calendar.setup({

        inputField: "checkIn_date5",   // id of the input field
        button: "button8k",  // What will trigger the popup of the calendar
        ifFormat: "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime: false,          //no time
        dateStatusFunc: disallowDateAfter5, //the function to call
        onUpdate: filterDates11

    });

    Zapatec.Calendar.setup({
        inputField: "checkOut_date5",
        button: "button8l",  // What will trigger the popup of the calendar
        ifFormat: "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime: false,          //no time
        dateStatusFunc: disallowDateBefore5, //the function to call
        onUpdate: filterDates12
    });
    var cal6 = new Zapatec.Calendar.setup({

        inputField: "checkIn_date6",   // id of the input field
        button: "button8m",  // What will trigger the popup of the calendar
        ifFormat: "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime: false,          //no time
        dateStatusFunc: disallowDateAfter6, //the function to call
        onUpdate: filterDates13

    });

    Zapatec.Calendar.setup({
        inputField: "checkOut_date6",
        button: "button8n",  // What will trigger the popup of the calendar
        ifFormat: "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime: false,          //no time
        dateStatusFunc: disallowDateBefore6, //the function to call
        onUpdate: filterDates14
    });
    var cal7 = new Zapatec.Calendar.setup({

        inputField: "checkIn_date7",   // id of the input field
        button: "button8o",  // What will trigger the popup of the calendar
        ifFormat: "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime: false,          //no time
        dateStatusFunc: disallowDateAfter7, //the function to call
        onUpdate: filterDates15

    });

    Zapatec.Calendar.setup({
        inputField: "checkOut_date7",
        button: "button8p",  // What will trigger the popup of the calendar
        ifFormat: "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime: false,          //no time
        dateStatusFunc: disallowDateBefore7, //the function to call
        onUpdate: filterDates16
    });
    var cal8 = new Zapatec.Calendar.setup({

        inputField: "checkIn_date8",   // id of the input field
        button: "button8q",  // What will trigger the popup of the calendar
        ifFormat: "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime: false,          //no time
        dateStatusFunc: disallowDateAfter8, //the function to call
        onUpdate: filterDates17

    });

    Zapatec.Calendar.setup({
        inputField: "checkOut_date8",
        button: "button8r",  // What will trigger the popup of the calendar
        ifFormat: "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime: false,          //no time
        dateStatusFunc: disallowDateBefore8, //the function to call
        onUpdate: filterDates18
    });
    var cal9 = new Zapatec.Calendar.setup({

        inputField: "checkIn_date9",   // id of the input field
        button: "button8s",  // What will trigger the popup of the calendar
        ifFormat: "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime: false,          //no time
        dateStatusFunc: disallowDateAfter9, //the function to call
        onUpdate: filterDates19

    });

    Zapatec.Calendar.setup({
        inputField: "checkOut_date9",
        button: "button8t",  // What will trigger the popup of the calendar
        ifFormat: "%b %d, %Y",       // format of the input field: Mar 18, 2005
        showsTime: false,          //no time
        dateStatusFunc: disallowDateBefore9, //the function to call
        onUpdate: filterDates20
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