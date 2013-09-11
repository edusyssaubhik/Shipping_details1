<%@ Language = "VBScript" %>
<%
'Written By : Bharath'
'Created Date: 14/03/2013'
'Last UpaDated: 14/03/2013'
'Description : Displaying the comments'
%>
<!--#include virtual="/Quotewerks/includes/connection.asp"-->
<link href="/Quotewerks/css/style.css" rel="stylesheet" type="text/css" media="screen" />
<%
'Declare The Variables'
Dim rqCallId
Dim strQuery
Dim objRs

'Creating Recordset'
Set objRs = Server.CreateObject("ADODB.Recordset")

'Retrive The enrolluserid From couobjRse.asp Page'
rqQuoteId = Request.Querystring("quoteId")

'Sql Query For Retrive The comments For That EnrolledUser'
strQuery = "SELECT * FROM QW_QuoteOverviewHistory WHERE quoteId = '" & rqQuoteId & "' Order by cid desc"

objRs.Open strQuery,ConnObj


%>
 <html>
 <head>
 <title>Quote Comments</title>
 </head>
 <body>
 <table border="0" cellspacing="0" cellpadding="0">
  <tr>
   <td>
   <ol>
   	  <% do until objRs.EOF %>
    <li>

    <% = objRs("comment") %><br>Added by <% = objRs("comm_addedby") %>&nbsp;
 <% = objRs("comm_date") %>

    </li>
	  <% objRs.Movenext
     	 Loop
		 objRs.Close  %>
   </ol>
   </td>
  </tr>
 </table>
 </body>
 </html>
