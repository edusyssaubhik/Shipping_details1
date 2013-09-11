<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<% If not  Session("UserId") = "" Then %>
<!--#include virtual="/includes/connection.asp"-->
<%  
'======================================================='
'Written By : Priyanka'
'Written Date : 13/05/2010'
'Last UpDated : 13/05/2010'
'Description :'
'This page is for Feedback '
'======================================================='

'Declaring variables'
Dim rqId,rqPage,rqRow
Dim strQuery,arrAllEmpDet,firstRow, lastRow, numRows, rowcounter

'Retriving the values'
rqAction=request.QueryString("action")
rqPage = Request.QueryString("page")
rqRow  = Request.QueryString("row")

'Creating the recordset'
set rs=server.CreateObject("ADODB.recordset")
rs.open "SELECT * FROM Feedback ORDER BY addeddate DESC",connObj
If Not rs.EOF Then
	arrAllEmpDet = rs.getrows
	firstRow = 0
	lastRow = 9
	numRows = Ubound(arrAllEmpDet,2)
	If lastRow > numRows Then
	   lastRow = numRows
	End If
End If

rs.Close

If rqPage = "next" Then

   numRows = Ubound(arrAllEmpDet,2)

   firstRow = rqRow + 1
   lastRow = firstRow + 9

   If firstRow >= numRows Then
      firstRow = rqRow + 1
      lastRow = firstRow + 9
   End If

   If firstRow < 0 Then
      firstRow = 0
   End If

   If lastRow > numRows Then
      lastRow = numRows
   End If

End If

If rqPage = "previous" Then

   numRows = Ubound(arrAllEmpDet,2)

   lastRow = rqRow - 1
   firstRow = lastRow - 9

   If firstRow =< 0 Then
      firstRow = 0
      lastRow = firstRow + 9
   End If

   If lastRow > numRows Then
      lastRow = numRows
   End If

End If


%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Feedback</title>
<script language="javascript">
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
	   //Check To See If The Name Field Is Balnk     
		
		if (validate_required(Name,"Please enter the Name")==false)
			  {Name.focus();return false}
  
      //Check To See If The company Field Is Balnk     
		
		if (validate_required(company,"Please enter the Company Name")==false)
			  {company.focus();return false}
  
	  //Check To See If The dateofpassing Field Is Balnk     
		
		if (validate_required(dateofpassing,"Please enter the Date of Passing")==false)
			  {dateofpassing.focus();return false}
  
       //Check To See If The feedback Field Is Balnk     
		
		if (validate_required(feedback,"Please enter the Feedback")==false)
			  {feedback.focus();return false}

	}
}
</script>
</head>

<body>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Home</title>
<link href="/backoffice/css/pagestyle.css" rel="stylesheet" type="text/css">
</head>
<body><div id="htMap">
<table border="1"  width="1000px" cellspacing="0" height="550" class="dbborder">
 <tr>
   <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to APMGstudy Back Office</font></div>
 </tr>
  <tr>
   <td width="100px" valign="top" rowspan="22">
     <% if Session("country") <> "" then %>
	<!--#include file="includes/leftMenu.html"-->
	<% end if %>
   </td>
  </tr>
  <tr>
      <td valign="top">

<% 

	strQuery="SELECT * FROM Feedback" 
	rs.open strQuery,connObj
%>
<%  'If IsArray(arrAllEmpDet) Then %> 
<!-- Here Displaying All The Users -->
    
      <table border="1" align="center" width="500px" cellspacing="0" cellpadding="3" >

<tr height="25">
<td bgcolor="#A7DBFB"><h4>ID</h4></td>
<td bgcolor="#A7DBFB"><h4>Name</h4></td>
<td bgcolor="#A7DBFB"><h4>Email Id</h4></td>
<td bgcolor="#A7DBFB" ><h4>Feedback</h4></td>
<td bgcolor="#A7DBFB"><h4>Date of pasing</h4></td>

</tr>
  <%  For rowcounter = firstRow To lastRow  %>
<tr>
<td><% = arrAllEmpDet(0,rowcounter) %></td>
<td><% = arrAllEmpDet(1,rowcounter) %></td>
<td><% = arrAllEmpDet(2,rowcounter) %></td>
<td><% = arrAllEmpDet(3,rowcounter) %></td>
<td><% = arrAllEmpDet(4,rowcounter) %></td>

</tr>
<% Next %>
 <tr>
    <td colspan="25"><% If Not firstRow = 0 Then %>
      <a href="feedback.asp?page=previous&row=<% = firstRow %>">&lt;&lt;Previous</a>
      <% End If %>
      <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
      <% If Not numRows = lastRow Then %>
      <a href="feedback.asp?page=next&row=<% = lastRow %>">&gt;&gt;Next</a>
      <% End If %></td>
  </tr> 

<% 'End If %>

 </table>
  </td>
 </tr>


														
</table>
</body>
</html>
<%
 Else
 Response.Redirect("../backoffice/login.asp")
 End If
%>
