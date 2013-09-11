<!--#include virtual="/QuoteWerks/includes/header.asp"-->
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->



<head>
<script type="text/javascript">
function toggleVARetainerAddMoreBP1(AddMoreBP1){
		if(document.getElementById(AddMoreBP1).style.display == 'none'){
		document.getElementById(AddMoreBP1).style.display = 'table-row';
		document.getElementById('AddMorelink1').style.display = 'none';
		}else{
		document.getElementById(AddMoreBP1).style.display = 'none';
		document.getElementById('AddMorelink1').style.display = 'block';
		}
 

}
function toggleVARetainerAddMoreBP2(AddMoreBP2){
		if(document.getElementById(AddMoreBP2).style.display == 'none'){
		document.getElementById(AddMoreBP2).style.display = 'table-row';
		document.getElementById('AddMorelink2').style.display = 'none';
		}else{
		document.getElementById(AddMoreBP2).style.display = 'none';
		document.getElementById('AddMorelink2').style.display = 'block';
		}
 

}
function toggleVARetainerAddMoreBP3(AddMoreBP3){
		if(document.getElementById(AddMoreBP3).style.display == 'none'){
		document.getElementById(AddMoreBP3).style.display = 'table-row';
		document.getElementById('AddMorelink3').style.display = 'none';
		}else{
		document.getElementById(AddMoreBP3).style.display = 'none';
		document.getElementById('AddMorelink3').style.display = 'block';
		}
 

}
function toggleVARetainerAddMoreBP4(AddMoreBP4){
		if(document.getElementById(AddMoreBP4).style.display == 'none'){
		document.getElementById(AddMoreBP4).style.display = 'table-row';
		document.getElementById('AddMorelink4').style.display = 'none';
		}else{
		document.getElementById(AddMoreBP4).style.display = 'none';
		document.getElementById('AddMorelink4').style.display = 'block';
		}
 

}
function toggleVARetainerAddMoreBP5(AddMoreBP5){
		if(document.getElementById(AddMoreBP5).style.display == 'none'){
		document.getElementById(AddMoreBP5).style.display = 'table-row';
		document.getElementById('AddMorelink5').style.display = 'none';
		}else{
		document.getElementById(AddMoreBP5).style.display = 'none';
		document.getElementById('AddMorelink5').style.display = 'block';
		}
		
 

}
function toggleVARetainerAddMoreBP6(AddMoreBP6){
		if(document.getElementById(AddMoreBP6).style.display == 'none'){
		document.getElementById(AddMoreBP6).style.display = 'table-row';
		document.getElementById('AddMorelink6').style.display = 'none';
		}else{
		document.getElementById(AddMoreBP6).style.display = 'none';
		document.getElementById('AddMorelink6').style.display = 'block';
		}
 

}
function toggleVARetainerAddMoreBP7(AddMoreBP7){
		if(document.getElementById(AddMoreBP7).style.display == 'none'){
		document.getElementById(AddMoreBP7).style.display = 'table-row';
		document.getElementById('AddMorelink7').style.display = 'none';
		}else{
		document.getElementById(AddMoreBP7).style.display = 'none';
		document.getElementById('AddMorelink7').style.display = 'block';
		}
 

}

//second more link for contact


function toggleVARetainerAddMoreContactBP1(AddMoreContactBP1){
		if(document.getElementById(AddMoreContactBP1).style.display == 'none'){
		document.getElementById(AddMoreContactBP1).style.display = 'table-row';
		document.getElementById('AddMoreContactlink1').style.display = 'none';
		}else{
		document.getElementById(AddMoreContactBP1).style.display = 'none';
		document.getElementById('AddMoreContactlink1').style.display = 'block';
		}
 

}

function toggleVARetainerAddMoreContactBP2(AddMoreContactBP2){
		if(document.getElementById(AddMoreContactBP2).style.display == 'none'){
		document.getElementById(AddMoreContactBP2).style.display = 'table-row';
		document.getElementById('AddMoreContactlink2').style.display = 'none';
		}else{
		document.getElementById(AddMoreContactBP2).style.display = 'none';
		document.getElementById('AddMoreContactlink2').style.display = 'block';
		}
 

}

function toggleVARetainerAddMoreContactBP3(AddMoreContactBP3){
		if(document.getElementById(AddMoreContactBP3).style.display == 'none'){
		document.getElementById(AddMoreContactBP3).style.display = 'table-row';
		document.getElementById('AddMoreContactlink3').style.display = 'none';
		}else{
		document.getElementById(AddMoreContactBP3).style.display = 'none';
		document.getElementById('AddMoreContactlink3').style.display = 'block';
		}
 

}


function toggleVARetainerAddMoreContactBP4(AddMoreContactBP4){
		if(document.getElementById(AddMoreContactBP4).style.display == 'none'){
		document.getElementById(AddMoreContactBP4).style.display = 'table-row';
		document.getElementById('AddMoreContactlink4').style.display = 'none';
		}else{
		document.getElementById(AddMoreContactBP4).style.display = 'none';
		document.getElementById('AddMoreContactlink4').style.display = 'block';
		}
 

}


function toggleVARetainerAddMoreContactBP5(AddMoreContactBP5){
		if(document.getElementById(AddMoreContactBP5).style.display == 'none'){
		document.getElementById(AddMoreContactBP5).style.display = 'table-row';
		document.getElementById('AddMoreContactlink5').style.display = 'none';
		}else{
		document.getElementById(AddMoreContactBP5).style.display = 'none';
		document.getElementById('AddMoreContactlink5').style.display = 'block';
		}
 

}



</script>


 <script type="text/javascript">
					<!--
					//Validating The Email

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

					function validate_required(field,alerttxt)
					{
						with (field)
						{
							if (field.value=="")
							  {alert(alerttxt);return false}
							else {return true}
						}
					}

					function validate_special(field,alerttxt)
					{
						var iChars = "!#$%^&*@()+=-[]\\\;,{}|\":<>?./";

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

					function validate_specialcharacters(field,alerttxt)
					{
						var iChars = "!#$%^&*@()+=[]\\\;{}|\":<>?";

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
						var iChars = "0123456789-/,";

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


					                       function validate_check(){  
												if(!document.enrol.check.checked)
												
												{
												alert("Please accept our terms and conditions before proceeding"); 
												return false; } 						
													}  


					function validate_form(thisform)
					{
						with (thisform)
						{

						// Check The First Name Field Empty Or Not

						if (validate_required(companyname,"Please Enter Company Name")==false)
							  {companyname.focus();return false}

						// Check The If You Given Any Special Characters In First Name Field

						if (validate_special(companyname,"Your Company Name Has Special Characters. \n Please remove them and try again")==false)
									  {companyname.focus();return false}

						// Check The Your First Name Have Numerals in Frist Name Field

						if (validate_noNumber(companyname,"Your Company Name Has Numerals")==false)
								  {companyname.focus();return false}
								  
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////								  
								  
								  if (validate_required(companyaddress_1,"Please Enter Company Address")==false)
							      {companyaddress_1.focus();return false}

			


						
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

						
						
						if (validate_required(contactname_1,"Please Enter Contact Name")==false)
							  {contactname_1.focus();return false}

						// Check The If You Given Any Special Characters In First Name Field

						if (validate_special(contactname_1,"Your contact Name Has Special Characters. \n Please remove them and try again")==false)
									  {contactname_1.focus();return false}

						// Check The Your First Name Have Numerals in Frist Name Field

						if (validate_noNumber(contactname_1,"Your Contact Name Has Numerals")==false)
								  {contactname_1.focus();return false}
						
						
						
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////						
						
						
						
						// Check The EMail Field Empty Or not

						if (validate_required(contactemail_1,"Please Enter Your EmailId")==false)
							  {contactemail_1.focus();return false}

						// Check The Eamil Validation

						if (echeck(contactemail_1)==false)
							  {contactemail_1.focus();return false}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////						

						if (validate_required(contactphone_1,"Please enter phone number")==false)
							  {contactphone_1.focus();return false}

						// Check The Phone Number Have Special Characters

						if (validate_specialcharacters(contactphone_1,"Your phone number Has Special Characters. \n Please remove them and try again")==false)
									  {contactphone_1.focus();return false}

						// Check The Phone Number Field Have numerals

						if (validate_number(contactphone_1,"Your phone number is not a numeral")==false)
							  {contactphone_1.focus();return false}
							  
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////						
					
						
						//Address feilds
						
						if (validate_required(companyaddress_1,"Please Enter Your Street")==false)
							  {companyaddress_1.focus();return false}
							  
						

						}
					}


					-->
					</script>


<% 
'If not Session("userName") then redirect to  login page'
	If Session("QWUserName") = "" Then 
		Response.Redirect("default.asp")
	Else
	
%>

</head>

<%

''''''''''''''from companydetails page- retieving compId on selecting company dropdown
rqAddCompany=Request.form("company")
Session("compId") = rqAddCompany


SET Rs = Server.CreateObject("ADODB.Recordset")
SET Rs1 = Server.CreateObject("ADODB.Recordset")
SET Rs2 = Server.CreateObject("ADODB.Recordset")

rqMessage=Session("editMessage")
Session("editMessage")=""

If Session("compId") = "" Then
Response.Redirect("companyDetails.asp")
End If

%>
<!-- Body Starts -->
<body style="margin-top:0px">
<link href="/QuoteWerks/css/leftNavi.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/form.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/mainContent.css" rel="stylesheet" type="text/css" />


<tr>
  <td width="170px" align="left" valign="top" style=" border-right:#CCC thin solid;"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftNavigation" >
      <!--#include virtual="/QuoteWerks/includes/LeftMenu.asp"-->
    </table></td>
  <td width="730" align="center" valign="top" height="450px">
 
  <div id="styledForm" class="myform">

      <table border="0" cellpadding="7">
      <tr><td colspan="2" height="50px">&nbsp;</td></tr>
        <tr>
          <td colspan="2" align="center">
		<table>
			<tr>
            <td>
            <% If rqAddCompany = "addCompany" Then %>
			
			<form action="insertcompanydetails.asp" method="post" onSubmit="return validate_form(this)">
			<table>
            
            <tr> <td>Enter company name:</td><td><input type="text" name="companyname"  /></td></tr>
            <tr><td>Enter Address:</td><td><textarea name="companyaddress_1"></textarea></td>
            <td><a href="javascript:;" onClick="toggleVARetainerAddMoreBP1('AddMoreBP1');"><span id="AddMorelink1">Add More</span></a></td></tr> 
                           <tr id="AddMoreBP1" style="display:none">
                            <td><b>Enter Address:</b></td>
                            <td><textarea name="companyaddress_2" ></textarea>&nbsp; <a href="javascript:;" onClick="toggleVARetainerAddMoreBP2('AddMoreBP2');"><span  id="AddMorelink2">Add More</span></a></td>
                          </tr>
						   <tr id="AddMoreBP2" style="display:none">
                            <td><b>Enter Address:</b></td>
                            <td><textarea name="companyaddress_3" ></textarea>&nbsp; <a href="javascript:;" onClick="toggleVARetainerAddMoreBP3('AddMoreBP3');"><span  id="AddMorelink3">Add More</span></a></td>
                          </tr>
						     <tr id="AddMoreBP3" style="display:none">
                            <td><b>Enter Address:</b></font></td>
                            <td><textarea name="companyaddress_4" ></textarea>&nbsp; <a href="javascript:;" onClick="toggleVARetainerAddMoreBP4('AddMoreBP4');" ><span  id="AddMorelink4">Add More</span></a></td>
                          </tr>
                          <tr id="AddMoreBP4" style="display:none">
                            <td><b>Enter Address:</b></font></td>
                            <td><textarea name="companyaddress_5" ></textarea>&nbsp; <a href="javascript:;" onClick="toggleVARetainerAddMoreBP5('AddMoreBP5');"><span  id="AddMorelink5">Add More</span></a></td>
                          </tr>
                          <tr id="AddMoreBP5" style="display:none">
                            <td><b>Enter Address:</b></td>
                            <td><textarea name="companyaddress_6" ></textarea>&nbsp; <a href="javascript:;" onClick="toggleVARetainerAddMoreBP6('AddMoreBP6');"><span  id="AddMorelink6">Add More</span></a></td>
                          </tr>
						   <tr id="AddMoreBP6" style="display:none">
                            <td><b>Enter Address:</b></td>
                            <td><textarea name="companyaddress_7" ></textarea>&nbsp; <a href="javascript:;" onClick="toggleVARetainerAddMoreBP7('AddMoreBP7');"><span  id="AddMorelink7">Add More</span></a></td>
                          </tr>
						   <tr id="AddMoreBP7" style="display:none">
                            <td><b>Enter Address:</b></td>
                            <td><textarea name="companyaddress_10" ></textarea></td>
                          </tr>
                          
                         
                          
            <tr><td><b>Enter Contact details:</b></td></tr>
            <tr><td>Enter name:</td><td><input type="text" name="contactname_1"/></td></tr>
            <tr><td>Enter email-id:</td><td><input type="text" name="contactemail_1"/></td></tr>
            <tr><td>Enter phone:</td><td><input type="text" name="contactphone_1"/></td>
            <tr><td>Enter fax No:</td><td><input type="text" name="faxNo_1"/>&nbsp; <a href="javascript:;" onClick="toggleVARetainerAddMoreContactBP1('AddMoreContactBP1');"><span  id="AddMoreContactlink1">Add More</span></a></td></tr> 
         
        

			 <tr><td colspan="2">
             <table id="AddMoreContactBP1" style="display:none;margin-left:120px;">
            
             <tr><td>Enter name:</td><td><input type="text" name="contactname_2"/></td></tr>
             <tr><td>Enter email-id:</td><td><input type="text" name="contactemail_2"/></td></tr>
             <tr><td>Enter phone:</td><td><input type="text" name="contactphone_2"/></td></tr>
             <tr><td>Enter fax No:</td><td><input type="text" name="faxNo_2"/>&nbsp; <a href="javascript:;" onClick="toggleVARetainerAddMoreContactBP2('AddMoreContactBP2');"><span  id="AddMoreContactlink2">Add More</span></a></td>  
             </tr>
             </table>
            </td></tr> 
            
            
            </tr>
            
           <tr><td colspan="2">
            
             <table id="AddMoreContactBP2" style="display:none">
            
             <tr><td>Enter name:</td><td><input type="text" name="contactname_3"/></td></tr>
             <tr><td>Enter email-id:</td><td><input type="text" name="contactemail_3"/></td></tr>
             <tr><td>Enter phone:</td><td><input type="text" name="contactphone_3"/></td></tr>
             <tr><td>Enter fax No:</td><td><input type="text" name="faxNo_3"/>&nbsp;<a href="javascript:;" onClick="toggleVARetainerAddMoreContactBP3('AddMoreContactBP3');"><span  id="AddMoreContactlink3">Add More</span></a></td>  
             </tr>
             </table>
             </td> 
            </tr>
            
            
            <tr>
            
             <table  id="AddMoreContactBP3" style="display:none">
            
             <tr><td>Enter name:</td><td><input type="text" name="contactname_4"/></td></tr>
             <tr><td>Enter email-id:</td><td><input type="text" name="contactemail_4"/></td></tr>
             <tr><td>Enter phone:</td><td><input type="text" name="contactphone_4"/></td></tr>
             <tr><td>Enter fax No:</td><td><input type="text" name="faxNo_4"/>&nbsp;<a href="javascript:;" onClick="toggleVARetainerAddMoreContactBP4('AddMoreContactBP4');"><span  id="AddMoreContactlink4">Add More</span></a></td>  
             </tr>
             </table>
             </td> 
            </tr>
            
            
            
            <tr>
            
             <table id="AddMoreContactBP4" style="display:none">
            
             <tr><td>Enter name:</td><td><input type="text" name="contactname_5"/></td></tr>
             <tr><td>Enter email-id:</td><td><input type="text" name="contactemail_5"/></td></tr>
             <tr><td>Enter phone:</td><td><input type="text" name="contactphone_5"/></td></tr>
             <tr><td>Enter fax No:</td><td><input type="text" name="faxNo_5"/>&nbsp;<!--<a href="javascript:;" onClick="toggleVARetainerAddMoreContactBP5('AddMoreContactBP5');"><span  id="AddMoreContactlink5">Add More</span></a> --></td>  
             </tr>
             </table>
             </td> 
            </tr>
            
            
                <tr>
             <td height="25">&nbsp;</td>
              <td height="25"><button type="submit" name="addcompanydetails" value="addcompanydetails">Addcompanydetails</button>
              </tr>
          
            </table>
			
			</form>
            
            
            <% Else
			
			''''''''''''''''''''Already company selected
			
			 %>
            
            
           
            
            <table>
            <tr> <td>Enter company name:</td>
            <%
			
			strCompany = "SELECT compId,CompName FROM QW_Company where compId = '"&rqAddCompany&"'"
			Rs.open strCompany,ConnObj
			%>
            
            <td><input type="text" name="companyname" readonly="readonly" value="<% =Rs("CompName") %>" size="33"/></td></tr>
            
            
            <tr><td>Enter Address:</td>
            
            
            <td>
            
            <Select name="selectcompanyaddress_1">
            
            
               <% 
			  	    
					 strAddress = "SELECT CompAddress FROM QW_CompAddress where compId = '"&rqAddCompany&"'"
					 'response.Write(strAddress)
					 
					 Rs1.open strAddress,ConnObj
			   
			         do until Rs1.EOF 
			          %>
					 <option value="<% =Rs1("CompAddress") %>"><% = Rs1("CompAddress") %> </option>
			<% 
			   Rs1.movenext
		       loop 
			   Rs1.close%>
				 </select>
          </td>
            
       
       <form action="insertcompanydetails.asp" method="post" >
            
     <td><a href="javascript:;" onClick="toggleVARetainerAddMoreBP1('AddMoreBP1');"><span id="AddMorelink1">Add More</span></a></td></tr> 
     
                           <tr id="AddMoreBP1" style="display:none">
                            <td><b>Enter Address:</b></td>
                            <td><textarea name="editcompanyaddress_1" ></textarea>&nbsp; <a href="javascript:;" onClick="toggleVARetainerAddMoreBP2('AddMoreBP2');"><span  id="AddMorelink2">Add More</span></a></td>
                          </tr>
						   <tr id="AddMoreBP2" style="display:none">
                            <td><b>Enter Address:</b></td>
                            <td><textarea name="editcompanyaddress_2" ></textarea>&nbsp; <a href="javascript:;" onClick="toggleVARetainerAddMoreBP3('AddMoreBP3');"><span  id="AddMorelink3">Add More</span></a></td>
                          </tr>
						     <tr id="AddMoreBP3" style="display:none">
                            <td><b>Enter Address:</b></font></td>
                            <td><textarea name="editcompanyaddress_4" ></textarea>&nbsp; <a href="javascript:;" onClick="toggleVARetainerAddMoreBP4('AddMoreBP4');" ><span  id="AddMorelink4">Add More</span></a></td>
                          </tr>
                          <tr id="AddMoreBP4" style="display:none">
                            <td><b>Enter Address:</b></font></td>
                            <td><textarea name="editcompanyaddress_5" ></textarea>&nbsp; <a href="javascript:;" onClick="toggleVARetainerAddMoreBP5('AddMoreBP5');"><span  id="AddMorelink5">Add More</span></a></td>
                          </tr>
                          <tr id="AddMoreBP5" style="display:none">
                            <td><b>Enter Address:</b></td>
                            <td><textarea name="editcompanyaddress_6" ></textarea>&nbsp; <a href="javascript:;" onClick="toggleVARetainerAddMoreBP6('AddMoreBP6');"><span  id="AddMorelink6">Add More</span></a></td>
                          </tr>
						   <tr id="AddMoreBP6" style="display:none">
                            <td><b>Enter Address:</b></td>
                            <td><textarea name="editcompanyaddress_7" ></textarea>&nbsp; <a href="javascript:;" onClick="toggleVARetainerAddMoreBP7('AddMoreBP7');"><span  id="AddMorelink7">Add More</span></a></td>
                          </tr>
						   <tr id="AddMoreBP7" style="display:none">
                            <td><b>Enter Address:</b></td>
                            <td><textarea name="editcompanyaddress_10" >></textarea></td>
                          </tr>
                          
                         
                          
            <tr><td><b>Enter Contact details:</b></td></tr>
            <tr><td>Enter name:</td><td>           
            
             	  <Select name="selectcontactname_1">
            
            
               <%  
			  	    
					 strContact = "SELECT contName,contEmailId,contPhoneno FROM QW_CompContactDet where compId = '"&rqAddCompany&"'"
					 Rs2.open strContact,ConnObj
			   		 do until Rs2.EOF 
			         %>
					      <option value="<% =Rs2("contName") %>"><% = Rs2("contName") %> </option>
                     
                        <% 
			   			 Rs2.movenext
		       			 loop 
						 Rs2.close%>
			            
		  </select>
          
            </td></tr>
            <tr><td>Enter email-id:</td><td>
                  <Select name="contactemail_1">
           		  
                  <%
				     strContact1 = "SELECT contName,contEmailId,contPhoneno FROM QW_CompContactDet where compId = '"&rqAddCompany&"'"
					 Rs2.open strContact1,ConnObj
				     do until Rs2.EOF  %>
                  
                  <option value="<% =Rs2("contEmailId") %>"><% = Rs2("contEmailId") %> </option>
					   <% Rs2.movenext
                        loop 
                        Rs2.close
                        %>
            </Select>
            </td></tr>
               
                 <tr><td>Enter phone:</td><td>
                 <Select name="selectcontactphone_1">
           		  
                  
                  <% strContact1 = "SELECT contName,contEmailId,contPhoneno FROM QW_CompContactDet where compId = '"&rqAddCompany&"'"
					 Rs2.open strContact1,ConnObj
				     do until Rs2.EOF  %>
                  <option value="<% =Rs2("contPhoneno") %>"><% = Rs2("contPhoneno") %> </option>
                  
               <% Rs2.movenext
		       	  loop 
				  Rs2.close
				  %></Select>
                  
                  <tr><td>Enter fax No:</td><td>
                 <Select name="selectcontactphone_1">
           		  
                  
                  <% strContact1 = "SELECT contName,contEmailId,contPhoneno,fax FROM QW_CompContactDet where compId = '"&rqAddCompany&"'"
					 Rs2.open strContact1,ConnObj
				     do until Rs2.EOF  %>
                  <option value="<% =Rs2("fax") %>"><% = Rs2("fax") %> </option>
                  
               <% Rs2.movenext
		       	  loop 
				  Rs2.close
				  %></Select>
                  
                 <a href="javascript:;" onClick="toggleVARetainerAddMoreContactBP1('AddMoreContactBP1');"><span  id="AddMoreContactlink1">Add More</span></a></td></tr> 
          
        <tr><td colspan="2">
            
             <table id="AddMoreContactBP1" style="display:none">
            
             <tr><td>Enter name:</td><td><input type="text" name="editcontactname_2"/></td></tr>
             <tr><td>Enter email-id:</td><td><input type="text" name="editcontactemail_2"/></td></tr>
             <tr><td>Enter phone:</td><td><input type="text" name="editcontactphone_2"/></td></tr>
             <tr><td>Enter faxNo:</td><td><input type="text" name="editfaxno_2"/>&nbsp; <a href="javascript:;" onClick="toggleVARetainerAddMoreContactBP2('AddMoreContactBP2');"><span  id="AddMoreContactlink2">Add More</span></a> </td> 
            
            </tr>
             </table>
             </td> 
            </tr>
            
          <tr><td colspan="2">
            
             <table id="AddMoreContactBP2" style="display:none">
            
             <tr><td>Enter name:</td><td><input type="text" name="editcontactname_3"/></td></tr>
             <tr><td>Enter email-id:</td><td><input type="text" name="editcontactemail_3"/></td></tr>
             <tr><td>Enter phone:</td><td><input type="text" name="editcontactphone_3"/></td></tr>
             <tr><td>Enter faxNo:</td><td><input type="text" name="editfaxno_3"/>&nbsp; <a href="javascript:;" onClick="toggleVARetainerAddMoreContactBP3('AddMoreContactBP3');"><span  id="AddMoreContactlink3">Add More</span></a></td>   
            </tr>
            
             </table>
             </td> 
            </tr>
            
            
         <tr><td colspan="2">
            
             <table  id="AddMoreContactBP3" style="display:none">
            
             <tr><td>Enter name:</td><td><input type="text" name="editcontactname_4"/></td></tr>
             <tr><td>Enter email-id:</td><td><input type="text" name="editcontactemail_4"/></td></tr>
             <tr><td>Enter phone:</td><td><input type="text" name="editcontactphone_4"/></td></tr>
             <tr><td>Enter faxNo:</td><td><input type="text" name="editfaxno_4"/>&nbsp;<a href="javascript:;" onClick="toggleVARetainerAddMoreContactBP4('AddMoreContactBP4');"><span  id="AddMoreContactlink4">Add More</span></a></td>  
            
            
            </tr>
             </table>
             </td> 
            </tr>
            <tr><td colspan="2">
            
             <table id="AddMoreContactBP4" style="display:none">
            
             <tr><td>Enter name:</td><td><input type="text" name="editcontactname_5"/></td></tr>
             <tr><td>Enter email-id:</td><td><input type="text" name="editcontactemail_5"/></td></tr>
             <tr><td>Enter phone:</td><td><input type="text" name="editcontactphone_5"/></td></tr>
             <tr><td>Enter faxNo:</td><td><input type="text" name="editfaxno_5"/>&nbsp; <!--<a href="javascript:;" onClick="toggleVARetainerAddMoreContactBP5('AddMoreContactBP5');"><span  id="AddMoreContactlink5">Add More</span></a>--></td>  
             </tr>
             </table>
             </td> 
            </tr>

                 <tr>
           
             <td height="25">&nbsp;</td>
              <td height="25"><button type="submit" name="addcompanydetails" value="Editcompanydetails">Editcompanydetails</button>

              </tr>
       
            </table>
            
      
            </form>
            
			
		
			<% End If %>
	
            </td>
			
          </tr>
      </table>
   </div></td>
</tr>
</table>
<% 

End If %>

</Body>
<!-- Body Ends -->
