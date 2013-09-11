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
'Written Date : 27/02/2013'
'Description :'
'This page is for category Details '
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

If Request.QueryString("action") <> "" Then
	rqAction = Request.QueryString("action")
Else
	rqAction = Request.Form("action")
End If	

If Request.Form("type") <> "" Then
	rqType = Request.Form("type")
Else
	rqType = Request.QueryString("type")
End If

If Request.Form("Category") <> "" Then
	rqCategory = Request.Form("Category")
Else
	rqCategory = Request.QueryString("Category")
End If

If Request.Form("TittleDescription") <> "" Then
	rqTittleDescription = Request.Form("TittleDescription")
Else
	rqTittleDescription = Request.QueryString("TittleDescription")
End If

'query for category list

If rqCategory <> "" Then

strEmpDet = "SELECT * FROM QW_Category Where category = '"&rqCategory&"' Order By id desc "

ElseIf rqTittleDescription <> "" Then

strEmpDet = "SELECT * FROM QW_Category Where TittleDescription = '"&rqTittleDescription&"' Order By id desc "

Else

strEmpDet = "SELECT * FROM QW_Category Order By id desc "

End If
'response.Write(strEmpDet)
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


 %>
<link href="/QuoteWerks/css/leftNavi.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/form.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/mainContent.css" rel="stylesheet" type="text/css" />
<script language ="JavaScript" type="text/javascript">

// Function To Validate Fields And Display An Alert Message If Any Field Is Empty.

//Email Validation

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


// Function To Validate The Form And Display An Alert Message If Any Field Is Found Empty.

function validate_form1(thisform)
{

		with (thisform)
		{
      if (int_check(thisform.tax.value, "Please enter number between 0 to 100") == false)
		    { tax.focus(); return false }
		else if (thisform.tax.value == "") {
		    alert("Please enter tax (%)");
		    return false;
		}

		  //Check To See If The UserId Field Is Balnk    
				 if (validate_required(firstName,"Please enter First Name")==false)
					 {firstName.focus();return false}
					 
				 if (validate_noNumber(firstName,"First Name Only Alphbets")==false)
					 {firstName.focus();return false}
					 
				 if (validate_required(lastName,"Please enter Last Name")==false)
					 {lastName.focus();return false}	 
					
					 
				 if (validate_noNumber(lastName,"Last Name Only Alphbets")==false)
					 {lastName.focus();return false}
					 
				 if (validate_required(userName,"Please enter User Name")==false)
					 {userName.focus();return false}
					 if (validate_required(priEmailId,"Please enter primary Email ID")==false)
					 {priEmailId.focus();return false}
			
			   
				if(echeck(priEmailId)==false)
					 {priEmailId.focus();return false}
					 
				
					 
		 
				if (validate_required(phoneNo,"Please enter Phone No")==false)
					 {phoneNo.focus();return false}
					 
					 
				if (validate_number(phoneNo,"Feild allows Only Numbers")==false)
					 {phoneNo.focus();return false}	
					 
				if (validate_special(phoneNo,"Feild allows Only Numbers")==false)
				     {phoneNo.focus();return false}	
				
				 
				if (validate_required(accessGranted,"Please select Access granted")==false)
					 {accessGranted.focus();return false}
			 	
               
		}
	
	  if (thisform.password.value == "")
		{
			alert("Please enter the Password");
			thisform.password.focus();
			return(false);
	   }	
	
			  
	     if (thisform.nwPassword.value == "")
		{
			alert("Please enter the ConfirmPassword");
			thisform.nwPassword.focus();
			return(false);
		}	 

					   
		if (thisform.password.value != thisform.nwPassword.value)
    	 {
			alert("Password and ConfirmPassword Are Not Equal");
			thisform.nwPassword.focus();
			return(false);
	     }
	
    		if (thisform.accessGranted.selectedIndex == "")
		   {
			 alert("Please Select Access granted");
			 thisform.accessGranted.focus();
			 return (false);
		   }

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
 window.location = "/QuoteWerks/ViewEditcategory.asp"
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


<% 'Editing Item Details'
If rqAction = "Edit" Then 
rqId = Request.QueryString("id")

strEditDetail = "SELECT * FROM QW_Category WHERE id= '"& rqId&"'"

'Response.Write(strEditDetail)
objRs1.Open strEditDetail, ConnObj

%>
<form  action="/QuoteWerks/addeditviewCategory.asp"  method="post" onSubmit="return validate_form1(this)">
  <table width="100%" border="0" cellspacing="0" cellpadding="8px">
   <tr>
      <td colspan="2" > <p><b>Edit Category Details</b></p></td>
    </tr>
 
  
     <% Do until objRs1.EOF %>
          <input type="hidden" name="id" value="<% = objRs1("id") %>" />
    <tr>
      <td width="30%" height="25"><label>Category <span class="small">Category Name</span> </label></td>
      <td height="25"><input type="text" name="Category" id="Category" value="<% = objRs1("category") %>" /></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Cost <span class="small">Add Cost</span></label></td>
      <td height="25"><input type="text" name="Cost" id="Cost" value="<% = objRs1("Cost") %>" /></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Tittle Description<span class="small">Add Tittle Description</span></label></td>
      <td height="25"><input type="txt" name="TittleDescription" id="TittleDescription" value="<% = objRs1("TittleDescription") %>"/></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Manufacturer Part Number<span class="small">Add Manufacturer Part Number</span></label></td>
      <td height="25"><input type="txt" name="ManufacturerPartNumber" id="TittleDescription" value="<% = objRs1("TittleDescription") %>" /></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Supplier<span class="small">Add Supplier</span></label></td>
      <td><select name="supplier" id="supplier">
          <option value="">--Select--</option>
           <option value="<% = objRs1("supplier") %>"<% If objRs1("supplier") = ""& objRs1("supplier")&"" Then %> selected="selected" <% End If %>><% = objRs1("supplier") %></option>
          
        </select></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Vendor Part Number<span class="small">Add Vendor Part Number</span></label></td>
      <td height="25"><input type="txt" name="VendorPartNumber" id="VendorPartNumber" value="<% = objRs1("VendorPartNumber") %>" /></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Price<span class="small">Add Price</span></label></td>
      <td height="25"><input type="txt" name="Price" id="Price" value="<% = objRs1("Price") %>" /></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>List<span class="small">Add List</span></label></td>
      <td height="25"><input type="txt" name="List" id="List"  value="<% = objRs1("List") %>"/></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Manufacturer<span class="small">Add Manufacturer</span></label></td>
      <td><select name="Manufacturer" id="Manufacturer">
          <option value="">--Select--</option>
           <option value="<% = objRs1("Manufacturer") %>"<% If objRs1("Manufacturer") = ""& objRs1("Manufacturer")&"" Then %> selected="selected" <% End If %>><% = objRs1("Manufacturer") %></option>
         
        </select></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Item Type<span class="small">Add Item Type</span></label></td>
      <td><select name="ItemType" id="ItemType">
          <option value="">--Select--</option>
           <option value="<% = objRs1("ItemType") %>"<% If objRs1("ItemType") = ""& objRs1("ItemType")&"" Then %> selected="selected" <% End If %>><% = objRs1("ItemType") %></option>
          
        </select></td>
    </tr>
     <tr>
      <td width="30%" height="25"><label>URL<span class="small">Add URL</span></label></td>
      <td height="25"><textarea name="url" rows="5" cols="30" value="<% = objRs1("url") %>"><% = objRs1("url") %></textarea></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Notes<span class="small">Add Notes</span></label></td>
      <td height="25"><textarea name="Notes" rows="5" cols="30" value="<% = objRs1("Notes") %>"></textarea></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Custom Number <span class="small">Add Custom Number</span></label></td>
      <td height="25"><input type="txt" name="CustomNumber01" id="CustomNumber01" value="<% = objRs1("CustomNumber01") %>" /></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Extra Memo<span class="small">Add Extra Memo</span></label></td>
      <td height="25"><input type="txt" name="ExtraMemo01" id="ExtraMemo01" value="<% = objRs1("ExtraMemo01") %>" /></td>
    </tr>
      <tr>
              <td width="30%" height="25"><label>Tax<span class="small"> tax(%)</span></label></td>
              <td height="25">
                  <input type="text" name="tax" value="<%=objRs1("tax") %>" id="tax" />
              </td>
            </tr>
            
            
    <tr>
      <td height="25">&nbsp;</td>
      <td height="25"><button type="submit" name="type" value="Edit Item">Edit Item</button>
        <button type="button" onClick="Cancel()"  value="Cancel">Cancel</button></td>
    </tr>
  </table>
   <% objRs1.Movenext
		   Loop
		   objRs1.Close %>
</form>
<% 'View category Details'
ElseIf rqAction = "View" Then 
rqId = Request.QueryString("id")

strEditDetail = "SELECT * FROM QW_Category WHERE id= '"& rqId&"'"

objRs1.Open strEditDetail, ConnObj

%>
<form  action="/QuoteWerks/ViewEditcategory.asp?action=View&id=<% = arrAllUsers(0,rowcounter) %>"  method="post" onSubmit="return validate_form1(this)">
  <table width="100%" border="0" cellspacing="0" cellpadding="8px">
  <tr>
      <td colspan="2" > <p><b>View Category Details</b></p></td>
    </tr>
 
     <% Do until objRs1.EOF %>
          <input type="hidden" name="id" value="<% = objRs1("id") %>" />
    <tr>
      <td width="30%" height="25"><label>Category <span class="small">Category Name</span> </label></td>
      <td height="25"><% = objRs1("category") %></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Cost <span class="small">Add Cost</span></label></td>
      <td height="25"><% = objRs1("Cost") %></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Tittle Description<span class="small">Add Tittle Description</span></label></td>
      <td height="25"><% = objRs1("TittleDescription") %></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Manufacturer Part Number<span class="small">Add Manufacturer Part Number</span></label></td>
      <td height="25"><% = objRs1("TittleDescription") %></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Supplier<span class="small">Add Supplier</span></label></td>
      <td><% = objRs1("supplier") %></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Vendor Part Number<span class="small">Add Vendor Part Number</span></label></td>
      <td height="25"><% = objRs1("VendorPartNumber") %></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Price<span class="small">Add Price</span></label></td>
      <td height="25"><% = objRs1("Price") %></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>List<span class="small">Add List</span></label></td>
      <td height="25"><% = objRs1("List") %></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Manufacturer<span class="small">Add Manufacturer</span></label></td>
      <td>
          <% = objRs1("Manufacturer") %>
         </td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Item Type<span class="small">Add Item Type</span></label></td>
      <td><% = objRs1("ItemType") %></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Notes<span class="small">Add Notes</span></label></td>
      <td height="25"><% = objRs1("Notes") %></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Custom Number <span class="small">Add Custom Number</span></label></td>
      <td height="25"><% = objRs1("CustomNumber01") %></td>
    </tr>
    <tr>
      <td width="30%" height="25"><label>Extra Memo<span class="small">Add Extra Memo</span></label></td>
      <td height="25"><% = objRs1("ExtraMemo01") %></td>
    </tr>
    <tr>
      <td height="25">&nbsp;</td>
      <td height="25"><button type="submit" name="type" value="View Item">View Item</button>
        <button type="button" onClick="Cancel()"  value="Cancel">Cancel</button></td>
    </tr>
  </table>
   <% objRs1.Movenext
		   Loop
		   objRs1.Close %>
</form>

<%  'Display the Table'
   Else
   
'Recordset   
Set objRsCategory = Server.CreateObject("ADODB.Recordset")
Set objRsDesc = Server.CreateObject("ADODB.Recordset")

'Calling distinct category

strCategory = "SELECT Distinct category  FROM QW_Category"

objRsCategory.Open strCategory, ConnObj


'Calling distinct item name
strDesc = "SELECT Distinct TittleDescription  FROM QW_Category"

objRsDesc.Open strDesc, ConnObj
	
 %>
 
 
<div style="width:100%">
  <table  border="0" cellspacing="0" cellpadding="4" align="left">
  <tr><td>
  <form action="ViewEditcategory.asp" method="post" onSubmit="return Form_Validator(this)">
  <table>
    <tr>
      <td>Search By Category: </td>
      <td><select name="category">
          <option value="">--Select--</option>
          <% Do Until objRsCategory.EOF %>
          <option <% If rqcategory = objRsCategory("category") Then %> selected="selected" <% End If %> value="<% = objRsCategory("category") %>">
          <% = objRsCategory("category") %>
          </option>
          <% objRsCategory.Movenext
							   Loop
							   objRsCategory.Close %>
        </select></td>
      <td><input type="Submit" name="Search" value="Search" /></td>
    </tr>
  </table>
</form>
</td>
<td>
 <form action="ViewEditcategory.asp" method="post" onSubmit="return Form_Validator(this)">
  <table>
    <tr>
      <td>Search By Item Name: </td>
      <td><select name="TittleDescription">
          <option value="">--Select--</option>
          <% Do Until objRsDesc.EOF %>
          <option <% If rqTittleDescription = objRsDesc("TittleDescription") Then %> selected="selected" <% End If %> value="<% = objRsDesc("TittleDescription") %>">
          <% = objRsDesc("TittleDescription") %>
          </option>
          <% objRsDesc.Movenext
							   Loop
							   objRsDesc.Close %>
        </select></td>
      <td><input type="Submit" name="Search" value="Search" /></td>
    </tr>
  </table>
</form>
</td>
</tr>
<tr><br /></tr>
</table>
<br /><br />
  <table  border="0" cellspacing="0" cellpadding="4" class="mainContent" align="left">
  

    
           <font face="Arial" color="red"><% = message %></font><br /><br />
   
    <% If IsArray(arrAllUsers) Then %>
    <thead>
      <tr>
        <th>Category</th>
        <th>TittleDescription</th>
        <th>ManufacturerPartNumber</th>
        <th>supplier</th>
        <th>LIST</th>
        <th>Manufacturer</th>
        <th>ItemType</th>
        <th>URL</th>
<th>Tax</th>
        <% If Session("QWTypeofuser") = "Admin" Then %>
        <th>Edit</th>
        <% End If %>
        <th>View</th>
      </tr>
    </thead>
    <% 
			 For rowcounter = firstRow To lastRow 
			 
		  %>
    <tbody>
      <tr>
        <td width="15%" ><% = arrAllUsers(1,rowcounter) %></td>
        <td width="15%" ><% = arrAllUsers(3,rowcounter) %></td>
        <td width="15%" ><% = arrAllUsers(5,rowcounter) %></td>
        <td width="15%" ><% = arrAllUsers(6,rowcounter) %></td>
        <td width="15%" ><% = arrAllUsers(9,rowcounter) %></td>
        <td width="15%" ><% = arrAllUsers(10,rowcounter) %></td>
        <td width="15%"><% = arrAllUsers(11,rowcounter) %></td>
         <td width="15%"><% = arrAllUsers(14,rowcounter) %></td>
          <td width="15%"><% = arrAllUsers(23,rowcounter) %></td>

         <% If Session("QWTypeofuser") = "Admin" Then %>
        <td width="15%"><a href="ViewEditcategory.asp?action=Edit&amp;id=<% = arrAllUsers(0,rowcounter) %>">Edit</a></td>
        <% End If %>
        <td width="15%"><a href="ViewEditcategory.asp?action=View&amp;id=<% = arrAllUsers(0,rowcounter) %>">View</a></td>
     
      </tr>
      <% Next %>
      <tr>
        <td colspan="9" class="pagination"><div class="pagination">
            <%'Pgination Code'
               ps = getPaginationString(page, (numRows + 1), 10, 2, "ViewEditcategory.asp?category="&rqcategory &"&name=user")
                Response.Write(ps)
	           %>
            <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
          </div></td>
      </tr>
    </tbody>
  </table>
</div>
<% End If %>
<% End If %>
</table>
</td>
</tr>
</table>
<% End If %>
<!--#include virtual="/QuoteWerks/includes/connectionClose.asp"-->
<!-- Body Ends -->
