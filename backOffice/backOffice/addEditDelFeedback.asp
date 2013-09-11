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
Dim rqType,rqDelId,rqName,rqEmailId,rqDateOfPassing,rqFeedback
Dim strDel,strAdd,strEdit,Dop 

'Retriving values'
rqType=request.Form("type")
rqAction=request.QueryString("action")

'Retriving ID(for delete)'
rqDelId=request.QueryString("id")

'Retriving ID(for Edit)'
rqEditId=request.Form("id")

'Retriving all values'
rqName=request.form("name")
rqEmailId=request.form("emailid")
rqDateOfPassing=request.form("dateofpassing")
rqFeedback=request.form("feedback")

'Inserting'
If rqType="submit" then

'Formatting Date'
Dop = (YEAR(rqDateOfPassing) & "-" & (Month(rqDateOfPassing)) & "-" & (DAY(rqDateOfPassing)))

'Teatarea '
Feedback = Replace(rqFeedback,"'","''")

strAdd="INSERT into Feedback(custname,emailid,feedback,addeddate) values "
 strAdd=strAdd &"('" &rqName& "',"
 strAdd=strAdd &"'" &rqEmailId& "',"
 strAdd=strAdd &"'" &Feedback& "',"
 strAdd=strAdd &"'" &Dop& "')"
 
 
'response.Write(strAdd)
connObj.execute strAdd
response.Redirect("feedback.asp")

'Editing'
ElseIf rqType="update" then

'Formatting Date'
Dop = (YEAR(rqDateOfPassing) & "-" & (Month(rqDateOfPassing)) & "-" & (DAY(rqDateOfPassing)))

'Teatarea '
Feedback = Replace(rqFeedback,"'","''")

strEdit="UPDATE Feedback SET"
strEdit=strEdit& " custname= '" &rqName& " ',"
strEdit=strEdit& " emailid= '" &rqEmailId& " ',"
strEdit=strEdit& " feedback= '" &Feedback& " ',"
strEdit=strEdit& " addeddate= '" &Dop& " '"

strEdit=strEdit& " WHERE feedbackid= '" &rqEditId& "'"
'response.Write(strEdit)
connObj.execute strEdit
response.Redirect("feedback.asp")



'Deleting Recoed'
ElseIf rqAction="deleteFeedback" then
strDel="DELETE from Feedback where id= '"& rqDelId & "' "

'response.Write(strDel)
connObj.execute strDel
response.Redirect("feedback.asp")

End IF

%>
</body>
</html>
<% 

 Else
 Response.Redirect("../login.asp")
 End If
 
%>