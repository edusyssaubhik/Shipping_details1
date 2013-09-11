
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->

<%

rqChange = Request.Querystring("Submit")






''''''''''''''from company.js page''''''''''''''
	rqSoldCompanyname=Request.QueryString("soldcompanyname")  
	rqSoldAddress=  Request.QueryString("soldcompanyaddress_1")
	rqSoldname=Request.QueryString("soldcontactname_1")
	rqSoldemail =  Request.QueryString("soldcontactemail_1")
	rqSoldphone =   Request.QueryString("soldcontactphone_1")
	rqSoldfax =   Request.QueryString("soldfaxno_1")
	rqshipCompId = Request.QueryString("soldCompId")
    	
	
	Session("SoldAddress") = (rqSoldCompanyname &"<br/>"& rqSoldAddress &"<br/>"& rqSoldphone)
	
	session("shipCompId")=rqshipCompId
	'response.Write(Session("SoldAddress"))
	'response.Write(session("shipCompId"))
	rqshipCompanyname=Request.QueryString("shipcompanyname")  
	rqShipAddress=  Request.QueryString("selectshipaddress_1")
	rqShipname=Request.QueryString("selectcontactname_1")
	rqShipemail =  Request.QueryString("contactemail_1")
	rqshipphone =   Request.QueryString("selectcontactphone_1")
	rqshipfax =   Request.QueryString("selectfax_1")
	
	Session("ShipAddress") = (rqshipCompanyname &"<br/>"& rqShipAddress &"<br/>"& rqshipphone)
	
	
	'response.Write(Session("ShipAddress"))
	
	rqbillCompanyname=Request.QueryString("billcompanyname")  
	rqbillAddress=  Request.QueryString("billselectcompanyaddress_1")
	rqbillname=Request.QueryString("billselectcontactname_1")
	rqbillemail =  Request.QueryString("billcontactemail_1")
	rqbillphone =   Request.QueryString("billselectcontactphone_1")
	rqbillphone =   Request.QueryString("billselectcontactphone_1")
	rqbillfax =   Request.QueryString("billselectfax_1")
	
	Session("billAddress") = (rqbillCompanyname &"<br/>"& rqbillAddress &"<br/>"& rqbillphone)
	
	'response.Write(Session("billAddress") )
	
	If rqChange = "Submit" Then
	'response.Write("hii")
    str = "<div name=""soldaddressdisp"" id=""soldaddressdisp"" class=""quote-box"">"&( rqSoldCompanyname & "<br/>"& rqSoldAddress &"<br/>"& rqSoldname &"<br/>"&  rqSoldemail &"<br/>"& rqSoldphone &"<br/>"& rqSoldfax)&"</div>"
	
	ElseIf rqChange = "Ship" Then
	
	str = "<div name=""shipaddaddressdisp"" id=""shipaddaddressdisp"" class=""quote-box"">"&( rqshipCompanyname &"<br/>"& rqShipAddress &"<br/>"& rqShipname &"<br/>"&  rqShipemail &"<br/>"& rqshipphone &"<br/>"& rqshipfax)&"</div>"
	
	ElseIf rqChange = "Bill" Then
	 
	  str = "<div name=""billaddaddressdisp"" id=""billaddaddressdisp"" class=""quote-box"">"&( rqbillCompanyname &"<br/>"& rqbillAddress &"<br/>"& rqbillname &"<br/>"&  rqbillemail &"<br/>"& rqbillphone &"<br/>"& rqbillfax)&"</div>"
	  
	  End If
	
	response.Write(str)
	
	
	
%>



