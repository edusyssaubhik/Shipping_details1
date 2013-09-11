<%@ Language = "VBScript" %>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 23/09/2010'
'Description :'
' Add/Edit/Delete Course Page and Enrolledusers Page'
'======================================================='
%>
<% If not  Session("UserId") = "" Then %>
<!--#include file="../includes/connection.asp"-->
<%
'Declare The Local Variables'
Dim strAddCountryDetails
Dim strEditCountryDetails
Dim rsEditCountryDetails
Dim rqType
Dim rqCountry
Dim rqAddress
Dim rqPhoneNumber
Dim rqCurrencyFormat
Dim rqReschedule1
Dim rqReschedule2
Dim rqReschedule3
Dim rqCancellation1
Dim rqCancellation2
Dim rqCancellation3
Dim rqApplicableDays
Dim rqPayOption1
Dim rqPayOption2
Dim rqPmbok
Dim rqCheckOrDD_Payment
Dim rqBankTransfer_Payment
Dim rqFPPrice, rqFPEBDiscount, rqFPAfterEBDiscount, rqFPTax, rqFounPrice,rqFounEBDiscount,rqFounAfterEBDiscount,rqFounTax 
Dim rqPracPrice,rqPracEBDiscount,rqPracAfterEBDiscount,rqPracTax 

 Set rsCountryDetails = Server.CreateObject("ADODB.Recordset")
 Set Rs1 = Server.CreateObject("ADODB.Recordset")

'=============================================================================================='
'Retrive From countryDetails.asp Page User Clicks Add Country Details Or Edit Country Details'
'=============================================================================================='

rqType                 =  Request.Form("type")
rqCountry              =  Session("country")
rqPhoneNumber	       =  Request.Form("phonenumber")
rqOnlineCoursePhoneNo  =  Request.Form("onlinephnum")
rqClassCoursePhoneNo1  =  Request.Form("classphmum1")
rqClassCoursePhoneNo2  =  Request.Form("classphmum2")
rqCurrencyFormat       =  Request.Form("currencyformat")
rqReschedule1	       =  Request.Form("reschedule1")
rqReschedule2	       =  Request.Form("reschedule2")
rqReschedule3	       =  Request.Form("reschedule3")
rqCancellation1	       =  Request.Form("cancellation1")
rqCancellation2	       =  Request.Form("cancellation2")
rqCancellation3	       =  Request.Form("cancellation3")
rqApplicableDays	   =  Request.Form("applicabledays")
rqPmbok				   =  Request.Form("pmbok")
rqPayOption1           =  Request.Form("payopt1")
rqPayOption2           =  Request.Form("payopt2") 
rqPayments     	       =  Request.Form("payments")
'Foundation and Practitioner
rqFPPrice				   =  Request.Form("FPprice")
rqFPEBDiscount           =  Request.Form("FPEBDiscount")
rqFPAfterEBDiscount      =  Request.Form("FPafterEBDiscountPrice") 
rqFPTax       	       =  Request.Form("FPtax")
'Foundation
rqFounPrice				   =  Request.Form("Founprice")
rqFounEBDiscount           =  Request.Form("FounEBDiscount")
rqFounAfterEBDiscount      =  Request.Form("FounafterEBDiscountPrice") 
rqFounTax       	       =  Request.Form("Fountax")
'Practitioner
rqPracPrice				   =  Request.Form("Pracprice")
rqPracEBDiscount           =  Request.Form("PracEBDiscount")
rqPracAfterEBDiscount      =  Request.Form("PracafterEBDiscountPrice") 
rqPracTax       	       =  Request.Form("Practax")

rqStartTime            =  Request.Form("starttime") 
rqEndTime     	       =  Request.Form("endtime")
rqPaymentsAfterEnroll  =  Replace(Request.Form("paymentsafterenroll"),"'","''")
rqAddress              =  Request.Form("address")

'==================================================='
'If User Clicks Add Country Details and Add Country Details Insert Here'
'==================================================='

If rqType = "Add Country Details" Then


  strQuery1 = "SELECT country FROM proj_countrydetails WHERE country = '"& Session("country") &"'"

  Rs1.Open strQuery1,ConnObj

  If (not Rs1.BOF) and (not Rs1.EOF) Then

     Country = Rs1("country")

	   If Session("country") = Country Then

		 Session("message") = "This Ciuntry Details Is Already Added"
		 Response.Redirect("countryDetails.asp")

	   End if
  Else

	   strAddCountryDetails = "INSERT INTO proj_countrydetails (country,phonenumber,onlinecourse_phno,classroomcourse_phno1,classroomcourse_phno2,currencyformat,reschedule1,reschedule2,reschedule3,cancellation1,cancellation2,cancellation3,applicabledays,PRINCE2Manual, payments, paymentsafterenroll, address, PayOpt1, PayOpt2, FPprice, FPEBDiscount, FPafterEBDiscountPrice, FPtax, Founprice, FounEBDiscount, FounAfterEBDiscountPrice, Fountax, Pracprice, PracEBDiscount,PracafterEBDiscountPrice,Practax,addedBy,starttime,endtime) VALUES ('"& rqCountry & "','"& rqPhoneNumber &"','"& rqOnlineCoursePhoneNo &"','"& rqClassCoursePhoneNo1 &"','"& rqClassCoursePhoneNo2 &"','"& rqCurrencyFormat &"','"& rqReschedule1 &"','"& rqReschedule2 &"','"& rqReschedule3 &"','"& rqCancellation1 &"','"& rqCancellation2 &"','"& rqCancellation3 &"','"& rqApplicableDays &"','"& rqPmbok &"','"& rqPayments &"','"& rqPaymentsAfterEnroll &"','"& rqAddress &"','"& rqPayOption1 &"','"& rqPayOption2 &"','"& rqFPPrice &"','"& rqFPEBDiscount &"','"& rqFPAfterEBDiscount &"','"& rqFPTax &"', '"&rqFounPrice&"', '"&rqFounEBDiscount&"','"&rqFounAfterEBDiscount&"', '"&rqFounTax&"', '"&rqPracPrice&"', '"&rqPracEBDiscount&"', '"&rqPracAfterEBDiscount&"', '"&rqPracTax&"','"&Session("UserId")&"','"& rqStartTime &"','"& rqEndTime &"')"
		
	   

	   rsCountryDetails.Open strAddCountryDetails,ConnObj

	   Session("message") = "You Have Successfully Added Country Details"
	   Response.Redirect("countryDetails.asp")

	   rsCountryDetails.Close
	
	End If

End If

'==================================================='
'If You Click Edit In city.asp Page In That Page You can Edit That City and Insert Here'
'At The Same Time in Location Table also We Can Edit That particular City'
'Retrive The cityId and Edited City From city.asp Page'
'==================================================='

If rqType = "Edit Country Details" Then

 rqId = Request.Form("id")

 strEditCountryDetails = "UPDATE proj_countrydetails SET phonenumber = '"& rqPhoneNumber &"',onlinecourse_phno = '"& rqOnlineCoursePhoneNo &"', classroomcourse_phno1 = '"& rqClassCoursePhoneNo1 &"',classroomcourse_phno2 = '"& rqClassCoursePhoneNo2 &"',currencyformat = '"& rqCurrencyFormat &"',reschedule1 = '"& rqReschedule1 &"',reschedule2 = '"& rqReschedule2 &"',reschedule3 = '"& rqReschedule3 &"',cancellation1 = '"& rqCancellation1 &"',cancellation2 = '"& rqCancellation2 &"',cancellation3 = '"& rqCancellation3 &"',applicabledays = '"& rqApplicableDays &"',PRINCE2Manual = '"& rqPmbok &"',payments = '"& rqPayments &"',paymentsafterenroll = '"& rqPaymentsAfterEnroll &"',address = '"& rqAddress &"',PayOpt1 = '"& rqPayOption1 &"',PayOpt2 = '"& rqPayOption2 &"',FPprice = '"& rqFPPrice &"',FPEBDiscount = '"& rqFPEBDiscount &"',FPafterEBDiscountPrice = '"& rqFPAfterEBDiscount &"',FPtax = '"& rqFPTax &"',Founprice = '"& rqFounPrice &"',FounEBDiscount = '"& rqFounEBDiscount &"',FounAfterEBDiscountPrice = '"& rqFounAfterEBDiscount &"',Fountax	 = '"& rqFounTax &"' , Pracprice = '"& rqPracPrice &"',PracEBDiscount = '"& rqPracEBDiscount &"',PracafterEBDiscountPrice = '"& rqPracAfterEBDiscount &"',Practax = '"& rqPracTax &"',modifiedBy = '"&Session("UserId")&"',starttime = '"& rqStartTime &"',endtime = '"& rqEndTime &"' WHERE country = '" & Session("country") & "' AND id = '" & rqId & "'"

 rsCountryDetails.Open strEditCountryDetails,ConnObj


 Session("message") = "You Have Successfully Edited Country Details"
 Response.Redirect("countryDetails.asp")
 
 rsCountryDetails.Close

End If

'==================================================='
'If You Click The Delete Button That Particular Delete Here'
'And Display The Message in city.asp Page'
'==================================================='

 ConnObj.Close
 Set ConnObj = Nothing
 Else
 Response.Redirect("../backoffice/login.asp")
 End If
%>