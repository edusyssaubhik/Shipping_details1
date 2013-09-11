
<%@ Language = "VBScript" %>

<!-- #include virtual = "./includes/connection.asp"-->
<%



 Dim rqUsername,Rs
 Dim rqPassword
 Dim strQuery
 
Set Rs = Server.CreateObject("ADODB.Recordset")

    city=request.QueryString("city")

  strQuery = "select * from proj_locations where location='"& city &"'"
'response.write(strQuery)
  Rs.Open strQuery,ConnObj
  dim c 
 while not Rs.EOF
   c=c & Rs(3) &"~"
    Rs.MoveNext
wend
response.write(c)
Rs.Close
ConnObj.Close
%>

