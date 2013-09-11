
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->
<%

Dim rqCountry
Dim strQuery
Dim items
Dim firstrow,lastrow,numrows,rowcounter,allitems
Dim objRs

SET objRs = Server.CreateObject("ADODB.Recordset")

 'sql quesry updated by Saubhik
 strQuery = "select distinct ItemType from QW_category "

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
For rowcounter = firstrow to lastrow
allitems = Trim(items(0,rowcounter))
'If items(1,rowcounter) <> "" Then
'allitems = Trim(items(0,rowcounter))&", "&Trim(items(1,rowcounter))
'Else
'allitems = Trim(items(0,rowcounter))
'End If
response.write(allitems & "<br>")

Next
End If
    

ConnObj.Close
%>
