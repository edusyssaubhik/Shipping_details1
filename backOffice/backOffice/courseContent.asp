<%@ Language = "VBScript" %>
<% 'OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 23/09/2010'
'Description :'
' Display Cities'
'======================================================='

%>
<% If not  Session("UserId") = "" Then %>
<!--#include file="./includes/connection.asp"-->
<%
'======================================================='
 'Declare The Variables'
'======================================================='

 Dim arrAllQueries
 Dim rqType,rqPage,rqRow
 Dim firstRow,lastRow,numRows,rowcounter
 Dim strQuery,viewQuestionNo,i
 Dim rqCityId,rqCertificationId
 Dim strQuery1,Rs1,Rs

 Dim message
 message = Session("message")
 Session("message") = ""

 Set Rs1 = Server.CreateObject("ADODB.Recordset")
 Set Rs  = Server.CreateObject("ADODB.Recordset")
  Set Rs11  = Server.CreateObject("ADODB.Recordset")


'======================================================='
'Retrive The Types in This Page'
'Types Are Add City,Edit City'
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

If rqType = "submit" then

rqCertificationId = request.Form("certificationType")

   strQuery = "select * from datrixCourse where certificationId = '"&rqCertificationId&"' order by courseid desc"
Else

  strQuery = "select * from datrixCourse order by courseid desc"
  
End If

'response.Write(strQuery)

  Rs.Open strQuery,ConnObj

   If Not Rs.EOF Then
     arrAllQueries = Rs.getrows
     Session("arrAllQueries") = arrAllQueries
     firstRow = 0
     lastRow = 19
     numRows = Ubound(arrAllQueries,2)
     If lastRow > numRows Then
        lastRow = numRows
     End If
   End If
 If rqPage = "next" Then

    arrAllQueries = Session("arrAllQueries")
    numRows = Ubound(arrAllQueries,2)

    firstRow = rqRow + 1
    lastRow = firstRow + 19

    If firstRow >= numRows Then
       firstRow = rqRow + 1
       lastRow = firstRow + 19
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
    firstRow = lastRow - 19

    If firstRow =< 0 Then
       firstRow = 0
       lastRow = firstRow + 19
    End If

    If lastRow > numRows Then
       lastRow = numRows
    End If

End If

'======================================================='
'If You Click Edit In city.asp Page That Particular City Dispalyed and You Can Edit That City '
'======================================================='

 If rqtype = "edit" Then

   rqCourseId = Request.Querystring("courseid")

   strQuery1 = "SELECT * FROM datrixCourse WHERE courseid = '" & rqCourseId & "'"

   Rs1.Open strQuery1,ConnObj

End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
 <title>Course Content</title>
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
   <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% if Session("country") = "" And session("brand") = "" then %>
     
  
         <% elseif Session("country") = "" And session("brand") <> "" then %>
   
		      <span style="color:#FF3300"><% =Session("brand") %></span>
       
	     <% else %>
     
		       <span style="color:#FF3300"><% =Session("brand") %>&nbsp;<% =Session("country") %></span>
         
	     <% end if %> 
     </span>Back Office</font></div></td>
 </tr>
 <tr>
  <td width="100px" valign="top" rowspan="22">
    <!--#include file="includes/leftMenu.html"-->
  </td>
 </tr>
  <tr>
   <td height="25"><a href="courseContent.asp?type=addCourse">Add Course Content</a></td>
 </tr>
 <!-- If You Click Add City That Comes Here-->
 <% If rqType = "addCourse" Then %>
 <tr>
  <td height="200">
   <form action="addEditDeleteCourseContent.asp" method="post" onsubmit="return Form_Validator(this)">
    <table align="center" border="0">
     <tr>
       <td align="center" colspan="4" height="40" class="h3">Add Course Content</td>
     </tr>
     
      <tr>
     <td><b>Certification:</b></td>
     <td>     <select name="certification">
     <option value="" >--Select----</option>

     <% 
			  'If itil is selected'	
			  Dim strBrand1 , Rs11
			   
			 strBrand1 = "SELECT * from Certification WHERE Ven_ID = '2'"
			 'response.Write(strBrand)
				Rs11.Open strBrand1,ConnObj
				
				Do until Rs11.EOF
		%>
				     
     <option value="<% = Rs11("Cer_ID") %>" <% IF  Rs11("CertName") =  Rs11("CertName") then %> selected=selected <% End IF %>><% = Rs11("CertName") %></option>
     
                 <% 
			  
				Rs11.Movenext
				loop
				Rs11.close
				%>
     
     </select>
     
     </td>
     
     </tr>
     <tr><td><br /></td></tr>
     
     <tr>
     <td><b>Select Static Course Name:</b></td>
     <td>     <select name="CourseName">
     <option value="" >--Select----</option>

     <% 
			   
			 strBrand1 = "SELECT * from datrixCourse "
			 'response.Write(strBrand)
				Rs11.Open strBrand1,ConnObj
				
				Do until Rs11.EOF
		%>
				     
     <option value="<% = Rs11("courseName") %>" <% IF  Rs11("courseName") =  Rs11("courseName") then %> selected=selected <% End IF %>><% = Rs11("courseName") %></option>
     
                 <% 
			  
				Rs11.Movenext
				loop
				Rs11.close
				%>
     
     </select>
     
     </td>
     
     </tr>
          <tr><td><br /></td></tr>

     
      <tr>
     <td><b>Ref Number:</b></td>
     <td>     <select name="RefNumber">
     <option value="" >--Select----</option>

     <% 
			   
			 strBrand1 = "SELECT * from datrixCourse"
			 'response.Write(strBrand)
				Rs11.Open strBrand1,ConnObj
				
				Do until Rs11.EOF
		%>
				     
     <option value="<% = Rs11("RefNumber") %>" <% IF  Rs11("RefNumber") =  Rs11("RefNumber") then %> selected=selected <% End IF %>><% = Rs11("RefNumber") %></option>
     
                 <% 
			  
				Rs11.Movenext
				loop
				Rs11.close
				%>
     
     </select>
     
     </td>
     
     </tr>
     
	 <tr>
	  <td><b>What you'll learn :</b></td>
	  <td><textarea  name="Whatyoulearn" rows="10" cols="50"></textarea></td>
	 </tr>
	 <tr>
	  <td><b>Audience Profile:</b></td>
	  <td><textarea name="AudienceProfile" rows="10" cols="50"></textarea></td>
	 </tr>	 
	 <tr>
      <td><b>Prerequisites:</b></td>
      <td><textarea name="Prerequisites" rows="10" cols="50"></textarea></td>
     </tr>
     <tr>
      <td><b>Outline:</b></td>
      <td><textarea name="Outline" rows="10" cols="50"></textarea></td>
     </tr>
     <tr>
      <td>&nbsp;</td>
     </tr>
    <tr>
     <td></td>
     <td colspan="2" align="right">
      <input type="submit" name="addCourse" value="Add Course Content" class="buttonc">
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
       <form action="addEditDeleteCourseContent.asp" method="post" onsubmit="return Form_Validator1(this)">
		<table align="center" border="0">
	     <tr>
		  <td align="center" colspan="4" height="40" class="h3">Edit Static Course</td>
         </tr>
		 <% do until Rs1.EOF %>
         
		 <tr>
     <td><b>Certification:</b></td>
     <td>     <select name="certification">

     <% 
			   
			 strBrand1 = "SELECT * from Certification WHERE Ven_ID = '2' and Cer_ID = '"&Rs1("certificationId") &"'"
			 'response.Write(strBrand1)
				Rs11.Open strBrand1,ConnObj
				
				Do until Rs11.EOF
		%>
				     
     <option value="<% = Rs11("Cer_ID") %>" <% IF  Rs11("Cer_ID") =  Rs1("certificationId") then %> selected=selected <% End IF %>><% = Rs11("CertName") %></option>
     
                 <% 
			  
				Rs11.Movenext
				loop
				Rs11.close
				%>
     
     </select>
     
     </td>
     
     </tr>
     <tr><td><br /></td></tr>
     
     <tr>
     <td><b>Select Static Course Name:</b></td>
     <td>     <select name="editCourseName">
     <option value="" >--Select----</option>

     <% 
			   
			 strBrand1 = "SELECT * from datrixCourse where courseid = '" & rqCourseId & "' "
			 'response.Write(strBrand)
				Rs11.Open strBrand1,ConnObj
				
				Do until Rs11.EOF
		%>
				     
     <option value="<% = Rs1("courseName") %>" <% IF  Rs11("courseName") =  Rs1("courseName") then %> selected=selected <% End IF %>><% = Rs1("courseName") %></option>
     
                 <% 
			  
				Rs11.Movenext
				loop
				Rs11.close
				%>
     
     </select>
     
     </td>
     
     </tr>
          <tr><td><br /></td></tr>

     
      <tr>
     <td><b>Ref Number:</b></td>
     <td>     <select name="editRefNumber">
     <option value="" >--Select----</option>

     <% 
			   
			 strBrand1 = "SELECT * from datrixCourse where courseid = '" & rqCourseId & "'"
			 'response.Write(strBrand)
				Rs11.Open strBrand1,ConnObj
				
				Do until Rs11.EOF
		%>
				     
     <option value="<% = Rs1("RefNumber") %>" <% IF  Rs11("RefNumber") =  Rs1("RefNumber") then %> selected=selected <% End IF %>><% = Rs1("RefNumber") %></option>
     
                 <% 
			  
				Rs11.Movenext
				loop
				Rs11.close
				%>
     
     </select>
     
     </td>
     
     </tr>
		 <tr>
	  	    <td><b>What you'll learn :</b></td>
		    <td><textarea name="editWhatyoulearn"  style="height:300px; width:700px;"  ><% =Rs1("Whatyoulearn") %></textarea></td>
		 </tr>
		 <tr>
	 	    <td><b>Audience Profile:</b></td>
			<td><textarea name="editAudienceProfile"  style="height:300px; width:700px;" ><% =Rs1("AudienceProfile") %></textarea></td>
		 </tr>	
		 <tr>
		  <td><b>Prerequisites:</b></td>
		   <td><textarea name="editedPrerequisites"  style="height:300px; width:700px;"><% = Rs1("Prerequisites") %></textarea> </td>
		    
		  </tr>
          <tr>
		  <td><b>Outline:</b></td>
		   
		     <input type="hidden" name="editCourseid" value="<% = Rs1("courseid") %>">
		   <td><textarea  name="editedOutline"  style="height:300px; width:700px;"><% = Rs1("Outline") %></textarea></td>
		    <% Rs1.Movenext
		       Loop %>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		  </tr>
		  <tr>
		    <td colspan="2" align="right">
             <input type="submit" name="editcourse" value="Edit Course Content" class="buttonc">
            </td>
           </tr>
         </table>
        </td>
      </tr>
   <% End If %>
 <!-- Edit If Condition Closed Here-->
 <!-- Displaying The All Cities Here -->
 <tr>
 <td>
          <form name="Certification" action="courseContent.asp?type=submit" method="post">
       <table border="1" cellpadding="5" cellspacing="0">
    
 <tr>
        
        <td><b>Certification Type:</b></td>
 			<td colspan="6"><select name="CertificationType" id="CertificationType" style="width:350px">
             <option value="">-- Select --</option>
             <% 
			 Dim certRs,strCert
			 
			 Set certRs = server.CreateObject("ADODB.recordset")
			 
			 strCert = "SELECT * FROM Certification WHERE Ven_ID = '"&Session("vendor") &"'"
			' response.Write(strCert)
			  certRs.Open strCert,ConnObj

                                  'response.Write(strQuery)
                 If Not certRs.EOF Then
					arrAllRecords = certRs.getrows
					Session("arrAllRecords") = arrAllRecords
					cnt = 1
					firstRow = 0
					lastRow = 19
					numRows = Ubound(arrAllRecords,2)
					If lastRow > numRows Then
					   lastRow = numRows
					End If
					
					allNumRows = numRows
			   End If

                                    
                                
			 
			 If IsArray(arrAllRecords) Then
          		 For rowcounter = firstRow to allNumRows 
				
			  %>
             
                 
                 <option value="<% = arrAllRecords(0,rowcounter)  %>"><% = arrAllRecords(1,rowcounter) %></option>
             
                 
         <% Next %>
		
          		<% End If %>
                    
 				</select>
   
      <input type="submit" id="submit" value="Submit"/></td>
                
</tr>
</table>
</form>
</td>
</tr>
 <tr height="490">
  <td valign="top">
   <table border="1" align="center" width="400px" cellspacing="0" cellpadding="2">
	<tr height="25">
	 <td bgcolor="#A7DBFB" align="center"><b>Certification</b></td>
     <td bgcolor="#A7DBFB" align="center"><b>courseName</b></td>
   <td bgcolor="#A7DBFB" align="center"><b>RefNumber</b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>What you'll learn</b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Audience Profile</b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Prerequisites</b></td>
    <td bgcolor="#A7DBFB" align="center"><b> Outline</b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Edit</b></td>
	 <td bgcolor="#A7DBFB" align="center"><b>Delete</b></td>
	</tr>
	<!--All Cities Puttin into Arraya And Dispalying-->
	<% If IsArray(arrAllQueries) Then
	   FOR rowcounter = firstrow to lastrow %>
	<tr>
	 <input type="hidden"  name="cityId"  value="<% = arrAllQueries(0,rowcounter) %>">
	 <td> <% 
			  'If itil is selected'	
			  Dim strBrand 
			   
			 strBrand = "SELECT * from Certification WHERE Cer_ID = '"&arrAllQueries(4,rowcounter)&"'"
			 'response.Write(strBrand)
				Rs11.Open strBrand,ConnObj
				
				Do until Rs11.EOF
				
				rqCertName = Rs11("CertName")
				
				Rs11.Movenext
				loop
				Rs11.close

 				response.Write(rqCertName)
 
 
                %></td>
      <td><% = arrAllQueries(1,rowcounter) %></td>
      <td><% = arrAllQueries(2,rowcounter) %></td>          
	 <td><% = arrAllQueries(6,rowcounter) %></td>
	 <td><% = arrAllQueries(7,rowcounter) %></td>	 
	 <td><% = arrAllQueries(8,rowcounter) %></td>
      <td><% = arrAllQueries(9,rowcounter) %></td>
	 <td align="center"><a href="courseContent.asp?type=edit&courseid=<% = arrAllQueries(0,rowcounter)%>">Edit</a></td>
	 <td align="center"><a href="addEditDeleteCourseContent.asp?delete=<% = arrAllQueries(0,rowcounter)%>" onclick="return DeleteAlert(this.href);" >Delete</a></td>
	</tr>
	<% Next %>
	<tr>
	 <td colspan="8">
	   <% If Not firstRow = 0 Then %>
		<a href="courseContent.asp?type=editOrDelete&page=previous&row=<% = firstRow %>"> &lt;&lt;Previous</a>
	   <% End If %>
	   <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
	   <% If Not numRows = lastRow Then %>
		<a href="courseContent.asp?type=editOrDelete&page=next&row=<% = lastRow %>"> &gt;&gt;Next</a>
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