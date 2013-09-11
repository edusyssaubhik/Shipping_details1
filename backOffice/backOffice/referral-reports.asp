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
rqReports = Request.QueryString("reports")

%>
<script type="text/javascript">

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
 function validate_required(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
	}
}



function validate_form(thisform)
{

    with (thisform)
    {
     
	   //Check To See If The Details Field Is Balnk     
		
		if (validate_required(FromDate,"Please enter the From Date")==false)
			  {FromDate.focus();return false}
			  
	 //Check To See If The Amount Field Is Balnk     
		
		if (validate_required(ToDate,"Please enter the To Date")==false)
			  {ToDate.focus();return false}
  
			 
		//Check To See If The Company name Field Is Balnk     
		
		if (validate_required(Classtype,"Please Select Country")==false)
			  {Classtype.focus();return false}
			  
		
  	}
	 
  
 }


 
  
</script>

<div align="left" style="padding:10px;">
  <p><b>Referral Reports</b><br /><br />
  <span style="font-size:12px; color:#F00;">( *** Report Effective from 18 October 2012)</span>
  &nbsp;&nbsp;Please <a href="referral-reports-old.asp" target="_blank">click here</a> for the old records
  </p>
</div>
<div align="left" style="margin-left:20px;">
  <form action="referral-reports.asp" method="post" onsubmit="return validate_form(this)">
    <table border="1" class="table1" width="25%" cellpadding="3" cellspacing="0">
      <tr>
        <td width="20%"><b>From Date:</b></td>
        <td width="20%"><input type="text" name="FromDate" value="<% = rqFromDate %>">
          <br>(EX: YYYY-MM-DD)</td>
      </tr>
      <tr>
        <td width="20%"><b>To Date:</b></td>
        <td width="20%"><input type="text" name="ToDate" value="<% = rqToDate %>">
          <br>(EX:  YYYY-MM-DD)</td>
      </tr>
      <tr>
        <td width="20%"><b>Course Type:</b></td>
        <td width="20%"><select name="Classtype" id="Classtype">
        <option value="">----Select----</option>
        <option <% If rqClasstype = "Class" THEN %> selected="selected" <% End if %> value="Class">Classroom</option>
        </select>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center"><input type="submit" name="Reports" value="Submit"></td>
      </tr>
    </table>
  </form>
  <br /><br />
</div>




<% If rqFromDate <> "" Then %>

<hr />

<div style="margin-left:20px; padding-top:50px;">

<table  border="0" class="table1" width="100%" cellpadding="0" cellspacing="0">


<tr><td width="60%"><b>Enrollment Details</b><br /><br />
<table  border="1" class="table1" width="100%" cellpadding="3" cellspacing="0">
<tr>
<th>EmailID of Referred</th>
<th>Date of Referred</th>
<th>EmailID of Referre</th>
<th>Enroll Status</th>
<th>Date of Enrollment</th>
<th>Date of Payment</th>
<th>Course Type</th>
<th>Website</th>
</tr>



<%
' Queriy for selecting days in between given values'

 
 
strQuery2="select Distinct(convert(varchar(10),ReferredDate,121)) FROM Ref_Enrollments WHERE ReferredDate BETWEEN '"&rqFromDate&"' AND '"&rqToDate&"' AND CourseType = '"& rqClasstype &"' AND Website = 'PROJstudy'"

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

strQuery3="select * FROM Ref_Enrollments WHERE convert(varchar(10),ReferredDate,121) = '"&arrAllRecords2(0,rowcounter)&"' AND CourseType = '"& rqClasstype &"' AND Website = 'PROJstudy'"

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
<td><% =  arrAllRecords3(3,rowcounter1) %></td>
<td><% =  arrAllRecords3(11,rowcounter1) %></td>
<td><% =  ReferreEmailID %></td>
<td>
<% If  rqClasstype  = "Class" Then %>
<% If arrAllRecords3(4,rowcounter1) = "1" Then  %>
<% Noof_Enrolled = Noof_Enrolled + 1 %>   

Enrolled but not paid
<% ElseIf arrAllRecords3(4,rowcounter1) = "2" Then  %>
<% Noof_Paid = Noof_Paid + 1 %> 
Enrolled and paid
<% End If %>
<% ElseIf rqClasstype = "Online" Then %>
<% If arrAllRecords3(4,rowcounter1) = "1" Then  %>
<% Noof_Enrolled = Noof_Enrolled + 1 %>  
Enrolled
<% End If %>
<% End If %>
</td>
<td><% =  arrAllRecords3(5,rowcounter1) %></td>
<td><% =  arrAllRecords3(6,rowcounter1) %></td>
<td><% =  arrAllRecords3(10,rowcounter1) %></td>
<td><% =  arrAllRecords3(7,rowcounter1) %></td>
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


<td width="30%" valign="top"><b>Referral Numbers:</b><br /><br />
<table border="1" class="table1" width="50%" cellpadding="3" cellspacing="0">
<%

strQuery6="select  Distinct(RefID)  FROM Ref_Requested WHERE Date_of_sent BETWEEN '"&rqFromDate&"' AND '"&rqToDate&"' AND Website = 'PROJstudy'"

'Response.Write(strQuery3&" <Br>")
objRs3.open strQuery6,ConnObjRef

If Not objRs3.EOF Then

		arrAllRecords6 = objRs3.getrows
		Session("arrAllRecords6") = arrAllRecords6
		EnrollmentsNum6 = Ubound(arrAllRecords6,2)
         EnrollmentsNum6 = EnrollmentsNum6 + 1
Else

EnrollmentsNum6 = 0

End If



%>

      <tr>
	  <td width="30%"><b>Total Referral mails sent</b></td>
        <td width="10%"><% = EnrollmentsNum6   %></td>
		</tr>
      <tr>
        <td width="30%"><b>Total Referred Students</b></td>
        <td width="10%"><% = rowcounter1  %></td>
      </tr>
      <tr>
        <td width="30%"><b>Students Enrolled</b></td>
        <td width="10%"><% = Noof_Enrolled %></td>
      </tr>
      <% If rqClasstype = "Class" Then %>
      <tr>
        <td width="30%"><b>Enrolled and Paid Students</b></td>
        <td width="10%"><% =  Noof_Paid  %></td>
      </tr>
      <% End If %>
     
</table>
</td></tr>
</table>
<% End If %>
<% End If %>
</div>
</body>
</html>
