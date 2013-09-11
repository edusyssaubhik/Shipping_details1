
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->
<%

Dim rqCountry
Dim strQuery
Dim items
Dim firstrow,lastrow,numrows,rowcounter,allitems
Dim objRs
Dim req
SET objRs = Server.CreateObject("ADODB.Recordset")
req=request.QueryString("category")
 
 strQuery = "select distinct TittleDescription,ManufacturerPartNumber from QW_category where Category='"& req &"'"

 objRs.Open strQuery,ConnObj
dim c
 If Not objRs.EOF Then
   items = objRs.getrows
   numrows = Ubound(items,2)
   firstrow = 0
   lastrow = numrows
   'response.Write(lastrow)
 End If
 
 objRs.Close
 
 
If IsArray(items) Then
For rowcounter = firstrow to lastrow-1
allitems = Trim(items(0,rowcounter))
If items(1,rowcounter) <> "" Then
allitems = Trim(items(1,rowcounter))&", "&Trim(items(0,rowcounter))
Else
allitems = Trim(items(0,rowcounter))
End If
response.write(allitems & "<br>")

Next
End If
    

ConnObj.Close
%>
