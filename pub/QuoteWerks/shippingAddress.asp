<!--#include virtual="/QuoteWerks/includes/header.asp"-->
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->


<head>

<link href="/QuoteWerks/css/leftNavi.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/form.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/mainContent.css" rel="stylesheet" type="text/css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script language="JavaScript" type="text/javascript" src="js/company.js"></script>


<script>
function Backcategory()

{
alert("hello")
window.location="/QuoteWerks/Category-Itemrecords.asp"
}

function Next()

{
	                  if(document.getElementById("company").value=="Select")
	
							   {
	                             alert("Please select Company Name")
								 return false;
							   }
var sold_cname,sold_add,sold_name1,email,ph,fax;
var ship_cname,ship_add,ship_name1,email1,ph1,fax1;
var bill_cname,bill_add,bill_name1,email2,ph2,fax2;

 sold_cname=document.getElementById("soldcompanyname").value
 var z=document.getElementById("soldcompanyaddress_1")

 sold_add=z.options[z.selectedIndex].innerHTML;

 var y = document.getElementById('soldcontactname_1');

 sold_name1=y.options[y.selectedIndex].innerHTML;
email=document.getElementById('soldcontactemail_1').value
ph=document.getElementById('soldcontactphone_1').value
fax=document.getElementById('soldfaxno_1').value
if(document.getElementById("shiptoOldCheckBox").checked==true)
{
    ship_cname= sold_cname
	ship_add=sold_add
	ship_name1=sold_name1
	email1=email
	ph1=ph
    fax1=fax+" !sold"
}
else if(document.getElementById("soldCheckbox").checked==true)
{
ship_cname=document.getElementById("shipcompanyname").value
 var c=document.getElementById("soldcompanyaddress_2")
 ship_add=c.options[c.selectedIndex].innerHTML;
 var y=document.getElementById("soldcontactname_2").value
  ship_name1=y.options[y.selectedIndex].innerHTML;
  //var email_id=
 email1=document.getElementById('soldcontactemail_2').value
 ph1=document.getElementById('soldcontactphone_2').value 
 fax1=document.getElementById('soldfaxno_2').value+" !new" 
 
}
else
{
alert("Sorry!Please select the Ship to address")
return false;
}

if(	document.getElementById("billCheckbox1").checked==true)
{
    bill_cname= sold_cname
	bill_add=sold_add
	bill_name1=sold_name1
    email2=email
	ph2=ph
    fax2=fax+" !sold";
}
else if(document.getElementById("billCheckbox2").checked==true)
{
      bill_cname= ship_cname
	bill_add=ship_add
	bill_name1=ship_name1
   email2=email1
	ph2=ph1
    fax2=fax1+" !ship";
}
else if(document.getElementById("billCheckbox3").checked==true)
{
bill_cname=document.getElementById("billcompanyname").value
 var ww=document.getElementById("billselectcompanyaddress_1")
 bill_add=ww.options[ww.selectedIndex].innerHTML;
 var x11=document.getElementById("billselectcontactname_1").value
  bill_name1=x11.options[x11.selectedIndex].innerHTML;
email2=document.getElementById("billcontactemail_1").value
ph2=document.getElementById("billselectcontactphone_1").value
fax2=document.getElementById("billselectfax_1").value+" !new"

}
else
{
alert("Sorry!Please select the Bill to address")
return false;

}
var form = document.createElement("form");
 form.setAttribute("method", "post"); 
form.setAttribute("action", "addeditviewquote.asp");
//form.setAttribute("action", "next_page.asp");

// setting form target to a window named 'formresult'
//form.setAttribute("target", "formresult");

//var sold_cname,sold_add,sold_name1;
//var ship_cname,ship_add,ship_name1;
//var bill_cname,bill_add,bill_name1
var hiddenField1 = document.createElement("input");              
hiddenField1.setAttribute("type", "hidden");
hiddenField1.setAttribute("name", "sold_cname");
hiddenField1.setAttribute("value", sold_cname);

var hiddenField2 = document.createElement("input");              
hiddenField2.setAttribute("type", "hidden");
hiddenField2.setAttribute("name", "sold_add");
hiddenField2.setAttribute("value", sold_add);
var hiddenField3 = document.createElement("input");              
hiddenField3.setAttribute("type", "hidden");
hiddenField3.setAttribute("name", "sold_name1");
hiddenField3.setAttribute("value", sold_name1);

var hiddenField33 = document.createElement("input");              
hiddenField33.setAttribute("type", "hidden");
hiddenField33.setAttribute("name", "email");
hiddenField33.setAttribute("value", email);

var hiddenField44 = document.createElement("input");              
hiddenField44.setAttribute("type", "hidden");
hiddenField44.setAttribute("name", "ph");
hiddenField44.setAttribute("value", ph);


var hiddenField_fax = document.createElement("input");              
hiddenField_fax.setAttribute("type", "hidden");
hiddenField_fax.setAttribute("name", "fax");
hiddenField_fax.setAttribute("value",fax);



var hiddenField4 = document.createElement("input");              
hiddenField4.setAttribute("type", "hidden");
hiddenField4.setAttribute("name", "ship_cname");
hiddenField4.setAttribute("value", ship_cname);

var hiddenField5 = document.createElement("input");              
hiddenField5.setAttribute("type", "hidden");
hiddenField5.setAttribute("name", "ship_add");
hiddenField5.setAttribute("value", ship_add);

var hiddenField6 = document.createElement("input");              
hiddenField6.setAttribute("type", "hidden");
hiddenField6.setAttribute("name", "ship_name1");
hiddenField6.setAttribute("value", ship_name1);

var hiddenField66 = document.createElement("input");              
hiddenField66.setAttribute("type", "hidden");
hiddenField66.setAttribute("name", "email1");
hiddenField66.setAttribute("value", email1);

var hiddenField77 = document.createElement("input");              
hiddenField77.setAttribute("type", "hidden");
hiddenField77.setAttribute("name", "ph1");
hiddenField77.setAttribute("value", ph1);


var hiddenField_fax1 = document.createElement("input");              
hiddenField_fax1.setAttribute("type", "hidden");
hiddenField_fax1.setAttribute("name", "fax1");
hiddenField_fax1.setAttribute("value",fax1);


var hiddenField7 = document.createElement("input");              
hiddenField7.setAttribute("type", "hidden");
hiddenField7.setAttribute("name", "bill_cname");
hiddenField7.setAttribute("value", bill_cname);

var hiddenField8 = document.createElement("input");              
hiddenField8.setAttribute("type", "hidden");
hiddenField8.setAttribute("name", "bill_add");
hiddenField8.setAttribute("value", bill_add);

var hiddenField9 = document.createElement("input");              
hiddenField9.setAttribute("type", "hidden");
hiddenField9.setAttribute("name", "bill_name1");
hiddenField9.setAttribute("value", bill_name1);



var hiddenField10 = document.createElement("input");              
hiddenField10.setAttribute("type", "hidden");
hiddenField10.setAttribute("name", "email2");
hiddenField10.setAttribute("value", email2);

var hiddenField99 = document.createElement("input");              
hiddenField99.setAttribute("type", "hidden");
hiddenField99.setAttribute("name", "ph2");
hiddenField99.setAttribute("value", ph2);


var hiddenField_fax2 = document.createElement("input");              
hiddenField_fax2.setAttribute("type", "hidden");
hiddenField_fax2.setAttribute("name", "fax2");
hiddenField_fax2.setAttribute("value",fax2);

form.appendChild(hiddenField1);
form.appendChild(hiddenField2);
form.appendChild(hiddenField3);
form.appendChild(hiddenField4);
form.appendChild(hiddenField5);
form.appendChild(hiddenField6);
form.appendChild(hiddenField7);
form.appendChild(hiddenField8);
form.appendChild(hiddenField9);

form.appendChild(hiddenField33);
form.appendChild(hiddenField44);
form.appendChild(hiddenField66);
form.appendChild(hiddenField77);
form.appendChild(hiddenField10);
form.appendChild(hiddenField99);

form.appendChild(hiddenField_fax);
form.appendChild(hiddenField_fax1);
form.appendChild(hiddenField_fax2);

//form.appendChild(hiddenField);



document.body.appendChild(form);
form.submit();
  		


		
//window.location="/QuoteWerks/addeditviewquote.asp"
}

</script>
<script type="text/javascript">

function toggleVARetainerAddMoreBP1(AddMoreBP1){
	//alert("hi");
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
		document.getElementById('AddMorelinkContact1').style.display = 'none';
		}else{
		document.getElementById(AddMoreContactBP1).style.display = 'none';
		document.getElementById('AddMoreContactlink1').style.display = 'block';
		}
 

}

function toggleVARetainerAddMoreContactBP2(AddMoreContactBP2){
		if(document.getElementById(AddMoreContactBP2).style.display == 'none'){
		document.getElementById(AddMoreContactBP2).style.display = 'table-row';
		document.getElementById('AddMorelinkContact2').style.display = 'none';
		}else{
		document.getElementById(AddMoreContactBP2).style.display = 'none';
		document.getElementById('AddMoreContactlink2').style.display = 'block';
		}
 

}

function toggleVARetainerAddMoreContactBP3(AddMoreContactBP3){
		if(document.getElementById(AddMoreContactBP3).style.display == 'none'){
		document.getElementById(AddMoreContactBP3).style.display = 'table-row';
		document.getElementById('AddMorelinkContact3').style.display = 'none';
		}else{
		document.getElementById(AddMoreContactBP3).style.display = 'none';
		document.getElementById('AddMoreContactlink3').style.display = 'block';
		}
 

}


function toggleVARetainerAddMoreContactBP4(AddMoreContactBP4){
		if(document.getElementById(AddMoreContactBP4).style.display == 'none'){
		document.getElementById(AddMoreContactBP4).style.display = 'table-row';
		document.getElementById('AddMorelinkContact4').style.display = 'none';
		}else{
		document.getElementById(AddMoreContactBP4).style.display = 'none';
		document.getElementById('AddMoreContactlink4').style.display = 'block';
		}
 

}


function toggleVARetainerAddMoreContactBP5(AddMoreContactBP5){
		if(document.getElementById(AddMoreContactBP5).style.display == 'none'){
		document.getElementById(AddMoreContactBP5).style.display = 'table-row';
		document.getElementById('AddMorelinkContact5').style.display = 'none';
		}else{
		document.getElementById(AddMoreContactBP5).style.display = 'none';
		document.getElementById('AddMoreContactlink5').style.display = 'block';
		}
 

}

//brijesh
function showThisShipToOld(){
if(document.getElementById('shiptoOldCheckBox').checked==true)
   {
   
	document.getElementById("shiptoOld").style.display="block"
	document.getElementById("shiptoOld").innerHTML=document.getElementById("soldaddressdisp").innerHTML;
	document.getElementById('soldCheckbox').checked=false;
	document.getElementById('txtHint1').innerHTML=""
	document.getElementById('txtHint4').innerHTML=""
   }
	else if(document.getElementById('shiptoOldCheckBox').checked==false)
 	{
   //	document.getElementById("shiptoOld").style.display="block"
	document.getElementById("shiptoOld").innerHTML=""//document.getElementById("soldaddressdisp").innerHTML;
	document.getElementById('soldCheckbox').checked=false;
	document.getElementById('txtHint1').innerHTML=""
	document.getElementById('txtHint4').innerHTML=""
 	}	
 	
}

function showThisBillToOld(){
if(document.getElementById('billCheckbox1').checked==true)
   {
     
	document.getElementById('billCheckbox2').checked=false;
	document.getElementById("billToOld").style.display="block"
	document.getElementById("billToOld").innerHTML=document.getElementById("soldaddressdisp").innerHTML;

	document.getElementById('billToShip').style.display="none"
	document.getElementById('billCheckbox3').checked=false;
	document.getElementById('txtHint2').innerHTML=""
  
}
  else if(document.getElementById('billCheckbox1').checked==false)
   {
     //document.getElementById("billToOld").style.display="block"
	document.getElementById("billToOld").innerHTML="";//document.getElementById("soldaddressdisp").innerHTML;
	document.getElementById('billCheckbox2').checked=false;
	document.getElementById('billToShip').style.display="none"
	document.getElementById('billCheckbox3').checked=false;
	document.getElementById('txtHint2').innerHTML=""
   }
}
function showThisBillToOld1(){

   try
    {
  if(document.getElementById('billCheckbox2').checked==true)
   {
   
   
   if(document.getElementById('shiptoOldCheckBox').checked==true)
	{
	
	document.getElementById("billToShip").style.display="block"
	document.getElementById("billToShip").innerHTML=document.getElementById("shiptoOld").innerHTML;
	document.getElementById('billCheckbox1').checked=false;
	document.getElementById('billToOld').style.display="none"
	document.getElementById('billCheckbox3').checked=false;
	document.getElementById('txtHint2').innerHTML=""
	}
	
	else if(document.getElementById('soldCheckbox').checked==true)
	{
	   var shipcompanyname;
shipcompanyname = document.getElementById('shipcompanyname').value;

var selectshipaddress_1;
selectshipaddress_1 = document.getElementById('soldcompanyaddress_2').value;

var selectcontactname_1;
selectcontactname_1 = document.getElementById('soldcontactname_2').value;

var contactemail_1;
contactemail_1 = document.getElementById('soldcontactemail_2').value;

var selectcontactphone_1;
selectcontactphone_1 = document.getElementById('soldcontactphone_2').value;


var Submit;
Submit = document.getElementById('ship').value;


if(selectcontactname_1!="Select"  && contactemail_1!="Select" && selectcontactphone_1 !="Select"  )
{
    document.getElementById("billToShip").style.display="block"
	document.getElementById("billToShip").innerHTML=document.getElementById("shipaddaddressdisp").innerHTML;
	document.getElementById('billCheckbox1').checked=false;
	document.getElementById('billToOld').style.display="none"
	document.getElementById('billCheckbox3').checked=false;
	document.getElementById('txtHint2').innerHTML=""
	
}	
else
{
alert("Please add the company details in Ship to Tab")
	
}   
}	   
	} 
	   
 
	else if(document.getElementById('billCheckbox2').checked==false)
     {
	//document.getElementById("billToShip").style.display="block"
	document.getElementById("billToShip").innerHTML=""//=document.getElementById("txtHint4").innerHTML;
	document.getElementById('billCheckbox1').checked=false;
	document.getElementById('billToOld').style.display="none"
	document.getElementById('billCheckbox3').checked=false;
	document.getElementById('txtHint2').innerHTML=""
	 
     }
	 else
	 {
	 alert("Please select the Ship to tab!")
	 document.getElementById('billCheckbox2').checked=false;
	// document.getElementById('txtHint2').innerHTML=""
	 }
	}
  catch (e)
    {
	alert("Please add the company details in Ship to Tab")
	document.getElementById('billCheckbox2').checked=false
    //htmlstring=""
	}
    
 //  htmlstring = (htmlstring.trim) ? htmlstring.trim() :? htmlstring.replace(/^\s+/,'');
   //if(document.getElementById("shipaddaddressdisp").innerHTML.trim()==""){
 //
  
}
</script>


<style type="text/css">
.quote-box {
background: #efefef;
border: #bfbfbf 1px solid;
padding: 10px 0px 10px 8px;
width:300px;
}
</style>


<% 
'If not Session("userName") then redirect to  login page'
	If Session("QWUserName") = "" Then 
		Response.Redirect("default.asp")
	Else
	

	
%>

</head>


<!-- Body Starts -->
<body style="margin-top:0px">



<tr>
  <td width="170px" align="left" valign="top" style=" border-right:#CCC thin solid;">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftNavigation" >
      <!--#include virtual="/QuoteWerks/includes/LeftMenu.asp"-->
    </table></td>
  <td align="center" valign="top" height="450px">
 
  <div id="styledForm" class="myform">
  
  
   <form  method="post" >
   
      <table width="100%" align="center" border="0" cellpadding="7">
      <tr><td colspan="2" >Sold To</td>
      <td>Ship To</td>
      <td>Bill To</td></tr>
    
    
      <tr>
      <td width="50">Company Name:</td><td width="100">
      
      				
                    <select name="company" id="company" onChange="findCompany(this.value);">
                    
					<option value="Select">--Select--</option>
                    <% 
					SET Rs = Server.CreateObject("ADODB.Recordset")
					strCompany = "SELECT compId,CompName FROM QW_Company"
					Rs.open strCompany,ConnObj
										
					do until Rs.EOF %>
					<option value="<% =Rs("compId") %>"><% = Rs("CompName") %> </option>
            
			<% 
			   Rs.movenext
		       loop %>
      
      
      </select></td>
      
      
 </form>
 
 
 <td width="200"><input type="checkbox"  size="20" value="1"  id="shiptoOldCheckBox" disabled="disabled" onClick="showThisShipToOld()"/>&nbsp;&nbsp;Same as sold address<br/><br/>
 <div id="shiptoOld" style="background-color: rgb(239, 239, 239); border: 1px rgb(191, 191, 191); display: block;" ></div>
 
 </td>
      
      
<td width="200"><input type="checkbox" name="billCheckbox1"  id="billCheckbox1" size="20" disabled="disabled" onClick="showThisBillToOld()"/>&nbsp;&nbsp;Same as sold address <br/><br/><br/><div  id="billToOld" style="background-color:#efefef;width:70;border:#bfbfbf 1px;"></div>
</td>
</tr>

      
      
<tr><td colspan="2"  id="txtHint">


</td>

<td width="200"><input type="checkbox" name="soldCheckbox" disabled="disabled" id="soldCheckbox" disabled="disabled" size="20" onClick="findShipAddress(this.value);"/>&nbsp;&nbsp; Add new address</td>

<td width="200"><input type="checkbox" name="billCheckbox2" id="billCheckbox2" disabled="disabled" size="20" onClick="showThisBillToOld1()"/>&nbsp;&nbsp; Same as ship to <br/><br/>
 <div  id="billToShip"></div>
</td>
   </tr>
<td>

</td>




<tr><td colspan="2"></td><td></td><td width="200"><input type="checkbox" name="billCheckbox3" disabled="disabled" id="billCheckbox3" size="20" onClick="findBillAddress(this.value);"/>&nbsp;&nbsp; Add new Address</td>

</tr>

     
      
<tr><td colspan="2" id="txtHint6"></td><td id="txtHint1"></td><td id="txtHint2"></td></tr>

<tr><td colspan="2"></td><td id="txtHint4"></td></td><td id="txtHint5"></td></tr>
      
      
   
      
      
</tr> </table>
<table> <tr>
      <td height="25">&nbsp;</td>
	 <!-- <form action="Category-Itemrecords.asp" method="post">
      <td height="25"><button type="submit" name="type" value="Back">Back</button>
      </form>-->
	  
	    <button type="button" onClick="return Next();"  value="Next">Next</button>
        
       
        </td>
    </tr></table>
      
      
   </div></td>
   
   
</tr>
</table>
<% End If %>

</Body>
<!-- Body Ends -->
