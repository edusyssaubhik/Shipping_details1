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
<!--#include virtual="/includes/connection.asp"-->


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
 <title>Report</title>
 <link href="/backoffice/css/pagestyle.css" rel="stylesheet" type="text/css">
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
 
 <tr><td>
 <table border="1"  cellspacing="2" class="dbborder" width="1000px" cellpadding="5">

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

'strCourseIds = "SELECT courseid, city, startdate, enddate FROM ps_course WHERE country = 'US' AND status <> 'Cancelled' AND status <> 'Completed' ORDER BY startdate"

strCourseIds = "SELECT course.courseid, course.courseName, course.city, course.startdate, course.enddate, city.state_code, course.instructor FROM course course, city city WHERE course.city = city.city And "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' And course.vendorId = '1' And course.certificateId = '1'  Union SELECT course.courseid, course.courseName, course.city, course.startdate, course.enddate, city.state_code, course.instructor FROM datrixClasses course, city city WHERE course.city = city.city And "& strCountry &" AND course.status <> 'Cancelled' AND course.status <> 'Completed' And course.startdate >= '"&Now() - 1&"' And course.vendorId = '2' And course.certificateId = '2' order by course.startdate, course.city asc"

objRs.Open strCourseIds,ConnObj

'Retrive All Values From Query And Doeing Pagination'
					
					  If Not objRs.EOF Then
						arrAllRecords = objRs.getrows
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
					
                         
        
%>
<tr>
<td colspan="3" style="width:100px"></td>

<td colspan="6" align="center" style="width:100px; color:#06F;"><b>PROJstudy</b></td>
<td colspan="2" align="center" style="width:100px;color:#06F;"><b>Datrix</b></td>
</tr>
  <tr>
    <td width="50px"><b>City</b>  </td>
    <td width="200px"><b>Class Date</b></td>
    <td width="200px"><b>Instructor<font color="red" size="2">*</font></b></td>	
    <td width="50px"><b>Total Enrollments</b></td>
    <td width="50px"><b>Payment Made</b></td>	
	<td width="50px"><b>P.O Received</b></td>
    <td width="50px"><b>Payment Declined</b></td>	
	<td width="50px"><b>Under Process</b></td>	
	<td width="50px"><b>Not Paid</b></td>
    <td width="50px"><b>Total Enrollments</b></td>
	<td width="50px"><b>Quote Id</b></td>
  </tr>
  <%   If IsArray(arrAllRecords) Then
          For rowcounter = firstRow TO lastRow
		  
		 
     CourseId = arrAllRecords(0,rowcounter)
	 Course   = arrAllRecords(1,rowcounter)
	 City = Trim(arrAllRecords(2,rowcounter))
	 StartDate = arrAllRecords(3,rowcounter)
	 EndDate = arrAllRecords(4,rowcounter)
	 State_Code = arrAllRecords(5,rowcounter)
	 Instructor = arrAllRecords(6,rowcounter)

	 
	 
		 strEnrollments = "SELECT count(*) AS Total FROM enrolledusers WHERE vendorId = '1' And certificateId = '1' And courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule' And (us_status Is Null OR us_status = 'Active')"
		 objRs1.Open strEnrollments,ConnObj
		 
		 Do Until objRs1.EOF
			TotalEnrollments = objRs1("Total")
		 objRs1.Movenext
		 Loop
		 objRs1.Close
		 
		 strPaid = "SELECT count(*) AS Paid FROM enrolledusers WHERE  vendorId = '1' And certificateId = '1' And checkreceived = 'Yes' AND courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule'"
		 objRs1.Open strPaid,ConnObj	 
	
		 Do Until objRs1.EOF
			Paid = objRs1("Paid")
		 objRs1.Movenext
		 Loop
		 objRs1.Close
		 
		 strPayment = "SELECT us_status FROM enrolledusers WHERE vendorId = '1' And certificateId = '1' And  courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule'"
		 
		 objRs1.Open strPayment,ConnObj	 
	
		 Do Until objRs1.EOF
		  
		 paymentstatus = objRs1("us_status")
		 
		 Select case paymentstatus
		 
		 case "P.O Received"
		 
		 PO_Received = PO_Received + 1
		 
		 case "Payment Declined"
		 PaymentDeclined = PaymentDeclined + 1
		 
		 case "Under Process"
		 UnderProcess = UnderProcess + 1
		 
		 End Select
		 
		 objRs1.Movenext
		 Loop
		 objRs1.Close
		 
		 
		 
		 
		 	 strEnrollmentsDatrix = "SELECT count(*) AS Total FROM enrolledusers WHERE vendorId = '2' And certificateId = '2' And courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule' And (us_status Is Null OR us_status = 'Active')"
		 objRs1.Open strEnrollmentsDatrix,ConnObj
		 
		 Do Until objRs1.EOF
			TotalEnrollmentsDatrix = objRs1("Total")
			'response.Write(TotalEnrollments)
		 objRs1.Movenext
		 Loop
		 objRs1.Close
		 
		 strPaidDatrix = "SELECT quoteId FROM enrolledusers WHERE  vendorId = '2' And certificateId = '2' And courseid = '"& CourseId &"' AND status <> 'Cancel' AND status <> 'Re-Schedule' And (us_status Is Null OR us_status = 'Active')"
		 
		 objRs1.Open strPaidDatrix,ConnObj	 
		 Do Until objRs1.EOF
			rqQuote = objRs1("quoteId")

		 objRs1.Movenext
		 Loop
		 objRs1.Close

		 
   %>
  <tr>
    <td><% = City %></td>
    <td><% = Course %> - <% = FormatDateTime(StartDate,1) %> to <% = FormatDateTime(EndDate,1) %></td>
    <td><% = Instructor %></td>
	<td><% = TotalEnrollments %></td>
    <td><% = Paid %></td>
	<td><% = Int(PO_Received) %></td>
    <td><% = Int(PaymentDeclined) %></td>
	<td><% = Int(UnderProcess) %></td>	
	<td><% = (TotalEnrollments - (Paid + PO_Received + PaymentDeclined + UnderProcess)) %></td>
    <td><% = Int(TotalEnrollmentsDatrix) %></td>	
	<td><% = rqQuote %></td>
  </tr>
  <% 
  'Making it zero'
  PO_Received = 0
  PaymentDeclined = 0
  UnderProcess = 0
  
  %>
  <% Next %>
  
         <tr><td colspan="17"> 
           <!--#include file="pagination.asp"-->
               <% 

			    ps = getPaginationString(page, (numRows+1), 10, 2, "report.asp?id="& arrAllRecords(0,numRows)&"")
				  Response.Write(ps)
	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows)) %>
        <%    BlGetOurVenuesCities = BlGetOurVenuesCities  %>
		
		 </td></tr>
		
   <% End If 
		
    
     ConnObj.Close %>
     </table>
 </td>
</tr>
</table>
</div>
</body>
</html>
<%
 Else
 Response.Redirect("../backOffice/login.asp")
 End If
%>
