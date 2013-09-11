<%

dim sold_cname,sold_add,sold_name1
dim ship_cname,ship_add,ship_name1
dim bill_cname,bill_add,bill_name1
sold_cname=request.Form("sold_cname")
sold_add=request.Form("sold_add")
sold_name1=request.Form("sold_name1")
ship_cname=request.Form("ship_cname")
ship_add=request.Form("ship_add")
ship_name1=request.Form("ship_name1")
bill_cname=request.Form("bill_cname")
bill_add=request.Form("bill_add")
bill_name1=request.Form("bill_name1")
ph1=request.Form("ph")
ph2=request.Form("ph1")
ph3=request.Form("ph2")
email1=request.Form("email")
email2=request.Form("email1")
email3=request.Form("email2")


response.Write(sold_cname  &"<br>"&sold_add &"<br>" &sold_name1 &"<br>" & ship_cname &"<br>" & ship_add &"<br>" & ship_name1 &"<br>" & bill_cname &"<br>" & bill_add &"<br>" & bill_name1 &"<br>" & ph1&"<br>" & ph2 &"<br>" & ph3&"<br>" & email1&"<br>" & email2&"<br>" & email3)
'Company add

Session("sold_cname") = sold_cname
Session("sold_add") = 	sold_add
Session("sold_name1") = ship_name1
Session("email1")=email1
Session("ph1")=ph1
'ship address

Session("ship_cname") = ship_cname
Session("ship_add") = 	ship_add
Session("ship_name1") = ship_name1
Session("email2")=email2
Session("ph2")=ph2

'bill sessiom

Session("bill_cname") = sold_cname
Session("bill_add") = 	sold_add
Session("bill_name1") = ship_name1
Session("email3")=email3
Session("ph3")=ph3


'update query of Courseoverview and CourseDetails 

'response.Redirect("ShippingAddress.asp")

%>