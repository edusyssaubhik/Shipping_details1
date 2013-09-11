
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->



<% 
	If Session("QWUserName") = "" Then 
		Response.Redirect("default.asp")
	Else
	%>
<%

Dim rqType,rqCategory,rqCost ,rqTittleDescription,rqLongDescription ,rqManufacturerPartNumber ,rqsupplier
Dim rqAction,rqtypeofuser,rqVendorPartNumber,rqaddedBy ,rqaddedDate,rqPrice,rqList
Dim objRs,strEmpDet,rqDelGID, strQuery1 ,rqItemType,  rqManufacturer,rqDeleteuserId,rqID
Dim rqNotes,rqCustomNumber01,rqExtraMemo01,Rs1,ManufacturerPartNumber,upuser,upuser1,rqURL

dim sold_cname,sold_add,sold_name1,comp_id
dim ship_cname,ship_add,ship_name1
dim bill_cname,bill_add,bill_name1
    comp_id=request.Form("comp_id")
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
fax1=request.Form("fax")
fax2=request.Form("fax1")
fax3=request.Form("fax2")


'response.Write(sold_cname  &"<br>"&sold_add &"<br>" &sold_name1 &"<br>" & ship_cname &"<br>" & ship_add &"<br>" & ship_name1 &"<br>" & bill_cname &"<br>" & bill_add &"<br>" & bill_name1 &"<br>" & ph1&"<br>" & ph2 &"<br>" & ph3&"<br>" & email1&"<br>" & email2&"<br>" & email3)
'Company add'
'strEmpDet= strEmpDet& "soldtoAddress = '"& Session("SoldAddress") &"',"
'					strEmpDet= strEmpDet& "shiptoAddress = '"& session("ShipAddress") &"',"
'					strEmpDet= strEmpDet& "billtoAddress = '"& session("billAddress") &"',"



'update query of Courseoverview and CourseDetails 

'response.Redirect("ShippingAddress.asp")

	'Retrive the type of action'
    rqAction = Request.QueryString("action")
	rqType =  Request.form("type")
	
	'Retrive the values from this page'
session("CompId")=comp_id
Session("sold_cname") = sold_cname
Session("SoldAddress") = 	sold_add
Session("sold_name1") = sold_name1
Session("email1")=email1
Session("ph1")=ph1
Session("fax1")=fax1

'ship address

Session("ship_cname") = ship_cname
Session("ShipAddress") = 	ship_add
Session("ship_name1") = ship_name1
Session("email2")=email2
Session("ph2")=ph2
Session("fax2")=fax2
'bill sessiom

Session("bill_cname") = bill_cname
Session("billAddress") = 	bill_add
Session("bill_name1") = bill_name1
Session("email3")=email3
Session("ph3")=ph3
Session("fax3")=fax3
	
	
'	Session("SoldAddress")
'	session("shipCompId")
	'Session("ShipAddress")
	'Session("billAddress")	

	'Creating Record Objects'
	Set objRs = Server.CreateObject("ADODB.Recordset")
	Set  Rs1 = Server.CreateObject("ADODB.Recordset")
	'Response.write(rquserName)

'Session("sold_cname") = sold_cname
'Session("SoldAddress") = 	sold_add
'Session("sold_name1") = sold_name1
'Session("email1")=email1
'Session("ph1")=ph1
''ship address
'
'Session("ship_cname") = ship_cname
'Session("ShipAddress") = 	ship_add
'Session("ship_name1") = ship_name1
'Session("email2")=email2
'Session("ph2")=ph2

 
			
         'Response.write("c")
					strEmpDet= "UPDATE QW_QuoteOverview  SET "
					    'strEmpDet= strEmpDet& "sentDate = '"& now() &"',"
					strEmpDet= strEmpDet& "companyId = '"& session("CompId") &"',"
					strEmpDet= strEmpDet& "soldtoAddress = '"& Session("sold_cname") &"!"&Session("sold_name1")&"!"&Session("SoldAddress")&"!"&Session("email1")&"!"&Session("ph1")&"!"&Session("fax1")&"',"
					strEmpDet= strEmpDet& "shiptoAddress = '"& Session("ship_cname") &"!"&Session("ship_name1")&"!"&Session("ShipAddress")&"!"&Session("email2")&"!"&Session("ph2")&"!"&Session("fax2")&"',"
					strEmpDet= strEmpDet& "billtoAddress = '"& Session("bill_cname") &"!"&Session("bill_name1")&"!"&Session("billAddress")&"!"&Session("email3")&"!"&Session("ph3")&"!"&Session("fax3")&"',"
					strEmpDet= strEmpDet& "status = 'In Process',"
					strEmpDet= strEmpDet& "addedBy= '" & Session("QWUserName") & "',"
					strEmpDet= strEmpDet& "CertificationId= '1',"
					strEmpDet= strEmpDet& "VendorId= '2'"
					strEmpDet= strEmpDet& " WHERE quoteId = '"&Session("new_quoteid") &"'"
				  
				'response.write(strEmpDet)
					ConnObj.Execute strEmpDet
					
					strEmpDet= "UPDATE QW_QuoteDetails   SET "
					strEmpDet= strEmpDet& "status = 'In Process',"
					strEmpDet= strEmpDet& "addedBy= '" & Session("QWUserName") & "',"
					strEmpDet= strEmpDet& "CertificationId= '1',"
					strEmpDet= strEmpDet& "VendorId= '2'"
					strEmpDet= strEmpDet& " WHERE quoteId = '"& Session("new_quoteid")&"'"
				  
				'response.write(strEmpDet)
					ConnObj.Execute strEmpDet
					dim x1
       x1= split(Session("fax2"),"!")
       Session("fax2")=x1(0)
					 'Session("message") = "You Have Successfully Edit User" 
					Response.Redirect("/QuoteWerks/edit_generateQuote.asp")
		
				 
				'Deleteing the records from the table'


%>
<% End If %>
<!--#include virtual="/QuoteWerks/includes/connectionClose.asp"-->
