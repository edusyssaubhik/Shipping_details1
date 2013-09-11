<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<% If Not  Session("UserId") = "" Then %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
<title>Logistics</title>
<link href="/backoffice/css/pagestyle.css" rel="stylesheet" type="text/css">
<script language="javascript" type="text/javascript">
<!--
function popitup(url) {
	newwindow=window.open(url,'name','toolbar=0,location=0,directories=0,status,menubar=0,scrollbars=1,minimizable=0,resizable=0,height=600,width=950,top=250,left=400');
	if (window.focus) {newwindow.focus()}
	return false;
}
//-->
</script>
</head>
<!-- #include virtual = "backoffice/includes/connection.asp"-->

<%
'Written By : Vinaya'
'Created Date: 24/11/2011'
'Last Updated Date: 
'Description :'
'Purpose : Show the logistic details'

'Declare The Variables'
Dim rqAction
Dim strStudyMat, strGifts, strUsers, strMis
Dim objRs, objRs1, objRs2, User
Dim allUsers, usersNumRows, usersFirstRoww, usersLastRow,rowUsersCounter
Dim bgColor

Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")
Set objRs2 = Server.CreateObject("ADODB.Recordset")

rqAction = Request.QueryString("action")

'Query for retriving all the email ids of faculty
strUsers = "SELECT emailid1 FROM instructors WHERE typeofuser = 'Faculty'"

objRs2.Open strUsers, ConnObj

If Not objRs2.EOF Then
	allUsers = objRs2.getrows
	usersNumRows = Ubound(allUsers,2)
	usersFirstRoww = 0
	usersLastRow = usersNumRows
End If

objRs2.Close


%>
<body>
<div id="htMap">
  <table border="1" height="550" cellspacing="0" class="dbborder" width="1000px">
    <tr>
      <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300">
          <% =Session("country") %>
          </span> PROJstudy Back Office</font></div>
    </tr>
    <tr>
      <td width="100px" valign="top" rowspan="22"><!--#include file="includes/leftMenu.html"-->
      </td>
    </tr>
    <tr height="490">
      <td valign="top"><table border="1" align="center" width="90%" cellspacing="0" cellpadding="2">
         <tr height="25">
            <td bgcolor="#A7DBFB" align="center" colspan="5"><b>Foundation</b></td>
            <td bgcolor="#A7DBFB" align="center" colspan="5"><b>Practitioner</b></td>
            <td bgcolor="#A7DBFB" align="center" colspan="2"><b>Trainer</b></td>
            <td bgcolor="#A7DBFB" align="center" colspan="3"><b>Details</b></td>
         </tr>
         
          <tr height="25">
            <td bgcolor="#A7DBFB" align="center"><b>Foundation Student Workbook</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Foundation Chapter Test </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Foundation Sample Paper 2</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Process Charts</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Process Diagram</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Practitioner Case Study (Student)</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Practitioner Case Study 1 (Answers)</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Practitioner Case Study 2 (Answers)</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Hints</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Feedback forms</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Foundation Trainer  Workbook</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Practitioner Case Study (Trainer)</b></td>
            
            <td bgcolor="#A7DBFB" align="center"><b>Added By</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Added Date</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>View All</b></td>
          </tr>
          <!--All Cities Puttin into Arraya And Dispalying-->
          <% 
	   If IsArray(allUsers) Then
	   FOR rowUsersCounter = usersFirstRoww to usersLastRow
	   
	   User = allUsers(0,rowUsersCounter)
	   
	   ' Query for select the latest studymaterials added by perticuler user
	   strStudyMat = "SELECT top 1 * FROM proj_studymaterial WHERE added_by = '"&User&"' ORDER BY id desc"
		
	   objRs.Open strStudyMat, ConnObj	
	   
	   Do Until objRs.EOF %>
          <tr>
            <% If objRs("Foun_StudentWorkbook") <= 15 Then 
	 		bgColor = "#E80000"
			Else
			bgColor = "#B1FB17"
	 		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("Foun_StudentWorkbook") %>
              </b></td>
            <% If objRs("Foun_Chaptest") <= 15 Then 
	 		bgColor = "#E80000"
			Else
			bgColor = "#B1FB17"
	 		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("Foun_Chaptest") %>
              </b></td>
            <% If objRs("Foun_Samplepaper2") <= 15 Then 
	 		bgColor = "#E80000"
			Else
			bgColor = "#B1FB17"
	 		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("Foun_Samplepaper2") %>
              </b></td>
            <% If objRs("ProcessCharts") <= 15 Then 
	 		bgColor = "#E80000"
			Else
			bgColor = "#B1FB17"
	 		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("ProcessCharts") %>
              </b></td>
            <% If objRs("ProcessDiagram") <= 15 Then 
	 		bgColor = "#E80000"
			Else
			bgColor = "#B1FB17"
	 		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("ProcessDiagram") %>
              </b></td>
            <% If objRs("Prac_Casestudy") <= 15 Then 
	 		bgColor = "#E80000"
			Else
			bgColor = "#B1FB17"
	 		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("Prac_Casestudy") %>
              </b></td>
            <% If objRs("Prac_Casestudy1") <= 15 Then 
	 		bgColor = "#E80000"
			Else
			bgColor = "#B1FB17"
	 		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("Prac_Casestudy1") %>
              </b></td>
            <% If objRs("Prac_Casestudy2") <= 15 Then 
	 		bgColor = "#E80000"
			Else
			bgColor = "#B1FB17"
	 		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("Prac_Casestudy2") %>
              </b></td>
            <% If objRs("Hints") <= 15 Then 
	 		bgColor = "#E80000"
			Else
			bgColor = "#B1FB17"
	 		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("Hints") %>
              </b></td>
            <% If objRs("FeedbackForms") <= 15 Then 
	 		bgColor = "#E80000"
			Else
			bgColor = "#B1FB17"
	 		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("FeedbackForms") %>
              </b></td>
            <% If objRs("Foun_TrainerWorkbook") <= 15 Then 
	 		bgColor = "#E80000"
			Else
			bgColor = "#B1FB17"
	 		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("Foun_TrainerWorkbook") %>
              </b></td>
            <% If objRs("Prac_TrainerCasestudy") <= 15 Then 
	 		bgColor = "#E80000"
			Else
			bgColor = "#B1FB17"
	 		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs("Prac_TrainerCasestudy") %>
              </b></td>
                         
            <td><% = objRs("added_by") %></td>
            <td><% = objRs("added_date") %></td>
            <td><a href="viewAllLogistcs.asp?User=<% = User %>&type=StudyMat" onClick="return popitup('viewAllLogistics.asp?User=<% = User %>&type=StudyMat')">View All</a></td>
          </tr>
          <% objRs.Movenext 
	   Loop 
	   objRs.Close 
	   
	   Next 
	   End If
	 %>
        </table>
        <br />
        <br />
        <table border="1" align="center" width="90%" cellspacing="0" cellpadding="2">
          <tr height="25">
            <td bgcolor="#A7DBFB" align="center"><b>4 in 1 Pens </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Highlighter Neon Yellow </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Highlighter Neon Green</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Highlighter Neon Pink </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Pencil - Z- Grip </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Quick point Pen Holder </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Robot Series Calculator </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Backpack Travel </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Cap</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Stress Ball </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Post It Notes</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Added By</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Added Date</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>View All</b></td>
          </tr>
         
          <% 
	   If IsArray(allUsers) Then
	   FOR rowUsersCounter = usersFirstRoww to usersLastRow
	   
	   User = allUsers(0,rowUsersCounter)
	' Query for select the latest gifts added by perticuler user
		strGifts = "SELECT top 1 *  FROM proj_gifts WHERE added_by = '"&User&"' ORDER BY added_by, id desc"

		objRs1.Open strGifts, ConnObj	

		Do Until objRs1.EOF %>
          <tr>
            <% If objRs1("pen") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("pen") %>
              </b></td>
            <% If objRs1("highlighter_yellow") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("highlighter_yellow") %>
              </b></td>
            <% If objRs1("highlighter_green") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("highlighter_green") %>
              </b></td>
            <% If objRs1("highlighter_pink") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("highlighter_pink") %>
              </b></td>
            <% If objRs1("pencil") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("pencil") %>
              </b></td>
            <% If objRs1("pen_holder") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("pen_holder") %>
              </b></td>
            <% If objRs1("calculator") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("calculator") %>
              </b></td>
            <% If objRs1("backpack") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("backpack") %>
              </b></td>
            <% If objRs1("cap") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("cap") %>
              </b></td>
            <% If objRs1("stressball") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("stressball") %>
              </b></td>
            <% If objRs1("postit_notes") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs1("postit_notes") %>
              </b></td>
            <td><% = objRs1("added_by") %></td>
            <td><% = objRs1("added_date") %></td>
            <td><a href="viewAllLogistcs.asp?User=<% = User %>&type=Gifts" onClick="return popitup('viewAllLogistics.asp?User=<% = User %>&type=Gifts')">View All</a></td>
          </tr>
          <% objRs1.Movenext 
	   Loop 
	   objRs1.Close 
	   
	   Next 
	   End If   
	   %>
        </table>
        <br />
        <br />
        <table border="1" align="center" width="90%" cellspacing="0" cellpadding="2">
          <tr height="25">
            <td bgcolor="#A7DBFB" align="center"><b>Visiting Cards </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Trifold Brochure </b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Onepage Flyer</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Added By</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>Added Date</b></td>
            <td bgcolor="#A7DBFB" align="center"><b>View All</b></td>
          </tr>
          <!--All Cities Puttin into Arraya And Dispalying-->
          <% 
	   If IsArray(allUsers) Then
	   FOR rowUsersCounter = usersFirstRoww to usersLastRow
	   
	   User = allUsers(0,rowUsersCounter)
	     ' Query for select the latest miscellaneous added by perticuler user
		strMis = "SELECT top 1 *  FROM proj_miscellaneous WHERE added_by = '"&User&"' ORDER BY added_by, id desc"

		objRs2.Open strMis, ConnObj	

		Do Until objRs2.EOF %>
          <tr>
            <% If objRs2("visiting_cards") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs2("visiting_cards") %>
              </b></td>
            <% If objRs2("trifold") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs2("trifold") %>
              </b></td>
            <% If objRs2("onepage_flyer") <= 15 Then 
			bgColor = "#E80000"
		Else
			bgColor = "#B1FB17"
		End If %>
            <td bgcolor="<% = bgColor %>"><b>
              <% = objRs2("onepage_flyer") %>
              </b></td>
            <td><% = objRs2("added_by") %></td>
            <td><% = objRs2("added_date") %></td>
            <td><a href="viewAllLogistcs.asp?User=<% = User %>&type=Gifts" onClick="return popitup('viewAllLogistics.asp?User=<% = User %>&type=Miscellaneous')">View All</a></td>
          </tr>
          <% objRs2.Movenext 
	   Loop 
	   objRs2.Close 
	   
	   Next 
	   End If   
	   %>
        </table></td>
    </tr>
  </table>
</div>
</body>
</html>
<%
 ConnObj.Close
 Set ConnObj = Nothing
 Else
  Response.Redirect("/backOffice/login.asp")
 End If
%>
