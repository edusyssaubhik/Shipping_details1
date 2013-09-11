var req1 = null;
var req2 = null;

function call_createPDF(x, y, z) {

    if (window.XMLHttpRequest) {
        req2 = new XMLHttpRequest; //mozilla/safari
    } else if (window.ActiveXObject) {
        req2 = new ActiveXObject("Microsoft.XMLHTTP"); //internet explorer
    }
    //define callback handler
    if (req2) {
        //
        req2.onreadystatechange = onReadyState2;
        req2.open("GET", "/Convert_pdf1.aspx?action=" + x + "&id=" + y + "&req=" + z, true);
        req2.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        req2.send(null);

    }


}

function onReadyState2() {
    //req2=null;
    //

    var ready2 = req2.readyState;
    var data = null;
    var myString = "";
    if (ready2 == 4) { //check ready state

        data = req2.responseText; //read response data
        console.log("ok")
    }
}
