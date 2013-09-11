var xmlHttp

function Timer() {
    document.getElementById('loader').style.display = 'none';
}



function findCourse(course) {


    var date = "";
    var fulladdress = "";

    var CourseName = document.getElementById('course').value;
    var certificationId = document.getElementById('course').item(document.getElementById('course').selectedIndex).getAttribute('certificationId');
    var course_Type = "";// document.getElementById('course_Type').value;
    var finalURL = ""

    var finalURL = ""
    if ((CourseName != '')) {
        //alert("Please Select the Course Name");
        finalURL += "?course=" + CourseName;
    }
    if ((certificationId != '')) {
        //alert("Please Select the City");
        finalURL += "&certificationId=" + certificationId;
    }
    if ((course_Type != '')) {
        //alert("Please Select the City");
        finalURL += "&course_Type=" + course_Type;
    }
    if (finalURL == "") {
        alert("Please select a field");
        return false;
    }


    if (CourseName == '') {
        // alert("hrllo")

        document.getElementById('Hidecourse').style.display = 'inline';

    }
    else {

        document.getElementById('Hidecourse').style.display = 'none';
    }
    document.getElementById('loader').style.display = 'block';
    var url = "/backOffice/getDatrixCourses.asp";
    url += finalURL
    console.log(url)
    xmlHttp = GetXmlHttpObject();
    if (xmlHttp == null) {
        alert("Your browser does not support AJAX!");
        return;
    }


    xmlHttp.onreadystatechange = stateChanged;
    xmlHttp.open("GET", url, true);
    xmlHttp.send();
}


function stateChanged() {

    if (xmlHttp.readyState == 4) {
        document.getElementById("txtHint1").innerHTML = xmlHttp.responseText;
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
