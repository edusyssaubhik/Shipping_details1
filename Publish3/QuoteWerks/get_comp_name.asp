
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->
<%
dim x,y
dim strContact
 x= request.QueryString("contact")
 y= request.QueryString("name")
SET rs = Server.CreateObject("ADODB.Recordset")

strContact = "SELECT  contName,contEmailId,contPhoneno,fax FROM QW_CompContactDet where compId = '"&x&"' and contName='"& y &"'"
'response.Write(strContact)
rs.open strContact,ConnObj
While Not rs.EOF

response.write(rs("contEmailId") & "," & rs("contPhoneno") & "," & rs("fax"))
response.write("<br>") 
 
rs.MoveNext
Wend
rs.close






%>

<!--#include virtual="/QuoteWerks/includes/connectionClose.asp"-->