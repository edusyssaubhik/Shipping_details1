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
'Written By : Vinaya'
'Written Date : 1/04/2011'
'Modified By : Bharath'
'Modified Date : 7th Apr 2011'
'Description :'
'This page is for country Details '
'======================================================='
%>
<%
 'Declaring variables
  Dim rqAction ,UserId,strQuery
  Dim objRs, objRs1
  Dim rqId,arrAllcountries
  Dim arrAllEmpDet, firstRow, lastRow, numRows, rqRow, rqPage
  Dim message
  
  message = Session("message")
  Session("message") = ""
   
   'Creating the Recordset objects'
  SET objRs1 = Server.CreateObject("ADODB.Recordset")

  'Retrive the values from this page'
   rqAction = Request.QueryString("action")
   rqRow  = Request.QueryString("row")
   rqPage = Request.QueryString("page")
 
 
   'Retrive the Empdetails and dispaly'
    strQuery = "SELECT id FROM QW_Users WHERE userid = '" & Session("QWUserName") & "'"
    objRs1.Open strQuery, ConnObj
Do Until objRs1.EOF

 ID = objRs1("id")

objRs1.Movenext
Loop 
objRs1.Close
	
     
 %>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <title>Change Password</title>
<script language="javascript">
function Form_Validator(theform)
{

  //Check To See If The Current Password Field Is Blank
   
  if (theform.pwd.value == "")
  {
    alert("Please enter current password");
    theform.pwd.focus();
	return(false);
  }

  //Check To See If The New Password Field Is Blank
    
  if (theform.newPwd.value == "")
  {
    alert("Please enter new password");
    theform.newPwd.focus();
	return(false);
  }

  //Check To See If The Confirm New Password Field Is Blank
    
  if (theform.confPwd.value == "")
  {
    alert("Please enter confirm password");
    theform.confPwd.focus();
	return(false);
  }    
 
  if (theform.newPwd.value != theform.confPwd.value)
  {
    alert("New password and confirm password are not equal");
    theform.confPwd.focus();
	return(false);	
  }

}


</script>
<!-- Body Starts -->
<link href="/QuoteWerks/css/leftNavi.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/form.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/mainContent.css" rel="stylesheet" type="text/css" />

    <tr>
      <td width="170px" align="left" valign="top" style=" border-right:#CCC thin solid;"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftNavigation" width="170">
          <!--#include virtual="/QuoteWerks/includes/LeftMenu.asp"-->
        </table></td>
      <td width="730" align="left" valign="top"  style="padding-left:5px; padding-right:5px" height="450px"><div id="styledForm" class="myform">

       
             <form  action="/QuoteWerks/changepwd.asp"  method="post" onSubmit="return Form_Validator(this)">
              <input type="hidden" name="ID" value="<% = ID %>" />
          <table width="100%" border="0" cellspacing="0" cellpadding="8px">
             <font face="Arial" color="red"><% = message %></font>
            <tr>
              <td colspan="2"><h1>Change Password</h1>
                <p>use this form to change password 
         </p></td>
            </tr>
            
            <tr>
              <td width="30%" height="25"><label>Current Password <span class="small">Enter Current Password</span> </label></td>
              <td height="25"><input type="password" name="pwd" /></td>
               <tr>
              <td width="30%" height="25"><label>New Password <span class="small">Add New Password</span></label></td>
              <td height="25"><input type="password" name="newPwd" /></td>
            </tr>
        
             
            <tr>
              <td width="30%" height="25"><label>Confirm Password<span class="small">Add Confirm Password</span></label></td>
              <td height="25"><input type="password" name="confPwd" /></td>
            </tr>
                
            <tr>
              <td height="25">&nbsp;</td>
              <td height="25"><button type="submit" name="Submit" value="submit">submit</button>
</td>
            </tr>
          </table>
        </form>
              </td>
          </tr>
        </table>
        </td>
              </tr>
                        
            </table></td>
  </tr>
  </table>


<% End If %>
<!--#include virtual="/QuoteWerks/includes/connectionClose.asp"-->
<!-- Body Ends -->
