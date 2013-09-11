<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<!--#include virtual="/includes/connectionRef.asp"-->
</head>
<body>


<%
   If Session("UserId") = "" Then
     Response.Redirect("../login.asp")
   Else
%>

<%

'---------------------------------------------------------------'
'Written By : Praveen'
'Created Date : 26/09/2012'
'Modified By : Praveen'
'Modified Date: 26/09/2012'
'Description :'
'This page is for getting Referral enrollments based on the dates entered' 

'--------------------------------------------------------------'

'Diclaring Variables'

Dim rqFromDate,rqToDate,objRs,objRs1
Dim strQuery,strQuery1
Dim EnrollmentsNum,PaymentsNum,rqClasstype
Dim Noof_Enrolled, Noof_Paid, Total_No

Noof_Enrolled = 0
Noof_Paid = 0
Total_No = 0


'initiating Record sets' 

Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")
Set objRs2 = Server.CreateObject("ADODB.Recordset")
Set objRs3 = Server.CreateObject("ADODB.Recordset")
Set objRs4 = Server.CreateObject("ADODB.Recordset")

'retriving Values'
rqFromDate = Request.form("FromDate")
rqToDate = Request.Form("ToDate")
rqClasstype = Request.Form("Classtype")

%>


<div align="left" style="padding:10px;">
  <p><b>PROJstudy Referral Reports</b></p>
</div>






<hr />

<div style="margin-left:20px; padding-top:50px;">

<table  border="0" class="table1" width="100%" cellpadding="0" cellspacing="0">


<tr><td width="60%"><b>Referral Reports</b>&nbsp;&nbsp;(From 13th September 2012 to 18th October 2012)<br /><br />
<table  border="1" class="table1" width="100%" cellpadding="3" cellspacing="0">
<tr>
<th>Date selected</th>
<th>Referral EmailID</th>
<th>Date of Enrollment</th>
<th>Enroll Status</th>
<th>Date of Payment</th>
<th>Referred By</th>
<th>Website</th>
<th>Course Type</th>
</tr>



<%






' Queriy for selecting days in between given values'
 
strQuery2="select Distinct(convert(varchar(10),dateofEnrollment,121)) FROM Ref_Enrollments WHERE dateofEnrollment BETWEEN '2012-09-13' AND '2012-10-18' AND CourseType = 'Class' AND Website = 'PROJstudy' AND ReferredEmail NOT LIKE 'edusys%'"

'response.Write(strQuery2)
objRs2.open strQuery2 ,ConnObjRef

If Not objRs2.EOF Then

		arrAllRecords2 = objRs2.getrows
		Session("arrAllRecords2") = arrAllRecords2
		EnrollmentsNum2 = Ubound(arrAllRecords2,2)
		
		firstrow = 0
		lastrow = EnrollmentsNum2
End If

objRs2.close
'Running loop for retriving values based on day for getting payments and enrollments count'

If IsArray(arrAllRecords2) Then
       
for rowcounter = firstrow to lastrow

' Queriy for selecting enrollments count per each day in the loop'

strQuery3="select * FROM Ref_Enrollments WHERE convert(varchar(10),dateofEnrollment,121) = '"&arrAllRecords2(0,rowcounter)&"' AND CourseType = 'Class' AND Website = 'PROJstudy' AND ReferredEmail NOT LIKE 'edusys%'"

'Response.Write(strQuery3&" <Br>")
objRs3.open strQuery3,ConnObjRef

If Not objRs3.EOF Then

		arrAllRecords3 = objRs3.getrows
		Session("arrAllRecords3") = arrAllRecords3
		EnrollmentsNum3 = Ubound(arrAllRecords3,2)
		firstrow1 = 0
		lastrow1 = EnrollmentsNum3

End If


objRs3.close

If IsArray(arrAllRecords3) Then
       
for rowcounter1 = firstrow1 to lastrow1

'Here im getting the referre emailid'

strQuery4="select * FROM Ref_Account WHERE RefID = '"&arrAllRecords3(1,rowcounter1)&"'"

objRs4.open strQuery4,ConnObjRef
If Not objRs4.EOF Then
ReferreEmailID = objRs4("EmailId")

Else

ReferreEmailID = ""
End If
objRs4.close


%>
  

<tr align="center">
<td><% = arrAllRecords2(0,rowcounter) %></td>
<td><% =  arrAllRecords3(3,rowcounter1) %></td>
<td><% =  arrAllRecords3(5,rowcounter1) %></td>
<td>
<% If arrAllRecords3(4,rowcounter1) = "1" Then  %>
<% Noof_Enrolled = Noof_Enrolled + 1 %>   

Enrolled but not paid
<% ElseIf arrAllRecords3(4,rowcounter1) = "2" Then  %>
<% Noof_Paid = Noof_Paid + 1 %> 
Enrolled and paid
<% End If %>
</td>
<td><% =  arrAllRecords3(6,rowcounter1) %></td>
<td><% =  ReferreEmailID  %>
<td><% =  arrAllRecords3(7,rowcounter1) %></td>
<td><% =  arrAllRecords3(10,rowcounter1) %></td>
</tr>

<%

NEXT
End If

NEXT
End If

%>
</table>
</td>
<td width="10%">&nbsp; </td>

<%  

'Query for retriving no of referred people'

strQuery2="select Count(ID) AS ID FROM Ref_Enrollments WHERE  CourseType = 'Class' AND Website = 'PROJstudy' AND ReferredEmail NOT LIKE 'edusys%'"

'response.Write(strQuery2)
objRs2.open strQuery2 ,ConnObjRef

If Not objRs2.EOF Then

		Total_No = objRs2("ID")
Else
  
        Total_No = 0		
		
End If




%>
<td width="30%" valign="top"><b>Referral Numbers:</b><br /><br />
<table border="1" class="table1" width="50%" cellpadding="3" cellspacing="0">
     
	  <tr>
        <td width="30%"><b>Total Number of emails sent</b></td>
        <td width="10%">460 (Trough email campagin)</td>
      </tr> 
      <tr>
        <td width="30%"><b>Total Referred Students</b></td>
        <td width="10%"><% = Total_No %></td>
      </tr>
      <tr>
        <td width="30%"><b>Students Enrolled</b></td>
        <td width="10%"><% = Noof_Enrolled %></td>
      </tr>
      <tr>
        <td width="30%"><b>Enrolled and Paid Students</b></td>
        <td width="10%"><% =  Noof_Paid  %></td>
      </tr>
     
</table>
</td></tr>
</table>
<% End If %>


</div>
</body>
</html>
