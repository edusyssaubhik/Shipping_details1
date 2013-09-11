<%@ Language = "VBScript" %>

<!-- #include virtual = "./includes/connection.asp"-->
<%



 Dim rqUsername,Rs
 Dim rqPassword
 Dim strQuery
 
Set Rs = Server.CreateObject("ADODB.Recordset")



  strQuery = "SELECT distinct city FROM datrixClasses"

  Rs.Open strQuery,ConnObj
  dim c 
 while not Rs.EOF
   c=c & Rs(0)&"<br>"
    Rs.MoveNext
wend
response.write(c)
Rs.Close
ConnObj.Close
%>

