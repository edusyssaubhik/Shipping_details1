<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<!--#include file="includes/connection.asp"-->
<link href="/backoffice/css/pagestyle.css" rel="stylesheet" type="text/css">
<%
 'Declare The Variables'
 
 Dim  rqId
 Dim strQuery,Rs
 
 Set Rs = server.CreateObject("ADODB.recordset")

'Retrive The enrolluserid From course.asp Page'

 rqId = Request.Querystring("ID")

'Sql Query For Retrive The comments For That EnrolledUser'

 strQuery = "SELECT TOP 1 * FROM callsreceived_new WHERE ID = '" & rqId & "' ORDER BY callid desc"

 Rs.Open strQuery,ConnObj

 %>
 <html>
 <head>
 <title>EnrollUser status</title>
 </head>
 <body>
 <table border="0" cellspacing="0" cellpadding="0">
 <!-- <tr>
   <td bgcolor="#00B0EC" align="center">Comment</td>
   <td bgcolor="#00B0EC" align="center">Entered By</td>
   <td bgcolor="#00B0EC" align="center">EnteredDate</td>
  </tr>-->

  <tr>
   <td><div id="htMap">

  
   	  <% do until Rs.EOF %>
   

    <% = Rs("call_status2") %><br>Added By <% = Rs("addedby") %><br>


   
	  <% Rs.Movenext
     Loop %>
   </div>
   </td>
  </tr>

 </table>
 </body>
 </html>
