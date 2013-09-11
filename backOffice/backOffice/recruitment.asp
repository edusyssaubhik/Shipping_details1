<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/inneraboutusbanner.html"-->
<!--#include virtual="/metatags/aboutus_metatag.html"-->
<!-- Body Starts -->

<script language ="javascript">
			
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
function validate_required(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
	}
}
// Function To Validate The Form And Display An Alert Message If Any Field Is Found Empty.

function validate_form(thisform)
{
    with (thisform)
    {
     
	   //Check To See If The  Name Field Is Balnk     
		
		if (validate_required(candidateName,"Please enter the Name")==false)
			  {candidateName.focus();return false}
			 
	   	if (validate_required(email,"Please enter the Email ID")==false)
			  {email.focus();return false}	
			  
		if (validate_required(phNo,"Please enter Phone Number")==false)
			  {phNo.focus();return false}	
			  		  
	   //Check To See If The EmailId Correct Or Not   
	   
        if (echeck(email)==false)
 	         {email.focus();return false}


		if (validate_required(datePassed,"Please enter the date passed Practitioner exam")==false)
			  {datePassed.focus();return false}
			  
			  
	    if (validate_required(score,"Please enter the score")==false)
			  {score.focus();return false}			  
			  
	   	if (validate_required(city,"Please enter City")==false)
			  {city.focus();return false}
			  
			  
	    if (validate_required(country,"Please enter Country")==false)
			  {country.focus();return false}			  
 
  }
  

}
</script>


<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="breadcrumb"><a href="/index.asp" title="Home">Home</a> &raquo; Recruitment</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body">
			<div style="margin-top:-15px; width:97%;">
                <!-- Content Start From Here-->

              <table border="0" width="100%" cellspacing="0" cellpadding="2" >
                <tr>
                  <td colspan="2" class="general-body">
				  <p><span class="PageTitle">Recruitment</span></p>
				
               <p>
                <span class="Header">Recruitment Form:</span><br /><br />
Please fill out the form below giving your details and we will get in touch with you very soon. 
 </p>
				 </td>
                </tr>
                <tr>
                  <td colspan="2">&nbsp;</td>
                </tr>
                     <form name="Recruitment" action="insertRecruitment.asp" method="post" onSubmit="return validate_form(this)">
        
 
     <table border="0" cellspacing="5" cellpadding="0" width="100%" >
	         <tr>
        <td><span class="general-bodyBold">Name<span class="Required">*</span> :</span></td>
        <td><input type="text" name="candidateName" id="candidateName" size="20" /></td>
        </tr>
		        <tr>
        <td><span class="general-bodyBold">Email<span class="Required">*</span> :</span></td>
        <td><input type="text" name="email" id="email" size="40" /></td>
        </tr>
		<tr>
		<td width="20%"><span class="general-bodyBold">Phone No.<span class="Required">*</span> :</span></td>
        <td><input type="text" name="phNo" id="phNo" size="30" /></td>
        </tr>
        
        <tr>
        <td><span class="general-bodyBold">Date passed Practitioner exam<span class="Required">*</span> :</span></td>
        <td><input type="text" name="datePassed" id="datePassed" size="20" /> (mm-dd-yyyy)
        </td>
        </tr>
		
        <tr>
        <td><span class="general-bodyBold">Score<span class="Required">*</span> :</span></td>
        <td><input type="text" name="score" id="score" size="20" /></td>
        </tr>
                <tr>
        <td><span class="general-bodyBold">City<span class="Required">*</span> :</span></td>
        <td><input type="text" name="city" id="city" size="40" /></td>
        </tr>

        <tr>
        <td><span class="general-bodyBold">Country<span class="Required">*</span> :</span></td>
        <td><input type="text" name="country" id="country" size="40" /></td>
        </tr>

        <tr>
        <td></td>
        <td><input type="Submit" name="type" value="Submit" />
        <input type="reset"  value="Reset" /></td>
        </tr>
        </table>
        </form>
         <span class="Required">*</span> <b>Mandatory fields</b>.
   
              </table></td>
          </tr>
        </table></td>
    </tr>
  </table>

				</td>
                
          </tr>
        </table></td>
    </tr>
  </table>
</div>

<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
