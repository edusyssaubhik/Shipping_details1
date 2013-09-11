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
'Written Date : 29/03/2011'
'Description :'
'This page is for country Details '
'======================================================='
%>
<%
 'Declaring variables
Dim rqAction,message 
Dim objRs, objRs1,rquserId
Dim rqId,rqaddedBy,rqaddedDate
Dim arrAllUsers, firstRow, lastRow, numRows, rqRow, rqPage

'Creating the Recordset objects'
SET objRs1 = Server.CreateObject("ADODB.Recordset")


message = Session("message")
Session("message") = ""

'Retrive the values from this page'
rqAction = Request.QueryString("action")
rqRow  = Request.QueryString("row")
rqPage = Request.QueryString("page")


strEmpDet = "SELECT * FROM QW_CountryDetail"

objRs1.Open strEmpDet, ConnObj

'Response.Write(strEmpDet)

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
		  //Check To See If The UserId Field Is Balnk    
				 if (validate_required(firstName,"Please enter First Name")==false)
					 {firstName.focus();return false}
					 
				 if (validate_noNumber(firstName,"Last Name Only Alphbets")==false)
					 {firstName.focus();return false}
					 
				 if (validate_required(lastName,"Please enter Last Name")==false)
					 {lastName.focus();return false}	 
				
				if (validate_noNumber(lastName,"First Name Only Alphbets")==false)
					 {lastName.focus();return false}
				
				 if (validate_required(officialemailid,"Please enter official Email ID")==false)
			 		 {officialemailid.focus();return false}
			
			   
			   	if(echeck(officialemailid)==false)
					 {officialemailid.focus();return false}

				if (validate_required(personalemailid,"Please enter personal Email ID")==false)
					 {personalemailid.focus();return false}
					 
				if(echeck(personalemailid)==false)
					 {personalemailid.focus();return false}
					 
				if (validate_required(phoneNo,"Please enter Phone No")==false)
					 {phoneNo.focus();return false}
					 
					 
				if (validate_number(phoneNo,"Feild allows Only Numbers")==false)
					 {phoneNo.focus();return false}	
					 
				if (validate_special(phoneNo,"Feild allows Only Numbers")==false)
				     {phoneNo.focus();return false}	
					 
				if (validate_required(Designation,"Please enter Designation")==false)
					 {Designation.focus();return false}
					 
				 
				
				 
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

function Cancel()
{
 window.location = "/QuoteWerks/country.asp"
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
      <td width="170px" align="left" valign="top" style=" border-right:#CCC thin solid;">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftNavigation" width="170">
          <!--#include virtual="/QuoteWerks/includes/LeftMenu.asp"-->
        </table></td>
      <td width="730" align="left" valign="top"  style="padding-left:5px; padding-right:5px" height="450px"><div id="styledForm" class="myform">

<% 'Adding New Users Details'
If rqAction = "addCountry" Then %>
        <form  action="/QuoteWerks/addeditCountry.asp"  method="post" onSubmit="return validate_form1(this)">
          <table width="100%" border="0" cellspacing="0" cellpadding="8px">
         
            <tr>
              <td colspan="2"><h1>Add Country Details</h1>
                <p>use this form to add CountryDetail 
         </p></td>
            </tr>
            
            <tr>
              <td width="30%" height="25"><label>Country <span class="small">Add Country Name</span> </label></td>
              <td height="25"><input type="text" name="country" id="country" /></td>
               <tr>
              <td width="30%" height="25"><label>Currency <span class="small">Add Currency</span></label></td>
              <td height="25"><input type="text" name="currency" id="currency" /></td>
            </tr>
                        <tr>
              <td width="30%" height="25"><label>Tax<span class="small">Add Tax</span></label></td>
              <td height="25"><input type="txt" name="tax" id="tax" /></td>
            </tr>
            <tr>
              <td height="25"></td>
              <td height="25"><button type="submit" name="type" value="Add Country Details">Add Country</button>
              <button type="button" onClick="Cancel()"  value="Cancel">Cancel</button>
</td>
            </tr>
          </table>
        </form>
<% 'Editing Users Details'
ElseIf rqAction = "editCountry" Then 
rqId = Request.QueryString("id")

'Response.Write(rqId)

strCountDetail = "SELECT * FROM QW_CountryDetail WHERE countryId= '"& rqId&"'"

objRs1.Open strCountDetail, ConnObj

'Response.Write(strEmpDetail)

%>
        <form  action="addeditCountry.asp"  method="post" onSubmit="return validate_form1(this)">
          <% 
		  
		  Do until objRs1.EOF
		 		   %>
          <input type="hidden" name="countryId" value="<% = objRs1("countryId") %>" />
          <table width="100%" border="0" cellspacing="0" cellpadding="8px">
            <tr>
              <td colspan="2">Edit Country Details
                <p>use this form to edit Country </p></td>
            </tr>
            <tr>
              <td width="30%" height="25"><label>Country <span class="small">Edit Country</span> </label></td>
              <td height="25"><input type="text" value="<% = objRs1("country") %>" name="country" /></td>
            </tr>
            <tr>
              <td width="30%" height="25"><label>Currency <span class="small">Edit Currency</span> </label></td>
              <td height="25"><input type="text" value="<% = objRs1("currency") %>" name="currency" /></td>
            </tr>
           
            <tr>
              <td width="30%" height="25"><label>Tax <span class="small">Edit Tax</span> </label></td>
              <td height="25"><input type="text" value="<% = objRs1("tax") %>" name="tax" /></td>
            </tr>
            <tr>
              <td></td>
             
              <td height="25"><button type="submit" name="type" value="Edit Country Details">Edit Country</button><button type="button" onClick="Cancel()"  value="Cancel">Cancel</button></td>
            </tr>
          </table>
          <% objRs1.Movenext
		   Loop
		   objRs1.Close %>
        </form>
<%  'Display the Table'
   else
 %> 
    <div style="width:60%">
        <table  border="0" cellspacing="0" cellpadding="4" class="mainContent" align="left">
       
          <caption>
          <a href="country.asp?action=addCountry">Add New Country</a>
          </caption>
           <font face="Arial" color="red"><% = message %></font>
        <% If IsArray(arrAllUsers) Then %>
          <thead>
            <tr>
                   
            <th>Country</th>
            <th>Currency</th>
              <th>Tax</th>
              <th>Edit</th>
                <% If Session("QWTypeofuser") = "Admin" Then %>
              <th>Delete</th>
              <% End If %>
            </tr>
          </thead>
          <% 
			 For rowcounter = firstRow To lastRow 
			 
		  %>
          <tbody>
            <tr>
           
              <td width="15%" ><% = arrAllUsers(1,rowcounter) %></td>
              <td width="15%" ><% = arrAllUsers(2,rowcounter) %></td>
              <td width="15%" ><% = arrAllUsers(3,rowcounter) %></td>
              <td width="15%"><a href="country.asp?action=editCountry&amp;id=<% = arrAllUsers(0,rowcounter) %>">Edit</a> </td>
              <% If Session("QWTypeofuser") = "Admin" Then %>
              <td width="15%"><a href="addeditCountry.asp?action=deleteCountry&amp;id=<% = arrAllUsers(0,rowcounter) %>" onclick="return DeleteAlert(this.href);">Delete</a> </td>
              <% End If %>
            </tr>
            <% Next %>
            
            <tr>
            
                <td colspan="9" class="pagination"> <div class="pagination"> <%'Pgination Code'
               ps = getPaginationString(page, (numRows + 1), 10, 2, "users.asp?name=user")
                Response.Write(ps)
	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %></div>
                 </td>
            
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
