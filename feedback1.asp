<!--#include virtual="/includes/connection.asp"-->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
</head>
<body>
    <%
        dim name,email,feedback,strBody
      name=   request.Form("name")
      email=   request.Form("email")
      feedback=   request.Form("feedback")
       ' insert into feedback_db
     '   Set objRs = Server.CreateObject("ADODB.Recordset")
      
       ConnObj.Execute "INSERT INTO feedback_db VALUES('" & name & "','" & email & "','" & feedback & "', '"& Now() & "')"

'send the mail
         strBody=strBody&"Hi<br><br>Please find below the feedback from the MyITstudy CompTIA certification - N+ App<br><br><br>"
        strBody=strBody&"Name:"&name&"<br>"
        strBody=strBody&"Email:"&email&"<br>"
        strBody=strBody&"Feedback:"&feedback&"<br>"

Set objCDOMail = Server.CreateObject("CDONTS.NewMail")

objCDOMail.From = "tech@edusysglobal.com"
objCDOMail.To =  "studyitil@myitstudy.com"
 'myMail.BCC = "edusysshruthi@gmail.com,edusyssaubhik@gmail.com"
objCDOMail.cc="edusysshruthi@gmail.com,edusyssaubhik@gmail.com"
objCDOMail.Importance = 2
objCDOMail.Subject = "Feedback from CompTIA certification - N+ App"
objCDOMail.BodyFormat = 0
objCDOMail.MailFormat = 0
objCDOMail.Body =  strBody
objCDOMail.Send
Set objCDOMail = Nothing




Session("Message") = "Email Sent Successfully"


         %>
</body>
</html>
