<%@ Language = "VBScript" %>

<!-- #include virtual = "./includes/connection.asp"-->
<%



 Dim rqUsername,Rs
 Dim rqPassword
 Dim strQuery
if   request.Form("id")<>"" then
rqvalue=request.Form("id")
     
    rqbutton=request.Form("update")
    response.Write(rqvalue)
    response.Write(rqbutton)

  '  Arrmode=split(strmode,",")
   '  For i=LBound(Arrmode) to UBound(Arrmode)
    '    Response.Write(Arrmode(i) &" ")
     'Next 
   'Make Late Availibility

    'make lateavaiblity active
    if rqbutton="Make Late Availibility" and rqvalue<>"" then
  strQuery = "update datrixClasses set lateavailibility=1 where  courseid in ("&rqvalue&")"
    
  ConnObj.execute strQuery
    elseif rqbutton="Disable Late Availibility" and rqvalue<>"" then
    'make lateavaiblity inactive
    strQuery = "update datrixClasses set lateavailibility=2 where  courseid in ("&rqvalue&")"
    
  ConnObj.execute strQuery
  
    response.Write(strQuery)
 else
    response.write("Not updated")
  end if
    response.Write(strQuery)
  dim c 

      response.Redirect("search_report.asp?"&session("params"))
'Rs.Close()
ConnObj.Close
    end if
%>

