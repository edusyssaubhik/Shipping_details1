<%
'======================================================='
'Written By : Bharath'
'Last UpDated : 24/03/2012'
'Description :'
' Add/Edit/Delete Locations'


'Modified By : Mahima'
'Modified Dated : 26/03/2012'

'======================================================='

%>
<!-- #include virtual = "./includes/connection.asp"-->

<% If not  Session("UserId") = "" Then %>
<%
'======================================================='
 'Declare The Variables'
'======================================================='

 Dim arrAllQueries
 Dim rqType,rqPage,rqRow
 Dim firstRow,lastRow,numRows,rowcounter
 Dim strQuery,viewQuestionNo,i
 Dim rqCityId
 Dim strQuery1,Rs1,Rs

 Dim message
 message = Session("message")
 Session("message") = ""

 Set Rs1 = Server.CreateObject("ADODB.Recordset")
 Set Rs  = Server.CreateObject("ADODB.Recordset")
 Set Rs2  = Server.CreateObject("ADODB.Recordset")
'======================================================='
'Retrive The Types in This Page'
'Types Are Add City,Edit City'
'Retrive The page and row Using For Pagination'
'======================================================='
'Session("country") = "India"
 rqType = Request.Querystring("type")
 rqPage = Request.QueryString("page")
 rqRow  = Request.QueryString("row")

'======================================================='
'Sql Query For Retrive The CityId and City For Displaying'
'And Put Into Array'
'And Do The Paginavigation'
'======================================================='
strCity = "SELECT city FROM city where country = '"& Session("country") &"' order by city"

Rs2.Open strCity, ConnObj

  strQuery = "select id, location, imageName, locationaddress, country, hotelName,Region,phoneNo,Postcode,GooglemapURL,capacity from proj_locations where country = '"& Session("country") &"' and vendorId = '"&Session("vendor")&"'  order by location"
  Rs.Open strQuery,ConnObj

    If Not Rs.EOF Then
  arrAllQueries = Rs.getrows
  Session("arrAllQueries") = arrAllQueries

        firstRow = 0
		lastRow = 9
		numRows = Ubound(arrAllQueries ,2)
		If lastRow > numRows Then
		   lastRow = numRows
		End If

		allNumRows = numRows

		cnt = 1

	End If

'Pagination code'

If cnt = 1 Then

 If Request.QueryString("page") = "" Then

	iPageCurrent = 1

	'arrAllRecords = Session("arrAllRecords")
	numRows = Ubound(arrAllQueries,2)

	 firstRow = 0

	 If numRows > 9 Then
	    lastRow = 9
	 Else
	 	lastRow = numRows
	 End If
  Else

	arrAllRecords = Session("arrAllRecords")
	numRows = Ubound(arrAllQueries,2)

	iPageCurrent = Request.QueryString("page")
    firstRow = ((10 * iPageCurrent)-10)
     lastRow = firstRow + 9

    If lastRow > numRows Then
    lastRow = numRows
   End If

    If firstRow < 0 Then
       firstRow = 0
    End If

 End if

End If
'======================================================='
'If You Click Edit In city.asp Page That Particular City Dispalyed and You Can Edit That City '
'======================================================='

 If rqtype = "edit" Then

   rqLocationId = Request.Querystring("locationid")

   strQuery1 = "SELECT id,location,imagename,locationaddress,country, hotelName,Region,phoneNo,Postcode,GooglemapURL,capacity FROM proj_locations WHERE id = '" & rqLocationId & "'"
   Rs1.Open strQuery1,ConnObj

End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
 <title>Locations</title>
 <link href="/backoffice/css/pagestyle.css" rel="stylesheet" type="text/css">
<script language="javascript">

 function validate_required(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
	}
}


// Function To Validate The Form And Display An Alert Message If Any Field Is Found Empty.

function validate_form1(thisform)

{
	with (thisform)
    {

	    if (validate_required(location,"Please select Location")=='')
 		     {location.focus();return false}
	    if (validate_required(imgName,"Please enter Image name")=='')
 		     {imgName.focus();return false}

 	    if (validate_required(locationAddress,"Please enter Location Address")==false)
 		     {locationAddress.focus();return false}

	}
}


function DeleteAlert(link,site,ltext) {
  if(confirm("Are you sure you want to delete?"))
  {
  	return true;
  }
return false;
}

</script>
</head>
<body><div id="htMap">
<table border="1" height="550" cellspacing="0" class="dbborder" width="1000px">
 <tr>
   <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% if  session("brand") <> "All" then %><% =Session("brand") %>&nbsp;<% end if %><% =Session("country") %></span>

	    Back Office</font></div></td>
 </tr>
 <tr>
  <td width="100px" valign="top" rowspan="22">
  <!--#include file="includes/leftMenu.html"-->
  </td>
 </tr>
  <tr>
   <td height="25"><a href="locations.asp?type=addLocation">Add Location</a></td>
 </tr>
 <!-- If You Click Add City That Comes Here-->
 <% If rqType = "addLocation" Then %>
 <tr>
  <td height="200">
   <form action="addEditDeleteLoc.asp" method="post" onsubmit="return validate_form1(this)">
    <table align="center" border="0">
     <tr>
       <td align="center" colspan="4" height="40" class="h3">Add Location</td>
     </tr>
     <tr>
      <td width="90px"><b>Location :</b></td>

      <td width="70px" >

      <% if  session("brand") = "Datrix" then %>

      <input type="text" name="location">

       <% else %>

      <select name="location">
      	<option value="">--Select--</option>
        <% Do Until Rs2.EOF %>
        <option value="<% = Rs2("City") %>"><% = Rs2("City") %></option>
        <% Rs2.Movenext
		   Loop %>
      </select>

       <% End if %>
      </td>
     </tr>


     <tr>
       <% if  session("brand") = "Datrix" then %>
       <td><b>Region:</b></td>
	  <td><input type="text" name="Region"><br />(Ex: North West)</td>

        <% else %>

	  <td><b>Hotel Name:</b></td>
	  <td><input type="text" name="hotelName"></td>

       <% End if %>
	 </tr>


	 <tr>
	  <td><b>Address:</b></td>
	  <td><textarea name="locationAddress"></textarea> <% if  session("brand") = "Datrix" then %><br />("Ex:Unit 5 Albert Edward House,(Add break tag)The Pavillions,(Add break tag) Ashton-On-Ribble,(Add break tag)PR2 2YB")<% End if %></td>
	 </tr>


    <% if  session("brand") = "Datrix" then %>

   <tr><td><b>Phone No.:</b></td>
	  <td><input type="text" name="phoneNo">
      </td></tr>


    <tr><td><b>Postcode:</b></td>
	  <td><input type="text" name="Postcode">
      </td></tr>

	<% End if %>


     <tr>
	  <td><b>Image Name :</b></td>
	  <td><input type="text" name="imgName" style="margin-left:1px" /> <br />(Ex: imagename.jpg or imagename.gif)</td>
	 </tr>
     <tr>
	  <td><b>Google map URL:</b></td>
	  <td><textarea name="GooglemapURL" style="margin-left:1px" cols="50" rows="10"></textarea></td>
	 </tr>
	  <tr>
	 	 	       <td><b>Capacity:</b></td>
	 	 	       <td><input type="text" name="Capacity"></td>
     </tr>
     <tr>
      <td>&nbsp;</td>
     </tr>
    <tr>
     <td></td>
     <td colspan="2" align="right">
      <input type="submit" name="addlocation" value="Add Location" class="buttonc">
     </td>
    </tr>
   </table>
  </form>
  </td>
 </tr>
 <% End If %>
 <!-- Add City IF Condition Closed Here -->
 <!-- If You Click Edit That Comes Here -->
 <% If rqtype = "edit" Then %>
    <tr>
     <td height="200">
       <form action="addEditDeleteLoc.asp" method="post" onsubmit="return validate_form1(this)">
		<table align="center" border="0">
	     <tr>
		  <td align="center" colspan="4" height="40" class="h3">Edit Location</td>
         </tr>
		 <% do until Rs1.EOF %>

		 <tr>

           <td><b>Location :</b></td>

            <td >
          <% if  session("brand") = "Datrix" then %>

      <input type="text" name="location" value="<% = Rs1("location") %>">

       <% else %>


        <select name="location">
      	<option value="">--Select--</option>
        <% Do Until Rs2.EOF %>
        <option <% If Rs1("location") = Rs2("City") Then %> selected="selected" <% End If %> value="<% = Rs2("City") %>"><% = Rs2("City") %></option>
        <% Rs2.Movenext
		   Loop %>
      </select>
       <% End if %>
      </td>
		 </tr>

         <tr>
         <% if  session("brand") = "Datrix" then %>

       <td><b>Region:</b></td>
	  <td><input type="text" name="editRegion" value="<% = Rs1("Region") %>"><br />(Ex: North West)</td>

        <% else %>

	  <td><b>Hotel Name:</b></td>
	 <td><input type="text" name="hotelName" value="<% = Rs1("hotelName") %>"></td>

      <% End if %>
	 </tr>

         	 <tr>
	 	    <td><b>Address :</b></td>
			<td><textarea type="text" name="locationAddress"  style="margin-left:1px" /><% =Rs1("locationaddress") %></textarea></td>
		 </tr>

		    <% if  session("brand") = "Datrix" then %>

   <tr><td><b>Phone No.:</b></td>
	  <td><input type="text" name="editphoneNo" value="<% = Rs1("phoneNo") %>">
      </td></tr>


    <tr><td><b>Postcode:</b></td>
	  <td><input type="text" name="editPostcode" value="<% = Rs1("Postcode") %>">
      </td></tr>

	<% End if %>

		 <tr>
	 	    <td><b>Image Name :</b></td>
			<td><input type="text" name="imgName"  value="<% =Rs1("imagename") %>" style="margin-left:1px" /><br />(Ex: imagename.jpg or imagename.gif)</td>
		 </tr>

          <tr>
	  <td><b>Google map URL:</b></td>
	  <td><textarea name="editGooglemapURL" style="margin-left:1px" cols="50" rows="10" ></textarea></td>
	 </tr>
      <tr>
	 	       <td><b>Capacity:</b></td>
	 	       <td><input type="text" name="Capacity" value="<% = Rs1("capacity") %>"></td>
     </tr>
		     <input type="hidden" name="editid" value="<% = Rs1("id") %>">

		    <% Rs1.Movenext
		       Loop %>


		  <tr>
		    <td colspan="2" align="Center">
             <input type="submit" name="type" value="Edit City" class="buttonc">
            </td>
           </tr>
         </table>
        </td>
      </tr>
   <% End If %>
 <!-- Edit If Condition Closed Here-->
 <!-- Displaying The All Cities Here -->
 <tr height="490">
  <td valign="top">
   <table border="1" align="center" width="400px" cellspacing="0" cellpadding="2">
	<tr height="25">
	 <td bgcolor="#A7DBFB" align="center"><b>Country</b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Location</b></td>
     <% if  session("brand") = "Datrix" then %>
     <td bgcolor="#A7DBFB" align="center"><b>Region</b></td>
     <td bgcolor="#A7DBFB" align="center"><b>Phone No.</b></td>
     <td bgcolor="#A7DBFB" align="center"><b>Postcode</b></td>
     <td bgcolor="#A7DBFB" align="center"><b>Google map</b></td>
     <% Else %>
	 <td bgcolor="#A7DBFB" align="center"><b>Hotel Name</b></td>
    <% End if %>
	 <td bgcolor="#A7DBFB" align="center"><b>Address</b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Capacity</b></td>
	<td bgcolor="#A7DBFB" align="center"><b>Edit</b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Delete</b></td>
	</tr>
	<!--All Cities Puttin into Arraya And Dispalying-->
	<% If IsArray(arrAllQueries) Then
	   FOR rowcounter = firstrow to lastrow %>
	<tr>
	 <input type="hidden"  name="id"  value="<% = arrAllQueries(0,rowcounter) %>">
	 <td><% = arrAllQueries(4,rowcounter) %></td>
	 <td><% = arrAllQueries(1,rowcounter) %></td>
     <% if  session("brand") = "Datrix" then %>
	 <td><% = arrAllQueries(6,rowcounter) %></td>
     <td><% = arrAllQueries(7,rowcounter) %></td>
	 <td><% = arrAllQueries(8,rowcounter) %></td>
     <td><% = arrAllQueries(9,rowcounter) %></td>
     <% Else %>
	 <td><% = arrAllQueries(5,rowcounter) %></td>
    <% End if %>
	 <td><% = arrAllQueries(3,rowcounter) %></td>
	  <td><% = arrAllQueries(10,rowcounter) %></td>
	<td align="center"><a href="locations.asp?type=edit&locationid=<% = arrAllQueries(0,rowcounter)%>">Edit</a></td>
	 <td align="center"><a href="addEditDeleteLoc.asp?delete=<% = arrAllQueries(0,rowcounter)%>" onclick="return DeleteAlert(this.href);">Delete</a></td>
	</tr>
	<% Next %>
	 <tr id="htMap">
              <td colspan="10"><!--#include virtual="/backoffice/pagination.asp"-->
               <%
			    ps = getPaginationString(page, (numRows + 1), 10, 2, "locations.asp?locations="& rqlocations&"")
				  Response.Write(ps)
	           %>

                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
          </td>
       </tr>
	<% End If %>
	<tr>
	  <td colspan="10" align="center"><font face="Arial" size="2" color="orangered"><%=message%></font></td>
	</tr>
  </table>
 </td>
</tr>
</table>
</div>
</body>
</html>
<%
 Rs.Close
 Set Rs = Nothing
 ConnObj.Close
 Set ConnObj = Nothing
 Else
 Response.Redirect("../backOffice/login.asp")
 End If
%>