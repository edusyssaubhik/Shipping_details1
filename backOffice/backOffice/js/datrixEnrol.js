

function findCourse()
{ 


var date="";
var fulladdress="";


var rqcourse_Type;
var rqcourse;


var courseElement=document.addcalls['course'];

for(var i=0; i<courseElement.length; i++){
if(courseElement[i].checked){
	rqcourse=courseElement[i].value;
	break;
}}


if ((document.getElementById('course').style.display == 'none'))
{
document.getElementById('Hidecourse').style.display = 'inline';
} else {
document.getElementById('Hidecourse').style.display = 'none';
}

	
xmlHttp=GetXmlHttpObject();
if (xmlHttp==null)
  {
  alert ("Your browser does not support AJAX!");
  return;
  } 
var url="/backoffice/getDatrixCourses.asp";
url=url+"?course="+rqcourse;
url=url+"&course_Type="+rqcourse_Type;
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



