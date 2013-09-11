
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
 req=request.QueryString("query")
     margin_total=request.QueryString("margin")
 total=request.QueryString("total")
 tax=request.QueryString("tax")
 act=request.QueryString("act")
sell=request.QueryString("sell")
dis=request.QueryString("dis")
dim v,qono
'<--------inserting data with new version
if session("new_quoteid")="" then
 a=Session("qid_edit")
sql="select versionNo a,quoteno b from QW_QuoteOverview where quoteId = '"&a&"' and userId='"&Session("QWUserName")&"'"
Rs1.Open sql,ConnObj
  while not Rs1.EOF
 v=Rs1("a")
 qono=Rs1("b")
  Rs1.moveNext
  wend 
  Rs1.Close
  version_no=CInt(v)
 version_no=version_no+1 ' next version
strEmpDet = "INSERT INTO QW_QuoteOverview(versionNo,createdDate,userId,quoteno) VALUES ("&version_no&",'"& Now() &"','"&Session("QWUserName")&"','"&qono&"')"
	 
	 ConnObj.Execute strEmpDet
 que="select top 1 quoteId a from QW_QuoteOverview where userId='"&Session("QWUserName")&"' order by quoteId desc"	  	
    
	  Rs1.Open que,ConnObj
	  If (Not Rs1.BOF) and (Not Rs1.EOF) Then
	  Session("new_quoteid")=Rs1("a")
      end if
	  	
end if




 new_code=Split(req,";")
 For i = LBound(new_code) TO UBound(new_code)
  ' Response.Write new_code(i) & "<BR />"
 items=new_code(i)
'Session("quote_no")
 'dim quote=Cint(Session("quote"))
 strQuery = "INSERT INTO QW_QuoteDetails(quoteId,versionNo,itemName,itemCode,cost,price,quantity,actualPrice,discount,discountAmount,sellingPrice,FinalPrice,tax,shipping,totalAmount,courseid,margin,addedBy,addedDate,status,quoteno) values  ('"& Session("new_quoteid")&"',"&version_no&","&items&",'"&Session("QWUserName")&"','"& Now() &"','In Process','"&qono&"')"
response.Write(strQuery)
ConnObj.Execute strQuery
Next
'Session("quote")=""
 if act<> 0.00 and act<>"" then
    discount_per=-(Cdbl(dis)/Cdbl(act))*100
    else
    discount_per=0
    end if
  
  sql1="update QW_QuoteOverview set countryId='"&Session("country")&"',totalAmount='"& total &"',tax='"& tax &"' ,totalDiscount ='"& dis &"' ,totalActualPrice='"& act &"',totalsellingPrice='"& sell &"',margin_total='"& margin_total &"',discount_percent='"&discount_per&"' where quoteId='"& Session("new_quoteid")&"'"
 ConnObj.Execute sql1
  response.Write("Data is successfully inserted with updated"& tax & total)

ConnObj.Close
%>
