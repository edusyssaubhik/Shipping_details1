<!--#include virtual="/QuoteWerks/includes/connection.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>

<%
'======================================================='
'Written By : savita'
'Created Date : 28/02/2013'
'Description :'
'This page is for generating the quote '
'======================================================='
%>
<%
'Declaring variables
Dim rqAction ,rqCountry,rqWebsite
Dim rqId,arrAllcountries,objRs2,objRs3,objRs4
Dim arrAllEmpDet, firstRow, lastRow, numRows, rqRow, rqPage
Dim message,strquery1
Dim hb_website

message = Session("message")
Session("message") = ""
   
'Creating the Recordset objects'
SET objRs1 = Server.CreateObject("ADODB.Recordset")
SET objRs2 = Server.CreateObject("ADODB.Recordset")
	
'Retrive the values from this page'
rqquoteid = Request.QueryString("quoteid")

rqAction = Request.Form("action")
rqAction = Request.QueryString("action")
rqRow  = Request.QueryString("row")
rqPage = Request.QueryString("page")

'updating query with status omplete'
strEmpDet= "UPDATE QW_QuoteOverview  SET "
 strEmpDet= strEmpDet& "licensing = 'Accepted',"
		  strEmpDet= strEmpDet& "licensing_Addeddate = '"& now() &"',"
		  strEmpDet= strEmpDet& "licensing_addedBy = '"&Session("email1")&"'"
		  strEmpDet= strEmpDet& " WHERE quoteId = '"& rqquoteid &"'"
					
ConnObj.Execute strEmpDet

'Response.Write(strEmpDet)


Response.Write "Thank you for your confirmation"

										  


%>



</Body>
<!-- Body Ends -->
