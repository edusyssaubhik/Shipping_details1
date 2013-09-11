<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% OPTION EXPLICIT %>
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->

<% 
	If Session("QWUserName") = "" Then 
		Response.Redirect("default.asp")
	Else
	%>
<%
	

'======================================================='
'Written By : savita'
'Written Date : 29/03/2013'
'Description :'
'This page is for country Details '
'======================================================='

Dim rqType,rqDeleteId,rqCountry ,rqCurrency,rqTax ,rqcountryId
Dim rqAction
Dim objRs,strCountDet,rqDelGID, strQuery1 ,Rs1,upuser,  upuser1

	'Retrive the type of action'
    rqAction = Request.QueryString("action")
	rqType =  Request.form("type")
	
	'Retrive the values from this page'
	
	  rqDeleteId = Request.QueryString("id")
	  rqCountry = Request.Form("country")
	  rqCurrency = Request.Form("currency")
	  rqTax = Request.Form("tax")
	  rqcountryId = Request.Form("countryId")		   

	'Creating Record Objects'
	Set objRs = Server.CreateObject("ADODB.Recordset")
	Set  Rs1 = Server.CreateObject("ADODB.Recordset")
	'Response.write(rquserName)
 If rqType = "Add Country Details" then 
 'To check whether the country is already added   
 strQuery1 = "SELECT country FROM QW_CountryDetail where country = '" & rqCountry & "'"
   
      Rs1.Open StrQuery1,ConnObj
	  
	  'Response.Write(strQuery1)

      If (Not Rs1.BOF) and (Not Rs1.EOF) Then
	  'response.write("A")
       upuser=Ucase( rqCountry )
        upuser1=Ucase(Rs1("country"))
         If  upuser =  upuser1 Then 
        'If rquserName = Rs1("userName") Then
	 		
			Session("message") = "This Country Name Already Exists"
			Response.Redirect("/QuoteWerks/country.asp")
		
       	End If 
     Else
   
    strCountDet = "INSERT INTO QW_CountryDetail(country,currency,tax) values " 
		strCountDet= strCountDet& "('" & rqCountry& "',"
		strCountDet= strCountDet& "'" & rqCurrency & "',"
		strCountDet= strCountDet& "'" & rqTax & "')"
		
		'Response.Write(strCountDet)
    	objRs.open strCountDet,ConnObj
	 	 Session("message") = "You Have Successfully Added Country" 
			Response.Redirect("/QuoteWerks/country.asp")
	
	End If
	
'Updating values into the database'	
 ElseIf rqType = "Edit Country Details" then
 
		strCountDet= "UPDATE QW_CountryDetail  SET "
		strCountDet= strCountDet& "country = '"& rqCountry &"',"
		strCountDet= strCountDet& "currency = '"& rqCurrency &"',"
		strCountDet= strCountDet& "tax = '"& rqTax &"'"
		strCountDet= strCountDet& " WHERE countryId = '"& rqcountryId &"'"
				  
				'response.write(strCountDet)
					ConnObj.Execute strCountDet
					 Session("message") = "You Have Successfully Edit Country" 
					Response.Redirect("/QuoteWerks/country.asp")
		
				 
'Deleteing the records from the table'
ElseIf rqAction ="deleteCountry" then	
				 
				   ConnObj.Execute("DELETE  from QW_CountryDetail where countryId = '"& rqDeleteId &"'")
					Session("message") = "You Have Successfully Deleted Country" 
				   response.Redirect("/QuoteWerks/country.asp")
	
end If

%>
<% End If %>
<!--#include virtual="/QuoteWerks/includes/connectionClose.asp"-->
