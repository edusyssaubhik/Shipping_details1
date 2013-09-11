<!--#include virtual="/includes/connection.asp"-->
<%
'======================================================='
'Written By : Bharath'
'Created Date : 02nd Feb 2011
'Last UpDated : 02nd Feb 2011'
'Description :'
'This page is adding UK calls to the database'
'CRM'
'======================================================='
 If not  Session("UserId") = "" Then 

message = Session("message")
 Session("message") = ""

'Declare the local variables'
Dim strUSState, objRs, strUKCounties

'Creatting the record set'
Set objRs = Server.CreateObject("ADODB.Recordset")

strUKCounties = "SELECT states FROM states WHERE country = 'United Kingdom' ORDER BY states"

objRs.Open strUKCounties, ConnObj

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Enrollment For Datrix</title>
<link href="/backoffice/css/pagestyle.css" rel="stylesheet" type="text/css">

<style type="text/css">
body {
	background: white;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #646464;
	text-align: left;
}
</style>
 <script language="JavaScript" type="text/javascript" src="/backoffice/js/datrixEnrol.js"></script>
<script language="javascript">
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
		 
		 if (str1.indexOf(",")!=-1){
			alert("Invalid E-mail ID")
			return false
		}    

  		 return true
 	} 

/*Phone number validation*/
function validate_number(field,alerttxt)
  {
  	var iChars = "0123456789-()";

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


function Form_Validator(theform)
{

  if (theform.phoneno.value == "")
  {
     alert("Please enter the phone number.");
     theform.phoneno.focus();
     return (false);
  }
  
   if (theform.country.value == "")
  {
     alert("Please select Country.");
     theform.country.focus();
     return (false);
  }
  if (theform.emailid.value == "")
  {
     alert("Please enter the email id.");
     theform.emailid.focus();
     return (false);
  }

  if (theform.question.value == "")
  {
     alert("Please enter the question.");
     theform.question.focus();
     return (false);
  }

  with (theform)
  {
 	    if(echeck(emailid)==false)
					 {emailid.focus();return false}
  
  }

}

function clicked()
{
	alert('Only email support is provided to online students. So, please email adminsupport@PMstudy.com for queries relating to online courses.');
}
</script>
</head>
<body>
<div id="htMap">
<% If message <> "" then %>
 <script type="text/javascript">
	  alert("<% = message %>")
	
	
	  </script>
      
      <% End IF %>
  <table border="1" cellpadding="5" cellspacing="0" align="center" width="1000px" class="dbborder">
  <tr>
   <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% if  session("brand") <> "All" then %><% =Session("brand") %>&nbsp;<% end if %><% =Session("country") %></span>
         
	    Back Office</font></div></td>
 </tr>
 <tr>
  <td width="100px" valign="top" rowspan="22">
  <!--#include file="includes/leftMenu.html"-->
  </td>
 </tr>
    <tr>
      <td align="center">Datrix Enrollment Form</td>
    </tr>
    <tr>
      <td><form name="addcalls" action="Datrix-enrollsuccess.asp" method="post" onsubmit="return Form_Validator(this)">
          <table border="0" cellpadding="5" cellspacing="0" width="100%">
          
            <tr>
              <td width="20%"><b>Enrolling For :</b></td>
              <td width="60%"><input type="radio" id="course" name="course" value="PRINCE2"  onClick="findCourse();"  />
                PRINCE2&nbsp;
                <input type="radio" id="course" name="course" value="ITIL"  onClick="findCourse();" />
                ITIL &nbsp;  </td>
            </tr>         
           
            <tr id="Hidecourse">
                  <td><b>Course Enrolling in:</b></td>
                  <td><select><option value="">-----Select------</option></select>
                  </td>
                 
				   </tr>
                <tr id="txtHint"></tr>
            <tr>
              <td><b> First Name :</b></td>
              <td><input type="text" name="firstname" /></td>
            </tr>
             <tr>
              <td><b> Last Name :</b></td>
              <td><input type="text" name="lastname" /></td>
            </tr>
            <tr>
              <td><b>Phone Number :</b></td>
              <td><input type="text" name="phoneno" /></td>
            </tr>
             <tr>
              <td><b>EmailId :</b></td>
              <td><input type="text" name="email" /></td>
            </tr>  
            <tr>
              <td><b>County:</b></td>
              <td><input type="text" name="state1"  /></td>
            </tr>
            <tr>
              <td><b>City :</b></td>
              <td><input type="text" name="city" />
              </td>
            </tr>
                      
            <tr>
              <td>&nbsp;</td>
              <td><input type="submit" name="Submit" value="Submit" />
                &nbsp;
                <input type="reset" name="reset" value="Reset" /></td>
            </tr>
          </table>
        </form></td>
    </tr>
  </table>
</div>
<!--#include virtual="/includes/connectionClose.asp"-->
</body>
</html>
<% Else
 Response.Redirect("../backOffice/login.asp")
 End If
%>