<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<body>
<% If not  Session("UserId") = "" Then %>
<!--#include virtual="/includes/connection.asp"-->
<%

'======================================================='
'Written By : Priyanka'
'Written Date : 13/05/2010'
'Last UpDated : 13/05/2010'
'Description :'
'This page is for Feedback '
'======================================================='

'Declaring variables'
Dim rqType,rqDelId,rqName,rqCompany,rqDateOfPassing,rqFeedback
Dim strDel,strAdd,strEdit,Dop,rqName1

'Retriving values'
If request.Form("type") <> "" Then
rqType=request.Form("type")
Else
rqType=request.QueryString("type")
End If
'response.Write(request.Form("type"))
'response.Write(request.QueryString("type"))

rqAction=request.QueryString("action")

'Retriving ID(for delete)'
rqDelId=request.QueryString("id")

'Retriving ID(for Edit)'
rqEditId=request.Form("id")

'Retriving all values'
rqName=request.form("name")
rqName1 = Replace(rqName,"'","''")

rqCompany=request.form("company")
rqDateOfPassing=request.form("dateofpassing")
rqFeedback=request.form("feedback")
rqFeedbackType = request.form("FeedbackType")

'Inserting'
If rqType="Submit" then

'Formatting Date'
Dop = (YEAR(rqDateOfPassing) & "-" & (Month(rqDateOfPassing)) & "-" & (DAY(rqDateOfPassing)))

'Teatarea '
Feedback = Replace(rqFeedback,"'","''")

strAdd="INSERT into classroom_feedback(fname,company,dateofpassing,feedback,feedbackType,country) values "
 strAdd=strAdd &"('" &rqName1& "',"
 strAdd=strAdd &"'" &rqCompany& "',"
 strAdd=strAdd &"'" &Dop& "',"
 strAdd=strAdd &"'" &Feedback& "',"
 strAdd=strAdd &"'" &rqFeedbackType& "',"
  strAdd=strAdd &"'" &Session("country")& "')"
 
 
response.Write(strAdd)
connObj.execute strAdd
response.Redirect("classroom_feedback.asp")

'Editing'
ElseIf rqType="Update" then

'Formatting Date'
Dop = (YEAR(rqDateOfPassing) & "-" & (Month(rqDateOfPassing)) & "-" & (DAY(rqDateOfPassing)))

'Teatarea '
Feedback = Replace(rqFeedback,"'","''")

strEdit="UPDATE classroom_feedback SET"
strEdit=strEdit& " fname= '" &rqName1& " ',"
strEdit=strEdit& " company= '" &rqCompany& " ',"
strEdit=strEdit& " dateofpassing= '" &Dop& " ',"
 strEdit=strEdit& " feedbackType= '" &rqfeedbackType& " ',"
strEdit=strEdit& " feedback= '" &Feedback& " '"

strEdit=strEdit& " WHERE id= '" &rqEditId& "'  And country = '"&Session("country")&"'"
'response.Write(strEdit)
connObj.execute strEdit
response.Redirect("classroom_feedback.asp")



'Deleting Recoed'
ElseIf rqAction="deleteFeedback" then
strDel="DELETE from classroom_feedback where id= '"& rqDelId & "'  And country = '"&Session("country")&"' "

'response.Write(strDel)
connObj.execute strDel
response.Redirect("classroom_feedback.asp")

End IF

%>
</body>
</html>
<% 

 Else
 Response.Redirect("../backOffice/login.asp")
 End If
 
%>