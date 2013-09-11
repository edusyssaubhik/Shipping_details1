<!--#include virtual="/QuoteWerks/includes/connection.asp"-->

<% dim from_mail,fname,lname,email,mode,payment,transaction,po,tomail,toname,currency1
    id=request.QueryString("id")
      from_mail = request.QueryString("from_mail")
      name = request.QueryString("name")
        lname = request.QueryString("lname")
       email = request.QueryString("email")
      payment = request.QueryString("payment")
       mode = request.QueryString("mode")
       transaction = request.QueryString("transaction")
         po = request.QueryString("po")
    tomail=request.QueryString("tomail")
    currency1=request.QueryString("currency")
    toname=request.QueryString("toname")
    dated=request.QueryString("dated")
               if currency1="pound" then 
                currency1 = "&#163;"
    end if

       strBody = strBody &"<img src=""http://projstudy.com/QuoteWerks/images/logo.jpg"" /><br><br>Dear "&toname&",<br>"
      strBody = strBody & "     We acknowledge with thanks receipt of "&currency1 &" "& payment &" currency through "&mode &" and transaction ID "& transaction &""
     strBody = strBody &" transaction dated "& dated &" " 
     strBody = strBody &"towards the Purchase Order with PO Number "&po&"<br />"
     strBody = strBody &"Thanks and Regards,<br />"
     strBody = strBody &name & "<br>" 
     strBody = strBody &"Datrix Training"
     response.Write(strBody)      
 'updating query with status omplete'
   strEmpDet= "UPDATE QW_QuoteOverview  SET "
		  strEmpDet= strEmpDet& "tran_date = '"& dated &"',"
		   strEmpDet= strEmpDet& "PONumber = '"&po&"',"
           strEmpDet= strEmpDet& "payment = '"&payment&"',"
           strEmpDet= strEmpDet& "payment_mode = '"&mode&"',"
           strEmpDet= strEmpDet& "transactionId = '"&transaction&"'"
         
		  strEmpDet= strEmpDet& " WHERE quoteId = '"& id &"'"
					
ConnObj.Execute strEmpDet

     'update in sql

Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
objCDOMail.From = from_mail
objCDOMail.To =  ""&email&""

objCDOMail.cc = "edusyssaubhik@gmail.com,edusyssidhardha@gmail.com,edusyssavita@gmail.com,edusysayan@gmail.com"

objCDOMail.Importance = 2
objCDOMail.Subject = "Payment Received"
objCDOMail.BodyFormat = 0
objCDOMail.MailFormat = 0
objCDOMail.Body =  strBody
objCDOMail.Send
Set objCDOMail = Nothing
 Session("Message") = "Email Sent Successfully"
response.Redirect("generateReport.asp?action=Payment Received")        
     %>    
