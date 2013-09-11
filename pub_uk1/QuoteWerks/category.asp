<!--#include virtual="/QuoteWerks/includes/header.asp"-->
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->
<!--#include virtual="/QuoteWerks/includes/pagination.asp"-->
<% 
	If Session("QWUserName") = "" Then 
		Response.Redirect("default.asp")
	Else
	
%>
<%
'======================================================='
'Written By : savita'
'Written Date : 28/02/2013'
'Description :'
'This page is for adding category Details '
'======================================================='
%>
<%
 'Declaring variables
Dim rqAction,message 
Dim objRs, objRs1,rquserId
Dim rqId,rqaddedBy,rqaddedDate
Dim arrAllUsers, strCategory, objRsCategory, objRsItem, strItem
Dim strSupplier,objRsSupplier,objRsManufacturer,strManufacturer
Dim firstRow, lastRow, numRows, rqRow, rqPage

'Creating the Recordset objects'
SET objRs1 = Server.CreateObject("ADODB.Recordset")


message = Session("message")
Session("message") = ""

'Retrive the values from this page'
rqAction = Request.Form("action")
rqAction = Request.QueryString("action")
rqRow  = Request.QueryString("row")
rqPage = Request.QueryString("page")



strEmpDet = "SELECT * FROM QW_Category Order By id desc "

objRs1.Open strEmpDet, ConnObj

 If Not objRs1.EOF Then
	  arrAllUsers = objRs1.getrows
	  cnt = 1
     End If

objRs1.Close
'getting values for pagination
If cnt = 1 Then

 If Request.QueryString("page") = "" Then
	 iPageCurrent = 1
	  
	numRows = Ubound(arrAllUsers,2)
 firstRow = 0  
	 If numRows > 9 Then
	    lastRow = 9  
	 Else
	 	lastRow = numRows
	 End If 
	
	
	Else
	
	 numRows = Ubound(arrAllUsers,2)
	
	iPageCurrent = Request.QueryString("page") 
    firstRow = ((10 * iPageCurrent)-10) 
     lastRow = firstRow + 9 

    If lastRow > numRows Then
    lastRow = numRows
   End If

    If firstRow < 0 Then
       firstRow = 0
    End If

 End if
 End If

Set objRsCategory = Server.CreateObject("ADODB.Recordset")

strCategory = "SELECT Distinct category  FROM QW_Category"

objRsCategory.Open strCategory, ConnObj
	
'If Admin Selects the Country and cliked on Submit button, It will come here and raise a session variable'
rqAction = Request.Form("submit")
rqcategory = Request.Form("category")

If rqAction = "Submit" Then
	
	'Raising session for Country'
	rqcategory = Request.Form("category")
	'Session("category") = rqcategory

End If

Set objRsSupplier = Server.CreateObject("ADODB.Recordset")

strSupplier = "SELECT Distinct supplier FROM QW_Category where category = '"&rqcategory&"' "

objRsSupplier.Open strSupplier, ConnObj

'Response.Write(strItem)

Set objRsManufacturer = Server.CreateObject("ADODB.Recordset")

strManufacturer = "SELECT Distinct Manufacturer FROM QW_Category where category = '"&rqcategory&"' "

objRsManufacturer.Open strManufacturer, ConnObj

'Response.Write(strItem)

Set objRsItem = Server.CreateObject("ADODB.Recordset")

strItem = "SELECT Distinct ItemType FROM QW_Category where category = '"&rqcategory&"' "

objRsItem.Open strItem, ConnObj

'Response.Write(strItem)
	 
 %>
<link href="/QuoteWerks/css/leftNavi.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/form.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/mainContent.css" rel="stylesheet" type="text/css" />
<script language ="JavaScript" type="text/javascript">

// Function To Validate Fields And Display An Alert Message If Any Field Is Empty.

//Email Validation
/*
 function validate_required(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
	}
}
function validate_noNumber(field,alerttxt)
  {
  	var iChars = "0123456789";

  	with (field)
  	{
  		for (var i = 0; i < value.length; i++) {
  		  	if ((iChars.indexOf(value.charAt(i)) != -1)) {
  		  	alert (alerttxt);
  		  	return false;
  		  	}
  		}
  	}
 }

 function validate_special(field,alerttxt)
 {
 	var iChars = "!#$%^&*@()+=-[]\\\';,{}|\":<>?";

 	with (field)
 	{
 		for (var i = 0; i < value.length; i++) {
 		  	if (iChars.indexOf(value.charAt(i)) != -1) {
 		  	alert (alerttxt);
 		  	return false;
 		  	}
 		}
 	}
 }

 function validate_number(field,alerttxt)
  {
  	var iChars = "0123456789";

  	with (field)
  	{
  		for (var i = 0; i < value.length; i++) {
  		  	if (!(iChars.indexOf(value.charAt(i)) != -1)) {
  		  	alert (alerttxt);
  		  	return false;
  		  	}
  		}
  	}
  }

 function echeck(str) {

 		var str1 = str.value
 		var at="@"
 		var dot="."
 		var lat=str1.indexOf(at)
 		var lstr=str1.length
 		var ldot=str1.indexOf(dot)
 		if (str1.indexOf(at)==-1){
 		   alert("Invalid E-mail ID")
 		   return false
 		}

 		if (str1.indexOf(at)==-1 || str1.indexOf(at)==0 || str1.indexOf(at)==lstr){
 		   alert("Invalid E-mail ID")
 		   return false
 		}

 		if (str1.indexOf(dot)==-1 || str1.indexOf(dot)==0 || str1.indexOf(dot)==lstr){
 		    alert("Invalid E-mail ID")
 		    return false
 		}


 		 if (str1.indexOf(at,(lat+1))!=-1){
 		    alert("Invalid E-mail ID")
 		    return false
 		 }

 		 if (str1.substring(lat-1,lat)==dot || str1.substring(lat+1,lat+2)==dot){
 		    alert("Invalid E-mail ID")
 		    return false
 		 }

 		 if (str1.indexOf(dot,(lat+2))==-1){
 		    alert("Invalid E-mail ID")
 		    return false
 		 }

 		 if (str1.indexOf(" ")!=-1){
 		    alert("Invalid E-mail ID")
 		    return false
 		 }

  		 return true
 	} 

*/
// Function To Validate The Form And Display An Alert Message If Any Field Is Found Empty.

function Form_Validator(thisform)
{
	  if (thisform.category.value == "Select")
		{
			alert("Please enter the Category first");
			thisform.category.focus();
			return(false);
	    }	
	 }
	 function validate_form1(thisform)
	  {
	    if (thisform.Cost.value == "")
		{
			alert("Please enter the Cost");
			thisform.Cost.focus();
			return(false);
		}	 
     else  	if (thisform.TittleDescription.value =="")
    	 {
			alert("Please Enter the TittleDescription");
			thisform.TittleDescription.focus();
			return(false);
	     }
	
    		else if (thisform.ManufacturerPartNumber.value =="")
		   {
			 alert("Please enter ManufacturerPartNumber");
			 thisform.ManufacturerPartNumber.focus();
			 return (false);
		   }
else if (thisform.supplier.value =="Select")
		   {
			 alert("Please select supplier");
			 thisform.supplier.focus();
			 return (false);
		   }
		   else if (thisform.VendorPartNumber.value =="")
		   {
			 alert("Please select supplier");
			 thisform.VendorPartNumber.focus();
			 return (false);
		   }
		   else if (thisform.Price.value =="")
		   {
			 alert("Please enter price");
			 thisform.Price.focus();
			 return (false);
		   }
		    else if (thisform.List.value =="")
		   {
			 alert("Please select List");
			 thisform.List.focus();
			 return (false);
		   }
		    else if (thisform.Manufacturer.value =="select")
		   {
			 alert("Please select Manufacturer");
			 thisform.Manufacturer.focus();
			 return (false);
		   }
		      else if (thisform.ItemType.value =="select")
		   {
			 alert("Please select ItemType");
			 thisform.ItemType.focus();
			 return (false);
		      }
	    else  if (int_check(thisform.tax.value, "Please enter number between 0 to 100") == false)
	    { tax.focus(); return false }
	    else if (thisform.tax.value == "") {
	        alert("Please enter tax (%)");
	        return false;
	    }
	    else
	        return true;
		   
		   

	 }
	 function int_check(x, y) {
	     // alert(x)
	     if (x.length == 0) {
	         return false;
	     }
	     if (isNaN(x)) {
	         alert(y)
	         return false;
	     }
	     else {
	         // alert("integer value")
	         return true;
	     }

	 }


function Cancel()
{
 window.location = "/QuoteWerks/users.asp"
}
function DeleteAlert(link,site,ltext) {
  if(confirm("Are you sure you want to delete?"))
  {
  	return true;
  }
return false;
}
</script>
<tr>
<td width="170px" align="left" valign="top" style=" border-right:#CCC thin solid;"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftNavigation" width="170">
  <!--#include virtual="/QuoteWerks/includes/LeftMenu.asp"-->
  </table></td>
<td width="730" align="left" valign="top"  style="padding-left:5px; padding-right:5px" height="450px">
<div id="styledForm" class="myform">

<% 'Adding New category Details'
'If rqAction  = "addNew" Then %>
<form action="category.asp" method="post" onSubmit="return Form_Validator(this);">
   <table >
  <br /><br />
    <tr>
      <td>Select Category: </td>
      <td><select name="category">
          <option value="Select">--Select--</option>
          <% Do Until objRsCategory.EOF %>
          <option <% If rqcategory = objRsCategory("category") Then %> selected="selected" <% End If %> value="<% = objRsCategory("category") %>">
          <% = objRsCategory("category") %>
          </option>
          <% objRsCategory.Movenext
							   Loop
							   objRsCategory.Close %>
        </select></td>
      <td><input type="Submit" name="submit" value="Submit" /></td>
    </tr>
  </table>
</form>
<% 'Adding New category Details'
If rqAction  = "Submit" Then %>
<form  action="/QuoteWerks/addeditviewCategory.asp"  method="post" onSubmit="return validate_form1(this)">
  <table width="100%" border="0" cellspacing="0" cellpadding="8px">
    <tr>
      <td colspan="2" ><p> Enter Specification of new item to this category </p></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Category <span class="small">Category Name</span> </label></td>
      <td height="25"><input type="text" name="Category" id="Category" value="<% =rqcategory %>" /></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Cost <span class="small">Add Cost</span></label></td>
      <td height="25"><input type="text" name="Cost" id="Cost" /></td>
    </tr>
    
    <tr>
      <td width="30%" height="25"><label>Tittle Description<span class="small">Add Tittle Description</span></label></td>
      <td height="25"><input type="txt" name="TittleDescription" id="TittleDescription" /></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Manufacturer Part Number<span class="small">Add Manufacturer Part Number</span></label></td>
      <td height="25"><input type="txt" name="ManufacturerPartNumber" id="ManufacturerPartNumber" /></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Supplier<span class="small">Add Supplier</span></label></td>
      <td><select name="supplier" id="supplier">
          <option value="Select">--Select--</option>
          <% Do Until objRsSupplier.EOF %>
          <option value="<% = objRsSupplier("supplier") %>">
          <% = objRsSupplier("supplier") %>
          </option>
          <% objRsSupplier.Movenext
                       Loop
                       objRsSupplier.Close %>
        </select></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Vendor Part Number<span class="small">Add Vendor Part Number</span></label></td>
      <td height="25"><input type="txt" name="VendorPartNumber" id="VendorPartNumber" /></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Price<span class="small">Add Price</span></label></td>
      <td height="25"><input type="txt" name="Price" id="Price" /></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>List<span class="small">Add List</span></label></td>
      <td height="25"><input type="txt" name="List" id="List" /></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Manufacturer<span class="small">Add Manufacturer</span></label></td>
      <td><select name="Manufacturer" id="Manufacturer">
          <option value="select">--Select--</option>
          <% Do Until objRsManufacturer.EOF %>
          <option value="<% = objRsManufacturer("Manufacturer") %>">
          <% = objRsManufacturer("Manufacturer") %>
          </option>
          <% objRsManufacturer.Movenext
                       Loop
                       objRsManufacturer.Close %>
        </select></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Item Type<span class="small">Add Item Type</span></label></td>
      <td><select name="ItemType" id="ItemType">
          <option value="select">--Select--</option>
          <% Do Until objRsItem.EOF %>
          <option value="<% = objRsItem("ItemType") %>">
          <% = objRsItem("ItemType") %>
          </option>
          <% objRsItem.Movenext
                       Loop
                       objRsItem.Close %>
        </select></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Notes<span class="small">Add Notes</span></label></td>
      <td height="25"><textarea name="Notes" rows="5" cols="30"></textarea></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Custom Number <span class="small">Add Custom Number</span></label></td>
      <td height="25"><input type="txt" name="CustomNumber01" id="CustomNumber01" /></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Extra Memo<span class="small">Add Extra Memo</span></label></td>
      <td height="25"><input type="txt" name="ExtraMemo01" id="ExtraMemo01" /></td>
    </tr>
      <tr>
              <td width="30%" height="25"><label>Tax<span class="small"> tax(%)</span></label></td>
              <td height="25">
                  <input type="text" name="tax" id="tax" />
              </td>
      </tr>
       
    <tr>
      <td height="25">&nbsp;</td>
      <td height="25"><button type="submit" name="type" value="Add Item Details">Add New Item</button>
        <button type="button" onClick="Cancel()"  value="Cancel">Cancel</button></td>
    </tr>
           
  </table>
</form>

<% End If %>
</table>
</td>
</tr>
</table>
<% End If %>
<!--#include virtual="/QuoteWerks/includes/connectionClose.asp"-->
<!-- Body Ends -->
