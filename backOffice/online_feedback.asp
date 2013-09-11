<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<% If not  Session("UserId") = "" Then %>
<!-- #include virtual = "/includes/connection.asp"-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%  
'Declaring variables'
Dim rs,rqId,rqPage,rqRow
Dim strQuery,arrAllEmpDet,firstRow, lastRow, numRows, rowcounter

'Retriving the values'
rqAction=request.QueryString("action")
rqPage = Request.QueryString("page")
rqRow  = Request.QueryString("row")


'Creating the recordset'
set rs=server.CreateObject("ADODB.recordset")
rs.open "SELECT * FROM online_feedback Where country = '"&Session("country")&"' ORDER BY id DESC",connObj
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

 //This Function Is to confirm deleting course In Course Page
function DeleteAlert(link) {
  if(confirm("Are you sure you want to delete?"))
  {
      return true;
  }
return false;
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
	   //Check To See If The Name Field Is Balnk     
		
		if (validate_required(Name,"Please enter the Name")==false)
			  {Name.focus();return false}

  
  
       //Check To See If The feedback Field Is Balnk     
		
		if (validate_required(feedback,"Please enter the Feedback")==false)
			  {feedback.focus();return false}

	}
}
</script>
</head>

<body>
<h2><a href="online_feedback.asp">Feedback</a>
<% If rqAction="addFeedback" then %>
&raquo; Add Feedback
<% ElseIf rqAction="editFeedback" then %>
&raquo; Edit Feedback
<%  ElseIf rqAction="deleteFeedback" then %>
&raquo; Delete Feedback
<% Else %>
&raquo;Online Feedback Details
<% End If %>
 </h2>
<h4><a href="online_feedback.asp?action=addFeedback">Add Feedaback</a></h4>

<div>

<% If rqAction="addFeedback" then %>
<h3> Add Feedback </h3>
<% ElseIf rqAction="editFeedback" then %>
<h3> Edit Feedback </h3>
<%  ElseIf rqAction="deleteFeedback" then %>
<h3> Delete Feedback </h3>
<% Else %>
<h3> Online Feedback Details</h3>
<% End If %>

<fieldset>

<% 
	If rqAction="addFeedback" then 
%>

<form action="addEditDelOlFeedback.asp" method="post" onSubmit="return validate_form(this)">
<table border="0" width="50%">
<tr>
<td width="30%"><h4>Name</h4></td>
<td ><input type="text" name="Name" size="30"/></td>
</tr>

<tr>
<td valign="top"><h4>Feedback</h4></td>
<td><textarea cols="24" rows="10" name="feedback"></textarea></td>
</tr>

<tr>
<td></td>
<td align="left"><input type="submit" name="type" value="Submit" /></td>
</tr>
</table>
</form>


<% 
	ElseIf rqAction="editFeedback" then 
	rqID=request.QueryString("id")
	strQuery="SELECT id, fname, feedback FROM online_feedback WHERE id='"&rqID&"' and country = '"&Session("country")&"' "
     rs.open strQuery,connObj

%>

<form action="addEditDelOlFeedback.asp" method="post" onsubmit="return validate_form(this)">
<% do until rs.EOF %>
<input type="hidden" name="id" value="<%=rs("id")%>"/>

<table border="0" width="50%">
<tr>
<td width="30%"><h4>Name</h4></td>
<td ><input type="text" name="Name" value="<%=rs("fname") %>"size="30"/></td>
</tr>

<tr>
<td valign="top"><h4>Feedback</h4></td>
<td><textarea cols="24" rows="10" name="feedback" ><%=rs("Feedback") %></textarea></td>
</tr>

<tr>
<td></td>
<td align="left"><input type="submit" name="type" value="Update" /></td>
</tr>
<% rs.movenext
   loop
  rs.close%> 
</table>
</form>


<% Else

	strQuery="SELECT * FROM online_feedback WHERE country = '"&Session("country")&"'" 
	rs.open strQuery,connObj
%>
<%  If IsArray(arrAllEmpDet) Then %> 
<table border="1" width="100%" cellpadding="5" cellspacing="0">
<tr><td colspan="7" align="right"><a href="online_feedback.asp?action=addFeedback">Add</a></td></tr>
<tr>
<td width="50px"><h4>ID</h4></td>
<td width="100px"><h4>Name</h4></td>
<td width="150px"><h4>Feedback</h4></td>

<td width="50px"><h4>Edit</h4></td>
<td width="50px"><h4>Delete</h4></td>
</tr>
  <%  For rowcounter = firstRow To lastRow  %>
<tr>
<td><% = arrAllEmpDet(0,rowcounter) %></td>
<td><% = arrAllEmpDet(1,rowcounter) %></td>
<td><% = arrAllEmpDet(2,rowcounter) %></td>

<td><a href="online_feedback.asp?action=editFeedback&amp;id=<% = arrAllEmpDet(0,rowcounter) %>">Edit</a></td>
<td><a href="addEditDelOlFeedback.asp?action=deleteFeedback&amp;id=<% = arrAllEmpDet(0,rowcounter) %>" onclick="return DeleteAlert(this.href);">Delete</a></td>
</tr>
<% Next %>
 <tr>
    <td colspan="25"><% If Not firstRow = 0 Then %>
      <a href="online_feedback.asp?page=previous&amp;row=<% = firstRow %>">&lt;&lt;Previous</a>
      <% End If %>
      <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
      <% If Not numRows = lastRow Then %>
      <a href="online_feedback.asp?page=next&amp;row=<% = lastRow %>">&gt;&gt;Next</a>
      <% End If %></td>
  </tr> 
</table>
<% End If %>
<% End If %>
</fieldset>

</div> 

</body>
</html>
 <% 
 Else
 Response.Redirect("../backOffice/login.asp")
 End If	
%>