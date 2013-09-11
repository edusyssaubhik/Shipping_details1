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

'Retriving the Name'
rqName=request.form("Name")


'Creating the recordset'
set rs=server.CreateObject("ADODB.recordset")
If rqName <> ""  then 

rs.open "SELECT * FROM classroom_feedback Where fname like '%"& rqName &"%' AND country = '"&Session("country")&"'  ORDER BY dateofpassing DESC",connObj
 
Else

rs.open "SELECT * FROM classroom_feedback Where country = '"&Session("country")&"'  ORDER BY dateofpassing DESC",connObj

End If

If Not rs.EOF Then
	arrAllEmpDet = rs.getrows
	Session("arrAllEmpDet") = arrAllEmpDet
     cnt = 1
	firstRow = 0
	lastRow = 9
	numRows = Ubound(arrAllEmpDet,2)
	If lastRow > numRows Then
	   lastRow = numRows
	End If
		allNumRows = numRows
End If

rs.Close


'Pagination code'
If cnt = 1 Then 
 If Request.QueryString("page") = "" Then
	
	iPageCurrent = 1


   numRows = Ubound(arrAllEmpDet,2)

	 firstRow = 0  
	 If numRows > 9 Then
	    lastRow = 9  
	 Else
	 	lastRow = numRows
	 End If 
  Else
	
	arrAllEmpDet = Session("arrAllEmpDet")	
	numRows = Ubound(arrAllEmpDet,2)
	
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
  
      //Check To See If The company Field Is Balnk     
		
		if (validate_required(company,"Please enter the Company Name")==false)
			  {company.focus();return false}
  
	  //Check To See If The dateofpassing Field Is Balnk     
		
		if (validate_required(dateofpassing,"Please enter the Date of Passing")==false)
		    { dateofpassing.focus(); return false }

	    //Check To See If The Feedback type field Field Is Balnk     

		if (validate_required(FeedbackType, "Please select a feedback type") == false)
		{ FeedbackType.focus(); return false }
  
       //Check To See If The feedback Field Is Balnk     
		
		if (validate_required(feedback,"Please enter the Feedback")==false)
			  {feedback.focus();return false}

	}
}
</script>
</head>

<body>
<h2><a href="classroom_feedback.asp">Feedback</a>
<% If rqAction="addFeedback" then %>
&raquo; Add Feedback
<% ElseIf rqAction="editFeedback" then %>
&raquo; Edit Feedback
<%  ElseIf rqAction="deleteFeedback" then %>
&raquo; Delete Feedback
<% Else %>
&raquo;Classroom Feedback Details &raquo; <a href="classroom_feedback.asp?action=addFeedback">Add</a>
<% End If %>
 </h2>


<div>

<% If rqAction="addFeedback" then %>
<h3> Add Feedback </h3>
<% ElseIf rqAction="editFeedback" then %>
<h3> Edit Feedback </h3>
<%  ElseIf rqAction="deleteFeedback" then %>
<h3> Delete Feedback </h3>
<% Else %>
<h3> Classroom Feedback Details</h3>
<% End If %>

<fieldset>
       
         

<% 
	If rqAction="addFeedback" then 
%>

<form action="addEditDelClFeedback.asp" method="post" onSubmit="return validate_form(this)">
<table border="0" width="50%">
<tr>
<td width="30%"><h4>Name</h4></td>
<td ><input type="text" name="Name" size="30"/></td>
</tr>
<tr>
<td><h4>Company</h4></td>
<td><input type="text" name="company" size="30"/></td>
</tr>
<tr>
<td><h4>Date of passing</h4></td>
<td><input type="text" name="dateofpassing" size="30"/>
Ex: (YYYY-MM-DD)</td>
</tr>
<tr>
      <td valign="top"><h4>Feedback Type</h4></td>
      <td><select name="FeedbackType" id="FeedbackType">
          <option value="">---Select---</option>
          <option value="1">Excellent Feedback</option>
          <option value="2">Great Feedback</option>
          <option value="3">Good but short feedback</option>
          </select></td>
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
	strQuery="SELECT id,fname, company, dateofpassing, feedback,feedbackType FROM classroom_feedback WHERE id='"&rqID&"' AND country = '"&Session("country")&"' "
     rs.open strQuery,connObj

%>

<form action="addEditDelClFeedback.asp" method="post" onsubmit="return validate_form(this)">
<% do until rs.EOF %>
<input type="hidden" name="id" value="<%=rs("id")%>"/>

<table border="0" width="50%">
<tr>
<td width="30%"><h4>Name</h4></td>
<td ><input type="text" name="Name" value="<%=rs("fname") %>"size="30"/></td>
</tr>
<tr>
<td><h4>Company</h4></td>
<td><input type="text" name="company" value="<%=rs("company") %>" size="30"/></td>
</tr>
<tr>
<td><h4>Date of pasing</h4></td>
<td><input type="text" name="dateofpassing" value="<%=rs("dateofpassing") %>"size="30"/></td>
</tr>
<tr>
      <td valign="top"><h4>Feedback Type</h4></td>
      <td><select name="FeedbackType" id="FeedbackType">
          <option value="">---Select---</option>
          <option value="1" <%If rs("feedBackType") ="1" Then %>Selected="selected"<%End If %>>Excellent Feedback</option>
          <option value="2" <%If rs("feedBackType") ="2" Then %>Selected="selected"<%End If %>>Great Feedback</option>
          <option value="3" <%If rs("feedBackType") ="3" Then %>Selected="selected"<%End If %>>Good but short feedback</option>
          </select></td>
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

	strQuery="SELECT * FROM classroom_feedback Where country = '"&Session("country")&"'  ORDER BY dateofpassing DESC" 
	rs.open strQuery,connObj
%>
<%  If IsArray(arrAllEmpDet) Then %> 
<table border="1" width="100%" cellpadding="5" cellspacing="0">
<tr><td colspan="8" align="right"><a href="classroom_feedback.asp?action=addFeedback">Add</a></td></tr>
<tr><td colspan="8">
<table border="0" width="100%">
       <tr><td width="25%">
      <form action="classroom_feedback.asp" method="post">
     
     
			Name 
			  <input type="text" name="Name"/>
			
			  <input type="submit" name="search" value="Search" />			
              </form>
              </td></tr></table></td></tr>
              
<tr>
<td width="100px"><h4>Name</h4></td>
<td width="100px"><h4>Company</h4></td>
<td width="50px"><h4>Date of pasing</h4></td>
    <td width="60px"><h4>Feedback Type</h4></td>
<td width="150px"><h4>Feedback</h4></td>
<td width="50px"><h4>Edit</h4></td>
<td width="50px"><h4>Delete</h4></td>
</tr>
  <%  For rowcounter = firstRow To lastRow  
      
      
         rqFeedBacktype= ""
        If arrAllEmpDet(6,rowcounter) = "1" Then
            rqFeedBacktype = "Excellent Feedback"
        ElseIf arrAllEmpDet(6,rowcounter) = "2" then
            rqFeedBacktype ="Great Feedback"
        ElseIf arrAllEmpDet(6,rowcounter) = "3" then
            rqFeedBacktype ="Good but short feedback"
        End If
      %>
<tr>
<td><% = arrAllEmpDet(1,rowcounter) %></td>
<td><% = arrAllEmpDet(2,rowcounter) %></td>
<td><% = arrAllEmpDet(3,rowcounter) %></td>
<td><% = rqFeedBacktype %></td>
<td><% = arrAllEmpDet(4,rowcounter) %></td>
<td><a href="classroom_feedback.asp?action=editFeedback&id=<% = arrAllEmpDet(0,rowcounter) %>">Edit</a></td>
<td><a href="addEditDelClFeedback.asp?action=deleteFeedback&id=<% = arrAllEmpDet(0,rowcounter) %>" onclick="return DeleteAlert(this.href);" >Delete</a></td>
</tr>
<% Next %>
 <tr>
      <td colspan="17" ><!--#include file="pagination.asp"-->
               <% 

			    ps = getPaginationString(page, (numRows+1), 10, 2, "classroom_feedback.asp?&row="&firstRow&"")
				  Response.Write(ps)
	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows)) %>
            </td>
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
