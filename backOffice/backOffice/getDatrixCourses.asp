<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include virtual="/includes/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<%
'Declare the local variable'
Dim objRs, strCourses,strCourse
Dim strCity, strDate, strStartDate,strEndDate 
Dim arrAllCourses, firstRow, lastRow, numRows, rowCounter
Dim message

'Creating Record object''
Set objRs=Server.CreateObject("ADODB.Recordset")

'Retriving the values from dates_location.asp page through AJAX'
strCourse = Request.QueryString("course")
strcourse_Type = Request.QueryString("course_Type")

If strCourse = "PRINCE2" Then

Table = "course"
certificateId = 2

ElseIf strCourse = "ITIL" Then

Table = "course"
certificateId = 4

End IF


'Retriving Course  and assigning to session which is required to selcet city based on the course'


'Price Format Display Functions'
Currency_Format_Front = CurrencyFormat_Front("United Kingdom")

Currency_Format_Back = CurrencyFormat_Back("United Kingdom")

'If user select City that will come here'

strCourses="SELECT * FROM "& Table &" WHERE country = 'United Kingdom'  AND certificateId = "& certificateId &" AND status = 'Available' and vendorId = '2' order by startdate,city desc"

'response.Write(strCourses)

objRs.open strCourses,ConnObj

If Not objRs.EOF Then
	arrAllCourses = objRs.getrows
	Session("arrAllCourses") = arrAllCourses
	numRows = Ubound(arrAllCourses,2)
	firstRow = 0
	lastRow = numRows
Else
    message = "No classes scheduled "
End If



'Creating a table displaying the values in the dates_location.asp page'
 

str = "<td><b>Course Enrolling in:</b></td><td colspan=""3""><select name=""courseId"" id=""class"" style=""width:480px;""  class=""TeXtFielddropdown"">"



 If IsArray(arrAllCourses) Then
For rowCounter = firstRow to lastRow
						   
 
	 
	     If(CDate(arrAllCourses(3,rowCounter))-(Date())>=0) Then
						 
If (IsNull(arrAllCourses(28,rowCounter)) OR arrAllCourses(28,rowCounter) <> "Corporate") Then

If (arrAllCourses(26,rowCounter) <> "Full" ) Then					
                       
str = str & "<option value="& arrAllCourses(0,rowCounter) &">"& arrAllCourses(2,rowCounter) &" - "& arrAllCourses(1,rowCounter) &" : "& FormatDateTime(arrAllCourses(3,rowCounter),1) &" to "& FormatDateTime(arrAllCourses(4,rowCounter),1) &" for "
    
	 If (CDate(arrAllCourses(3,rowCounter))-(Date()+arrAllCourses(16,rowCounter)+1) >= 0) Then
	 
  str = str & " "& Currency_Format_Front &"&nbsp;"& FormatNumber(arrAllCourses(19,rowCounter)) &"&nbsp;"& Currency_Format_Back &""
     
	  Else
  
  str = str & " "& Currency_Format_Front &"&nbsp;"& FormatNumber(arrAllCourses(13,rowCounter))&"&nbsp;"& Currency_Format_Back &""
  
     End If 
    str = str & "</option>"

	 End If
	 End If
	 End If

						 
	 
	 
	 Next
	 End If 
	 

	 

	 
    
	str = str & "</select></td>"
			
			Response.Write(str)
	
	
	
%>
<!--#include virtual="/includes/connectionClose.asp"-->
 
