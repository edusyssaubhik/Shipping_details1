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
'Written By : Mahima'
'Written Date : 29/03/2011'
'Description :'
'This page is for User Details '
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


 If Session("QWTypeofuser") = "Admin" Then 
strEmpDet = "SELECT * FROM QW_Users ORDER BY firstname"
Else
strEmpDet = "SELECT * FROM QW_Users where userid = '"& Session("QWUserName")&"' ORDER BY firstname"
End If
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
      <td width="170px" align="left" valign="top" style=" border-right:#CCC thin solid;">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftNavigation" width="170">
          <!--#include virtual="/QuoteWerks/includes/LeftMenu.asp"-->
        </table></td>
      <td width="730" align="left" valign="top"  style="padding-left:5px; padding-right:5px" height="450px"><div id="styledForm" class="myform">

<% 'Adding New Users Details'
If rqAction = "addUser" Then %>
        <form  action="/QuoteWerks/addeditUser.asp"  method="post" onSubmit="return validate_form1(this)">
          <table width="100%" border="0" cellspacing="0" cellpadding="8px">
         
            <tr>
              <td colspan="2"><h1>Add User Details</h1>
                <p>use this form to add user 
         </p></td>
            </tr>
            
            <tr>
              <td width="30%" height="25"><label>First Name <span class="small">Add First Name</span> </label></td>
              <td height="25"><input type="text" name="firstName" id="firstName" /></td>
               <tr>
              <td width="30%" height="25"><label>Last Name <span class="small">Add Last Name</span></label></td>
              <td height="25"><input type="text" name="lastName" id="lastName" /></td>
            </tr>
        
           <!--  <tr>
              <td width="30%" height="25"><label>User Name <span class="small">Add User Name</span> </label></td>
              <td height="25"><input type="text" name="userName" id="userName" /></td>
            </tr>
            <tr>
              <td width="30%" height="25"><label>Password <span class="small">Add Password</span></label></td>
              <td height="25"><input type="password" name="password" id="password" /></td>
            </tr>
            <tr>
              <td width="30%" height="25"><label>Confirm Password<span class="small">Add Confirm Password</span></label></td>
              <td height="25"><input type="password" name="nwPassword" id="nwPassword" /></td>
            </tr>-->
                <tr>
              <td width="30%" height="25"><label>Official EmailID<span class="small">Add Official EmailID</span></label></td>
              <td height="25"><input type="txt" name="officialemailid" id="officialemailid" /></td>
            </tr>
              <tr>
              <td width="30%" height="25"><label>Personal EmailID<span class="small">Add Official EmailID</span></label></td>
              <td height="25"><input type="txt" name="personalemailid" id="personalemailid" /></td>
            </tr>
              <tr>
              <td width="30%" height="25"><label>Phone No<span class="small">Add Phone No</span></label></td>
              <td height="25"><input type="txt" name="phoneNo" id="phoneNo" /></td>
            </tr>
            <tr>
              <td width="30%" height="25"><label>Designation<span class="small">Add Designation</span></label></td>
              <td height="25"><input type="txt" name="Designation" id="Designation" /></td>
            </tr>
            <tr>
              <td width="30%" height="25"><label>Type Of User<span class="small">Add Type Of User</span></label></td>
              <td height="25"><select name="typeofuser">
                  <option value="">--Select--</option>
                  <option value="Admin">Admin</option>
                  <option value="Booking Manager">Sales Manager</option>
                </select></td>
            </tr>
            <tr>
              <td height="25">&nbsp;</td>
              <td height="25"><button type="submit" name="type" value="Add User Details">Add User Details</button><button type="button" onClick="Cancel()"  value="Cancel">Cancel</button>
</td>
            </tr>
          </table>
        </form>
<% 'Editing Users Details'
ElseIf rqAction = "editUser" Then 
rqId = Request.QueryString("id")

'Response.Write(rqId)

strEmpDetail = "SELECT * FROM QW_Users WHERE id= '"& rqId&"'"

objRs1.Open strEmpDetail, ConnObj

'Response.Write(strEmpDetail)

%>
        <form  action="addeditUser.asp"  method="post" onSubmit="return validate_form1(this)">
          <% 
		  
		  Do until objRs1.EOF
		 		   %>
          <input type="hidden" name="id" value="<% = objRs1("id") %>" />
          <table width="100%" border="0" cellspacing="0" cellpadding="8px">
            <tr>
              <td colspan="2"><h1>Edit User Details</h1>
                <p>use this form to edit user </p></td>
            </tr>
            <tr>
              <td width="30%" height="25"><label>First Name <span class="small">Edit First Name</span> </label></td>
              <td height="25"><input type="text" value="<% = objRs1("firstName") %>" name="firstName" /></td>
            </tr>
            <tr>
              <td width="30%" height="25"><label>Last Name <span class="small">Edit Last Name</span> </label></td>
              <td height="25"><input type="text" value="<% = objRs1("lastName") %>" name="lastName" /></td>
            </tr>
            <tr>
              <td width="30%" height="25"><label>User Name </label></td>
              <td height="25">&nbsp;&nbsp;&nbsp;<% = objRs1("userid") %></td>
            </tr>
            <tr>
              <td width="30%" height="25"><label>Official EmailID <span class="small">Edit Official EmailID</span> </label></td>
              <td height="25"><input type="text" value="<% = objRs1("officialemailid") %>" name="officialemailid" /></td>
            </tr>
            <tr>
              <td width="30%" height="25"><label>Personal EmailID <span class="small">Edit Personal EmailID</span> </label></td>
              <td height="25"><input type="text" value="<% = objRs1("personalemailid") %>" name="personalemailid" /></td>
            </tr>
              <tr>
              <td width="30%" height="25"><label>Phone No <span class="small">Edit Phone No</span> </label></td>
              <td height="25"><input type="text" value="<% = objRs1("phoneNo") %>" name="phoneNo" /></td>
            </tr>
            
            <tr>
              <td width="30%" height="25"><label>Designation <span class="small">Edit Designation</span> </label></td>
              <td height="25"><input type="text" value="<% = objRs1("Designation") %>" name="Designation" /></td>
            </tr>
              <% If Session("QWTypeofuser") = "Admin" Then %>
            <tr>
              <td width="30%" height="25"><label>Access Granted <span class="small"> Edit access</span> </label></td>
              <td height="25"><select name="typeofuser">
                  <option value="">--Select--</option>
                  <option value="Admin"<% If objRs1("typeofuser") = "Admin" Then %> selected="selected" <% End If %>>Admin</option>
                  <option value="sales Manager" <% If objRs1("typeofuser") = "sales Manager" Then %> selected="selected" <% End If %>>sales Manager</option>
                 
                 <% End If %>
                 </td>
            </tr>
            <tr>
              <td></td>
             
              <td height="25"><button type="submit" name="type" value="Edit User Details">Edit User Details</button><button type="button" onClick="Cancel()"  value="Cancel">Cancel</button></td>
            </tr>
          </table>
          <% objRs1.Movenext
		   Loop
		   objRs1.Close %>
        </form>
<%  'Display the Table'
   else
 %> 
    <div style="width:100%">
        <table  border="0" cellspacing="0" cellpadding="4" class="mainContent" align="left">
        <% If Session("QWTypeofuser") = "Admin" Then %>
          <caption>
          <a href="Users.asp?action=addUser">Add New User</a>
          </caption>
           <font face="Arial" color="red"><% = message %></font>
           <% End If %>
        <% If IsArray(arrAllUsers) Then %>
          <thead>
            <tr>
                   
            <th>First Name</th>
            <th>Last Name</th>
              <th>User Name</th>
              <th>Official Email</th>
              <th>Personal Email</th>
              <th>Phone No</th>
              <th>Access Granted</th>
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
              <td width="15%" ><% = arrAllUsers(7,rowcounter) %></td>
              <td width="15%" ><% = arrAllUsers(8,rowcounter) %></td>
              <td width="15%" ><% = arrAllUsers(6,rowcounter) %></td>
              <td width="15%"><% = arrAllUsers(11,rowcounter) %></td>
              <td width="15%"><a href="users.asp?action=editUser&amp;id=<% = arrAllUsers(0,rowcounter) %>">Edit</a> </td>
              <% If Session("QWTypeofuser") = "Admin" Then %>
              <td width="15%"><a href="addeditUser.asp?action=deleteUser&amp;id=<% = arrAllUsers(0,rowcounter) %>" onclick="return DeleteAlert(this.href);">Delete</a> </td>
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
