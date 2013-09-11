
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->
<%
'[quoteId] [int] NOT NULL,---->session
'	[versionNo] [int] NULL,   ---->  1 
'	[itemName] [varchar](200) NULL,----> 
'	[itemCode] [varchar](20) NULL,
'	[cost] [nvarchar](20) NULL,
'	[price] [nvarchar](20) NULL,
'	[quantity] [int] NULL,
'	[actualPrice] [nvarchar](20) NULL,
'	[discount] [nvarchar](10) NULL,
'	[discountAmount] [nvarchar](10) NULL,
'	[sellingPrice] [nvarchar](10) NULL,
'	[FinalPrice] [nvarchar](20) NULL,
'	[tax] [nvarchar](10) NULL,
'	[shipping] [nvarchar](10) NULL,
'	[totalAmount] [nvarchar](20) NULL,
'	[addedBy ] [varchar](50) NULL,-->session user
'	[addedDate] [datetime] NULL,-->now()
'
'     VALUES
Dim rqCountry
Dim strQuery
Dim items
Dim firstrow,lastrow,numrows,rowcounter,allitems,sql1
Dim objRs
Dim req
Dim new_code
Dim total
Dim tax
Dim act
Dim sell
Dim dis

SET objRs = Server.CreateObject("ADODB.Recordset")
 req=request.QueryString("query")
 total=request.QueryString("total")
 tax=request.QueryString("tax")
 act=request.QueryString("act")
sell=request.QueryString("sell")
dis=request.QueryString("dis")
 new_code=Split(req,";")
 For i = LBound(new_code) TO UBound(new_code)
  ' Response.Write new_code(i) & "<BR />"
items=new_code(i)
'Session("quote_no")
 'dim quote=Cint(Session("quote"))
 strQuery = "INSERT INTO QW_QuoteDetails(quoteId,versionNo,itemName,itemCode,cost,price,quantity,actualPrice,discount,discountAmount,sellingPrice,FinalPrice,tax,shipping,totalAmount,courseid,addedBy,addedDate,status,quoteno) values  ('"&Session("quote")&"',1,"&items&",'"&Session("QWUserName")&"','"& Now() &"','In Process','"&Session("quote_no")&"')"
'response.Write(strQuery)
ConnObj.Execute strQuery
Next
'Session("quote")=""
 
  sql1="update QW_QuoteOverview set countryId='"&Session("country")&"',totalAmount='"& total &"',tax='"& tax &"' ,totalDiscount ='"& dis &"' ,totalActualPrice='"& act &"',totalsellingPrice='"& sell &"' where quoteId='"&Session("quote")&"'"
ConnObj.Execute sql1
  response.Write("Data is successfully inserted with updated"& tax & total)

ConnObj.Close
%>
