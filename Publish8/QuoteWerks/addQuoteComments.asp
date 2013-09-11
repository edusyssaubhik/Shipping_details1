<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
	If Session("QWUserName") = "" Then 
		Response.Redirect("default.asp")
	Else
%>
<!--#include virtual="/Quotewerks/includes/connection.asp"-->
<%
'======================================================='
'Written By : Bharath'
'Last UpDated : 14/03/2013'
'Description :'
'This page is adding the Quote comments into database page'
'======================================================='

'Declare The Variables'
Dim rqComment
Dim rqQuoteId
Dim objRs
Dim rqAction
Dim rqType
Dim strValue
Dim rqStatus
Dim rqPage
Dim rqRow
Dim rqState

'Retrive the quoteid and comment'
rqQuoteId  =  Request.Form("quoteId")
rqComment =  Request.Form("comment")
rqAction  =  Request.Form("action")
rqType    =  Request.Form("type")
rqStatus  =  Request.Form("status")
rqPage    =  Request.Form("page")
rqRow     =  Request.Form("row")
rqState    =  Request.Form("state")


Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "''")
End Function

Set objRs = Server.CreateObject("ADODB.Recordset")

If rqType = "Save" Then

'Insert the comment '
Response.Write("INSERT INTO QW_QuoteOverviewHistory (comment, comm_addedby, quoteid, comm_date) VALUES ('" & StrQuoteReplace(rqComment) & "','" & Session("QWUserName") & "','" & rqQuoteId & "', '"& Now() & "')")
ConnObj.Execute "INSERT INTO QW_QuoteOverviewHistory (comment, comm_addedby, quoteid, comm_date) VALUES ('" & StrQuoteReplace(rqComment) & "','" & Session("QWUserName") & "','" & rqQuoteId & "', '"& Now() & "')"

	Response.Redirect("/Quotewerks/generateReport.asp?action="&rqAction)


ElseIf rqType = "Close" Then


	ConnObj.Execute "INSERT INTO QW_QuoteOverviewHistory (comment, comm_addedby, quoteid, comm_date) VALUES ('" & StrQuoteReplace(rqComment) & "','" & Session("QWUserName") & "','" & rqQuoteId & "', '"& Now() & "')"
	
	ConnObj.Execute "UPDATE QW_QuoteOverview SET status = 'Quote Cancelled' WHERE quoteid = '"& rqQuoteId &"'"
	
	Response.Redirect("/Quotewerks/generateReport.asp?action=Cancelled")

ElseIf rqType = "Submit" Then
	
	rqStatus = Request.Form("status") 
	rqindex=Request.Form("index")
    rqpono="text_"&rqindex
    rqpono1=Request.Form(rqpono)
	ConnObj.Execute "INSERT INTO QW_QuoteOverviewHistory (comment, comm_addedby, quoteid, comm_date) VALUES ('" & StrQuoteReplace(rqStatus) & "','" & Session("QWUserName") & "','" & rqQuoteId & "', '"& Now() & "')"
	
	ConnObj.Execute "UPDATE QW_QuoteOverview SET status = '"& rqStatus &"',PONumber='"&rqpono1&"' WHERE quoteid = '"& rqQuoteId &"'"
	
	Response.Redirect("/Quotewerks/generateReport.asp?action="&rqStatus)


End If
End If
%>
<!--#include virtual="/Quotewerks/includes/connectionClose.asp"-->