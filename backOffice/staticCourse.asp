<%@ Language = "VBScript" %>
<% 'OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 23/09/2010'
'Description :'
' Display Cities'
'======================================================='

%>
<% If not  Session("UserId") = "" Then %>
<!--#include virtual="./includes/connection.asp"-->
<%
'======================================================='
 'Declare The Variables'
'======================================================='

 Dim arrAllQueries
 Dim rqType,rqPage,rqRow
 Dim firstRow,lastRow,numRows,rowcounter
 Dim strQuery,viewQuestionNo,i
 Dim rqCityId
 Dim strQuery1,Rs1,Rs

 Dim message
 message = Session("message")
 Session("message") = ""

 Set Rs1 = Server.CreateObject("ADODB.Recordset")
 Set Rs  = Server.CreateObject("ADODB.Recordset")
  Set Rs11  = Server.CreateObject("ADODB.Recordset")


'======================================================='
'Retrive The Types in This Page'
'Types Are Add City,Edit City'
'Retrive The page and row Using For Pagination'
'======================================================='

 rqType = Request.Querystring("type")
 rqPage = Request.QueryString("page")
 rqRow  = Request.QueryString("row")

'======================================================='
'Sql Query For Retrive The CityId and City For Displaying'
'And Put Into Array'
'And Do The Paginavigation'
'======================================================='
If rqType = "submit" then

rqCertificationId = request.Form("certificationType")

   strQuery = "select * from datrixCourse where certificationId = '"&rqCertificationId&"' order by courseid desc"
Else

  strQuery = "select * from datrixCourse order by courseid desc"

End If
  Rs.Open strQuery,ConnObj

   If Not Rs.EOF Then
     arrAllQueries = Rs.getrows
     Session("arrAllQueries") = arrAllQueries
     firstRow = 0
     lastRow = 19
     numRows = Ubound(arrAllQueries,2)
     If lastRow > numRows Then
        lastRow = numRows
     End If
   End If
 If rqPage = "next" Then

    arrAllQueries = Session("arrAllQueries")
    numRows = Ubound(arrAllQueries,2)

    firstRow = rqRow + 1
    lastRow = firstRow + 19

    If firstRow >= numRows Then
       firstRow = rqRow + 1
       lastRow = firstRow + 19
    End If

    If firstRow < 0 Then
       firstRow = 0
    End If

    If lastRow > numRows Then
       lastRow = numRows
    End If

 End If

 If rqPage = "previous" Then

    arrAllQueries = Session("arrAllQueries")
    numRows = Ubound(arrAllQueries,2)

    lastRow = rqRow - 1
    firstRow = lastRow - 19

    If firstRow =< 0 Then
       firstRow = 0
       lastRow = firstRow + 19
    End If

    If lastRow > numRows Then
       lastRow = numRows
    End If

End If

'======================================================='
'If You Click Edit In city.asp Page That Particular City Dispalyed and You Can Edit That City '
'======================================================='

 If rqtype = "edit" Then

   rqCourseId = Request.Querystring("courseid")

   strQuery1 = "SELECT * FROM datrixCourse WHERE courseid = '" & rqCourseId & "'"

   Rs1.Open strQuery1,ConnObj

End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
 <title>Static Courses</title>
 <link href="/backoffice/css/pagestyle.css" rel="stylesheet" type="text/css">
 <script type="text/javascript" src="calendar/zapatec.js"></script>
<script type="text/javascript" src="calendar/calendar.js"></script>
<script type="text/javascript" src="calendar/calendar-en.js"></script>
<link href="calendar/template.css" rel="stylesheet" type="text/css">
<link href="calendar/system.css" rel="stylesheet" type="text/css">

<script language="javascript">

 //This Function Is to confirm deleting course In Course Page
function DeleteAlert(link) {
  if(confirm("Are you sure you want to delete?"))
  {
      return true;
  }
return false;
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

//This Validation For Add City

function Form_Validator(theform)
{

var alertsay = "";


 //check to see if the City field is balnk

  if (theform.city.value == "")
  {
     alert("Please Enter The City.");
     theform.city.focus();
     return (false);
  }

  with (theform)
  {

    //check to see if the City field have Numarals

    if (validate_noNumber(city,"Your city Has Numerals")==false)
   	      {city.focus();return false}

    //check to see if the City field have Special Characters

    //if (validate_special(city,"City Has Special Characters. \n Please remove them and try again")==false)
 	    //  {city.focus();return false}

    }
}

//This VAlidation For Edit City

function Form_Validator1(theform)
{

var alertsay = "";


 //check to see if the City field is balnk

  if (theform.editedCity.value == "")
  {
     alert("Please Enter The City.");
     theform.editedCity.focus();
     return (false);
  }

  with (theform)
  {

   //check to see if the City field have Numarals

   if (validate_noNumber(editedCity,"Your city Has Numerals")==false)
   	      {editedCity.focus();return false}

   //check to see if the City field have Special Characters

  // if (validate_special(editedCity,"City Has Special Characters. \n Please remove them and try again")==false)
	 	  //    {editedCity.focus();return false}
  }
}

</script>
</head>
<body><div id="htMap">
<table border="1" height="550" cellspacing="0" class="dbborder" width="1000px">
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
  <tr>
   <td height="25"><a href="staticCourse.asp?type=addCourse">Add Static Course</a></td>
 </tr>
 <!-- If You Click Add City That Comes Here-->
 <% If rqType = "addCourse" Then %>
 <tr>
  <td height="200">
   <form action="addEditDeleteStaticCourse.asp" method="post" onsubmit="return Form_Validator(this)">
    <table align="center" border="0" cellpadding="5" cellspacing="5" width="800px">
     <tr>
       <td align="center" colspan="8" height="40" class="h3">Add Static Course</td>
     </tr>
     <tr>
     <td><b>Product Type:</b></td>
     <td>     <select name="certification">
     <option value="" >--Select----</option>

     <%
			  'If itil is selected'
			  Dim strBrand1 , Rs11

			 strBrand1 = "SELECT * from Certification WHERE Ven_ID = '2'"
			 'response.Write(strBrand)
				Rs11.Open strBrand1,ConnObj

				Do until Rs11.EOF
		%>

     <option value="<% = Rs11("Cer_ID") %>" <% IF  Rs11("CertName") =  Rs11("CertName") then %> selected=selected <% End IF %>><% = Rs11("CertName") %></option>

                 <%

				Rs11.Movenext
				loop
				Rs11.close
				%>

     </select>

     </td>

     </tr>

	 <tr>
	  <td><b>Course Code:</b></td>
	  <td><input type="text" name="RefNumber" /></td>
	 </tr>
	 <tr>
	  <td><b>Course Name:</b></td>
	  <td><input type="text" name="courseName" /></td>
	 </tr>
         <tr>
	  <td><b>Duration Type:</b></td>
	  <td><input type="radio" name="DurationType" value = "Days" />Days
              <input type="radio" name="DurationType" value = "Hours" />Hours</td>
	 </tr>
	 <tr>
      <td><b>Duration:</b></td>
      <td><input type="text" name="Duration">&nbsp;(eg: 2 )</td>
     </tr>
     <tr>
          <td><b>Start Time:</b></td>
          <td width="350px">
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
          </tr>
          <tr>
          <td><b>End Time:</b></td>
          <td width="600px">
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
         <tr>
      <td><b>Retail Price:</b></td>
      <td><input type="text" name="RetailPrice"></td>
     </tr>

     <tr>
      <td>&nbsp;</td>
     </tr>
    <tr>
     <td></td>
     <td colspan="2" align="right">
      <input type="submit" name="addCourse" value="Add Course" class="buttonc">
     </td>
    </tr>
   </table>
  </form>
  </td>
 </tr>
 <% End If %>
 <!-- Add City IF Condition Closed Here -->
 <!-- If You Click Edit That Comes Here -->
 <% If rqtype = "edit" Then %>
    <tr>
     <td height="200">
       <form action="addEditDeleteStaticCourse.asp" method="post" onsubmit="return Form_Validator1(this)">
		<table align="center" border="0"  cellpadding="5" cellspacing="5">
	     <tr>
		  <td align="center" colspan="4" height="40" class="h3">Edit Static Course</td>
         </tr>
		 <% do until Rs1.EOF %>
		<tr>
     <td><b>Certification:</b></td>
     <td>     <select name="editCertification">

     <%
			  'If itil is selected'
			  Dim strBrand2

			 strBrand2 = "SELECT * from Certification WHERE Ven_ID = '2'"
			 'response.Write(strBrand)
				Rs11.Open strBrand2,ConnObj

				Do until Rs11.EOF
		%>

     <option value="<% = Rs11("Cer_ID") %>"><% = Rs11("CertName") %></option>

                 <%

				Rs11.Movenext
				loop
				Rs11.close
				%>

     </select>

     </td>

     </tr>
		 <tr>
	  	    <td><b>Course Code:</b></td>
		    <td><input type="text" name="editRefNumber" value="<% =Rs1("RefNumber") %>" /></td>
		 </tr>
		 <tr>
	 	    <td><b>Course Name:</b></td>
			<td><input type="text" name="editcourseName"  value="<% =Rs1("courseName") %>" /></td>
		 </tr>
          <tr>
              <td><b>Duration Type:</b></td>
              <td><input type="radio" name="editDurationType" value = "Days" />Days
                      <input type="radio" name="editDurationType" value = "Hours" />Hours</td>
             </tr>
		 <tr>
		  <td><b>Duration:</b></td>

		     <input type="hidden" name="editCourseid" value="<% = Rs1("courseid") %>">
		   <td><input type="text" name="editedDuration" value="<% = Rs1("Duration") %>"> &nbsp;(eg: 2 )</td>

		  </tr>
         <tr>
          <td><b>Start Time:</b></td>
          <td width="350px">
            <select name="startinghour">
              <option value="<% = Rs1("starthour") %>"><% = Rs1("starthour") %></option>
              <option value="" disabled="disabled">HH</option>
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
         <option value="<% = Rs1("startminute") %>"><% = Rs1("startminute") %></option>
              <option value="" disabled="disabled">MIN</option>
              <option>00</option>
              <option>15</option>
              <option>30</option>
              <option>45</option>
            </select>
            <select name="sessionstart">
          <option value="<% = Rs1("startsession") %>"><% = Rs1("startsession") %></option>
              <option value="" disabled="disabled">Select</option>
              <option>AM</option>
              <option>PM</option>
            </select>
          </td>
          </tr>
          <tr>

          <td><b>End Time:</b></td>
          <td width="600px">
            <select name="endinghour">
<option value="<% = Rs1("endhour") %>"><% = Rs1("endhour") %></option>
              <option value="" disabled="disabled">HH</option>
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
         <option value="<% = Rs1("endminute") %>"><% = Rs1("endminute") %></option>
              <option value="" disabled="disabled">MIN</option>
              <option>00</option>
              <option>15</option>
              <option>30</option>
              <option>45</option>
            </select>
            <select name="sessionend">
        <option value="<% = Rs1("endsession") %>"><% = Rs1("endsession") %></option>
              <option value="" disabled="disabled">Select</option>

              <option>AM</option>
              <option>PM</option>
            </select>
          </td>
        </tr>
         <tr>
      <td><b>Retail Price:</b></td>
      <td><input type="text" name="RetailPrice" value="<% = Rs1("RetailPrice") %>"></td>

     </tr>

      <% Rs1.Movenext
		       Loop %>
		  <tr>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td colspan="2" align="right">
             <input type="submit" name="editcourse" value="Edit Course" class="buttonc">
            </td>
           </tr>
         </table>
        </td>
      </tr>
   <% End If %>
 <!-- Edit If Condition Closed Here-->
 <!-- Displaying The All Cities Here -->
  <tr>
 <td>
          <form name="Certification" action="staticCourse.asp?type=submit" method="post">
       <table border="1" cellpadding="5" cellspacing="0">

 <tr>

        <td><b>Certification Type:</b></td>
 			<td colspan="6"><select name="CertificationType" id="CertificationType" style="width:350px">
             <option value="">-- Select --</option>
             <%
			 Dim certRs,strCert

			 Set certRs = server.CreateObject("ADODB.recordset")

			 strCert = "SELECT * FROM Certification WHERE Ven_ID = '"&Session("vendor") &"'"
			' response.Write(strCert)
			  certRs.Open strCert,ConnObj

                                  'response.Write(strQuery)
                 If Not certRs.EOF Then
					arrAllRecords = certRs.getrows
					Session("arrAllRecords") = arrAllRecords
					cnt = 1
					CertfirstRow = 0
					CertlastRow = 19
					CertnumRows = Ubound(arrAllRecords,2)
					If CertlastRow > CertnumRows Then
					   CertlastRow = CertnumRows
					End If

					CertallNumRows = CertnumRows
			   End If




			 If IsArray(arrAllRecords) Then
          		 For Certrowcounter = CertfirstRow to CertallNumRows

			  %>


                 <option value="<% = arrAllRecords(0,Certrowcounter)  %>"><% = arrAllRecords(1,Certrowcounter) %></option>


         <% Next %>

          		<% End If %>

 				</select>

      <input type="submit" id="submit" value="Submit"/></td>

</tr>
</table>
</form>
</td>
</tr>

 <tr height="490">
  <td valign="top">
   <table border="1" align="center" width="1000px" cellspacing="2" cellpadding="5">
	<tr height="25">
	 <td bgcolor="#A7DBFB" align="center"><b>Certification</b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Course Code</b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Course Name</b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Duration</b></td>
     <td bgcolor="#A7DBFB" align="center"><b>Start Time</b></td>
     <td bgcolor="#A7DBFB" align="center"><b>End Time</b></td>
     <td bgcolor="#A7DBFB" align="center"><b>Retail Price</b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Edit</b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Delete</b></td>
	</tr>
	<!--All Cities Puttin into Arraya And Dispalying-->
	<% If IsArray(arrAllQueries) Then
	   FOR rowcounter = firstrow to lastrow %>
	<tr>
	 <input type="hidden"  name="cityId"  value="<% = arrAllQueries(0,rowcounter) %>">
	 <td> <%
			  'If itil is selected'
			  Dim strBrand

			 strBrand = "SELECT * from Certification WHERE Cer_ID = '"&arrAllQueries(4,rowcounter)&"'"
			 'response.Write(strBrand)
				Rs11.Open strBrand,ConnObj

				Do until Rs11.EOF

				rqCertName = Rs11("CertName")

				Rs11.Movenext
				loop
				Rs11.close

 				response.Write(rqCertName)


                %></td>
	 <td><% = arrAllQueries(1,rowcounter) %></td>
	 <td><% = arrAllQueries(2,rowcounter) %></td>
	 <td><% = arrAllQueries(3,rowcounter) %></td>
      <td><% If arrAllQueries(11,rowcounter) <> "" then %><% = arrAllQueries(11,rowcounter) &" : "& arrAllQueries(12,rowcounter)&""&arrAllQueries(13,rowcounter) %><% End If %></td>
       <td><% If arrAllQueries(14,rowcounter) <> "" then %><% = arrAllQueries(14,rowcounter) &" : "& arrAllQueries(15,rowcounter)&""&arrAllQueries(16,rowcounter)%><% End If %></td>
        <td><% = arrAllQueries(10,rowcounter) %></td>

	 <td align="center"><a href="staticCourse.asp?type=edit&courseid=<% = arrAllQueries(0,rowcounter)%>">Edit</a></td>
	 <td align="center"><a href="addEditDeleteStaticCourse.asp?delete=<% = arrAllQueries(0,rowcounter)%>" onclick="return DeleteAlert(this.href);" >Delete</a></td>
	</tr>
	<% Next %>
	<tr>
	 <td colspan="8">
	   <% If Not firstRow = 0 Then %>
		<a href="staticCourse.asp?page=previous&row=<% = firstRow %>"> &lt;&lt;Previous</a>
	   <% End If %>
	   <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
	   <% If Not numRows = lastRow Then %>
		<a href="staticCourse.asp?page=next&row=<% = lastRow %>"> &gt;&gt;Next</a>
	   <% End If %>
	 </td>
	</tr>
	<% End If %>
	<tr>
	  <td colspan="8" align="center"><font face="Arial" size="2" color="orangered"><%=message%></font></td>
	</tr>
  </table>
 </td>
</tr>
</table>
</div>
</body>
</html>
<!-- This Script For Calendar -->

<%
 Rs.Close
 Set Rs = Nothing
 ConnObj.Close
 Set ConnObj = Nothing
 Else
 Response.Redirect("../backOffice/login.asp")
 End If
%>