<!--#include virtual="/QuoteWerks/includes/header.asp"-->
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->

<head>
<link href="/QuoteWerks/css/leftNavi.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/form.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/mainContent.css" rel="stylesheet" type="text/css" />
</head>

<% 
'If not Session("userName") then redirect to  login page'
	If Session("QWUserName") = "" Then 
		Response.Redirect("default.asp")
	Else
	
%>


<%
'''''''''from addeditcompanydetails,asp - to differentiate between to add new company or already existing
rqaddcompanydetails = Request.Form("addcompanydetails")

'response.Write(rqaddcompanydetails)

'''''''''''''''retrieving company name to be added from addeditcompanydetails.asp if selected add new company in companydetails.asp
rqCompanyname=Request.form("companyname")

'response.Write(rqCompanyname)

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'response.Write(Session("compId"))

%>

<!-- Body Starts -->
<body style="margin-top:0px">

<tr>
  <td width="170px" align="left" valign="top" style=" border-right:#CCC thin solid;"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftNavigation" >
      <!--#include virtual="/QuoteWerks/includes/LeftMenu.asp"-->
    </table></td>
  <td width="730" align="center" valign="top" height="450px">
 
  <div id="styledForm" class="myform">
  
 
      <table border="0" cellpadding="7">
      <tr><td colspan="2" height="50px">&nbsp;</td></tr>
        <tr>
          <td colspan="2" align="center">
         
	     	<table>
            <% 
			 If rqaddcompanydetails = "addcompanydetails" Then
			 
			 Session("addMessage")="You have succesfully added a new company"
			 
			 
             Dim rqemail_(100),rqname_(100),rqcompanyaddress_(100),rqphone_(100),rqfaxNo_(100)
			 set Rs1=server.CreateObject("adodb.recordset")	
			
			
			 strQuery = "INSERT INTO QW_Company (CompName,addedBy,addedDate)"
			 strQuery = strQuery & " Values "
			 strQuery = strQuery & "('" & rqCompanyname & "',"
			 strQuery = strQuery & "'" & session("QWUserName") & "',"
			 strQuery = strQuery & "'" & now() & "')"
		 
 			 Rs1.Open strQuery,ConnObj
			' Rs1.Close
			
			 strQuery1 = "Select top 1 compId from QW_Company where CompName='"& rqCompanyname &"'"
			 Rs1.Open strQuery1,ConnObj
			 do until Rs1.EOF 
             rqcompId = Rs1("compId")
             Rs1.movenext
		     loop 
			 Rs1.close
			
		
			
		         	For i = 1 to 10 
				    rqcompanyaddress_(i) = Request.form("companyaddress_"&i)	
					
					If  rqcompanyaddress_(i) = "" Then
					
					Exit For
					
					Else
					
					 strQuery2 = "INSERT INTO QW_CompAddress ( compId,CompAddress,addedBy,addedDate)"
					 strQuery2 = strQuery2 & " Values "
					 strQuery2 = strQuery2 & "('" & rqcompId  & "',"
					 strQuery2 = strQuery2 & "'" &  rqcompanyaddress_(i) & "',"
					 strQuery2 = strQuery2 & "'" & session("QWUserName") & "',"
					 strQuery2 = strQuery2 & "'" & now() & "')"
					 'response.Write(strQuery2)
					 Rs1.Open strQuery2,ConnObj
					 'Rs1.Close
					 
					 End If
					 
			 Next
    
	
	
	
					 For j = 1 to 10
					 
					  rqname_(j)  =  Request.form("contactname_"&j)	
					  rqemail_(j) =  Request.form("contactemail_"&j)		
					  rqphone_(j) =  Request.form("contactphone_"&j)
					  rqfaxNo_(j) =  Request.form("faxNo_"&j)
					
					  
					  If  rqname_(j) = "" And  rqemail_(j)="" And rqphone_(j)="" And rqfaxNo_(j)="" Then
					
					  Exit For
					
					  Else
					
					 strQuery3 = "INSERT INTO QW_CompContactDet(compId,contName,contEmailId,contPhoneno,fax,addedBy,addedDate)"
					 strQuery3 = strQuery3 & " Values "
					 strQuery3 = strQuery3 & "('" &  rqcompId  & "',"
					 strQuery3 = strQuery3 & "'"  &  rqname_(j) & "',"
					 strQuery3 = strQuery3 & "'"  &  rqemail_(j) & "',"
					 strQuery3 = strQuery3 & "'"  &  rqphone_(j) & "',"
					 strQuery3 = strQuery3 & "'"  &  rqfaxNo_(j) & "',"
					 strQuery3 = strQuery3 & "'"  & session("QWUserName") & "',"
					 strQuery3 = strQuery3 & "'"  & now() & "')"
					 response.Write(strQuery3)
					 Rs1.Open strQuery3,ConnObj
					 'Rs1.Close
					End If
					 
			 Next
					  
		
		
					  
		'''''''''''''''''''''''''''''''''for editing'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''			  
		ElseIf 	rqaddcompanydetails = "Editcompanydetails" Then
		
		Session("editMessage")="You have successfully edited the company fields"
		
			  
				   	  
					  
			       Dim rqemail1_(100),rqname1_(100),rqcompanyaddress1_(100),rqphone1_(100),rqfaxNo1_(100)
			       set Rs2=server.CreateObject("adodb.recordset")	
			
		
			
		         	For k = 1 to 10 
				    rqcompanyaddress1_(k) = Request.form("editcompanyaddress_"&k)	
					
					
					
					If  rqcompanyaddress1_(k) = "" Then
					
					
					Else
				
					 strQuery2 = "INSERT INTO QW_CompAddress ( compId,CompAddress,addedBy,addedDate)"
					 strQuery2 = strQuery2 & " Values "
					 strQuery2 = strQuery2 & "('" & Session("compId") & "',"
					 strQuery2 = strQuery2 & "'" &  rqcompanyaddress1_(k) & "',"
					 strQuery2 = strQuery2 & "'" & session("QWUserName") & "',"
					 strQuery2 = strQuery2 & "'" & now() & "')"
					' response.Write(strQuery2)
					 Rs2.Open strQuery2,ConnObj
					 'Rs1.Close
					 
					 End If
					 
			 Next
    
	
	
	
					  For l = 1 to 10
					  rqname1_(l)  =  Request.form("editcontactname_"&l)	
					  rqemail1_(l) =  Request.form("editcontactemail_"&l)		
					  rqphone1_(l) =  Request.form("editcontactphone_"&l)
					  rqfaxNo1_(l) =  Request.form("editcontactphone_"&l)
					 ' response.Write(rqphone1_(l) & "dkmmm")
					  
					  If  rqname1_(l) = "" And  rqemail1_(l)="" And rqphone1_(l)="" And rqfaxNo1_(l)="" Then
					
					  
					
					  Else
					
					 strQuery3 = "INSERT INTO QW_CompContactDet(compId,contName,contEmailId,contPhoneno,fax,addedBy,addedDate)"
					 strQuery3 = strQuery3 & " Values "
					 strQuery3 = strQuery3 & "('" &  Session("compId")  & "',"
					 strQuery3 = strQuery3 & "'"  &  rqname1_(l) & "',"
					 strQuery3 = strQuery3 & "'"  &  rqemail1_(l) & "',"
					 strQuery3 = strQuery3 & "'"  &  rqphone1_(l) & "',"
					 strQuery3 = strQuery3 & "'"  &  rqfaxNo1_(l) & "',"
					 strQuery3 = strQuery3 & "'"  & session("QWUserName") & "',"
					 strQuery3 = strQuery3 & "'"  & now() & "')"
					' response.Write(strQuery3)
					 Rs2.Open strQuery3,ConnObj
					 
					 End If
					 
			 Next
					  
			End If		  
					  
	        
           %>
			
			</table>
		   </td>
        </tr>
      </table>
   </div></td>
</tr>
</table>
<% End If 
Response.Redirect("companyDetails.asp")

%>

</Body>
<!-- Body Ends -->
