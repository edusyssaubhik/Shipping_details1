<!--#include virtual="./includes/connection.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Update Price</title>
</head>

<body>
</body>

<% 


'getting Value From updatePeice-uk.asp Page
Dim courseName,Country,city,fromDate,toDate,withTax,withoutTax,ebd,ebdWith,ebdWithout

courseNumber = Trim(Request.Form("courseName"))
Country =Trim(Request.Form("Country"))
city = Trim(Request.Form("city"))
fromDate = Trim(Request.Form("fromDate"))
toDate = Trim(Request.Form("toDate"))
withoutTax = Trim(Request.Form("priceWithOutTax"))
tax = Trim(Request.Form("tax"))
withTax = Trim(Request.Form("priceWithTax"))
ebd = Trim(Request.Form("earlybirddicount"))
ebdWithout = Trim(Request.Form("afterearlybirddiscountwithouttax"))
ebdWith = Trim(Request.Form("afterearlybirddiscountwithtax"))
applicabledays =  Trim(Request.Form("applicabledays"))

rqBrand = Trim(Request.Form("brand"))
'response.Write(rqBrand)

'End Of getting Value From updatePeice-uk.asp Page

'Declaring'
Dim strQuery,rsUpdate,Rs,rqCerName

'Recordset'
Set rsUpdate = server.CreateObject("ADODB.recordset")
Set Rs = server.CreateObject("ADODB.recordset")

				'Query For Getting certificateid'	
				  DIm strCertName
					strCertName = "SELECT * FROM Certification where CertName = '"&rqBrand&"' and  Ven_ID = '"&Session("vendor")&"'  ORDER BY Cer_ID ASC"
					Rs.Open strCertName, ConnObj
						
						 do until Rs.EOF
						 
						 rqCer_ID = Rs("Cer_ID")
 
					   Rs.Movenext
					   Loop
					   Rs.close()



IF  rqBrand = "PRINCE2" then

If courseNumber = "1" Then
	courseName = "Foundation and Practitioner"
ElseIf courseNumber = "2" Then
	courseName = "Foundation"
ElseIf courseNumber = "3" Then
	courseName = "Practitioner"
End If


'Getting values for foundation
	
				'	 strGetQuery = "SELECT course.*, city.state_code, course.startdate, course.enddate FROM course course, city city Where city.city='"& city &"' And course.city = city.city And  course.country = '"& Country &"' AND city.country = '"& Country &"' And courseName= '"& courseName &"' and  course.status <> 'Cancelled' and startdate >='"& fromDate &"' And startdate <='"& toDate &"'  ORDER BY month(course.startdate) ,course.city DESC"
'		
			 

If city <> ""  Then
		
			strQuery = "UPDATE course SET pricewithouttax = '"& withoutTax &"', tax= '"& tax &"', pricewithtax = '"& withTax &"', applicabledays= '"& applicabledays &"', earlybirddiscount = '"& ebd &"' , afterEBdiscountwithouttax = '"& ebdWithout &"', afterEBdiscountwithtax = '"& ebdWith &"' WHERE city = '"& city &"' and startdate >='"& fromDate &"' and startdate <='"& toDate &"' and country = '"& Country &"'  And courseName= '"& courseName &"' And status <> 'Cancelled' AND certificateId = '"& rqCer_ID &"'  and vendorId = '"&Session("vendor")&"'"
						
	'response.write strQuery
			rsUpdate.Open strQuery,connObj
			
ElseIF city = "" Then

			strQuery = "UPDATE course SET pricewithouttax = '"& withoutTax &"', tax= '"& tax &"', pricewithtax = '"& withTax &"', applicabledays= '"& applicabledays &"', earlybirddiscount = '"& ebd &"' , afterEBdiscountwithouttax = '"& ebdWithout &"', afterEBdiscountwithtax = '"& ebdWith &"' WHERE startdate >='"& fromDate &"' and startdate <='"& toDate &"' and country = '"& Country &"'  And courseName= '"& courseName &"' And status <> 'Cancelled' AND certificateId = '"& rqCer_ID &"' and vendorId = '"&Session("vendor")&"'"
						
	'response.write strQuery
			rsUpdate.Open strQuery,connObj


End If
			
%>
Inserted: From <%= fromDate %> To <%= toDate %>For <%= courseName%> <BR>


		
<% ELseIF  rqBrand = "ITIL" and  Session("vendor") = 2 then


If city <> ""  Then
		
			strQuery = "UPDATE course SET pricewithouttax = '"& withoutTax &"', tax= '"& tax &"', pricewithtax = '"& withTax &"', applicabledays= '"& applicabledays &"', earlybirddiscount = '"& ebd &"' , afterEBdiscountwithouttax = '"& ebdWithout &"', afterEBdiscountwithtax = '"& ebdWith &"' WHERE city = '"& city &"' and startdate >='"& fromDate &"' and startdate <='"& toDate &"' and country = '"& Country &"'  And courseName= '"& courseName &"' And status <> 'Cancelled' AND certificateId = '"& rqCer_ID &"' and vendorId = '"&Session("vendor")&"'"
						
	'response.write strQuery
			rsUpdate.Open strQuery,connObj
			
ElseIF city = "" Then

			strQuery = "UPDATE course SET pricewithouttax = '"& withoutTax &"', tax= '"& tax &"', pricewithtax = '"& withTax &"', applicabledays= '"& applicabledays &"', earlybirddiscount = '"& ebd &"' , afterEBdiscountwithouttax = '"& ebdWithout &"', afterEBdiscountwithtax = '"& ebdWith &"' WHERE startdate >='"& fromDate &"' and startdate <='"& toDate &"' and country = '"& Country &"'  And courseName= '"& courseName &"' And status <> 'Cancelled' AND certificateId = '"& rqCer_ID &"' and vendorId = '"&Session("vendor")&"'"
						
	'response.write strQuery
			rsUpdate.Open strQuery,connObj
	End iF		

 ELseIF  rqBrand = "ITIL" and  Session("vendor") = 1 then


If city <> ""  Then
		
			strQuery = "UPDATE PROJITIL_course SET pricewithouttax = '"& withoutTax &"', tax= '"& tax &"', pricewithtax = '"& withTax &"', applicabledays= '"& applicabledays &"', earlybirddiscount = '"& ebd &"' , afterEBdiscountwithouttax = '"& ebdWithout &"', afterEBdiscountwithtax = '"& ebdWith &"' WHERE city = '"& city &"' and startdate >='"& fromDate &"' and startdate <='"& toDate &"' and country = 'United Kingdom'  And status <> 'Cancelled' AND certificateId = '"& rqCer_ID &"' and vendorId = '"&Session("vendor")&"'"
						
	'response.write strQuery
			rsUpdate.Open strQuery,connObj
			
ElseIF city = "" Then

			strQuery = "UPDATE PROJITIL_course SET pricewithouttax = '"& withoutTax &"', tax= '"& tax &"', pricewithtax = '"& withTax &"', applicabledays= '"& applicabledays &"', earlybirddiscount = '"& ebd &"' , afterEBdiscountwithouttax = '"& ebdWithout &"', afterEBdiscountwithtax = '"& ebdWith &"' WHERE startdate >='"& fromDate &"' and startdate <='"& toDate &"' and country = 'United Kingdom'  And status <> 'Cancelled' AND certificateId = '"& rqCer_ID &"' and vendorId = '"&Session("vendor")&"'"
						
	'response.write strQuery
			rsUpdate.Open strQuery,connObj

End If

 ELseIF  rqBrand = "AGILE" then


If city <> ""  Then
		
			strQuery = "UPDATE PROJITIL_course SET pricewithouttax = '"& withoutTax &"', tax= '"& tax &"', pricewithtax = '"& withTax &"', applicabledays= '"& applicabledays &"', earlybirddiscount = '"& ebd &"' , afterEBdiscountwithouttax = '"& ebdWithout &"', afterEBdiscountwithtax = '"& ebdWith &"' WHERE city = '"& city &"' and startdate >='"& fromDate &"' and startdate <='"& toDate &"' and country = 'United Kingdom'  And status <> 'Cancelled' AND certificateId = '"& rqCer_ID &"' and vendorId = '"&Session("vendor")&"'"
					
	'response.write strQuery
			rsUpdate.Open strQuery,connObj
			
ElseIF city = "" Then

			strQuery = "UPDATE PROJITIL_course SET pricewithouttax = '"& withoutTax &"', tax= '"& tax &"', pricewithtax = '"& withTax &"', applicabledays= '"& applicabledays &"', earlybirddiscount = '"& ebd &"' , afterEBdiscountwithouttax = '"& ebdWithout &"', afterEBdiscountwithtax = '"& ebdWith &"' WHERE startdate >='"& fromDate &"' and startdate <='"& toDate &"' and country = 'United Kingdom'  And status <> 'Cancelled' AND certificateId = '"& rqCer_ID &"' and vendorId = '"&Session("vendor")&"'"
						
	'response.write strQuery
			rsUpdate.Open strQuery,connObj

End If

 ELseIF  rqBrand = "MSP" then


If city <> ""  Then
		
			strQuery = "UPDATE PROJITIL_course SET pricewithouttax = '"& withoutTax &"', tax= '"& tax &"', pricewithtax = '"& withTax &"', applicabledays= '"& applicabledays &"', earlybirddiscount = '"& ebd &"' , afterEBdiscountwithouttax = '"& ebdWithout &"', afterEBdiscountwithtax = '"& ebdWith &"' WHERE city = '"& city &"' and startdate >='"& fromDate &"' and startdate <='"& toDate &"' and country = 'United Kingdom'  And status <> 'Cancelled' AND certificateId = '"& rqCer_ID &"' and vendorId = '"&Session("vendor")&"'"
						
	'response.write strQuery
			rsUpdate.Open strQuery,connObj
			
ElseIF city = "" Then

			strQuery = "UPDATE PROJITIL_course SET pricewithouttax = '"& withoutTax &"', tax= '"& tax &"', pricewithtax = '"& withTax &"', applicabledays= '"& applicabledays &"', earlybirddiscount = '"& ebd &"' , afterEBdiscountwithouttax = '"& ebdWithout &"', afterEBdiscountwithtax = '"& ebdWith &"' WHERE startdate >='"& fromDate &"' and startdate <='"& toDate &"' and country = 'United Kingdom'  And status <> 'Cancelled' AND certificateId = '"& rqCer_ID &"' and vendorId = '"&Session("vendor")&"'"
						
	'response.write strQuery
			rsUpdate.Open strQuery,connObj


End If
			
%>
Inserted: From <%= fromDate %> To <%= toDate %> <BR>


<%	
End If
%>
</html>
