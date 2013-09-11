

var xmlHttp
function Timer(){
	document.getElementById('loader').style.display='none';
	}




function findCompany(companyname)
{ 
//alert('hi');
	
//alert(companyname);


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
var url="edit_company_detals.asp";
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



///////////////////////////////////////////222222222222///////////////////////////////////



function findShipAddress(address)
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
xmlHttp.onreadystatechange=stateChanged1;
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



function stateChanged1() 
{ 
if (xmlHttp.readyState==4)
{ 
document.getElementById("txtHint1").innerHTML=xmlHttp.responseText;
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


// to find out email and ph no

function findcontactAddress(x)
{ 
//	document.getElementById('shiptoOldCheckBox').checked=false;
	//document.getElementById('shiptoOld').style.display="none"

var y = document.getElementById('soldcontactname_1');
//y.options[y.selectedIndex].innerHTML;
var y1 = y.options[y.selectedIndex].innerHTML;

xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
 var url="get_comp_name.asp";
 url=url+"?contact="+x+"&name="+y1;

//alert(url);
xmlHttp.onreadystatechange=stateChanged12;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);

}



function stateChanged12() 
{ 
if (xmlHttp.readyState==4)
{ 
var email="soldcontactemail_1" 
var phone="soldcontactphone_1"
var fax="soldfaxno_1"
//document.getElementById("txtHint1").innerHTML=
//alert(xmlHttp.responseText)
var response=xmlHttp.responseText;

var childEl2 = document.createElement('option'); //create option
    var so = document.getElementById(email);
    while(so.hasChildNodes()) { //removes items from dropdown if some already exist
   
     so.removeChild(so.firstChild);
	
 } 
  var so1 = document.getElementById(phone);
    while(so1.hasChildNodes()) { //removes items from dropdown if some already exist
   
     so1.removeChild(so1.firstChild);
	
 }
 
 
 var so2 = document.getElementById(fax);
    while(so2.hasChildNodes()) { //removes items from dropdown if some already exist
   
     so2.removeChild(so2.firstChild);
	
 }
 
 if(response!="")
 {
	var items = response.split('<br>');
	
    var length = items.length;
  
    //var childEl33 = document.createElement('option'); //create option
  //  var El33 = document.getElementById(email);
    //El33.appendChild(childEl33); //then append it to the second dropdown list
   // childEl33.value = "Select";
    //childEl33.innerHTML = "--Select--";
     
    //var childEl34 = document.createElement('option'); //create option
    //var El34 = document.getElementById(phone);
    //El34.appendChild(childEl34); //then append it to the second dropdown list
    //childEl34.value = "Select";
    //childEl34.innerHTML = "--Select--";
	  //oListBox=null;
	  
	//var childEl35 = document.createElement('option'); //create option
    //var El35 = document.getElementById(fax);
    //El35.appendChild(childEl35); //then append it to the second dropdown list
    //childEl35.value = "Select";
    //childEl35.innerHTML = "--Select--";
	  
	  for(var i=0;i<length-1;i++)
	  {
      myString = items[i];
	  var mySplit = myString.split(",");
	 
     var x=mySplit[0]// code
	 var y=mySplit[1]// value
	 var z=mySplit[2]// value
	 
	// alert(z);
       var childEl = document.createElement('option'); //create option
       var El = document.getElementById(email);
       El.appendChild(childEl); //then append it to the second dropdown list
      childEl.value = x;
      childEl.innerHTML = x;
      
       var childEl1 = document.createElement('option'); //create option
       var El1 = document.getElementById(phone);
       El1.appendChild(childEl1); //then append it to the second dropdown list
       childEl1.value = y;
       childEl1.innerHTML = y;
	   
	   
	   var childEl3 = document.createElement('option'); //create option
       var El3 = document.getElementById(fax);
       El3.appendChild(childEl3); //then append it to the second dropdown list
       childEl3.value = z;
       childEl3.innerHTML = z;
	   
	  
   
       
	  } 
	 
	 
 }
    
}
}






function findcontactAddress22(x)
{ 
//	document.getElementById('shiptoOldCheckBox').checked=false;
	//document.getElementById('shiptoOld').style.display="none"

var y = document.getElementById('soldcontactname_1');
//y.options[y.selectedIndex].innerHTML;
var y1 = y.options[y.selectedIndex].innerHTML;

xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
 var url="get_comp_name.asp";
 url=url+"?contact="+x+"&name="+y1;

//alert(url);
xmlHttp.onreadystatechange=stateChanged121;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);

}



function stateChanged121() 
{ 
if (xmlHttp.readyState==4)
{ 
var email="soldcontactemail_1" 
var phone="soldcontactphone_1"
var fax="soldfaxno_1"
//document.getElementById("txtHint1").innerHTML=
//alert(xmlHttp.responseText)
var response=xmlHttp.responseText;

var childEl2 = document.createElement('option'); //create option
    var so = document.getElementById(email);
    while(so.hasChildNodes()) { //removes items from dropdown if some already exist
   
     so.removeChild(so.firstChild);
	
 } 
  var so1 = document.getElementById(phone);
    while(so1.hasChildNodes()) { //removes items from dropdown if some already exist
   
     so1.removeChild(so1.firstChild);
	
 }
 
 
 var so2 = document.getElementById(fax);
    while(so2.hasChildNodes()) { //removes items from dropdown if some already exist
   
     so2.removeChild(so2.firstChild);
	
 }
 
 if(response!="")
 {
	var items = response.split('<br>');
	
    var length = items.length;
  
    //var childEl33 = document.createElement('option'); //create option
  //  var El33 = document.getElementById(email);
    //El33.appendChild(childEl33); //then append it to the second dropdown list
   // childEl33.value = "Select";
    //childEl33.innerHTML = "--Select--";
     
    //var childEl34 = document.createElement('option'); //create option
    //var El34 = document.getElementById(phone);
    //El34.appendChild(childEl34); //then append it to the second dropdown list
    //childEl34.value = "Select";
    //childEl34.innerHTML = "--Select--";
	  //oListBox=null;
	  
	//var childEl35 = document.createElement('option'); //create option
    //var El35 = document.getElementById(fax);
    //El35.appendChild(childEl35); //then append it to the second dropdown list
    //childEl35.value = "Select";
    //childEl35.innerHTML = "--Select--";
	  
	  for(var i=0;i<length-1;i++)
	  {
      myString = items[i];
	  var mySplit = myString.split(",");
	 
     var x=mySplit[0]// code
	 var y=mySplit[1]// value
	 var z=mySplit[2]// value
	 
	// alert(z);
       var childEl = document.createElement('option'); //create option
       var El = document.getElementById(email);
       El.appendChild(childEl); //then append it to the second dropdown list
      childEl.value = x;
      childEl.innerHTML = x;
      
       var childEl1 = document.createElement('option'); //create option
       var El1 = document.getElementById(phone);
       El1.appendChild(childEl1); //then append it to the second dropdown list
       childEl1.value = y;
       childEl1.innerHTML = y;
	   
	   
	   var childEl3 = document.createElement('option'); //create option
       var El3 = document.getElementById(fax);
       El3.appendChild(childEl3); //then append it to the second dropdown list
       childEl3.value = z;
       childEl3.innerHTML = z;
	   
	  var x='s';
   findcompanyDetails231();
       
	  } 
	 
	 
 }
    
}
}
















function findcontactAddress1(x)
{ 
//	document.getElementById('shiptoOldCheckBox').checked=false;
	//document.getElementById('shiptoOld').style.display="none"

var y = document.getElementById('soldcontactname_2');

var y1 = y.options[y.selectedIndex].innerHTML;

xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
 var url="get_comp_name.asp";
 url=url+"?contact="+x+"&name="+y1;

//alert(url);
xmlHttp.onreadystatechange=stateChanged13;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);

}



function stateChanged13() 
{ 
if (xmlHttp.readyState==4)
{ 
var email="soldcontactemail_2" 
var phone="soldcontactphone_2"
var fax="soldfaxno_2"

//document.getElementById("txtHint1").innerHTML=
//alert(xmlHttp.responseText)
var response=xmlHttp.responseText;

var childEl2 = document.createElement('option'); //create option
       var so = document.getElementById(email);
    while(so.hasChildNodes()) { //removes items from dropdown if some already exist
   
     so.removeChild(so.firstChild);
	
 } 
  var so1 = document.getElementById(phone);
    while(so1.hasChildNodes()) { //removes items from dropdown if some already exist
   
     so1.removeChild(so1.firstChild);
	
 }
 
  var so2 = document.getElementById(fax);
    while(so2.hasChildNodes()) { //removes items from dropdown if some already exist
   
     so2.removeChild(so2.firstChild);
	
 }
 
 if(response!="")
 {
	var items = response.split('<br>');
	
    var length = items.length;
  
    var childEl33 = document.createElement('option'); //create option
       var El33 = document.getElementById(email);
      El33.appendChild(childEl33); //then append it to the second dropdown list
      childEl33.value = "Select";
      childEl33.innerHTML = "--Select--";
     
    var childEl34 = document.createElement('option'); //create option
      var El34 = document.getElementById(phone);
       El34.appendChild(childEl34); //then append it to the second dropdown list
      childEl34.value = "Select";
      childEl34.innerHTML = "--Select--";
	  
	var childEl35 = document.createElement('option'); //create option
       var El35 = document.getElementById(fax);
       El35.appendChild(childEl35); //then append it to the second dropdown list
      childEl35.value = "Select";
      childEl35.innerHTML = "--Select--";
	
	  
	  
	  
	  for(var i=0;i<length-1;i++)
	  {
      myString = items[i];
	  var mySplit = myString.split(",");
	 
     var x=mySplit[0]// code
	 var y=mySplit[1]// value
	 var z=mySplit[2]// value
       var childEl = document.createElement('option'); //create option
       var El = document.getElementById(email);
       El.appendChild(childEl); //then append it to the second dropdown list
      childEl.value = x;
      childEl.innerHTML = x;
      
       var childEl1 = document.createElement('option'); //create option
       var El1 = document.getElementById(phone);
       El1.appendChild(childEl1); //then append it to the second dropdown list
       childEl1.value = y;
       childEl1.innerHTML = y;
	   
	   var childEl2 = document.createElement('option'); //create option
       var El2 = document.getElementById(fax);
       El2.appendChild(childEl2); //then append it to the second dropdown list
       childEl2.value = z;
       childEl2.innerHTML = z;
   
       
	  } 
	 
	 
 }
    
}
}



function findcontactAddress123(x)
{ 
//	document.getElementById('shiptoOldCheckBox').checked=false;
	//document.getElementById('shiptoOld').style.display="none"

var y = document.getElementById('soldcontactname_2');

var y1 = y.options[y.selectedIndex].innerHTML;

xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
 var url="get_comp_name.asp";
 url=url+"?contact="+x+"&name="+y1;

//alert(url);
xmlHttp.onreadystatechange=stateChanged1392;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);

}



function stateChanged1392() 
{ 
if (xmlHttp.readyState==4)
{ 
var email="soldcontactemail_2" 
var phone="soldcontactphone_2"
var fax="soldfaxno_2"

//document.getElementById("txtHint1").innerHTML=
//alert(xmlHttp.responseText)
var response=xmlHttp.responseText;

var childEl2 = document.createElement('option'); //create option
       var so = document.getElementById(email);
    while(so.hasChildNodes()) { //removes items from dropdown if some already exist
   
     so.removeChild(so.firstChild);
	
 } 
  var so1 = document.getElementById(phone);
    while(so1.hasChildNodes()) { //removes items from dropdown if some already exist
   
     so1.removeChild(so1.firstChild);
	
 }
 
  var so2 = document.getElementById(fax);
    while(so2.hasChildNodes()) { //removes items from dropdown if some already exist
   
     so2.removeChild(so2.firstChild);
	
 }
 
 if(response!="")
 {
	var items = response.split('<br>');
	
    var length = items.length;
  
    var childEl33 = document.createElement('option'); //create option
       var El33 = document.getElementById(email);
      El33.appendChild(childEl33); //then append it to the second dropdown list
      childEl33.value = "Select";
      childEl33.innerHTML = "--Select--";
     
    var childEl34 = document.createElement('option'); //create option
      var El34 = document.getElementById(phone);
       El34.appendChild(childEl34); //then append it to the second dropdown list
      childEl34.value = "Select";
      childEl34.innerHTML = "--Select--";
	  
	var childEl35 = document.createElement('option'); //create option
       var El35 = document.getElementById(fax);
       El35.appendChild(childEl35); //then append it to the second dropdown list
      childEl35.value = "Select";
      childEl35.innerHTML = "--Select--";
	
	  
	  
	  
	  for(var i=0;i<length-1;i++)
	  {
		 // alert(i)
      myString = items[i];
	  var mySplit = myString.split(",");
	 
     var x=mySplit[0]// code
	 var y=mySplit[1]// value
	 var z=mySplit[2]// value
       var childEl = document.createElement('option'); //create option
       var El = document.getElementById(email);
       El.appendChild(childEl); //then append it to the second dropdown list
      childEl.value = x;
      childEl.innerHTML = x;
      
       var childEl1 = document.createElement('option'); //create option
       var El1 = document.getElementById(phone);
       El1.appendChild(childEl1); //then append it to the second dropdown list
       childEl1.value = y;
       childEl1.innerHTML = y;
	   
	   var childEl2 = document.createElement('option'); //create option
       var El2 = document.getElementById(fax);
       El2.appendChild(childEl2); //then append it to the second dropdown list
       childEl2.value = z;
       childEl2.innerHTML = z;
   
       
	  } 
	 
	 
 }
	    
}
}









function findShipDetails(x)
{ 
//	document.getElementById('shiptoOldCheckBox').checked=false;
	//document.getElementById('shiptoOld').style.display="none"

var y = document.getElementById('soldcontactname_2');

var y1 = y.options[y.selectedIndex].innerHTML;

xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
 var url="get_comp_name.asp";
 url=url+"?contact="+x+"&name="+y1;

//alert(url);
xmlHttp.onreadystatechange=stateChanged1332;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);

}



function stateChanged1332() 
{ 
if (xmlHttp.readyState==4)
{ 
var email="soldcontactemail_2" 
var phone="soldcontactphone_2"
var fax="soldfaxno_2"

//document.getElementById("txtHint1").innerHTML=
//alert(xmlHttp.responseText)
var response=xmlHttp.responseText;

var childEl2 = document.createElement('option'); //create option
       var so = document.getElementById(email);
    while(so.hasChildNodes()) { //removes items from dropdown if some already exist
   
     so.removeChild(so.firstChild);
	
 } 
  var so1 = document.getElementById(phone);
    while(so1.hasChildNodes()) { //removes items from dropdown if some already exist
   
     so1.removeChild(so1.firstChild);
	
 }
 
  var so2 = document.getElementById(fax);
    while(so2.hasChildNodes()) { //removes items from dropdown if some already exist
   
     so2.removeChild(so2.firstChild);
	
 }
 
 if(response!="")
 {
	var items = response.split('<br>');
	
    var length = items.length;
  
    //var childEl33 = document.createElement('option'); //create option
      // var El33 = document.getElementById(email);
    //   El33.appendChild(childEl33); //then append it to the second dropdown list
      //childEl33.value = "Select";
      //childEl33.innerHTML = "--Select--";
     
    //var childEl34 = document.createElement('option'); //create option
      // var El34 = document.getElementById(phone);
       //El34.appendChild(childEl34); //then append it to the second dropdown list
      //childEl34.value = "Select";
      //childEl34.innerHTML = "--Select--";
	  
	//var childEl35 = document.createElement('option'); //create option
      // var El35 = document.getElementById(fax);
      // El35.appendChild(childEl35); //then append it to the second dropdown list
      //childEl35.value = "Select";
      //childEl35.innerHTML = "--Select--";
	
	  
	  
	  
	  for(var i=0;i<length-1;i++)
	  {
      myString = items[i];
	  var mySplit = myString.split(",");
	 
     var x=mySplit[0]// code
	 var y=mySplit[1]// value
	 var z=mySplit[2]// value
       var childEl = document.createElement('option'); //create option
       var El = document.getElementById(email);
       El.appendChild(childEl); //then append it to the second dropdown list
      childEl.value = x;
      childEl.innerHTML = x;
      
       var childEl1 = document.createElement('option'); //create option
       var El1 = document.getElementById(phone);
       El1.appendChild(childEl1); //then append it to the second dropdown list
       childEl1.value = y;
       childEl1.innerHTML = y;
	   
	   var childEl2 = document.createElement('option'); //create option
       var El2 = document.getElementById(fax);
       El2.appendChild(childEl2); //then append it to the second dropdown list
       childEl2.value = z;
       childEl2.innerHTML = z;
   
       
	  } 
	 
	 
 }
    
}
}












function findcontactAddress2(x)
{ 
//	document.getElementById('shiptoOldCheckBox').checked=false;
	//document.getElementById('shiptoOld').style.display="none"

var y = document.getElementById('billselectcontactname_1');

var y1 = y.options[y.selectedIndex].innerHTML;

xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
 var url="get_comp_name.asp";
 url=url+"?contact="+x+"&name="+y1;

//alert(url);
xmlHttp.onreadystatechange=stateChanged124;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);

}



function stateChanged124() 
{ 
if (xmlHttp.readyState==4)
{ 
var email="billcontactemail_1" 
var phone="billselectcontactphone_1"
var fax="billselectfax_1"
//document.getElementById("txtHint1").innerHTML=
//alert(xmlHttp.responseText)
var response=xmlHttp.responseText;

var childEl2 = document.createElement('option'); //create option
       var so = document.getElementById(email);
    while(so.hasChildNodes()) { //removes items from dropdown if some already exist
   
     so.removeChild(so.firstChild);
	
 } 
  var so1 = document.getElementById(phone);
    while(so1.hasChildNodes()) { //removes items from dropdown if some already exist
   
     so1.removeChild(so1.firstChild);
	
 }
 
  var so2 = document.getElementById(fax);
    while(so2.hasChildNodes()) { //removes items from dropdown if some already exist
   
     so2.removeChild(so2.firstChild);
	
 }
 
 if(response!="")
 {
	var items = response.split('<br>');
	
    var length = items.length;
  
    var childEl33 = document.createElement('option'); //create option
       var El33 = document.getElementById(email);
       El33.appendChild(childEl33); //then append it to the second dropdown list
      childEl33.value = "Select";
      childEl33.innerHTML = "--Select--";
     
    var childEl34 = document.createElement('option'); //create option
       var El34 = document.getElementById(phone);
       El34.appendChild(childEl34); //then append it to the second dropdown list
      childEl34.value = "Select";
      childEl34.innerHTML = "--Select--";
	  
	var childEl35 = document.createElement('option'); //create option
       var El35 = document.getElementById(fax);
       El35.appendChild(childEl35); //then append it to the second dropdown list
      childEl35.value = "Select";
      childEl35.innerHTML = "--Select--";
	  
	  //oListBox=null;
	  for(var i=0;i<length-1;i++)
	  {
      myString = items[i];
	  var mySplit = myString.split(",");
	 
     var x=mySplit[0]// code
	 var y=mySplit[1]// value
	 var z=mySplit[2]// value
       var childEl = document.createElement('option'); //create option
       var El = document.getElementById(email);
       El.appendChild(childEl); //then append it to the second dropdown list
      childEl.value = x;
      childEl.innerHTML = x;
      
       var childEl1 = document.createElement('option'); //create option
       var El1 = document.getElementById(phone);
       El1.appendChild(childEl1); //then append it to the second dropdown list
       childEl1.value = y;
       childEl1.innerHTML = y;
	   
	   var childEl2 = document.createElement('option'); //create option
       var El2 = document.getElementById(fax);
       El2.appendChild(childEl2); //then append it to the second dropdown list
       childEl2.value = z;
       childEl2.innerHTML = z;
   
       
	  } 
	 
	 
 }
    
}
}











//////////////////////////////////////////////////3333333333333333////////////////////////////////


function findBillAddress(address)
{ 
   if(document.getElementById('billCheckbox3').checked==true)
   {
	document.getElementById('billCheckbox2').checked=false;
	document.getElementById('billCheckbox1').checked=false;
	document.getElementById('billToShip').style.display="none"
	document.getElementById('billToOld').style.display="none"

var company;
company = document.getElementById('getBillId').value;

//alert(company);

xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url="getbillingDetails.asp";
url=url+"?company="+company;


//alert(url);
xmlHttp.onreadystatechange=stateChanged2;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);

   }
   else
   {
	document.getElementById("hello3").style.visibility="hidden"   
   }
}



function stateChanged2() 
{ 
if (xmlHttp.readyState==4)
{ 
document.getElementById("txtHint2").innerHTML=xmlHttp.responseText;
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

//////////////////////////////////////////////////4444444444444////////////////////////////////////////////


function findShipDetails(address)
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

var selectfax_1;
selectfax_1 = document.getElementById('soldfaxno_2').value;


var Submit;
Submit = document.getElementById('ship').value;


if(selectcontactname_1!="Select"  && contactemail_1!="Select" && selectcontactphone_1 !="Select" && selectfax_1 !="Select" )
{

xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url="getfulldetails.asp";
url=url+"?shipcompanyname="+shipcompanyname;
url=url+"&selectshipaddress_1="+selectshipaddress_1;
url=url+"&selectcontactname_1="+selectcontactname_1;
url=url+"&contactemail_1="+contactemail_1;
url=url+"&selectcontactphone_1="+selectcontactphone_1;
url=url+"&selectfax_1="+selectfax_1;
url=url+"&Submit="+Submit;



//alert(url);
xmlHttp.onreadystatechange=stateChanged4;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}
else
{
  alert("Please fill up the form!")	
return false;
}


}


function stateChanged4() 

{ 
if (xmlHttp.readyState==4)
{ 
document.getElementById("txtHint4").innerHTML=xmlHttp.responseText;
showThisBillToOld11()
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





function findShipDetailsxxx(address)
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

var selectfax_1;
selectfax_1 = document.getElementById('soldfaxno_2').value;


var Submit;
Submit = document.getElementById('ship').value;


xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url="getfulldetails.asp";
url=url+"?shipcompanyname="+shipcompanyname;
url=url+"&selectshipaddress_1="+selectshipaddress_1;
url=url+"&selectcontactname_1="+selectcontactname_1;
url=url+"&contactemail_1="+contactemail_1;
url=url+"&selectcontactphone_1="+selectcontactphone_1;
url=url+"&selectfax_1="+selectfax_1;
url=url+"&Submit="+Submit;



//alert(url);
xmlHttp.onreadystatechange=stateChanged4xxx;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);


}


function stateChanged4xxx() 

{ 
if (xmlHttp.readyState==4)
{ 
document.getElementById("txtHint4").innerHTML=xmlHttp.responseText;
showThisBillToOld11()
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

//////////////////////////////////////////////////555555555555555////////////////////////////////////////////


function findBillDetails(address)
{ 




var billcompanyname;
billcompanyname = document.getElementById('billcompanyname').value;

var billselectcompanyaddress_1;
billselectcompanyaddress_1 = document.getElementById('billselectcompanyaddress_1').value;

var billselectcontactname_1;
billselectcontactname_1 = document.getElementById('billselectcontactname_1').value;

var billcontactemail_1;
billcontactemail_1 = document.getElementById('billcontactemail_1').value;

var billselectcontactphone_1;
billselectcontactphone_1 = document.getElementById('billselectcontactphone_1').value;

var billselectfax_1;
billselectfax_1 = document.getElementById('billselectfax_1').value;

var Submit;
Submit = document.getElementById('Bill').value;

if(billcompanyname!="" && billselectcompanyaddress_1!="Select" && billselectcontactname_1!="Select" && billcontactemail_1!="Select" && billselectcontactphone_1!="Select"  )
{
xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url="getfulldetails.asp";
url=url+"?billcompanyname="+billcompanyname;
url=url+"&billselectcompanyaddress_1="+billselectcompanyaddress_1;
url=url+"&billselectcontactname_1="+billselectcontactname_1;
url=url+"&billcontactemail_1="+billcontactemail_1;
url=url+"&billselectcontactphone_1="+billselectcontactphone_1;
url=url+"&billselectfax_1="+billselectfax_1;
url=url+"&Submit="+Submit;



//alert(url);
xmlHttp.onreadystatechange=stateChanged5;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
}
else
{
alert("please fill the form!")	
}
}



function stateChanged5() 
{ 
if (xmlHttp.readyState==4)
{ 
document.getElementById("txtHint5").innerHTML=xmlHttp.responseText;
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


//////////////////////////////////////////////////6666666666666////////////////////////////////////////////


function findcompanyDetails()
{ 




var soldcompanyname;
soldcompanyname = document.getElementById('soldcompanyname').value;

var soldcompanyaddress_1,n;
soldcompanyaddress_1 = document.getElementById('soldcompanyaddress_1');
n=soldcompanyaddress_1.options[soldcompanyaddress_1.selectedIndex].innerHTML;
 
var soldcontactname_1,m;
soldcontactname_1 = document.getElementById('soldcontactname_1');
 //var ww=document.getElementById("billselectcompanyaddress_1")
 m=soldcontactname_1.options[soldcontactname_1.selectedIndex].innerHTML;
 
var soldcontactemail_1;
soldcontactemail_1 = document.getElementById('soldcontactemail_1').value;

var soldcontactphone_1;
soldcontactphone_1 = document.getElementById('soldcontactphone_1').value;
//alert(soldcontactphone_1)
var soldfaxno_1;
soldfaxno_1 = document.getElementById('soldfaxno_1').value;

var soldCompId;
soldCompId = document.getElementById('soldCompId').value;


var Submit;
Submit = document.getElementById('Submit').value;

if(soldcontactname_1!="Select" && soldcontactname_1!="Select" && soldcontactemail_1!="Select" && soldcontactphone_1!="Select" &&  soldfaxno_1!="Select" && soldCompId !="")
{

//document.getElementById('txtHint').style.display = "none";

xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url="getfulldetails.asp";
url=url+"?soldcompanyname="+soldcompanyname;
url=url+"&soldcompanyaddress_1="+n;
url=url+"&soldcontactname_1="+m;
url=url+"&soldcontactemail_1="+soldcontactemail_1;
url=url+"&soldcontactphone_1="+soldcontactphone_1;
url=url+"&soldfaxno_1="+soldfaxno_1;
url=url+"&soldCompId="+soldCompId;
url=url+"&Submit="+Submit;



xmlHttp.onreadystatechange=stateChanged6;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
return true
}
else
{
  alert("Please fill the form!")	
return false;
}
}



function stateChanged6() 
{ 
if (xmlHttp.readyState==4)
{ 
//alert(xmlHttp.responseText)

document.getElementById('txtHint6').innerHTML=xmlHttp.responseText;
showThisBillToOld();
showThisShipToOld();
document.getElementById("shiptoOldCheckBox").disabled=false;
document.getElementById("soldCheckbox").disabled=false;
document.getElementById("billCheckbox1").disabled=false;
document.getElementById("billCheckbox2").disabled=false;
//document.getElementById("billCheckbox3").disabled=false;
//document.getElementById("soldCheckbox").disabled=false;



//alert("hello");
}
}

function findcompanyDetails231()
{ 




var soldcompanyname;
soldcompanyname = document.getElementById('soldcompanyname').value;

var soldcompanyaddress_1,n;
soldcompanyaddress_1 = document.getElementById('soldcompanyaddress_1');
n=soldcompanyaddress_1.options[soldcompanyaddress_1.selectedIndex].innerHTML;
 
var soldcontactname_1,m;
soldcontactname_1 = document.getElementById('soldcontactname_1');
 //var ww=document.getElementById("billselectcompanyaddress_1")
 m=soldcontactname_1.options[soldcontactname_1.selectedIndex].innerHTML;
 
var soldcontactemail_1;
soldcontactemail_1 = document.getElementById('soldcontactemail_1').value;

var soldcontactphone_1;
soldcontactphone_1 = document.getElementById('soldcontactphone_1').value;
//alert(soldcontactphone_1)
var soldfaxno_1;
soldfaxno_1 = document.getElementById('soldfaxno_1').value;

var soldCompId;
soldCompId = document.getElementById('soldCompId').value;


var Submit;
Submit = document.getElementById('Submit').value;

if(soldcontactname_1!="Select" && soldcontactname_1!="Select" && soldcontactemail_1!="Select" && soldcontactphone_1!="Select" &&  soldfaxno_1!="Select" && soldCompId !="")
{

//document.getElementById('txtHint').style.display = "none";

xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url="getfulldetails.asp";
url=url+"?soldcompanyname="+soldcompanyname;
url=url+"&soldcompanyaddress_1="+n;
url=url+"&soldcontactname_1="+m;
url=url+"&soldcontactemail_1="+soldcontactemail_1;
url=url+"&soldcontactphone_1="+soldcontactphone_1;
url=url+"&soldfaxno_1="+soldfaxno_1;
url=url+"&soldCompId="+soldCompId;
url=url+"&Submit="+Submit;



xmlHttp.onreadystatechange=stateChanged6;
xmlHttp.open("GET",url,true);
xmlHttp.send(null);
return true
}
else
{
  alert("Please fill the form!")	
return false;
}
}



function stateChanged6() 
{ 
if (xmlHttp.readyState==4)
{ 
//alert(xmlHttp.responseText)

document.getElementById('txtHint6').innerHTML=xmlHttp.responseText;
//showThisBillToOld();
//showThisShipToOld();
//showThisBillToOld1();
//document.getElementById("shiptoOldCheckBox").disabled=false;
//document.getElementById("soldCheckbox").disabled=false;
//document.getElementById("billCheckbox1").disabled=false;
//dcument.getElementById("billCheckbox2").disabled=false;
//document.getElementById("billCheckbox3").disabled=false;
//document.getElementById("soldCheckbox").disabled=false;
if(document.getElementById('shiptoOldCheckBox').checked==true)
   {
   
	document.getElementById("shiptoOld").style.display="block"
	document.getElementById("shiptoOld").innerHTML=document.getElementById("soldaddressdisp").innerHTML;
	document.getElementById('soldCheckbox').checked=false;
	document.getElementById('txtHint1').innerHTML=""
	document.getElementById('txtHint4').innerHTML=""
   }
  else
  /*if(document.getElementById("soldCheckbox").checked==true)
  {
	  findShipAddress('s')
	  findShipDetails('s')
	  
  }*/
  

if(document.getElementById('billCheckbox1').checked==true)
   {
     
	document.getElementById('billCheckbox2').checked=false;
	document.getElementById("billToOld").style.display="block"
	document.getElementById("billToOld").innerHTML=document.getElementById("soldaddressdisp").innerHTML;
document.getElementById("billToOld").style.display="block"
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
	//document.getElementById('billCheckbox3').checked=false;
	document.getElementById('txtHint2').innerHTML=""
   }
    if(document.getElementById('billCheckbox3').checked==true)
   {
     //document.getElementById("billToOld").style.display="block"
	//findBillAddress('d')
	document.getElementById("txtHint2").style.visibility="visible"
   }
   
 /*if(document.getElementById('soldCheckbox').checked==true)
	{
		alert("yes")
		findShipAddress(document.getElementById("company").value);
        document.getElementById('txtHint1').style.display="block"
	}*/
showThisBillToOld11();















//alert("hello");
}
}




function showThisBillToOld11(){

   try
    {
  if(document.getElementById('billCheckbox2').checked==true)
   {
   
   
   if(document.getElementById('shiptoOldCheckBox').checked==true)
	{
	
	document.getElementById("billToShip").style.display="block"
	document.getElementById("billToShip").innerHTML=document.getElementById("shiptoOld").innerHTML;
	document.getElementById('billCheckbox1').checked=false;
	//document.getElementById('billToOld').style.display="none"
	//document.getElementById('billCheckbox3').checked=false;
	document.getElementById('txtHint2').innerHTML=""
	}
	
	else if(document.getElementById('soldCheckbox').checked==true)
	{
		alert("yes")
		findShipAddress(document.getElementById("company").value);
document.getElementById('txtHint1').style.display="block"
		
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
	//document.getElementById('billToOld').style.display="none"
	//document.getElementById('billCheckbox3').checked=false;
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
	//document.getElementById('billToOld').style.display="none"
	//document.getElementById('billCheckbox3').checked=false;
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













// JavaScript Document