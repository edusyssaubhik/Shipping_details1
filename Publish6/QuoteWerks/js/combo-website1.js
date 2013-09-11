 //globals
 var first = "txtwebsite"; //id of first SELECT 
 var second = "txtcountry"; //id of second SELECT
//
 function sendRequest1(url,params,HttpMethod) {
	 
 if(!HttpMethod) { //check if http method is defined, if not, set it to GET
    HttpMethod="GET";
	
 }
 //
 // initialize request object
 req1=null;
 if(window.XMLHttpRequest){
    req1=new XMLHttpRequest; //mozilla/safari
	
 } else if(window.ActiveXObject){
    req1=new ActiveXObject("Microsoft.XMLHTTP"); //internet explorer
 }
 //
 //define callback handler
 if(req1) {
 //
    req1.onreadystatechange=onReadyState1;
    req1.open(HttpMethod,url,true);
    req1.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req1.send(params);
 }
 }
 //
 

 //

 function onReadyState1() {
 //
 var ready1=req1.readyState;
 var data=null;
 if(ready1==4){ //check ready state

    data=req1.responseText; //read response data

    var items = data.split('<br>');
    var length = items.length;

    var childE2 = document.createElement('option'); //create option	
    var E2 = document.getElementById(second);

	E2.appendChild(childE2); //then append it to the second dropdown list
    childE2.value = "";
    childE2.innerHTML = "--Select--";
	   	
    for(var i = 0; i < length-1; i++) {

       var childEl = document.createElement('option'); //create option
       var El = document.getElementById(second);

       El.appendChild(childEl); //then append it to the second dropdown list
       childEl.value = items[i];
       childEl.innerHTML = items[i];
    }
 }
 }
 //
 
 //
 
  
 function clicked1() {
 //
 
 var el = document.getElementById(first);
 var ob2=document.getElementById(second);
 var selected = el.selectedIndex;
//document.write(selected);

//
 while(ob2.hasChildNodes()) { //removes items from dropdown if some already exist
    ob2.removeChild(ob2.firstChild);
 }
 if(selected!= 0) { //if they choose something other than the first select-->"Select topic first"
    sendRequest1('/hotelbooking/getcountries.asp?website='+el.options[selected].value);
    ob2.disabled=0;
//document.write('/hotelbooking/getzone.asp?countryId='+el.options[selected].value)
 } else { //otherwise add the Select Topic First option and disable it
    var childEl = document.createElement('option');
    ob2.appendChild(childEl);
    childEl.innerHTML = 'Select Website First';
    ob2.disabled=1; 
 }
}


