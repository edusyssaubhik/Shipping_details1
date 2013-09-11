<!--#include virtual="Quotewerks/includes/connection.asp"-->


<% 
'Declaring varaible
Dim strcourseId,strChapter,strNoofQues,objRs1,objRs,questionNo
Dim strStartDate

	strStartDate = Request.QueryString("startdate")
    if  session("duration")="same" then
	    rqEndDate = formatdatetime(strStartDate,1)
 '   response.Write(strStartDate)	
    Else
    duration=session("duration")
    rqEndDate = DateAdd("d",duration,formatdatetime(strStartDate,2))
    foramtEndDate  = formatdatetime(rqEndDate,1)
    rqEndDate = Split(foramtEndDate,",")
	
'    response.Write(foramtEndDate)
    End If
    response.Write(rqEndDate(2)&""&rqEndDate(1))
   'response.Write(session("duration"))



%>

