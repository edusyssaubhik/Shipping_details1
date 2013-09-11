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
'Written By : Mahima'
'Written Date : 29/03/2011'
'Description :'
'This page is for User Details '
'======================================================='

Dim rqType,rqCategory,rqCost ,rqTittleDescription,rqLongDescription ,rqManufacturerPartNumber ,rqsupplier
Dim rqAction,rqtypeofuser,rqVendorPartNumber,rqaddedBy ,rqaddedDate,rqPrice,rqList
Dim objRs,strEmpDet,rqDelGID, strQuery1 ,rqItemType,  rqManufacturer,rqDeleteuserId,rqID
Dim rqNotes,rqCustomNumber01,rqExtraMemo01,Rs1,ManufacturerPartNumber,upuser,upuser1,rqURL

	'Retrive the type of action'
    rqAction = Request.QueryString("action")
	rqType =  Request.form("type")
	
	'Retrive the values from this page'

	rqDeleteuserId = Request.QueryString("id")

	rqCategory = Request.Form("Category")
	rqCost = Request.Form("Cost")
	rqTittleDescription = Request.Form("TittleDescription")
	rqLongDescription = Request.Form("LongDescription")
	rqManufacturerPartNumber = Request.Form("ManufacturerPartNumber")
	rqsupplier = Request.Form("supplier")
	rqVendorPartNumber = Request.Form("VendorPartNumber")	
	rqPrice = Request.Form("Price")
	rqList = Request.Form("List")
	rqManufacturer = Request.Form("Manufacturer")
	rqItemType = Request.Form("ItemType")
	rqtypeofuser = Request.Form("typeofuser")
	rqURL = Request.Form("URL")
	rqNotes = Request.Form("Notes")
	rqCustomNumber01 = Request.Form("CustomNumber01")
	rqExtraMemo01 = Request.Form("ExtraMemo01")
	rqaddedDate	= Now()
	rqaddedBy = Session("QWuserName")
	rqID = Request.Form("id")
	'RESPONSE.WRITE(rquserName)
	

	'Creating Record Objects'
	Set objRs = Server.CreateObject("ADODB.Recordset")
	Set  Rs1 = Server.CreateObject("ADODB.Recordset")
	'Response.write(rquserName)
 If rqType = "Add Item Details" then 
    
   
	 'response.write("b")
 strEmpDet = "INSERT INTO QW_Category(Category,Cost,TittleDescription,ManufacturerPartNumber,supplier,VendorPartNumber,Price,List,Manufacturer,ItemType,typeofuser,Notes,CustomNumber01,ExtraMemo01,addedBy,addedDate) values " 
		strEmpDet= strEmpDet& "('" & rqCategory& "',"
		strEmpDet= strEmpDet& "'" & rqCost & "',"
		strEmpDet= strEmpDet& "'" & rqTittleDescription & "',"
		strEmpDet= strEmpDet& "'" & rqManufacturerPartNumber & "',"
		strEmpDet= strEmpDet& "'" & rqsupplier & "',"
		strEmpDet= strEmpDet& "'" & rqVendorPartNumber & "',"
		strEmpDet= strEmpDet& "'" & rqPrice & "',"
		strEmpDet= strEmpDet& "'" & rqList & "',"
		strEmpDet= strEmpDet& "'" & rqManufacturer & "',"
		strEmpDet= strEmpDet& "'" & rqItemType & "',"
		strEmpDet= strEmpDet& "'" & rqtypeofuser & "',"
		strEmpDet= strEmpDet& "'" & rqNotes & "',"
		strEmpDet= strEmpDet& "'" & rqCustomNumber01 & "',"
		strEmpDet= strEmpDet& "'" & rqExtraMemo01 & "',"
		strEmpDet= strEmpDet& "'" & rqaddedBy& "',"
		strEmpDet= strEmpDet& "'" & rqaddeddate & "')"
		
		'Response.Write(strEmpDet)
    	objRs.open strEmpDet,ConnObj
	 	 Session("message") = "You Have Successfully Added New Item" 
		Response.Redirect("category.asp")
	
	'End If
	'Updating values into the database'	
 ElseIf rqType = "Edit Item" then
 
 
			
         'Response.write("c")
					strEmpDet= "UPDATE QW_Category  SET "
					strEmpDet= strEmpDet& "Category = '"& rqCategory &"',"
					strEmpDet= strEmpDet& "Cost = '"& rqCost &"',"
					strEmpDet= strEmpDet& "TittleDescription = '"& rqTittleDescription &"',"
					strEmpDet= strEmpDet& "ManufacturerPartNumber = '"& rqManufacturerPartNumber &"',"
					strEmpDet= strEmpDet& "supplier = '"& rqsupplier &"',"
					strEmpDet= strEmpDet& "VendorPartNumber= '" & rqVendorPartNumber & "',"
					strEmpDet= strEmpDet& "Price= '" & rqPrice & "',"
					strEmpDet= strEmpDet& "List= '" & rqList & "',"
					strEmpDet= strEmpDet& "Manufacturer= '" & rqManufacturer & "',"
					strEmpDet= strEmpDet& "ItemType= '" & rqItemType & "',"
					strEmpDet= strEmpDet& "typeofuser= '" & rqtypeofuser & "',"
					strEmpDet= strEmpDet& "Notes= '" & rqNotes & "',"
					strEmpDet= strEmpDet& "URL= '" & rqURL & "',"
					strEmpDet= strEmpDet& "CustomNumber01= '" & rqCustomNumber01 & "',"
					strEmpDet= strEmpDet& "ExtraMemo01= '" & rqExtraMemo01 & "',"
					strEmpDet= strEmpDet& "modifiedBy= '" & rqaddedBy & "',"
					strEmpDet= strEmpDet& "modifiedDate= '" & rqaddeddate & "'"
					strEmpDet= strEmpDet& " WHERE id = '"& rqId &"'"
				  
				'response.write(strEmpDet)
					ConnObj.Execute strEmpDet
					 Session("message") = "You Have Successfully Edit User" 
					Response.Redirect("/QuoteWerks/ViewEditcategory.asp")
		
				 
				'Deleteing the records from the table'
ElseIf rqAction ="deleteUser" then	
  Response.Write(rqDeleteuserId) 
				 
				 ConnObj.Execute("DELETE  from QW_Category where id = '"& rqDeleteuserId &"'")
				  Session("message") = "You Have Successfully Deleted Item from the category" 
				 response.Redirect("/QuoteWerks/ViewEditcategory.asp")
	
end If

%>
<% End If %>
<!--#include virtual="/QuoteWerks/includes/connectionClose.asp"-->
