<% If not  Session("UserId") = "" Then %>
<!--#include file="includes/connection.asp"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Enrolments</title>
<link href="/backoffice/css/pagestyle.css" rel="stylesheet" type="text/css">
</head>
<body><div id="htMap">

<table border="1" height="550" cellspacing="0" class="dbborder" width="1000px">
 <tr>
   <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"><% =Session("country") %></span> PROJstudy Back Office</font></div></td>
 </tr>
 <tr>
  <td width="100px" valign="top" rowspan="22">
    <!--#include file="includes/leftMenu.html"-->
  </td>
 </tr>
 <tr valign="top"><td>

   
    <br /><br />
    
    <div>
    <%
'Declare Local Variables'
Dim rqType
Dim strQuery,strQuery1,strQuery2
Dim Rs1,Rs2,iCount,objRs1,objRs
Dim IPAddress,createdDate
Dim rqFirstName,rqLastName,rqPrimaryEmail
Dim rqActive, conObj,rqComment,rqComments
Dim rqStatus,rqUser,rqEnrollUserId
Dim rqUserId,rqEnrollDate,rqRevLevel
Dim ChangeStatusDateBy
Dim rqStatusNumber,rqCourseDetails,rqCity,str,i
Dim rqCourseId, rqEnrollStatus,Rs,rqSrNo,rqSrNo2,rqStatus1,iPageCurrent

	
'Recordset	
Set objRs1 = Server.CreateObject("ADODB.Recordset") 
Set objRs = Server.CreateObject("ADODB.Recordset") 
Set Rs = Server.CreateObject("ADODB.Recordset") 


'Retrive The Type Within this page'
rqType = Request.QueryString("type")
rqPage = Request.QueryString("page")
rqRow  = Request.QueryString("row")
rqCourseDetails = Request.Form("CourseDetails")
rqType = Request.Querystring("type")
rqName = Request.Form("Name")
rqEmailid = Request.Form("Emailid")
rqcourse = Request.Form("course")
rqPhoneno = Request.Form("phoneno")
rqStatus1 = Request.form("Status")
rqStatus2 = Request.form("Edit")
rqEnrollUserId = Request.form("enrollUserId")
rqEnrollDate = Request.Form("enrolldate")
rqCourseId = Request.Form("courseId")


%>

<%
'databases fetching from main database

response.Flush()

 	'If (rqPage = "next" AND rqPage <> "previous") then

	
	   if Request.form("SrNo") <> "" then
	       rqSrNo = Request.form("SrNo")
	 Elseif Request.Querystring("SrNo") <> ""then
	       rqSrNo=  Request.Querystring("SrNo")
	    End if
	   if Request.form("SrNo2") <> "" then
	       rqSrNo2 = Request.form("SrNo2")
	 Elseif Request.Querystring("SrNo2") <> ""then
	       rqSrNo2=  Request.Querystring("SrNo2")
	    End if
		
		  if Request.Form("countryOrigin") <> "" then
	       rqCountryOrigin = Request.form("countryOrigin")
	 Elseif Request.Querystring("countryOrigin") <> ""then
	       rqCountryOrigin=  Request.Querystring("countryOrigin")
	    End if

'Retriving the Name, email for search'
rqEmail=request.form("Email")
rqFirstName=request.form("FirstName")
rqLastName=request.form("LastName")


If rqEmail <> ""  then 

    strQuery = "SELECT * FROM PaypalDB WHERE item_number =  '107' And  payer_email like '%"& rqEmail &"%' ORDER BY date_entered desc "
	
ElseIf rqFirstName <> ""  then 

    strQuery = "SELECT * FROM PaypalDB WHERE item_number =  '107' And  first_name like '%"& rqFirstName &"%' ORDER BY date_entered desc "
 
ElseIf rqLastName <> ""  then 

    strQuery = "SELECT * FROM PaypalDB WHERE item_number =  '107' And  last_name like '%"& rqLastName &"%' ORDER BY date_entered desc "
 

Else

		
	strQuery = "SELECT * FROM PaypalDB WHERE item_number =  '107' ORDER BY date_entered desc"
	
End If

	'strQuery = "SELECT * FROM PaypalDB WHERE date_entered between '" & rqSrNo & "' AND '" & DateAdd("d", +1,CDate(rqSrNo2)) & "'"
objRs1.Open strQuery, ConnObj
'response.Write(strQuery)
		
	 If Not objRs1.EOF Then
     arrAllQueries = objRs1.getrows
     Session("arrAllQueries") = arrAllQueries
     firstRow = 0
     lastRow = 9
     numRows = Ubound(arrAllQueries,2)
     If lastRow > numRows Then
        lastRow = numRows
     End If
	 allNumRows = numRows
		
		cnt = 1
   End If
   
   'End If
 'getting values for pagination
 
    If cnt = 1 Then

 If IsArray(arrAllQueries) Then
 
 If Request.QueryString("page") = "" Then
 
	 iPageCurrent = 1
	 ' arrAllQueries = Session("arrAllQueries")	
	numRows = Ubound(arrAllQueries,2)
	
	 If numRows > 9 Then
	    lastRow = 9  
	 Else
	 	lastRow = numRows
	 End If 
	
	Else
	
	 arrAllQueries = Session("arrAllQueries")	
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
   End if

 
End If
	
	%>
    
    
	 
      <table width="950" height="80" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#00B0EC"  class="dbborder" >
      <tr><td colspan="10"><table border="0" width="100%">
       <tr><td >
      <form action="blendedCourse.asp" method="post">
     			Email Id 
			  <input type="text" name="Email"/>
			
			  <input type="submit" name="search" value="Search" />			
              </form>
              </td>
              <Td>
              <form action="blendedCourse.asp" method="post">
     			First Name
			  <input type="text" name="FirstName"/>
			
			  <input type="submit" name="search" value="Search" />			
              </form>
              </Td>
               <Td>
              <form action="blendedCourse.asp" method="post">
     			Last Name
			  <input type="text" name="LastName"/>
			
			  <input type="submit" name="search" value="Search" />			
              </form>
              </Td>
              </tr></table></td></tr>
                    <tr bgcolor="#00B0EC">
                      <td  class="btext" width="100px" align="center">ID</td>
                      <td  class="btext" width="180px" align="center">Name</td>
                      <td  class="btext" width="180px" align="center">item_number</td>
                      <td  class="btext" width="180px" align="center">EmailId</td>
                       <td  class="btext" width="180px" align="center">Course</td>
                        <td  class="btext" width="180px" align="center">Phone No</td>
                        <td  class="btext" width="180px" align="center">Address</td>
                         <td  class="btext" width="180px" align="center">Enrolled On</td>
                          <td  class="btext" width="180px" align="center">Valid Till</td>
                          <td  class="btext" width="180px" align="center">IP Address</td>
                           <!--<td  class="btext" width="180px" align="center" colspan="2">Comment</td>-->
                    </tr>
                    
                <% If IsArray(arrAllQueries) Then
	   FOR rowcounter = firstrow to lastrow %>
                    <tr class="rowEven">
                     <td  class="btext" width="60%"><% = arrAllQueries(0,rowcounter) %></td>
                      <td  class="btext" width="100%" align="center"><% = arrAllQueries(8,rowcounter) &""& arrAllQueries(9,rowcounter) %></td>
                       <td  class="btext" width="100%" align="center"><% = arrAllQueries(3,rowcounter) %></td>
                      <td  class="btext" width="100%" align="center"><% = arrAllQueries(7,rowcounter)  %></td>
                       <td  class="btext" width="100%" align="center"><% = arrAllQueries(2,rowcounter)  %></td>
                       <td  class="btext" width="100%" align="center"><% = arrAllQueries(34,rowcounter)  %></td>
                        <td  class="btext" width="100%" align="center"><% = arrAllQueries(13,rowcounter)&"<br>"&arrAllQueries(11,rowcounter)&"<br>"&arrAllQueries(15,rowcounter)&"<br>"&arrAllQueries(16,rowcounter)&"<br>"&arrAllQueries(12,rowcounter)&"<br>"&arrAllQueries(14,rowcounter) %></td>
                         <td  class="btext" width="100%" align="center"><% = arrAllQueries(39,rowcounter) %></td>
                          <td  class="btext" width="100%" align="center"><% = arrAllQueries(40,rowcounter)  %></td>
                          <td  class="btext" width="100%" align="center"><% = arrAllQueries(32,rowcounter)  %></td>

                
                          </tr> 
                    <% Next %>
	<tr>
	 <td colspan="12">
	  <!--#include file="pagination.asp"-->
               <% 
			    ps = getPaginationString(page, (numRows + 1), 10, 2, "enrolments.asp?type=preview&countryOrigin="&rqCountryOrigin&"&SrNo="&rqSrNo&"&SrNo2="&rqSrNo2&"")
				Response.Write(ps)
	           %>
      <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
	 </td>
	</tr>

    <tr>
	  <td colspan="8" align="center"><font face="Arial" size="2" color="orangered"><%=message%></font></td>
	</tr>
                    </table>
                     </td></tr></table><% End If %>
	   </div>

<%

 Else
 Response.Redirect("../backOffice/login.asp")
 End If
%>
</body>
</html>
