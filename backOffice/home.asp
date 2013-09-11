<%
On Error Resume Next
'======================================================='
'Written By : Priyanka'
'Last UpDated : 23/09/2010'
'Description :'
'This is home Page'
'======================================================='%
%>
<% If not  Session("UserId") = "" Then %>
<!-- #include virtual = "/includes/connection.asp"-->

<%

	Dim message
	Dim Sql,Rs1
	Dim rqMessage
	Dim i,Rs,rqCountryForm,rqCountrySession,rqcountry
	
	rqMessage = Session("message")
	Session("message") = ""
	
	Set Rs  = Server.CreateObject("ADODB.Recordset")
	Set Rs1  = Server.CreateObject("ADODB.Recordset")
	


'Changing the brand'
if Request.Form("brand") <> "" then
rqBrand = Request.Form("brand")
session("brand") =rqBrand
session("certificate") = "" 
elseif Request.QueryString("brand") <> "" then
rqBrand = Request.QueryString("brand")
session("brand") =rqBrand
session("certificate") = "" 
else
session("brand") = session("brand")
session("certificate") = "" 
end if
	
	
If session("brand")  <> "" Then

	 strQuery = "SELECT DISTINCT vendorId FROM vendor WHERE vendor = '"& session("brand") &"'"
		  'response.Write(strQuery)
		   Rs1.Open strQuery,ConnObj
	
		   
		   rqVendor = Rs1("vendorId")
		   Session("vendor") = rqVendor
		  
		
	 
End If



Sql = "select distinct(country) from city order by country desc"
	Rs.open Sql,ConnObj
	
	
	rqCountryForm = Request.Form("country")
	rqCountrySession = Session("country")
	if rqCountryForm <> "" then
		rqcountry = rqCountryForm
	else
		rqcountry = rqCountrySession 
	end if
	
	Session("country") = rqcountry
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Home</title>
<link href="/backoffice/css/pagestyle.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="htMap">
<table border="1"  width="1000px" cellspacing="0" height="550" class="dbborder">
 <tr>
   <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to  
         <% if Session("country") = "" And session("brand") = "" then %>
     
         <% elseif  session("brand") = "All" then %>
   
		      <span style="color:#FF3300"><% =Session("country") %></span>
  
  
         <% elseif Session("country") = "" And session("brand") <> "" And session("brand") <> "All" then %>
   
		      <span style="color:#FF3300"><% =Session("brand") %></span>
       
	     <% else %>
     
		       <span style="color:#FF3300"><% =Session("brand") %>&nbsp;<% =Session("country") %></span>
         
	     <% end if %> 
     
     Back Office</font> </div>
 </tr>
  <tr>
   <td width="100px" valign="top" rowspan="22">
     <% if Session("country") <> "" then %>
	<!--#include file="includes/leftMenu.html"-->
	<% end if %>
   </td>
   
   <td >
	   <table border="0" height="400px">
	 <% if Session("country") = "" then %>
		 <tr>
		  <td align="center" height="" width="900px"><font color="#00B0EC" face="Arial" size="4">Welcome to  
		  
		  <% if Session("country") = "" And session("brand") = "" then %>
     
          <% elseif  session("brand") = "All" then %>
   
		      <span style="color:#FF3300"><% =Session("country") %></span>
  
  
         <% elseif Session("country") = "" And session("brand") <> "" And session("brand") <> "All" then %>
   
		      <span style="color:#FF3300"><% =Session("brand") %></span>
        
	     <% else %>
     
		       <span style="color:#FF3300"><% =Session("brand") %>&nbsp;<% =Session("country") %></span>
         
	     <% end if %> 
     
     Back Office</font></td>
		 </tr>
         
	 <% else %>
     
		 <tr>
		  <td align="center" height="" width="900px"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300">  
         <% if  session("brand") = "" then %>
   
		      <span style="color:#FF3300"><% =Session("country") %></span>
       
	     <% else %>
     
		       <span style="color:#FF3300"> <% if  session("brand") <> "All" then %><% =Session("brand") %>&nbsp;<% end if %><% =Session("country") %></span>
         
	     <% end if %> 
         </span> Back Office</font></td>
		 </tr>
		 <% end if %>
         
         
    
    
           <tr><td>
                <form action="home.asp" name="brand" method="post" onsubmit="return validate_form(this)">
               
               <table  width="100%" cellpadding="3" cellspacing="5">
                 <tr align="center"><td >
                  <b>Select the type of provider</b>:
                                        <select name="brand" id="brand" value="brand">
                                        <option value="0" selected="selected">-- Select Course --</option>
                                        <option value="PROJstudy" <% If session("brand") = "PROJstudy" then%>selected="selected"<% End If %>>PROJstudy</option>
                                        <option value="Datrix" <% If session("brand") = "Datrix" then%>selected="selected"<% End If %>>Datrix</option>
                                        <option value="All" <% If session("brand") = "All" then%>selected="selected"<% End If %>>Both</option>
                                        </select>
                                </td></tr>
                                
                  <tr>
                    <td colspan="2" align="center"><input type="submit" name="submit" value="Submit" class="buttonc" align="middle"></td>
                  </tr>
                </table>
               </form>
             </td></tr>
             
             
  <% If session("brand") <> "" Then %>
<tr><td>
         
           <form name="country" action="home.asp" method="post">
 <table  width="100%" cellpadding="3" cellspacing="5">
         	 <tr>
		  <td colspan="2" align="center" valign="top">Please select the <b>Country :</b>  
		  <select name="country" >
			<option value="">--Select--</option>
            
      <% If session("brand") = "Datrix" or session("brand") = "All" then%>
            
      <option value="United Kingdom">United Kingdom</option>      
            
      <% ElseIf session("brand") <> "Datrix" then%>
             
			<% do until Rs.EOF 
			   for each i in Rs.Fields %>
			<option value="<% =Rs("country") %>" <% If rqcountry = Rs("country") Then %> selected="selected" <% End If %>><% If Rs("country") = "Other" Then %> Global <% Else %> <% = Rs("country") %> <% End IF %> </option>
			<% next
			   Rs.movenext
		       loop %>	
               
       <% End If %>
             
		 </select><div>&nbsp;</div>
		<div align="center" style="margin-right:-160px;"><input type="submit" value="Submit" class="buttonc" /></div> </td>
		</tr>
  	</table>
	</form>
   </td>
  </tr>	
  
   <% End If %>

  														
</table>
<% 
'Declaring variables'
Dim objRs,objRs1,strQuery,rqEnrollUserId,POExpected
Dim firstName,lastName,email,company,coursedet,strBody

'Creating Record objects'	
Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")

'Retriving the last mail send date'
strQuery = "SELECT id FROM enrolledusers WHERE us_status = 'P.O Received' AND po_expected IS NOT NULL AND po_sentmail IS NULL AND po_expected = '"& Date &"' AND checkreceived IS NULL Order by id desc"

objRs.Open strQuery,ConnObj
'response.Write(strQuery)
Do until objRs.EOF

	rqEnrollUserId = objRs("id")

	'Retriving the last mail send date'
	strQuery = "SELECT firstname, lastname, email, po_expected, nameofemployeer, coursedetails FROM enrolledusers WHERE id = '" & rqEnrollUserId &"' Order by id desc"
	
	objRs1.Open strQuery,ConnObj
	'response.Write(strQuery)
	Do until objRs1.EOF
	
		POExpected = FormatDateTime(objRs1("po_expected"),2)
		'checkReceived = objRs("checkreceived")
		firstName = objRs1("firstname")
		lastName = objRs1("lastname")
		email = objRs1("email")
		company = objRs1("nameofemployeer")
		coursedet = objRs1("coursedetails")
	objRs1.Movenext
	Loop
	objRs1.Close
	
	'Comparing the dates'
	'Comparin 1 day after P.O.expected date and today's date'
	'If (Date()- (cdate(POExpected))) =1 And Isnull(checkReceived) And IsNull(PO_SentMail) Then
	
	strBody = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF"">" 
						IF Session("country") = "India" Then
						strBody= strBody & "<span><img src=""http://www.PROJstudy.com/images/banners/email_headerIN.jpg"" alt=""PROJstudy"" width=""600px"" height=""103""  /></span>" 
						ElseIf Session("country")="United Kingdom" Then 
						strBody= strBody &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerUK.jpg"" alt=""PROJstudy"" width=""600px"" height=""103""  /></span>"
						ElseIf Session("country")="Australia" Then
						strBody= strBody &"<span><img src=""http://www.PROJstudy.com/images/banners/email_headerAUS.jpg"" alt=""PROJstudy"" width=""600px"" height=""103""  /></span>"
						Else
						strBody= strBody &"<span><img src=""http://www.PROJstudy.com/images/banners/email_header.jpg"" alt=""PROJstudy"" width=""600px"" height=""103""  /></span>"
						End if
						strBody= strBody &"<tr><td valign=""top""><font face=""Arial"" size=2>Hi,<BR><BR>We didn't recieve the payment from the student "&firstName&" "&lastName&" of Company name: "& company &" whose email id is " & email &".<br><br>Course Details: "& coursedet &"<BR><BR>Payment Expected Date: "&POExpected&"<br><br>Please follow up on this.<BR><BR>Best Regards, <BR>Custmer Support<br>www.PROJstudy.com<BR>Email: marketing@projstudy.com</font></font></td></tr></table></td></tr><tr height=""30px""><td>&nbsp;</td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"
	'response.Write(strBody)
	
	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
	objCDOMail.From = """Payment Not Received"" <marketing@projstudy.com>"
	objCDOMail.To =  "marketing@projstudy.com" 
	objCDOMail.Bcc = "edusyssidhardha@gmail.com"
	objCDOMail.Importance = 2
	objCDOMail.Subject = "Payment not recieved from "&firstName&""
	objCDOMail.BodyFormat = 0
	objCDOMail.MailFormat = 0
	objCDOMail.Body = strBody
	objCDOMail.Send
	Set objCDOMail = Nothing
	

	'Inserting date into the facultymailsent table because based on this emails will send daily'
	ConnObj.Execute "UPDATE enrolledusers SET po_sentmail = '1' WHERE id = '" & rqEnrollUserId &"'"
	'response.Write(strQuery)
			
	'End If	

			
objRs.Movenext
Loop
objRs.Close	
%>

</div>
 <% 
 Else
 Response.Redirect("/backOffice/login.asp")
 End If	
%>
</body>
</html>