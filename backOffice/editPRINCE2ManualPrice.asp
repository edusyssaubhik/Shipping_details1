<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
 'Written By : Priyanka'
 'Last UpaDated: 16/02/2011'
 'Description :'
 'Purpose : PMBOK Price Editing'
%>
<%
   If Session("UserId")  = "" Then
     Response.Redirect("../login.asp")
   Else
%>
<link href="/backoffice/css/pagestyle.css" rel="stylesheet" type="text/css">

<!--#include file="includes/connection.asp"-->

<%
  Dim rqid,rqname,rqcourse,rqamount,rqPRINCE2Manual,rqPRINCE2price,rqcourseId,Sql,difference,rqpmbokPriceOld,Rs
  
  Set Rs = server.CreateObject("ADODB.recordset")
  
  rqId = request.form("id")
  rqcourseId = request.form("courseId")
  rqamount = request.form("amount")
  rqPRINCE2Manual = request.form("PRINCE2Manual")
  rqPRINCE2price = request.form("PRINCE2price")
  rqpmbokPriceOld = request.form("PRINCE2PriceOld")
  
  if rqpmbokPriceOld <> "" then
  	rqamount = cint(rqamount) -cint( rqpmbokPriceOld )
  else
  	rqamount = rqamount
  end if
  
  difference = CLNG(rqamount) + CLNG(rqPRINCE2price)
  
   response.Write(difference)
   
  Sql = "update enrolledusers set amount = '"& formatnumber(difference)  &"', PRINCE2price = '"& rqPRINCE2price  &"' where id = '"& rqId &"'"
   'response.Write(sql)
   'response.Flush()
  Rs.open Sql,ConnObj
 
 	'response.Redirect("editPMBok.asp?id="&rqId&"&courseid="&rqcourseId)
	response.Redirect("courses.asp?courseid="&rqcourseId)
				
 
 end if %>