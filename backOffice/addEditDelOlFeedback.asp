<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<% If not  Session("UserId") = "" Then %>
<!-- #include virtual = "/includes/connection.asp"-->

<html xmlns="http://www.w3.org/1999/xhtml">

<body>
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
rqFeedback=request.form("feedback")

'Inserting'
If rqType="Submit" then

'Formatting Date'
Dop = (YEAR(now()) & "-" & (Month(now())) & "-" & (DAY(now())))

'Teatarea '
Feedback = Replace(rqFeedback,"'","''")

strAdd="INSERT into online_feedback(fname,feedback,dateofadding,country) values "
 strAdd=strAdd &"('" &rqName& "',"

 strAdd=strAdd &"'" &Feedback& "',"
 strAdd=strAdd &"'" &Dop& "',"
 strAdd=strAdd &"'" &Session("country")& "')"
 
 
'response.Write(strAdd)
connObj.execute strAdd
response.Redirect("online_feedback.asp")

'Editing'
ElseIf rqType="Update" then

'Formatting Date'
Dop = (YEAR(now()) & "-" & (Month(now())) & "-" & (DAY(now())))

'Teatarea '
Feedback = Replace(rqFeedback,"'","''")

strEdit="UPDATE online_feedback SET"
strEdit=strEdit& " fname= '" &rqName& " ',"

strEdit=strEdit& " feedback= '" &Feedback& " '"

strEdit=strEdit& " WHERE id= '" &rqEditId& "' And country = '"&Session("country")&"'"
'response.Write(strEdit)
connObj.execute strEdit
response.Redirect("online_feedback.asp")



'Deleting Recoed'
ElseIf rqAction="deleteFeedback" then
strDel="DELETE from online_feedback where id= '"& rqDelId & "' And country = '"&Session("country")&"' "

'response.Write(strDel)
connObj.execute strDel
response.Redirect("online_feedback.asp")

End IF

%>
</body>
</html>
 <% 
 Else
 Response.Redirect("../backOffice/login.asp")
 End If	
%>