<%@ Language = "VBScript" %>
<%
'======================================================='
'Written By : Bharath'
'Last UpDated : 24/03/2012'
'Description :'
' Add/Edit/Delete Course Page and Enrolledusers Page'

'Modified By : Mahima'
'Modified Dated : 26/03/2012'
'======================================================='
%>
<% If not  Session("UserId") = "" Then %>
<!--#include file="includes/connection.asp"-->
<%
 'Declare The Variables'

 Dim strQuery
 Dim strQuery1
 Dim rqCountry
 Dim addCity
 Dim rqEditCountry
 Dim rqCity
 Dim rqState
 Dim rqStateCode
 Dim rqeditid
 Dim strQuery2
 Dim rqDelete
 Dim strQuery3
 Dim strQuery4
 Dim strQuery5
 Dim Rs1,Rs
 Dim Rs2
 Dim City
 Dim rqimagename,rqlocationaddress,rqlocation
 Dim rqType, rqHotelName
 Dim rqeditpark, rqedittype,rqeditnote, rqeditbook,rqeditcapacity


rqType = Request.Form("type")
 Set Rs = Server.CreateObject("ADODB.Recordset")
 Set Rs1 = Server.CreateObject("ADODB.Recordset")
 Set Rs2 = Server.CreateObject("ADODB.Recordset")

'==================================================='
'Retrive From city.asp Page User Clicks Add City Or Edit City'
'==================================================='

 addLocation = Request.Form("addlocation")

  
'==================================================='
'If User Clicks Add Location and Add One Location That Location We Insert Here'
'strQuery1 For Searching User Entered Location Already Existing Or Not'
'If Location already Existed Then Display One Message in Location.asp Page "You Already Added This Location"'
'If you haven't That Location it Will Insert Into DataBase
'==================================================='

If addLocation= "Add Location" Then

  rqLocation      =  Request.Form("Location")
  rqCountry       =  "United Kingdom"
  'rqhotelName      =  Session("hotelName") 
  rqHotelName      =   Request.Form("hotelName") 
  rqImageName     =  Request.Form("imgName")
  rqLocAdd        =  Request.Form("locationAddress")
  rqRegion        =  Request.Form("Region")
  rqphoneNo       =  Request.Form("phoneNo")
  rqPostcode        =  Request.Form("Postcode")
  park=Request.Form("park")

  type1=Request.Form("type")

   note1=Request.Form("note")

    book1=Request.Form("book")
    capacity=Request.Form("capacity")

    strQuery = "INSERT INTO proj_locations (location,imagename,locationaddress,country,hotelName,Region,phoneNo,Postcode,vendorId,capacity,park_info,type,Faculty_notes,book_info)values ('"& rqLocation & "','"& rqImageName &"','"&rqLocAdd&"','"&Session("country")&"', '"&rqHotelName&"' , '"&rqRegion&"', '"&rqphoneNo&"', '"&rqPostcode&"','"&Session("vendor")&"','"&capacity&"','"&park&"','"&type1&"','"&note1&"','"&book1&"')"
    Rs.Open strQuery,ConnObj

    Session("message") = "You Have Successfully Added Location "  & rqLocation
    Response.Redirect("locations.asp?")

End If

'==================================================='
'If You Click Edit In city.asp Page In That Page You can Edit That City and Insert Here'
'At The Same Time in Location Table also We Can Edit That particular City'
'Retrive The cityId and Edited City From city.asp Page'
'==================================================='
If rqType = "Edit City" Then


 rqeditid                = Request.Form("editid") 
 rqimagename         = Request.Form("imgName")
 rqlocationaddress   =  Request.Form("locationaddress")
 rqlocation          = Request.Form("location")
   rqHotelName      =   Request.Form("hotelName") 
    rqeditRegion      =   Request.Form("editRegion") 
	 rqeditphoneNo      =   Request.Form("editphoneNo") 
	  rqeditPostcode      =   Request.Form("editPostcode") 
	    rqeditpark=Request.Form("park")

   rqedittype=Request.Form("editType")

    rqeditnote=Request.Form("note")

     rqeditbook=Request.Form("book")
     rqeditcapacity=Request.Form("editCapacity")

  
 strQuery2 = "UPDATE proj_locations SET location = '" & rqlocation & "', imagename = '" & rqimagename & "', locationaddress = '" & rqlocationaddress & "',Region = '" & rqeditRegion & "',phoneNo= '" & rqeditphoneNo & "',Postcode = '" & rqeditPostcode & "' , hotelName = '" & rqHotelName & "', park_info = '" & rqeditpark & "',type = '" & rqedittype & "',Faculty_notes = '" & rqeditnote & "',book_info = '" & rqeditbook & "',capacity = '" & rqeditcapacity & "' Where id = '" & rqeditid & "'"
Rs2.Open strQuery2,ConnObj 


 Session("message") = "You Have Successfully Edited Location "
 Response.Redirect("locations.asp")

End If

'==================================================='
'If You Click The Delete Button That Particular Delete Here'
'And Display The Message in city.asp Page'
'==================================================='

 rqDelete = Request.Querystring("delete")

If rqDelete <> "" Then

 strQuery3 = "DELETE FROM proj_locations WHERE id = '" & rqDelete & "'"
 Rs.Open strQuery3,ConnObj
 Session("message") = "You Have Successfully Deleted Location"
 Response.Redirect("locations.asp")

End If

 'Rs.Close
' Set Rs = Nothing
' ConnObj.Close
' Set ConnObj = Nothing
 Else
  Response.Redirect("../backOffice/login.asp")
 End If
%>