<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 03/03/2012'
'Description :'
'This page is adding the comments into datebase page'
'======================================================='
%>
<!--#include virtual="/includes/connection.asp"-->
<%
 'Declare The Variables'
 
 Dim rqID
 Dim strQuery,Rs,Conn

Set Rs = Server.CreateObject("ADODB.Recordset")

'Retrive The ID From paydecline.asp Page'

 rqID = Request.Querystring("ID")

'Sql Query For Retrive The comments For That payment declined'

 strQuery = "SELECT * FROM payment_comment WHERE ID = '" & rqID & "' ORDER BY comID desc"

 Rs.Open strQuery,ConnObj

 %>
<html>
<head>
<title>Payment Decline Comments</title>
</head>
<body>
<table border="0" cellspacing="0" cellpadding="0">
  <!-- <tr>
   <td bgcolor="#00B0EC" align="center">Comment</td>
   <td bgcolor="#00B0EC" align="center">Entered By</td>
   <td bgcolor="#00B0EC" align="center">EnteredDate</td>
  </tr>-->
  <tr>
    <td><ol>
        <% do until Rs.EOF %>
        <li>
          <% = Rs("comment") %>
          <br>
          <% = Rs("comm_addedby") %>
          &nbsp;
          <% = Rs("comm_addeddate") %>
          <br />
          <br />
        </li>
       
        <% Rs.Movenext
     Loop 
	 Rs.Close%>
      </ol></td>
  </tr>
</table>
</body>
</html>
