var first = "category"; //id of  SELECT
var req1=null;
var req2=null;

 var oListBox=null;
  var oListBox1=null;

function load_titledesp(x)
{
	var childEl2 = document.createElement('option'); //create option
       var so = document.getElementById('s');
    while(so.hasChildNodes()) { //removes items from dropdown if some already exist
   
     so.removeChild(so.firstChild);
	
 } 
   // alert(x)	
	if(window.XMLHttpRequest)
	{
    req2=new XMLHttpRequest; //mozilla/safari
 } else if(window.ActiveXObject){
    req2=new ActiveXObject("Microsoft.XMLHTTP"); //internet explorer
 }
 //
 //define callback handler
 if(req2) {
 //
    req2.onreadystatechange=onReadyState2;
    req2.open('GET','/QuoteWerks/getdesp.asp?category='+x,true);
    req2.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req2.send(null);
 }


}
function create()
{
/*var Arguments = {
            Base: document.getElementById('base'),
            Rows: 3,
            Width: 300,
            NormalItemColor: null,
            NormalItemBackColor: null,
            AlternateItemColor: null,
            AlternateItemBackColor: null,
            SelectedItemColor: null,
            SelectedIItemBackColor: null,
            HoverItemColor: null,
            HoverItemBackColor: null,
            HoverBorderdColor: null,
            ClickEventHandler: OnClick
        };
		
 
 oListBox = new ListBox(Arguments); 	
*/
}
function onReadyState2() 
{
	//req2=null;
 //

 var ready2=req2.readyState;
 var data=null;
 var myString="";
 if(ready2==4)
 { //check ready state

    data=req2.responseText; //read response data
	//alert(data)
   // document.write(data)
    var items = data.split('<br>');
	
    var length = items.length;
  
	  //oListBox=null;
	  for(var i=0;i<length-1;i++)
	  {
      myString = items[i];
	 var mySplit = myString.split(",");
	 
	//document.write(items)
	//alert(data)
	//document.getElementbyId("base").innerHtml=data;
	//document.getElementById("per").innerHTML=data
	   
     var x=mySplit[0]// code
	 var y=mySplit[1]// value
       var childEl = document.createElement('option'); //create option
       var El = document.getElementById("s");
       El.appendChild(childEl); //then append it to the second dropdown list
      childEl.value = x;
       childEl.innerHTML = y;
   
       
	  }
 }
}
 function add_node()
 {
	 
 }
function load_category()
{
	
	var el = document.getElementById(first);
    var selected = el.selectedIndex;
 
 //
 while(el.hasChildNodes()) { //removes items from dropdown if some already exist
   
     el.removeChild(el.firstChild);
	
 }

 //
 /*
 while(ob3.hasChildNodes()) { //removes items from dropdown if some already exist
    ob3.removeChild(ob3.firstChild);
 }*/
   
// } else { //otherwise add the Select Topic First option and disable it
//    var childEl = document.createElement('option');
//    el.appendChild(childEl);
//    childEl.innerHTML = 'Select Category';
//    
	
	/*
    var childE4 = document.createElement('option');
    ob3.appendChild(childE4);
    childE4.innerHTML = '-- Select Country First --';
    ob3.disabled=1;
	
	*/
	//var req1=null;

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
    req1.open("GET","/QuoteWerks/getcategories.asp",true);
    req1.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req1.send(null);
 }

	
	
 

	
}


 function sendRequest1(url,params,HttpMethod) {
 if(!HttpMethod) { //check if http method is defined, if not, set it to GET
    HttpMethod="GET";
 }
 alert("gogolwe")
 //
 // initialize request object
 

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


function onReadyState1() {
 //
 var ready1=req1.readyState;
 var data=null;
 if(ready1==4){ //check ready state

    data=req1.responseText; //read response data
	//alert(data)
   // document.write(data)
    var items = data.split('<br>');
    var length = items.length;
	//alert(length)

      var childE3 = document.createElement('option'); //create option
       var E3 = document.getElementById(first);
       E3.appendChild(childE3); //then append it to the second dropdown list
       childE3.value = '';
       childE3.innerHTML = '-- Select Category --';

  
    for(var i = 0; i < length-1; i++) {
       var childEl = document.createElement('option'); //create option
       var El = document.getElementById(first);
       El.appendChild(childEl); //then append it to the second dropdown list
	   
	 //  myString = items[i];//need
	   
	   //Split the value
	   //var mySplit = myString.split(",");
       childEl.value = items[i];
       childEl.innerHTML = items[i];
   
	  // childEl.value = mySplit[0];
       //childEl.innerHTML = items[i];
    }
	   
	   
}
 }
 
 
 
 
 
 
 
 function listbox_move(listID, direction) {

			var listbox = document.getElementById(listID);
			var selIndex = listbox.selectedIndex;

			if(-1 == selIndex) {
				alert("Please select an option to move.");
				return;
			}

			var increment = -1;
			if(direction == 'up')
				increment = -1;
			else
				increment = 1;

			if((selIndex + increment) < 0 ||
				(selIndex + increment) > (listbox.options.length-1)) {
				return;
			}

			var selValue = listbox.options[selIndex].value;
			var selText = listbox.options[selIndex].text;
			listbox.options[selIndex].value = listbox.options[selIndex + increment].value
			listbox.options[selIndex].text = listbox.options[selIndex + increment].text

			listbox.options[selIndex + increment].value = selValue;
			listbox.options[selIndex + increment].text = selText;

			listbox.selectedIndex = selIndex + increment;
		}

		function listbox_moveacross(sourceID, destID) {
			var src = document.getElementById(sourceID);
			var dest = document.getElementById(destID);
            var f,extra,n;
			extra=""
			n=0
			for(var count=0; count < src.options.length; count++) 
			{
                  f=0
				if(src.options[count].selected == true) {
						var option = src.options[count];

						var newOption = document.createElement("option");
						newOption.value = option.value;
						newOption.text = option.text;
						for(var c=0;c<dest.options.length; c++) // check whether its added in dest or not
						  {
					        		if(dest.options[c].value==newOption.value)
									{
									   f=1
									   n++
						               extra=extra+newOption.text+","
									   break
										
									}
						  }
						//newOption.selected = true;				
						if(f==0){
						try {
								 dest.add(newOption, null); //Standard
								// src.remove(count, null);
						 }catch(error) {
								 dest.add(newOption); // IE only
								 //src.remove(count);
						 }
						       }
					//	else if(f==1){
						//   	alert("you have already added the title "+newOption.text )
			                      	}
						//count--;
                       //break;
				}
				     if(extra!="" && n>1)
			          {
					   extra=extra.substring(0,extra.length-1)
			           alert("you have already added these titles - "+extra)
			          }
					  else if(extra!="" && n==1)
					   {
						      extra=extra.substring(0,extra.length-1)
						      alert("you have already added this title - "+extra)
					   }
			

		}
    
	   function listbox_moveback(sourceID, destID)
	   {
			var src = document.getElementById(sourceID);
			var dest = document.getElementById(destID);

			for(var count=0; count < src.options.length; count++)
			{

				if(src.options[count].selected == true) 
				{
						var option = src.options[count];

						var newOption = document.createElement("option");
						newOption.value = option.value;
						newOption.text = option.text;
						//newOption.selected = true;
						try {
								 //dest.add(newOption, null); //Standard
								 src.remove(count, null);
						 }catch(error) {
								 //dest.add(newOption); // IE browser
								 src.remove(count);
						 }
						count--;
                        // break;
				}

			}

		}



function listbox_selectall(listID, isSelect) {

			var listbox = document.getElementById(listID);
			for(var count=0; count < listbox.options.length; count++) {

				listbox.options[count].selected = isSelect;

			}
			
		}
		
		  function select_element(x)
           {
			   var id="";
	        var src = document.getElementById("d");
			for(var count=0; count < src.options.length; count++) 
			{
                        var option = src.options[count];
    					var newOption = document.createElement("option");
						newOption.value = option.value;
					//alert(newOption.value)
					id=id+"'"+newOption.value+"',"
					
			}
			if(id!="")
			  {
			id=id.substring(0,id.length-1)
		  // alert(id)
		  if(x=='V1')
	    window.location="Category-Itemrecords.asp?id="+id
			  else if(x=='V2')
		window.location="Edit-Category-Itemrecords.asp?id="+id
			  else if(x=='V3')
		window.location="Edit-Category-Itemrecords1.asp?id="+id
			  
			  
			  /*var form = document.createElement("form");
form.setAttribute("method", "post");
form.setAttribute("action", "Category-Itemrecords.asp");

// setting form target to a window named 'formresult'
form.setAttribute("target", "formresult");

var hiddenField = document.createElement("input");              
hiddenField.setAttribute("name", "id");
hiddenField.setAttribute("value", id);
form.appendChild(hiddenField);
document.body.appendChild(form);*/

// creating the 'formresult' window with custom features prior to submitting the form
//window.open(test.html, 'formresult', 'scrollbars=no,menubar=no,height=600,width=800,resizable=yes,toolbar=no,status=no');

   //form.submit();
			  
			  }
			else
			 {
			   alert("Please select some titles.")	
			 }
			 
		   }

