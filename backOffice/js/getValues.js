var xmlHttp

function findValue(CourseValue)
{ 

    var startdate = "";

if ((document.getElementById('course').value == ''))
{
    alert("Please Select the course");
    document.getElementById('course').focus();
	return(false);
}


var CourseValue = document.getElementById('course').item(document.getElementById('course').selectedIndex).getAttribute('courseid');

var startdate = document.getElementById('checkIn_date').value;

if (CourseValue == '0') {
    // alert("hrllo")

    document.getElementById('datrixCourse').style.display = 'table-row';
    document.getElementById('datrixCourse1').style.display = 'table-row';
    document.getElementById('datrixCourse2').style.display = 'table-row';
    document.getElementById('datrixCourse3').style.display = 'table-row';
    document.getElementById('txtHint').style.display = 'none';

}
else
{
   
        //document.getElementById('datrixCourse222').style.display = 'block';
        document.getElementById('datrixCourse1').style.display = '';
        document.getElementById('datrixCourse2').style.display = '';
        document.getElementById('datrixCourse3').style.display = '';
}


//alert("hi")
//if ((document.getElementById('course').style.display == 'block')) {
//    document.getElementById('datrixCourse').style.display = '';
//    document.getElementById('datrixCourse1').style.display = '';
//    document.getElementById('datrixCourse2').style.display = '';
//    document.getElementById('datrixCourse3').style.display = '';
//} else {

xmlHttp = GetXmlHttpObject();
if (xmlHttp == null) {
    alert("Your browser does not support AJAX!");
    return;
}
var url = "/backoffice/getValues.asp";
url = url + "?courseId=" + CourseValue + "&startdate=" + startdate;
//alert("fre");
xmlHttp.onreadystatechange=stateChanged22;
xmlHttp.open("GET",url,true);
xmlHttp.send();
}


function stateChanged22()
{
    var data = "";
  //  alert("fre");
    if (xmlHttp.readyState == 4) {
        //document.getElementById("txtHint").innerHTML = xmlHt`tp.responseText;
        data = xmlHttp.responseText;
 //      alert("fre"+data)
       var items = data.split('<br>');
   //    alert(items[0])
       var childEl2 = document.createElement('option'); //create option
       var so = document.getElementById('startinghour');
       while (so.hasChildNodes()) { //removes items from dropdown if some already exist

           so.removeChild(so.firstChild);

       }
       var childEl2 = document.createElement('option'); //create option
       var so = document.getElementById('startingminute');
       while (so.hasChildNodes()) { //removes items from dropdown if some already exist

           so.removeChild(so.firstChild);

       }
       var childEl2 = document.createElement('option'); //create option
       var so = document.getElementById('sessionstart');
       while (so.hasChildNodes()) { //removes items from dropdown if some already exist

           so.removeChild(so.firstChild);

       }

        document.getElementById("checkOut_date").value = items[0];

       // 4 / 26 / 20134 / 26 / 2013
       // 09
       // 00
       // AM
       // 07
       //// 00
       // AM
        //10000
       // 12000
        var length = items.length;
        //alert(length)

       
       // for (var i = 0; i < length - 1; i++) {
            var childEl = document.createElement('option'); //create option
            var El = document.getElementById("startinghour");
            El.appendChild(childEl); //then append it to the second dropdown list
         
            //  myString = items[i];//need

            //Split the value
            //var mySplit = myString.split(",");
            childEl.value = items[1];
            childEl.innerHTML = items[1];
             
            var childEl = document.createElement('option'); //create option
            var El = document.getElementById("startingminute");
            El.appendChild(childEl); //then append it to the second dropdown list

        //  myString = items[i];//need

        //Split the value
        //var mySplit = myString.split(",");
            childEl.value = items[2];
            childEl.innerHTML = items[2];

         
            var childEl = document.createElement('option'); //create option
            var El = document.getElementById("sessionstart");
            El.appendChild(childEl); //then append it to the second dropdown list

        //  myString = items[i];//need

        //Split the value
        //var mySplit = myString.split(",");
            childEl.value = items[3];
            childEl.innerHTML = items[3];



            // childEl.value = mySplit[0];
            //childEl.innerHTML = items[i];
       // }
        // 07
        //// 00
        // AM

            var childEl2 = document.createElement('option'); //create option
            var so = document.getElementById('endinghour');
            while (so.hasChildNodes()) { //removes items from dropdown if some already exist

                so.removeChild(so.firstChild);

            }
            var childEl2 = document.createElement('option'); //create option
            var so = document.getElementById('endingminute');
            while (so.hasChildNodes()) { //removes items from dropdown if some already exist

                so.removeChild(so.firstChild);

            }
            var childEl2 = document.createElement('option'); //create option
            var so = document.getElementById('sessionend');
            while (so.hasChildNodes()) { //removes items from dropdown if some already exist

                so.removeChild(so.firstChild);

            }


            var childEl = document.createElement('option'); //create option
            var El = document.getElementById("endinghour");
            El.appendChild(childEl); //then append it to the second dropdown list

        //  myString = items[i];//need

        //Split the value
        //var mySplit = myString.split(",");
            childEl.value = items[4];
            childEl.innerHTML = items[4];

            var childEl = document.createElement('option'); //create option
            var El = document.getElementById("endingminute");
            El.appendChild(childEl); //then append it to the second dropdown list

        //  myString = items[i];//need

        //Split the value
        //var mySplit = myString.split(",");
            childEl.value = items[5];
            childEl.innerHTML = items[5];


            var childEl = document.createElement('option'); //create option
            var El = document.getElementById("sessionend");
            El.appendChild(childEl); //then append it to the second dropdown list

        //  myString = items[i];//need

        //Split the value
        //var mySplit = myString.split(",");
            childEl.value = items[6];
            childEl.innerHTML = items[6];

        // 4 / 26 / 20134 / 26 / 2013
        // 09
        // 00
        // AM
        // 07
        //// 00
        // AM
        //10000
        // 12000
            
            document.getElementById("priceWithOutTax").value = items[7];

            document.getElementById("priceWithTax").value = items[8];



    }
}


function GetXmlHttpObject() {
    var xmlHttp = null;
    try {
        // Firefox, Opera 8.0+, Safari
        xmlHttp = new XMLHttpRequest();
    }
    catch (e) {
        // Internet Explorer
        try {
            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch (e) {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
    }
    return xmlHttp;
}


var i;
var end_date;
function findValue1(x) {

     var startdate = "";
     i = x
     var start_id = 'checkIn_date' + i;
    
     end_date = 'checkOut_date' + i;
     var startdate = document.getElementById(start_id).value;
    //alert(startdate)
    xmlHttp = GetXmlHttpObject();
    if (xmlHttp == null) {
        alert("Your browser does not support AJAX!");
        return;
    }
    var url = "/backoffice/get_Values.asp";
    url = url + "?startdate=" + startdate;
  //  alert("google")
    xmlHttp.onreadystatechange = stateChanged1;
    xmlHttp.open("GET", url, true);
    xmlHttp.send();
}


function stateChanged1() {

    if (xmlHttp.readyState == 4) {
    //    alert("asdasd" + xmlHttp.responseText)
        if (i == 1) {
    //        alert("ffffff"+i+xmlHttp.responseText);
            document.getElementById(end_date).value = xmlHttp.responseText;
        }
     else   if (i == 2) {
      //      alert("ffffff" + i + xmlHttp.responseText);
            document.getElementById(end_date).value = xmlHttp.responseText;
        }
     else if (i == 3) {
        
        //    alert("ffffff" + i + xmlHttp.responseText);
            document.getElementById(end_date).value = xmlHttp.responseText;
        }
       else if (i == 4) {
          //  alert("ffffff" + i + xmlHttp.responseText);
            document.getElementById(end_date).value = xmlHttp.responseText;
        }
      else  if (i == 5) {
            //alert("ffffff" + i + xmlHttp.responseText);
            document.getElementById(end_date).value = xmlHttp.responseText;
      }
      else if (i == 6) {
          //alert("ffffff" + i + xmlHttp.responseText);
          document.getElementById(end_date).value = xmlHttp.responseText;
      }
      else if (i == 7) {
          //alert("ffffff" + i + xmlHttp.responseText);
          document.getElementById(end_date).value = xmlHttp.responseText;
      }
      else if (i == 8) {
          //alert("ffffff" + i + xmlHttp.responseText);
          document.getElementById(end_date).value = xmlHttp.responseText;
      }
      else if (i == 9) {
          //alert("ffffff" + i + xmlHttp.responseText);
          document.getElementById(end_date).value = xmlHttp.responseText;
      }
      


    }
}

function GetXmlHttpObject() {
    var xmlHttp = null;
    try {
        // Firefox, Opera 8.0+, Safari
        xmlHttp = new XMLHttpRequest();
    }
    catch (e) {
        // Internet Explorer
        try {
            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch (e) {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
    }
    return xmlHttp;
}

