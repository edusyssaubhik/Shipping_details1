 <%Response.ContentType = "application/pdf"
 Response.BinaryWrite("errttre")
 Response.Flush
 objStream.Close
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Geo Map of particular location</title>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script language="javascript" type="text/javascript">

    var map;
    var geocoder;
	var address;//address of geo location
    function InitializeMap()
     {

        var latlng = new google.maps.LatLng(-34.321, 150.646);
        var myOptions =
        {
            zoom: 15,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            disableDefaultUI: true
        };
        map = new google.maps.Map(document.getElementById("map"), myOptions);
    }

    function FindLocaiton() {
        geocoder = new google.maps.Geocoder();
        InitializeMap();

         address = "Sheridan hotel,Bangalore";
        geocoder.geocode({ 'address': address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });

            }
            else {
                alert("Sorry geocode cant find this address for  " + status);
            }
        });

    }


    window.onload = InitializeMap;

</script>

</head>
<body onload="FindLocaiton()">
    <form id="form1" runat="server">
    <div>
    <table>
<tr>

<td colspan ="2">
<div id ="map" style="height: 564px; width: 595px;" >
</div>
 
</td>
</tr>
</table>
    </div>
    </form>
</body>
</html>
