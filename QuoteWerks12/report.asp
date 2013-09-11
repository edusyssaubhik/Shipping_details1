<!--#include virtual="/QuoteWerks/includes/connection.asp"-->
<head>
<% 
'If not Session("userName") then redirect to  login page'
	If Session("QWUserName") = "" Then 
		Response.Redirect("default.asp")
	Else
	
%>
<%
'======================================================='
'Written By : savita'
'Created Date : 2/03/2013'

'Description :'
'Report '
'======================================================='
%>
<%
'Declaring variables
Dim rqAction ,rqCountry,rqWebsite
Dim rqId,arrAllcountries,objRs2,objRs3,objRs4
Dim arrAllEmpDet, firstRow, lastRow, numRows, rqRow, rqPage
Dim message,strquery1
Dim hb_website,GrandTotal1

GrandTotal1 = 0

message = Session("message")
Session("message") = ""
   
 rquserId = Request.Form("userId")
 rqCompName = Request.Form("CompName")
 rqFromDate        =  Request.Form("fromDate")
rqFromDate2       =  Request.Form("toDate")
'Creating the Recordset objects'
SET objRs1 = Server.CreateObject("ADODB.Recordset")
SET objRs2 = Server.CreateObject("ADODB.Recordset")
	
'Retrive the values from this page'

rqAction = Request.QueryString("action")
rqRow  = Request.QueryString("row")
rqPage = Request.QueryString("page")


%>
</head>
<!-- Body Starts -->
<body>
<body style="margin-top:0px">
<div align="left" style="margin-bottom:40px;">
  <table width="580" border="1" cellspacing="0" cellpadding="5">
    <tr>
      <td colspan="12" align="center"><font face="Arial" size=2><b> Report </b></font></td>
    </tr>
    <tr>
      <td><b>SrNo</b></td>
      <td><font face="Arial" size=2><b>Sales Manager Name</b></font></td>
      <td><font face="Arial" size=2><b>quote Id</b></font></td>
      <td><font face="Arial" size=2><b>Sent Date</b></font></td>
      <td><font face="Arial" size=2><b>Company Name</b></font></td>
      <td><font face="Arial" size=2><b>Tax</b></font></td>
      <td><font face="Arial" size=2><b>Total Amount</b></font></td>
    </tr>
    <% 'query retrive the details from  tables
		
	If rquserId <> "" Then
		
	strQuery = "SELECT * FROM QW_QuoteOverview where userId = 	'"&rquserId &"'"
		
	ElseIf rqCompName <> "" Then
		
	strQuery = "SELECT * FROM QW_QuoteOverview where companyId = '"&rqcompId &"'"
	 	
	ElseIf rqFromDate <> "" Then
	
	strQuery = "SELECT * FROM QW_QuoteOverview where sentDate >= '" & rqFromDate & "' AND sentDate <= '" & DateAdd("d", +1,CDate(rqFromDate2)) & "'"
	 
	 Else
	 
	End If
	
	   objRs1.Open strQuery,ConnObj  
	   
	   SrNo = 1
	   	
	      Do Until objRs1.EOF
	         quoteId = objRs1("quoteId")
	         sentDate = Trim(objRs1("sentDate"))
	         userId = objRs1("userId")
	         totalAmount = objRs1("totalAmount")
	         tax = objRs1("tax")
	         companyId = objRs1("companyId")
			 			 
			 
	strQuery1 = "select CompName from QW_Company  where compId ='"&companyId &"'"
	
	objRs2.Open strQuery1,ConnObj
	
	  Do Until objRs2.EOF 

		  rqCompName = objRs2("CompName") 
          
          objRs2.Movenext
		   Loop
		   objRs2.Close 	 
		
%>
    <tr>
      <td><% = SrNo %></td>
      <td><font face="Arial" size=2><%= userId %></font></td>
      <td><font face="Arial" size=2><%= quoteId %></font></td>
      <td><font face="Arial" size=2><%= sentDate %></font></td>
      <td><font face="Arial" size=2><%= rqCompName %></font></td>
      <td><font face="Arial" size=2><%= tax %></font></td>
      <td><font face="Arial" size=2><%= totalAmount %></font></td>
      <% 
	   ' Dim GrandTotal

      if 	totalAmount = "" OR ISNULL(totalAmount) Then
	  
	  	totalAmount = 0
		
		End IF
		
		'calculate the total 

		 GrandTotal1 = GrandTotal1 + totalAmount 
		 
		 
		  SrNo = SrNo + 1
		totalAmount = 0
    
     objRs1.Movenext
     Loop
	 objRs1.Close
	 
	 %>
    </tr>
    <tr>
      <td colspan="6" align="right">Total</td>
      <td><font face="Arial" size=2><b>
        <% = GrandTotal1 %>
        </b></font></td>
    </tr>
  </table>
</div>
<% End If %>
</Body>
<!-- Body Ends -->
