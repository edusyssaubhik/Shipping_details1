<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 14/05/2012'
'Description :'
' Display Cities'
'======================================================='

%>
<% If not  Session("UserId") = "" Then %>
<!--#include file="../includes/connection.asp"-->
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





%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
 <title>Generate ITIL courses</title>
 <link href="/backoffice/css/pagestyle.css" rel="stylesheet" type="text/css">
</head>
<body><div id="htMap">
<table border="1" height="10" cellspacing="0" class="dbborder" width="1000px">
 <tr>
   <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% =Session("country") %></span> PROJstudy Back Office</font></div></td>
 </tr>
 <tr>
  <td width="100px" valign="top" rowspan="22">
    <!--#include file="includes/leftMenu.html"-->
  </td>
 </tr>

   <tr>
  <td style="padding-top:-75px; text-align:center;">
  
  <form action="/includes/generator4datesandlocation.asp" method="post">
  <input type="hidden" name="generateCourse" value="generate" />
     <input type="submit" name="submit" value="Generate ITIL course" class="buttonc">
   
  </form>
  </td>
 </tr>
 </table>
</div>
</body>
</html>
<%
 ConnObj.Close
 Set ConnObj = Nothing
 Else
 Response.Redirect("../backOffice/login.asp")
 End If
%>