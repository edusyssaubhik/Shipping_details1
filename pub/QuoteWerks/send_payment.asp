<!--#include virtual="/QuoteWerks/includes/connection.asp"-->
<%
    dim payment,mode,transaction,po
    
     %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
     <script type="text/javascript">
         function send_mail_payment()
         {

             var from_mail = document.getElementById("from_mail").value;
             var fname = document.getElementById("fname").value;
             var lname = document.getElementById("lname").value;
             var email = document.getElementById("email").value;

             var payment = document.getElementById('payment').value;
             var mode = document.getElementById('mode').value;
             var transaction = document.getElementById('transaction').value;
             var po = document.getElementById('po').value;
             window.location = "send_payment_mail.asp?from_mail=" + from_mail + "&name=" + fname + " " + lname + "&email=" + email + "&payment=" + payment + "&mode=" + mode + "&transaction="+transaction+"&po="+po;
         }

         function show_preview()
         {
         document.getElementById("show_preview").style.display="block"
         document.getElementById("payment_s").innerHTML=  document.getElementById('payment').value;
         document.getElementById("mode_s").innerHTML = document.getElementById('mode').value;
         document.getElementById("transaction_s").innerHTML = document.getElementById('transaction').value;
         document.getElementById("po_s").innerHTML = document.getElementById('po').value;

         }
     </script>
    <title></title>
</head>
<body>
    
  <div id="quote-header" >
    <center>
              <%
        dim rqId,rqPo
If Request.Form("id") <> "" Then
	rqId = Request.Form("id")
ElseIf Request.QueryString("id") <> "" Then
	rqId = Request.QueryString("id")
End If
If Request.Form("pono") <> "" Then
	rqPo = Request.Form("pono")
ElseIf Request.QueryString("pono") <> "" Then
	rqPo = Request.QueryString("pono")
End If
         %>

     <input type="hidden" name="qid" value="<%=rqId %>" /><br />
    Payment <input type="text" name="payment" id="payment"  /><br />
    Currency Mode<input type="text" name="mode" id="mode" /><br />
    transaction ID<input type="text" name="transaction" id="transaction" /><br />
    PO Number  <input type="text" name="po" id="po" value="<%=rqPo %>" /><br />

    <input type="submit" value="Preview" onclick="show_preview()" />
        </center>
        </div>
    <br />
    <div id="show_preview" style="display:none">


       <div>
           <%
               'to fetch email id of user
               dim fname,lname,stremail,email,sold_add
               SET objRs1 = Server.CreateObject("ADODB.Recordset")
               stremail = "select  a.firstname f,a.lastname l,a.officialemailid e,b.soldtoAddress s from QW_users a,QW_QuoteOverview b where b.quoteId='"& rqId &"' and a.userid=b.userId"
                objRs1.Open stremail, ConnObj
 
          If Not objRs1.EOF Then
	            fname=objRs1("f")
                lname=objRs1("l")
                email=objRs1("e")
                sold_add=objRs1("s")
          End If
               if sold_add="" then
               email=""
               else 
              ' Akme Limited!Ayan Ghosh!147, St Palms Street, New York, USA!edusysayan@gmail.com!98987987!98987987
               email=split(sold_add,"!")
               end if
                %>
           <div>
   
 From: <%=email(1) %>,<%=fname %>&nbsp;<%=lname %><br />
 To: <%=email(3) %><br />
 cc: operations@datrixtraining.com<br />
 Subject: Payment Received<br />
 Dear <%=email(1) %>,

We acknowledge with thanks receipt of <label id="payment_s" ></label>&nbsp;currency through mode <label  id="mode_s"></label> and transaction Id<label  id="transaction_s"></label>
  with transaction dated <%=now() %> 
towards the Purchase Order with PO Number <label name="po_s" id="po_s"></label>
Thanks and Regards 
<%=fname %>&nbsp;<%=lname %>
Datrix Training
<br />
    <input type="hidden" name="from_mail"  id="from_mail" value="<%=email(1) %>" />
    <input type="hidden" name="fname" id="fname" value="<%=fname %>" />
    <input type="hidden" name="lname" id="lname" value="<%=lname %>" />
    <input type="hidden" name="email" id="email" value="<%=email(3) %>" />
    <input type="submit" value="Send_mail" onclick="send_mail_payment()" />    
       </div>
      
                </body>
</html>
