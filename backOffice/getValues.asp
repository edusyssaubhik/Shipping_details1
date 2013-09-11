<!--#include virtual="/includes/connection.asp"-->


<% 
'Declaring varaible
Dim strcourseId,strChapter,strNoofQues,objRs1,objRs,questionNo
Dim strStartDate,foramtEndDate1,foramtEndDate
Dim rqEndDate,duration

Set objRs=Server.CreateObject("ADODB.Recordset")
Set objRs1=Server.CreateObject("ADODB.Recordset")

'Retriving Kno and assigning to session '

If Request.QueryString("courseId") <> "" Then

	strcourseId = Request.QueryString("courseId")
    strStartDate = Request.QueryString("startdate")

	Session("courseId") = strcourseId
    Session("StartDate") = strStartDate
	
Else

	Session("courseId") = Session("courseId")
    Session("StartDate")= Session("StartDate")
	
End If 


	strKNo="select * from datrixCourse WHERE courseid = '" & Session("courseId") &"'"
	'response.Write(strKNo)

objRs.open strKNo,ConnObj

If Not objRs.EOF Then
	arrAllCourses = objRs.getrows
	Session("arrAllCourses") = arrAllCourses
	numRows = Ubound(arrAllCourses,2)
	firstRow = 0
	lastRow = numRows
End If
'response.Write(strCourses)


'Creating a drop down for the values in the chapterTestsIndex.asp page'
				  
'Response.Write("<table width=""100%"" border=""0"" cellspacing=""0"" cellpadding=""5""><tr id=""datrixCourse""><td width=""17%"">End Date: </td><td>")


    
	iCount = 0

	
	If IsArray(arrAllCourses) Then
	For rowCounter = firstRow to lastRow	
    	
		 courseid = arrAllCourses(0,rowCounter)
					
		
	

     If instr(arrAllCourses(3,rowCounter),"hrs") then

     rqEndDate = formatdatetime(Session("StartDate"),1)
   ' response.Write(rqEndDate)
    '	response.Write(rqEndDate)
     session("duration")="same"
    Else

    duration = left(arrAllCourses(3,rowCounter), 1)
    
    foramtEndDate1 = DateAdd("d",duration-1,formatdatetime(Session("StartDate"),2))
	
	foramtEndDate  = formatdatetime(foramtEndDate1,1)
	session("duration")=duration-1
	'rqEndDate=foramtEndDate
	rqEndDate = Split(foramtEndDate,",")
	'response.Write(rqEndDate)

    End If
    



       			         str1 = rqEndDate(2)&""&rqEndDate(1)&"<br>"
    			         str1 = str1 & arrAllCourses(11,rowCounter)&"<br>"

    str1 =  str1 & arrAllCourses(12,rowCounter)&"<br>"

    str1 =  str1 & arrAllCourses(13,rowCounter)&"<br>"
'startinghour1

   str1 =  str1 &  arrAllCourses(14,rowCounter)&"<br>"

    str1 =  str1 & arrAllCourses(15,rowCounter)&"<br>"

    str1 =  str1 & arrAllCourses(16,rowCounter)&"<br>"
'endinghour1
   str1 =  str1 &  arrAllCourses(10,rowCounter)&"<br>"
'priceWithOutTax1
   ' price without tax

	'		         str = "<input name=""enddate1"" id=""checkOut_date"" type=""text"" value = """&rqEndDate&"""></td></tr>"
 
						
    'str =  str & "<tr><td>&nbsp;</td></tr>"

   'str =  str & "<tr id = ""datrixCourse1""><td>Start Time:</td><td width=""350px""><select name=""startinghour1""><option value="& arrAllCourses(11,rowCounter)&">"&arrAllCourses(11,rowCounter)&"</option><option disabled=""disabled"">HH</option></select><select name=""startingminute1""><option value="&arrAllCourses(12,rowCounter)&">"&arrAllCourses(12,rowCounter)&"</option><option disabled=""disabled"">MIN</option></select><select name=""sessionstart1""><option value="&arrAllCourses(13,rowCounter)&">"&arrAllCourses(13,rowCounter)&"</option></select></td></tr>"

    ' str =  str & "<tr><td>&nbsp;</td></tr>"


     'str =  str & "<tr><td>End Time:</td><td><select name=""endinghour1""><option value="&arrAllCourses(14,rowCounter)&">"&arrAllCourses(14,rowCounter)&"</option><option disabled=""disabled"">HH</option></select><select name=""endingminute1""><option value="&arrAllCourses(15,rowCounter)&">"& arrAllCourses(15,rowCounter)&"</option><option disabled=""disabled"">MIN</option></select><select name=""sessionend1""><option value="& arrAllCourses(16,rowCounter)&">"& arrAllCourses(16,rowCounter)&"</option></select></td></tr>"

     'str =  str & "<tr><td>&nbsp;</td></tr>"

    'str = str & "<tr  id = ""datrixCourse2""><td >Price WithOut Tax:</td><td><input type=""text"" name=""priceWithOutTax1"" size=""20"" maxlength=""15"" value="""& arrAllCourses(10,rowCounter)&""" onchange=""calculate();""><br>&nbsp;&nbsp;&nbsp;<font face=""Arial"" color=""red"" size=""2"">(Ex : 650 )</font></td></tr>"

    'str =  str & "<tr><td>&nbsp;</td></tr>"

    'str = str & "<tr><td >Tax:</td><td><input type=""text"" name=""tax1"" size=""20"" maxlength=""6"" value=""20""><br>&nbsp;&nbsp;&nbsp;<font face=""Arial"" color=""red"" size=""2"">(Ex : 20 )</font> </td></tr>"

    'str =  str & "<tr><td>&nbsp;</td></tr>"

    DIm rqPriceWithTax,rqPriceWithTax1, Price
	
	If (IsNull(arrAllCourses(10,rowCounter)) OR  arrAllCourses(10,rowCounter) = "") Then
	Price = 0
	Else
	Price = arrAllCourses(10,rowCounter)
	End If

    rqPriceWithTax1 = (Price / 100 * 20)
    rqPriceWithTax = cint(Price) + cint(rqPriceWithTax1)

    'str = str & "<tr  id = ""datrixCourse3""><td>Price With Tax:</td><td><input type=""text"" name=""priceWithTax1"" value="""& rqPriceWithTax&""" size=""20"" readonly=""true""><br>&nbsp;&nbsp;&nbsp;<font face=""Arial"" color=""red"" size=""2""></font></td></tr>"
	 str1 =  str1 & rqPriceWithTax
		'response.Write(str)
		Response.Write(str1)
	iCount = iCount +1 
	
	Next
	End If	
	



%>

