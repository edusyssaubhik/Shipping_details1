<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <style type="text/css">
body {
	background: white;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #646464;
	text-align: left;
}
        </style>

    <link href="css/pagestyle.css" rel="stylesheet" type="text/css"/>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Report</title>

<%
   If Session("UserId") = "" Then
     Response.Redirect("../login.asp")
   Else
%>



<%

'---------------------------------------------------------------'
'Written By : Praveen'
'Created Date : 26/09/2012'
'Modified By : Praveen'
'Modified Date: 26/09/2012'
'Description :'
'This page is for getting Referral enrollments based on the dates entered' 

'--------------------------------------------------------------'

'Diclaring Variables'

Dim rqFromDate,rqToDate,objRs,objRs1,Rs2,Rs3
Dim strQuery,strQuery1
Dim EnrollmentsNum,PaymentsNum,rqClasstype
Dim Noof_Enrolled, Noof_Paid, Total_No

Noof_Enrolled = 0
Noof_Paid = 0
Total_No = 0


'initiating Record sets' 

Set objRs = Server.CreateObject("ADODB.Recordset")
Set objRs1 = Server.CreateObject("ADODB.Recordset")
Set Rs2 = Server.CreateObject("ADODB.Recordset")
    Set Rs3 = Server.CreateObject("ADODB.Recordset")
Set objRs3 = Server.CreateObject("ADODB.Recordset")
Set objRs4 = Server.CreateObject("ADODB.Recordset")


'retriving Values'
   if Request.form("CourseId")<>"" then
    rqCourseId = Request.form("CourseId")
    elseif Request.QueryString("CourseId")<>"" then
    rqCourseId = Request.QueryString("CourseId")
    end if
%>

</head>

<body>
<form action="generateReport.asp?CourseId=<%=courseid %>&type=show">

<% 
    dim CourseName,Instructor,StartDate,EndDate,Duration,CourseCode,City,HotelName,HotelAddress,Country
    	 strQuery2 = "SELECT * FROM datrixclasses Where courseid = '" & rqCourseId & "'"
				 'response.Write(strQuery2)
					 Rs2.Open strQuery2,ConnObj
'					response.Write(connobj)
					 if not Rs2.EOF then
						CourseName = Rs2("courseName")
	                    Instructor=Rs2("instructor")					
                		StartDate = Rs2("startdate")
						EndDate   = Rs2("enddate")
			          	Duration=Rs2("duration")
                        CourseCode=Rs2("RefNumber")            
                        City    = Rs2("city")                	
                        HotelName = "Datrix Training "&City
						HotelAddress = Trim(Rs2("hoteladdress"))
					
                        
					 ' response.Write(courseName& City)
				'		ApplicableDays = Rs2("applicabledays")
						Country = Rs2("country")
				'		HotelPhNo = Rs2("hotelphonenumber")
				'		HotelURL = Rs2("hotelurl")
				'		Tax = Rs2("tax")
				'		TotalUK = Rs2("pricewithouttax") 
				'		WithTaxTotal = Rs2("pricewithtax") 
						end if
    Rs2.Close()
				       '  response.Write(StartDate)
				
    %>
   
<span id="_31.9" style="font-style:italic; font-family:Times New Roman; font-size:31.9px; color:#000000">
Delegate List</span>

<table>
    <tr>
        <td ><p><b><%=CourseName %></b></p></td>

    </tr>
    <tr>
        <td >Trainer: <%=Instructor %></td><td>Start Date: <%=day(StartDate) %>/<%=month(StartDate) %>/<%=year(StartDate) %></td>
        <td >&nbsp;&nbsp;&nbsp;End Date:  <%=day(enddate) %>/<%=month(enddate) %>/<%=year(enddate) %></td><td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Duration: <%=Duration %></td>
        <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Course Code: <%=CourseCode %></td>
    </tr>
<tr>
    <td>
        Venue: <%=HotelName %>
    </td>
    <td class="auto-style6">
       Venue Address: <%=HotelAddress %>
     </td>
</tr>    
</table>
    <% 
        'generating string for send email
  dim strbody,strbody1
  strBody1="<img src=""http://www.projstudy.com/Quotewerks/images/email_headerDatrix.jpg""></img><br><br><span id=""31.9"" style=""font-style:italic; font-family:Times New Roman; font-size:31.9px; color:#000000""><b>Delegate List</b></span>"
  strBody1 = strBody1 &"<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td><b>"&CourseName&"</b></td></tr><tr><td><b>Trainer</b>: "& Instructor &"&nbsp;&nbsp;</td><td><b>Start Date</b>: "&day(StartDate)&"/"& month(StartDate) &"/"&year(StartDate)&"</td><td><b><td>&nbsp;&nbsp;&nbsp;<b>End Date</b>:"&day(enddate)&"/"&month(enddate)&"/"&year(enddate) &"</td><td align=""right"">&nbsp;&nbsp;<b>Duration</b>: "&Duration&"</td><td>&nbsp;&nbsp;&nbsp; <b>Course Code</b>:" &CourseCode&"</td></tr><tr><td>&nbsp;&nbsp;<b>Venue:</b>"&HotelName&"</td></tr><tr><td>&nbsp;&nbsp;<b>Venue Address:</b>"&HotelAddress&"</td></tr></table>"
        
        dim rqcomment,rqfirstname,rqlastname,rqnameofemployeer,rqemail,rqtypeOfCourse,rqPRINCE2Manual,rqmanualsent_date
        ' to get all delegates who allocated for particular courseid
         strQuery3 = "SELECT * FROM enrolledusers Where courseid = '" & rqCourseId & "' and vendorId= '2' and vender = '2' And (us_status Is Null OR us_status = 'Active' )"
					' response.Write(strQuery3)
					 Rs3.Open strQuery3,ConnObj
			'response.Write(connobj)
    	
        
        %>
        <table>
         <tr><td>Add Comments:<b><input type="text" name="comment" value="" style="width: 290px" /></b></td></tr>
        </table>
    <%
        strBody = "<table width=""100%"" border=""1"" cellspacing=""0"" cellpadding=""0""><tr><td><center><b>Delegate Name</b></center></td><td><center><b>ClientName</b></center></td><td><center><b>Email Name</b></center></td><td><center><b>Signature</b></center></td><td align=""center"" style=""border-right:none;border-left:none"">|P|</td><td align=""center"" style=""border-right:none;border-left:none"">|F|</td><td align=""center"" style=""border-right:none;border-left:none"">|C|</td><td align=""center"" style=""border-right:none;border-left:none"">|RR|</td><td align=""center"" style=""border-right:none;border-left:none"">|EO|</td><td align=""center"" ><b>Manuals Sent</b></td></tr>"
         %>
    <table border="2">
    <tr>
    <td>Delegate Name</td>
    <td>ClientName</td>
    
    <td>Email Name</td>
    <td>Signature</td>
    
    <td><b>|P | F |  C |  RR |  EO|</b></td>
    <td>Manuals Sent</td>
</tr>            

<!--    <tr>    <td><%=rqcomment %></td>
</tr>-->
        
    <% 
    
         while not Rs3.EOF 
        rqcomment = Rs3("comment")
		rqfirstname = Rs3("firstname")
        rqlastname = Rs3("lastname")
        rqnameofemployeer = Rs3("nameofemployeer")
        rqemail = Rs3("email")
        'signature = Rs3("signature")
        rqtypeOfCourse = Rs3("typeOfCourse")
        rqPRINCE2Manual = Rs3("PRINCE2Manual")
        rqmanualsent_date= Rs3("manualsent_date")
        
	%>
        <tr>
            <td><b><%=rqfirstname %> &nbsp;<%=rqlastname %></b></td>
            <td><b><u><%=rqnameofemployeer %></u></b></td>
            <td><u><a href="mailto:<%=rqemail %>"><span style="color:black"><%=rqemail %></span></a></u></td>
            <td>______________</td>
            <td><input type="checkbox" name="coursetype" value="P" <% if Instr(rqtypeOfCourse,"P") then %>  checked="checked" <% end if %>/>
                <input type="checkbox" name="coursetype" value="F" <% if Instr(rqtypeOfCourse,"F") then %>  checked="checked" <% end if %>/>
                <input type="checkbox" name="coursetype" value="C" <% if Instr(rqtypeOfCourse,"C") then %>  checked="checked" <% end if %>/>
                &nbsp;<input type="checkbox" name="coursetype" value="RR" <% if Instr(rqtypeOfCourse,"RR") then %>  checked="checked" <% end if %>/>
                &nbsp;&nbsp;<input type="checkbox" name="coursetype" value="EO" <% if Instr(rqtypeOfCourse,"EO") then %>  checked="checked" <% end if %>/>  
      </td>
            <td><u>
                <% if rqPRINCE2Manual="Yes" then %>
                <%=rqPRINCE2Manual %>&nbsp;<%=rqmanualsent_date %>
                <% end if %>
            </u></td>
        </tr>
   <%
	strBody = strBody &"<tr><td align=""center""><b>"&rqfirstname &" &nbsp;"&rqlastname &"</b> </td><td valign=""top""  align=""center""><b>"&rqnameofemployeer&"</u></b></td><td valign=""top""  align=""center""><u><a href=""mailto:"&rqemail&"""><span style=""color:black"">"&rqemail&"</span></a></u></td><td valign=""top"" width=""23"" align=""center"">__________________</td><td valign=""top""  align=""center"" style=""border-right:none;border-left:none""><input type=""checkbox"" name=""coursetype"" value=""P"" "
        if Instr(rqtypeOfCourse,"P") then   
        strBody = strBody &"checked=""checked"""
         end if 
         strBody = strBody &"/></td><td align=""center"" style=""border-right:none;border-left:none"">"
         strBody = strBody &"<input type=""checkbox"" name=""coursetype"" value=""F"""
       if Instr(rqtypeOfCourse,"F") then   
       strBody = strBody &"checked=""checked"""
       end if 
       
       strBody = strBody &"/></td><td align=""center"" style=""border-right:none;border-left:none"">"
      
          strBody = strBody &"<input type=""checkbox"" name=""coursetype"" value=""C"""
       if Instr(rqtypeOfCourse,"C") then   
       strBody = strBody &"checked=""checked"""
       end if 
       
       strBody = strBody &"/></td><td align=""center"" style=""border-right:none;border-left:none"">"
         strBody = strBody &"<input type=""checkbox"" name=""coursetype"" value=""RR"""
       if Instr(rqtypeOfCourse,"RR") then   
       strBody = strBody &"checked=""checked"""
       end if 
    
          strBody = strBody &"/></td><td align=""center"" style=""border-left:none"">"
         strBody = strBody &"<input type=""checkbox"" name=""coursetype"" value=""EO"""
       if Instr(rqtypeOfCourse,"EO") then   
       strBody = strBody &"checked=""checked"""
       end if 
       strBody = strBody &"/></td><td valign=""top"" width=""63"" ><u>"
        if rqPRINCE2Manual="Yes" then
         strBody = strBody & rqPRINCE2Manual &"&nbsp;"&rqmanualsent_date &""
            end if
        strBody = strBody &"&nbsp;</u></td></tr>"
            
       
     
                   Rs3.MoveNext()
        		wend
               Rs3.Close()
	strBody = strBody&"</table>"
        %>
         </table>
    


<!--<textarea name="QueryReply" cols="75" rows="25"><%=strBody %> </textarea><br />-->
<br />
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<center><input name="Submit2" type="submit" class="buttonc"  value="Show Preview" />
              
</center><hr />
<% 
    session("strBody1")="<br>"&strBody1
    session("strBody")=strBody
    'response.Write(strBody)
    %>            
    <input type="hidden" name="CourseId" value="<%=rqcourseid%>" />
 </form>
    <form action="generateReport.asp?CourseId=<%=courseid %>&type=send">

<%
    
if request.QueryString("Submit2")="Show Preview" then
   dim strBody3
	strBody3 ="<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""0""><tr><td><b>"&request.QueryString("comment")&"</b></td></tr></table>"
     session("strnew")=session("strBody1")&strBody3&"<br>"&session("strBody")
'    response.Write(session("strnew"))
            dim file
            file=rqCourseId&".html"
            Set fsoObject=Server.CreateObject ("Scripting.FileSystemObject")
'Set tsObject = fsoObject.CreateTextFile("C:/GitHub/ConvertHTMLPdf/demo-certificate1.html",true)
    ' response.Write(session("lastName"))
 Set tsObject = fsoObject.CreateTextFile(Server.MapPath("/backOffice/html/"&file),true)
    	
'Set tsObject = fsoObject.CreateTextFile("E:\vhosts\MYITstudy.com\httpdocs\ITIL\Cities\ITIL-Training-"&StrQuoteReplace(StrQuoteReplace1(City))&".asp")


'Witing the string containing question format into an asp file using file system object.
tsObject.Write session("strnew")
    
'str  =  ""
 tsObject.Close
        set tsObject=Nothing 
        set fsoObject=Nothing
    response.Redirect("/backoffice/Convert_pdf1.aspx?file="&rqCourseId)
 
 
     %><br/>   <input type="hidden" name="CourseId" value="<%=rqcourseid%>" />
 
<center><!--<input name="Submit3" type="submit" class="buttonc" name="sendmail" value="Send mail" />-->
    </center>
        </form>
        <%
   
         end if
           ' if request.QueryString("submit3")="Send mail" then
   'Creating a text file using file systm object.
   
     ' Set objCDOMail = Server.CreateObject("CDONTS.NewMail")
	
	 'objCDOMail.From = "marketing@projstudy.com"
	
	  ' objCDOMail.To =  "edusyssantosh@gmail.com,edusysnikhil@gmail.com"
      '  objCDOMail.To=""&request.QueryString("to")&""
		'objCDOMail.Cc =""&Request.QueryString("cc")&"" ' "edusyssaubhik@gmail.com"
	   'Importance of the e-mail (0=Low, 1=Normal, 2=High)
	   'objCDOMail.Importance = 2
	   'objCDOMail.Subject = "Delegate list"
	   'objCDOMail.BodyFormat = 0
	   'objCDOMail.MailFormat = 0
	   'objCDOMail.Body  = ""&session("strnew")&""
	   'response.Write(str)
	   'objCDOMail.Importance = 2
           
	   'objCDOMail.Send
	

	   'Set objCDOMail = Nothing
        '    session("strBody")=""
         '   response.Redirect("datrixClass.asp")
	 'end if
    end if %>

    
</body>
</html>