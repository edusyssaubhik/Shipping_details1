
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
dim a
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
       Dim margin_total

SET Rs1 = Server.CreateObject("ADODB.Recordset")
margin_total=request.QueryString("margin")

 req=request.QueryString("query")
 total=request.QueryString("total")
 tax=request.QueryString("tax")
 act=request.QueryString("act")
sell=request.QueryString("sell")
dis=request.QueryString("dis")
dim v,qono,version_no,ses_new
'<--------inserting data with new version
if Session("quote")<>"" then
ses_new=session("quote")
Response.Write(ses_new)
end if 
Set  Rs2 = Server.CreateObject("ADODB.Recordset")

  s12="SELECT versionNo a,quoteno b FROM  QW_QuoteDetails where quoteId='"&ses_new&"'"
  'response.Write(s12)
  Rs2.Open s12,ConnObj
  while Not Rs2.EOF
  version_no=Rs2("a")
  qono=Rs2("b")
 'response.Write(s12) 
  Rs2.moveNext
  wend
  Rs2.Close

 sql="delete FROM  QW_QuoteDetails where quoteId='"&ses_new&"'"
  ConnObj.Execute sql
 

 new_code=Split(req,";")
 For i = LBound(new_code) TO UBound(new_code)
  ' Response.Write new_code(i) & "<BR />"
 items=new_code(i)
'Session("quote_no")
 'dim quote=Cint(Session("quote"))
 strQuery = "INSERT INTO QW_QuoteDetails(quoteId,versionNo,itemName,itemCode,cost,price,quantity,actualPrice,discount,discountAmount,sellingPrice,FinalPrice,tax,shipping,totalAmount,courseid,margin,addedBy,addedDate,status,quoteno) values  ('"& ses_new &"',"&version_no&","&items&",'"&Session("QWUserName")&"','"& Now() &"','In Process','"&qono&"')"
    response.Write(strQuery)
ConnObj.Execute strQuery
Next
'Session("quote")=""
 if act<> 0 and act<>"" then
    discount_per=-(Cdbl(dis)/Cdbl(act))*100
    else
    discount_per=0
    end if 

  sql1="update QW_QuoteOverview set countryId='"&Session("country")&"',totalAmount='"& total &"',tax='"& tax &"' ,totalDiscount ='"& dis &"' ,totalActualPrice='"& act &"',totalsellingPrice='"& sell &"',margin_total='"& margin_total &"',discount_percent='"&discount_per&"' where quoteId='"& ses_new &"'"
ConnObj.Execute sql1
  response.Write("Data is successfully inserted with updated"& tax & total)

ConnObj.Close

%>
