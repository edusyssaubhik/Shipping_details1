<%
'======================================================='
'Written By : Priyanka'
'Last UpDated :19/11/2012'
'Description :'
' Display exam details'
'======================================================='

%>
<% If not  Session("UserId") = "" Then %>
	<!--#include virtual="./includes/connection.asp"-->
<%
'======================================================='
 'Declare The Variables'
'======================================================='

 Dim arrAllQueries
 Dim rqType,rqPage,rqRow
 Dim firstRow,lastRow,numRows,rowcounter
 Dim strQuery,viewQuestionNo,i
 Dim rqCityId,strQuery3,rqExamId
 Dim strQuery1,Rs1,Rs3

 Dim message
 message = Session("message")
 Session("message") = ""

 Set Rs1 = Server.CreateObject("ADODB.Recordset")
 Set Rs3 = Server.CreateObject("ADODB.Recordset")
 Set Rs  = Server.CreateObject("ADODB.Recordset")

'======================================================='
'Retrive The Types in This Page'
'Types Are Add examDetails,Edit examDetails'
'Retrive The page and row Using For Pagination'
'======================================================='

 rqType = Request.Querystring("type")
 rqPage = Request.QueryString("page")
 rqRow  = Request.QueryString("row")

'======================================================='
'Sql Query For Retrive The CityId and City For Displaying'
'And Put Into Array'
'And Do The Paginavigation'
'======================================================='

  strQuery = "select * from PROJITIL_liveclass_examdetails order by Examid desc"

  Rs.Open strQuery,ConnObj

   If Not Rs.EOF Then
     arrAllQueries = Rs.getrows
     Session("arrAllQueries") = arrAllQueries
     firstRow = 0
     lastRow = 9
     numRows = Ubound(arrAllQueries,2)
     If lastRow > numRows Then
        lastRow = numRows
     End If
   End If
 If rqPage = "next" Then

    arrAllQueries = Session("arrAllQueries")
    numRows = Ubound(arrAllQueries,2)

    firstRow = rqRow + 1
    lastRow = firstRow + 9

    If firstRow >= numRows Then
       firstRow = rqRow + 1
       lastRow = firstRow + 9
    End If

    If firstRow < 0 Then
       firstRow = 0
    End If

    If lastRow > numRows Then
       lastRow = numRows
    End If

 End If

 If rqPage = "previous" Then

    arrAllQueries = Session("arrAllQueries")
    numRows = Ubound(arrAllQueries,2)

    lastRow = rqRow - 1
    firstRow = lastRow - 9

    If firstRow =< 0 Then
       firstRow = 0
       lastRow = firstRow + 9
    End If

    If lastRow > numRows Then
       lastRow = numRows
    End If

End If


'Sql Query For Retrive The Cities From City table'

  strQuery3 = "SELECT city FROM city WHERE country = 'United Kingdom' "

  Rs3.Open strQuery3,ConnObj

  If Not Rs3.EOF Then
     arrAllCities = Rs3.getRows
     Session("arrAllCities") = arrAllCities
     cityNumRows = Ubound(arrAllCities,2)
     cityFirstRow = 0
     cityLastRow  = cityNumRows
  End If

'======================================================='
'If You Click Edit In city.asp Page That Particular City Dispalyed and You Can Edit That City '
'======================================================='

 If rqtype = "edit" Then

   rqExamId = Request.Querystring("Examid")

   strQuery1 = "SELECT Examid,city,examDate,examTime FROM PROJITIL_liveclass_examdetails WHERE Examid = '" & rqExamId & "'"

   Rs1.Open strQuery1,ConnObj

End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
 <title>Live Class Exam Details</title>
 <link href="/backoffice/css/pagestyle.css" rel="stylesheet" type="text/css">
<script language="javascript">

 //This Function Is to confirm deleting course In Course Page
function DeleteAlert(link) {
  if(confirm("Are you sure you want to delete?"))
  {
      return true;
  }
return false;
}

function validate_noNumber(field,alerttxt)
{
	var iChars = "0123456789";

	with (field)
	{
		for (var i = 0; i < value.length; i++) {
		  	if ((iChars.indexOf(value.charAt(i)) != -1)) {
		  	alert (alerttxt);
		  	return false;
		  	}
		}
	}
}

 function validate_special(field,alerttxt)
 {
 	var iChars = "!#$%^&*@()+=-[]\\\';,{}|\":<>?";

 	with (field)
 	{
 		for (var i = 0; i < value.length; i++) {
 		  	if (iChars.indexOf(value.charAt(i)) != -1) {
 		  	alert (alerttxt);
 		  	return false;
 		  	}
 		}
 	}
 }

//This Validation For Add City

function Form_Validator(theform)
{

var alertsay = "";


 //check to see if the City field is balnk

  if (theform.city.value == "")
  {
     alert("Please Enter The City.");
     theform.city.focus();
     return (false);
  }

  with (theform)
  {

    //check to see if the City field have Numarals

    if (validate_noNumber(city,"Your city Has Numerals")==false)
   	      {city.focus();return false}

    //check to see if the City field have Special Characters

    //if (validate_special(city,"City Has Special Characters. \n Please remove them and try again")==false)
 	    //  {city.focus();return false}

    }
}

//This VAlidation For Edit City

function Form_Validator1(theform)
{

var alertsay = "";


 //check to see if the City field is balnk

  if (theform.editedCity.value == "")
  {
     alert("Please Enter The City.");
     theform.editedCity.focus();
     return (false);
  }

  with (theform)
  {

   //check to see if the City field have Numarals

   if (validate_noNumber(editedCity,"Your city Has Numerals")==false)
   	      {editedCity.focus();return false}

   //check to see if the City field have Special Characters

  // if (validate_special(editedCity,"City Has Special Characters. \n Please remove them and try again")==false)
	 	  //    {editedCity.focus();return false}
  }
}

</script>
</head>
<body><div id="htMap">
<table border="1" height="550" cellspacing="0" class="dbborder" width="1000px">
 <tr>
   <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% =Session("country") %></span> PROJstudy Back Office</font></div></td>
 </tr>
 <tr>
  <td width="100px" valign="top" rowspan="22">
    <!--#include virtual="/backoffice/includes/leftMenu.html"-->
  </td>
 </tr>
  <tr>
   <td height="25"><a href="/backoffice/ITIL-examDetails.asp?type=add">Add Exam Details</a></td>
 </tr>
 <!-- If You Click Add City That Comes Here-->
 <% If rqType = "add" Then %>
 <tr>
  <td height="200">
   <form action="../ITIL-addEditDelExamDetails.asp" method="post" onsubmit="return Form_Validator(this)">
    <table align="center" border="0">
     <tr>
       <td align="center" colspan="4" height="40" class="h3">Add Live Class Exam Details</td>
     </tr>
     <tr>
      <td width="70px"><b>City :</b></td>
     <td>&nbsp;&nbsp;
            <select name="city" id="city" onChange="clicked();">
              <option>--Select--</option>
              <% If IsArray(arrAllCities) Then
          For cityRowCounter = cityFirstRow to cityLastRow %>
              <option value="<% = arrAllCities(0,cityRowCounter) %>">
              <% = arrAllCities(0,cityRowCounter) %>
              </option>
              <% Next
          End If %>
            </select>
          </td>
     </tr>
	 <tr>
	  <td><b>Exam Date :</b></td>
	  <td><input type="text" name="ExamDate" />(yyyy-mm-dd)</td>
	 </tr>
	  
	 <tr>
      <td><b>Exam Time :</b></td>
      <td><input type="text" name="ExamTime">(Ex: 04:00 PM to 06:00 PM)</td>
     </tr>
     <tr>
      <td>&nbsp;</td>
     </tr>
    <tr>
	       <td colspan="2" align="center">
	       <input type="submit" name="type" class="buttonc" value="Add">	       </td>
	     </tr>
   </table>
  </form>
  </td>
 </tr>
 <% End If %>
 
 <% If rqtype = "edit" Then %>
    <tr>
     <td height="200">
       <form action="ITIL-addEditDelExamDetails.asp" method="post" onsubmit="return Form_Validator1(this)">
		<table align="center" border="0">
	     <tr>
		  <td align="center" colspan="4" height="40" class="h3">Edit Live Class exam details</td>
         </tr>
		 <% do until Rs1.EOF %>
		 <tr>
      		<td width="70px"><b>City :</b></td>
      		<td width="60px"> 
            <select name="editcity" id="editcity" onChange="clicked();">
                <option value="<% = Rs1("city") %> ">
                <% = Rs1("city") %>
                </option>
                <option value="" disabled="disabled">--Select--</option>
                <% If IsArray(arrAllCities) Then
                For cityRowCounter = cityFirstRow to cityLastRow %>
                <option value="<% = arrAllCities(0,cityRowCounter) %>">
                <% = arrAllCities(0,cityRowCounter) %>
                </option>
                <% Next
           End If %>
              </select></td>
     	 </tr>
		  <tr>
              <td><b>Exam Date :</b></td>
              <td><input type="text" name="editExamDate" /></td>
             </tr>
              
             <tr>
              <td><b>Exam Time :</b></td>
              <td><input type="text" name="editExamTime"></td>
             </tr>
                <% Rs1.Movenext
		       Loop %>
		  <tr>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td colspan="2" align="right">
            <input type="hidden" name="editExamId" value="<% = rqExamId %>">

             <input type="submit" name="type" value="Edit" class="buttonc">
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
	 <td bgcolor="#A7DBFB" align="center"><b>City</b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Exam Date</b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Exam Time</b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Edit</b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Delete</b></td>
	</tr>
	<!--All Cities Puttin into Arraya And Dispalying-->
	<% If IsArray(arrAllQueries) Then
	   FOR rowcounter = firstrow to lastrow %>
	<tr>
     <td><% = arrAllQueries(1,rowcounter) %></td>
	 <td><% = arrAllQueries(2,rowcounter) %></td>
	 <td><% = arrAllQueries(3,rowcounter) %></td>	 
	 <td align="center"><a href="../ITIL-examDetails.asp?type=edit&amp;Examid=<% = arrAllQueries(0,rowcounter)%>">Edit</a></td>
	 <td align="center"><a href="../ITIL-addEditDelExamDetails.asp?delete=<% = arrAllQueries(0,rowcounter)%>" onclick="return DeleteAlert(this.href);" >Delete</a></td>
	</tr>
	<% Next %>
	<tr>
	 <td colspan="8">
	   <% If Not firstRow = 0 Then %>
		<a href="../ITIL-examDetails.asp?page=previous&amp;row=<% = firstRow %>"> &lt;&lt;Previous</a>
	   <% End If %>
	   <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
	   <% If Not numRows = lastRow Then %>
		<a href="../ITIL-examDetails.asp?page=next&amp;row=<% = lastRow %>"> &gt;&gt;Next</a>
	   <% End If %>
	 </td>
	</tr>
	<% End If %>
	<tr>
	  <td colspan="8" align="center"><font face="Arial" size="2" color="orangered"><%=message%></font></td>
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