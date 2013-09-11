<!--#include virtual="/QuoteWerks/includes/header.asp"-->
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->


<head>


<% 
 dim vv
'If not Session("userName") then redirect to  login page'
	vv=0
	response.Write(session(qid_edit))
	session("first_ship") = 0
	session("first_ship")=vv
	If Session("QWUserName") = "" Then 
		Response.Redirect("default.asp")
		
	Else if session("first_ship") = 0 then
	dim a,b,c,d,e,f
    SET Rs1 = Server.CreateObject("ADODB.Recordset")	

	strCompany="select soldtoAddress a ,shiptoAddress b ,billtoAddress c from QW_QuoteOverview where quoteId='"&Session("qid_edit")&"'"
     
		 
		 Rs1.open strCompany,ConnObj
		 
		' response.write strCompany
										
			do until Rs1.EOF 
		    a=Rs1("a")   	 
			b=Rs1("b")
			c=Rs1("c")
			Rs1.movenext
		    
			  loop 
			' response.write a & b & c 
			
			   d=Split(a,"!")
			
			   e=Split(b,"!")
			   f=Split(c,"!")
			  response.write  trim(e(6))
			    i=trim(d(0)) 'comp name
				j=trim(d(1))  'name
				k=trim(d(2)) ' address
				l=trim(d(3))' email
				m=trim(d(4)) 'ph
				n=trim(d(5))  'fax
'				o=trim(d(6))  'sold
				p=trim(e(1))
				q=trim(e(2))
				r=trim(e(3))
				s=trim(e(4))
				t=trim(e(5))
				i=trim(e(6))
				j=trim(f(6))
			   response.Write(f(6))
			    end if
			  end if
			  
			   %>
    





<link href="/QuoteWerks/css/leftNavi.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/form.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/mainContent.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.7.1.min.js"></script>
<script language="JavaScript" type="text/javascript" src="js/company1.js"></script>


<script>


function findCompany1()
{
findCompany();
alert("hh")
}

function get_address(x)
{
var dest=""
 dest = document.getElementById('soldcompanyaddress_1');
 
//alert("hello")
			for(var count=0; count < dest.options.length; count++)
			{
//alert("fe")
				if(dest.options[count].value == x ) 
				{
						var optionl = dest.options[count];

						optionl.selected = true;
						break;
				}

			}

}
function find_ship_name(x)
{
var dest="";
dest = document.getElementById('soldcontactname_2');
 
//alert("<%=trim(e(6))%>")


			for(var count=0; count < dest.options.length; count++)
			{
//alert("fe"+dest.options[count].value)
				if(dest.options[count].text == x ) 
				{
						var optionl = dest.options[count];
//alert("fe"+dest.options[count].value)
						optionl.selected = true;
						//findcontactAddress22(dest.options[count].value,"<%=trim(e(6))%>","<%=trim(f(6))%>")
						
						
	/*if(document.getElementById('soldCheckbox').checked==true)
	{
		alert("yes")
		findShipAddress55(document.getElementById("company").value);
		
        
	}*/
						break;
				}

			}



}

function find_ship_add(x)
{
var dest="";
dest = document.getElementById("soldcompanyaddress_2");
alert(dest.options.length)
			for(var count=0; count < dest.options.length; count++)
			{
alert("fe"+dest.options[count].value)
				if(dest.options[count].value == x ) 
				{
						var optionl = dest.options[count];
          alert("fe"+dest.options[count].value)
						optionl.selected = true;
						//findcontactAddress22(dest.options[count].value,"<%=trim(e(6))%>","<%=trim(f(6))%>")
						break;
				}

			}

}

function get_name(x)
{
var dest="";
dest = document.getElementById('soldcontactname_1');
 
//alert("<%=trim(e(6))%>")


			for(var count=0; count < dest.options.length; count++)
			{
//alert("fe"+dest.options[count].value)
				if(dest.options[count].text == x ) 
				{
						var optionl = dest.options[count];
//alert("fe"+dest.options[count].value)
						optionl.selected = true;
						findcontactAddress22(dest.options[count].value,"<%=trim(e(6))%>","<%=trim(f(6))%>")
	if(document.getElementById('soldCheckbox').checked==true)
	{
		alert("yes")
		findShipAddress55(document.getElementById("company").value);
		
        
	}
						break;
				}

			}

}



function findShipAddress55(address)
{ 

   if(document.getElementById('soldCheckbox').checked==true){
	document.getElementById("txtHint1").style.visibility="visible"
document.getElementById('shiptoOldCheckBox').checked=false;
	document.getElementById('shiptoOld').style.display="none"
	var company;
company = document.getElementById('getCompanyId').value;



xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url="getshippingDetails.asp";
url=url+"?company="+company;


//alert(url);
xmlHttp.onreadystatechange=stateChanged111;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
   }
   else
   {

//	alert("bjmkhj")
	document.getElementById("txtHint1").style.visibility="hidden"
  if(document.getElementById("billCheckbox2").checked==true)
  {
	  document.getElementById("billCheckbox2").checked=false
      showThisBillToOld11()
  }
   }
}



function stateChanged111() 
{ 
if (xmlHttp.readyState==4)
{ 
document.getElementById("txtHint1").innerHTML=xmlHttp.responseText;
document.getElementById('txtHint1').style.display="block"
	    find_ship_add("<%=e(2)%>");
		find_ship_name("<%=e(1)%>");
		findcontactAddress('X')
		findShipDetailsxxx('x');
}
}

function GetXmlHttpObject()
{
var xmlHttp=null;
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  document.getElementById('txtHint1').style.display="block"
	    find_ship_add("<%=e(2)%>");
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
  }
return xmlHttp;



}





function findCompany()
{ 
//alert('hi');
	
//alert(companyname);

companyname=document.getElementById('company').value;
if ((document.getElementById('company').value == ''))
{
    alert("Please Select the company");
	document.getElementById('company').focus();
	return(false);
}


if (companyname != "")
{
	
}
	
xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url="getcompanyDetails.asp";
url=url+"?company="+companyname;

//alert(url);
xmlHttp.onreadystatechange=stateChanged;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}

function stateChanged() 
{ 
if (xmlHttp.readyState==4)
{ 
document.getElementById("txtHint").innerHTML=xmlHttp.responseText;

get_address("<%=trim(d(2))%>");
get_name("<%=trim(d(1))%>")

}
}

function findCompany2()
{ 
//alert('hi');
	
//alert(companyname);

companyname=document.getElementById('company').value;
if ((document.getElementById('company').value == ''))
{
    alert("Please Select the company");
	document.getElementById('company').focus();
	return(false);
}


if (companyname != "")
{
	
}
	
xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url="getcompanyDetails.asp";
url=url+"?company="+companyname;

//alert(url);
xmlHttp.onreadystatechange=stateChangedw3;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}

function stateChangedw3() 
{ 
if (xmlHttp.readyState==4)
{ 
document.getElementById("txtHint").innerHTML=xmlHttp.responseText;


}
}







function GetXmlHttpObject()
{
var xmlHttp=null;
try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
  }
return xmlHttp;
}



function Backcategory()

{
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
    fax1=fax
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
 fax1=document.getElementById('soldfaxno_2').value 
 
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
    fax2=fax;
}
else if(document.getElementById("billCheckbox2").checked==true)
{
      bill_cname= ship_cname
	bill_add=ship_add
	bill_name1=ship_name1
   email2=email1
	ph2=ph1
    fax2=fax1;
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
fax2=document.getElementById("billselectfax_1").value

}
else
{
alert("Sorry!Please select the Bill to address")
return false;

}
var form = document.createElement("form");
 form.setAttribute("method", "post"); 
form.setAttribute("action", "add_editviewquote1.asp");
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
	document.getElementById("shiptoOld").innerHTML=document.getElementById("soldaddressdisp").innerHTML;
	//document.getElementById('soldCheckbox').checked=false;
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
	//document.getElementById('billCheckbox2').checked=false;
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
	document.getElementById("billToShip").innerHTML=document.getElementById("txtHint4").innerHTML;
	//document.getElementById('billCheckbox1').checked=false;
	document.getElementById('billToOld').style.display="none"
	document.getElementById('billCheckbox3').checked=false;
	document.getElementById('txtHint2').innerHTML=""
	 
     }
	 else
	 {
	 alert("Please select the Ship to tab!")
	 document.getElementById('billCheckbox2').checked=false;
	// document.getElementById('txtHint2').innerHTML="
	 }
	}
  catch (e)
    {
	alert("Please add the company details in Ship to Tab")
	document.getElementById('billCheckbox2').checked=false
    //htmlstring="
	}
    
 //  htmlstring = (htmlstring.trim) ? htmlstring.trim() :? htmlstring.replace(/^\s+/,'');
   //if(document.getElementById("shipaddaddressdisp").innerHTML.trim()=="){
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

  


</head>


<!-- Body Starts -->
<body style="margin-top:0px" onLoad="findCompany();">
<%


%>


<tr>
  <td width="170px" align="left" valign="top" style=" border-right:#CCC thin solid;">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftNavigation" >
      <!--#include virtual="/QuoteWerks/includes/LeftMenu.asp"-->
    </table></td>
  <td align="center" valign="top" height="450px">
 
  <div id="styledForm" class="myform">
  
  
   <form action=" name="abc" method="post">
   
      <table width="100%" align="center" border="0" cellpadding="7">
      <tr><td colspan="2" >Sold To</td>
      <td>Ship To</td>
      <td>Bill To</td></tr>
    
    
      <tr>
      <td width="50">Company Name:</td><td width="100">
      
      				
                    <select name="company" id="company"    onChange="findCompany();">
                    
					<option value="Select">--Select--</option>
                    <% 
					SET Rs = Server.CreateObject("ADODB.Recordset")
					strCompany = "SELECT compId,CompName FROM QW_Company"
					Rs.open strCompany,ConnObj
										
					do until Rs.EOF %>
					<option  <% If trim(d(0)) = Rs("CompName") Then %> selected="selected" <% End If %>  value="<% =Rs("compId") %>"><% = Rs("CompName") %> </option>
            
			<% 
			   Rs.movenext
		       loop %>
      
      
      </select></td>
      
      
 </form>
 
 
 <td width="200"><input type="checkbox"  size="20" value="1"  id="shiptoOldCheckBox"   onClick="showThisShipToOld()"/>&nbsp;&nbsp;Same as sold address<br/><br/>
 <div id="shiptoOld" style="background-color: rgb(239, 239, 239); border: 1px rgb(191, 191, 191); display: block;" ></div>
 
 </td>
    
      
<td width="200"><input type="checkbox" name="billCheckbox1"   id="billCheckbox1"  size="20"  onClick="showThisBillToOld()"/>&nbsp;&nbsp;Same as sold address <br/><br/><br/><div  id="billToOld" style="background-color:#efefef;width:70;border:#bfbfbf 1px;"></div>
</td>
</tr>

      
      
<tr><td colspan="2"  id="txtHint">





</td>

<td width="200"><input type="checkbox" name="soldCheckbox"  id="soldCheckbox" size="20" onClick="findShipAddress(this.value);"/>&nbsp;&nbsp; Add new address</td>

<td width="200"><input type="checkbox" name="billCheckbox2" id="billCheckbox2" size="20" onClick="showThisBillToOld1()"/>&nbsp;&nbsp; Same as ship to <br/><br/>
 <div  id="billToShip"></div>
</td>
   </tr>
<td>

</td>




<tr><td colspan="2"></td><td></td><td width="200"><input type="checkbox" name="billCheckbox3"  id="billCheckbox3" size="20" onClick="findBillAddress(this.value);"/>&nbsp;&nbsp; Add new Address</td>

</tr>

     
      
<tr><td colspan="2" id="txtHint6"></td><td id="txtHint1"></td><td id="txtHint2"></td></tr>

<tr><td colspan="2"></td><td id="txtHint4"></td></td><td id="txtHint5"></td></tr>
      
      
   
      
      
</tr> </table>
<table> <tr>
      <td height="25">&nbsp;</td>
      <td height="25"><!--<button type="submit" name="type" onClick="Backcategory();" value="Back">Back</button>-->
        <button type="button" onClick="return Next();"  value="Next">Next</button>
        
       
        </td>
    </tr></table>
      
      
   </div></td>
   
   
</tr>
</table>
<%
if session("first_ship") = 0 then
if trim(e(6))="sold"   then
			
			       %>
			   <script> 
			   document.getElementById('shiptoOldCheckBox').checked=true;
			    </script>
			   <%
			   else if trim(e(6))="new"  then
			%>
			   <script>
			  document.getElementById('soldCheckbox').checked=true;
			 		</script>
			  <%
		end if
		end if	
				
			  if trim(f(6))="sold"   then
			   %>
			   <script> 
			   document.getElementById('billCheckbox1').checked=true;
			    </script>
			   <%
			   else if trim(f(6))="ship"  then
			   %>
			   <script>
			   document.getElementById('billCheckbox2').checked=true;
			   
			 		</script>
			  <%
			   else if trim(f(6))="new"  then
			   %>
			   <script>
			   document.getElementById('billCheckbox3').checked=true;
	
			 		</script>
			   <%
		'	response.write(f(6))   
			   vv=1
			   'session("first_ship")=vv
			  session("first_ship") = vv
			   end if
			   end if
			   end if
			
			 end if
%>
<script>

	  	window.onload = findCompany1;
	
	  
</scrpit>
<%

%>
</Body>
<!-- Body Ends -->
