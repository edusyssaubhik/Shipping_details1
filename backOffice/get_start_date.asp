<%@ Language = "VBScript" %>

<!-- #include virtual = "./includes/connection.asp"-->
<%



 Dim rqUsername,Rs
 Dim rqPassword
 Dim strQuery
 
Set Rs = Server.CreateObject("ADODB.Recordset")



  strQuery = "SELECT distinct startdate FROM datrixClasses order by startdate asc"

  Rs.Open strQuery,ConnObj
  dim c 
 while not Rs.EOF
   c=c & Rs(0)&","&Day(Rs(0)) & "/" & Month(Rs(0)) & "/" & Year(Rs(0)) &"<br>"
    Rs.MoveNext
wend
response.write(c)
Rs.Close
ConnObj.Close
%>

