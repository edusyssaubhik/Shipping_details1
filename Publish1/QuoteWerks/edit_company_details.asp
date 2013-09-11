
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->

<% 
 dim vv
'If not Session("userName") then redirect to  login page'
	'vv=0
	'session("first_ship1")=vv
	Session("edit_ship2")="1"
	 if Session("edit_ship2")="1"	then
	dim a,b,c,d,e,f
    SET Rs11 = Server.CreateObject("ADODB.Recordset")	
's8="select  "
	strCompany="select soldtoAddress a ,shiptoAddress b ,billtoAddress c from QW_QuoteOverview where quoteId='"&Session("qid_edit")&"'"
     response.Write(strCompany)
		 
		 Rs11.open strCompany,ConnObj
		 
		' response.write strCompany
										
			do until Rs11.EOF 
		    a=Rs11("a")   	 
			b=Rs11("b")
			c=Rs11("c")
			Rs11.movenext
		    
			  loop 
			 response.write a & b & c 
			
			   d=Split(a,"!")
			
			   e=Split(b,"!")
			   f=Split(c,"!")
			  response.write  trim(e(6))
			 '  response.Write(a)
            	'session("first_ship")=""
			    Session("edit_ship2")="1"
'				i=trim(d(0)) 'comp name
'				j=trim(d(1))  'name
''				k=trim(d(2)) ' address
	'			l=trim(d(3))' email
	'			m=trim(d(4)) 'ph
	'			n=trim(d(5))  'fax
'				o=trim(d(6))  'sold
	'			p=trim(e(1))
	'			q=trim(e(2))
	'			r=trim(e(3))
	'			s=trim(e(4))
	'			t=trim(e(5))
		'		i=trim(e(6))
				
			  end if
			   %>



<%

SET Rs = Server.CreateObject("ADODB.Recordset")
SET Rs1 = Server.CreateObject("ADODB.Recordset")
SET Rs2 = Server.CreateObject("ADODB.Recordset")



''''''''''''''from company.js page''''''''''''''
rqAddCompany = Request.QueryString("company")


If rqAddCompany <>  "" Then

Session("Company1") =  rqAddCompany
response.Write(rqAddCompany)

'response.Write(rqAddCompany & "hiii")

End If


    rqAddress = Request.Form("selectcompanyaddress_1")
	rqsoldcompanyname = Request.Form("soldcompanyname")
	
	if rqAddressForm <> "" then
		rqAddress = rqAddressForm
	else
		rqAddress = rqCountrySession 
	end if
	
	Session("Address") = rqAddress
	Session("rqsoldcompanyname") = rqsoldcompanyname
	


	
%>



<%

'if rqAddCompany <> "" then
  
 str = "<form action=""changeshippingAddress.asp"" method=""post"" ><table><tr><td>Enter company name:</td>"

			
strCompany = "SELECT compId,CompName FROM QW_Company where compId = '"&rqAddCompany&"'"

Rs.open strCompany,ConnObj
            
 str = str&"<td><input type=""text"" readonly=""readonly"" name=""soldcompanyname"" id=""soldcompanyname"" value="&Rs("CompName")&" size=""33"" /></td></tr><tr><td>Enter Address:</td><td><Select name=""soldcompanyaddress_1"" id=""soldcompanyaddress_1""><option value=""Select"">--Select--</option>"
 
				
strAddress = "SELECT CompAddress a FROM QW_CompAddress where compId = '"&rqAddCompany&"'"

Rs1.open strAddress,ConnObj

do until Rs1.EOF 
str = str&"<option value="& Rs1("a") &" >"&Rs1("a")&"</option>"
	
Rs1.movenext
loop 
Rs1.close

str = str&"</select></td><td>"

'str = str&"<a href=""javascript:;"" onClick=""toggleVARetainerAddMoreBP1('AddMoreBP1');""><span id=""AddMorelink1"">Add More</span></a>"


str = str&"</td></tr><tr id=""AddMoreBP1"" style=""display:none""><td><b>Enter Address:</b></td><td><input type=""text"" name=""editcompanyaddress_1"" size=""20"">&nbsp; <a href=""javascript:;"" onClick=""toggleVARetainerAddMoreBP2('AddMoreBP2');""><span  id=""AddMorelink2"">Add More</span></a></td></tr><tr id=""AddMoreBP2"" style=""display:none""><td><b>Enter Address:</b></td><td><input type=""text"" name=""editcompanyaddress_2"" size=""20"">&nbsp; <a href=""javascript:;"" onClick=""toggleVARetainerAddMoreBP3('AddMoreBP3');""><span  id=""AddMorelink3"">Add More</span></a></td></tr><tr id=""AddMoreBP3"" style=""display:none""><td><b>Enter Address:</b></font></td><td><input type=""text"" name=""editcompanyaddress_4"" size=""20"">&nbsp; <a href=""javascript:;"" onClick=""toggleVARetainerAddMoreBP4('AddMoreBP4');"" ><span  id=""AddMorelink4"">Add More</span></a></td></tr><tr id=""AddMoreBP4"" style=""display:none""><td><b>Enter Address:</b></font></td><td><input type=""text"" name=""editcompanyaddress_5"" size=""20"">&nbsp; <a href=""javascript:;"" onClick=""toggleVARetainerAddMoreBP5('AddMoreBP5');""><span  id=""AddMorelink5"">Add More</span></a></td></tr><tr id=""AddMoreBP5"" style=""display:none""><td><b>Enter Address:</b></td><td><input type=""text"" name=""editcompanyaddress_6"" size=""20"">&nbsp; <a href=""javascript:;"" onClick=""toggleVARetainerAddMoreBP6('AddMoreBP6');""><span  id=""AddMorelink6"">Add More</span></a></td></tr><tr id=""AddMoreBP6"" style=""display:none""><td><b>Enter Address:</b></td><td><input type=""text"" name=""editcompanyaddress_7"" size=""20"">&nbsp; <a href=""javascript:;"" onClick=""toggleVARetainerAddMoreBP7('AddMoreBP7');""><span  id=""AddMorelink7"">Add More</span></a></td></tr><tr id=""AddMoreBP7"" style=""display:none""><td><b>Enter Address:</b></td><td><input type=""text"" name=""editcompanyaddress_10"" size=""20""></td> </tr><tr><td colspan=""2""><b>Enter Contact details:</b></td></tr><tr><td>Enter name:</td><td><Select name=""soldcontactname_1"" id=""soldcontactname_1"" onchange=""findcontactAddress(this.value)""><option value=""Select"">--Select--</option>"
 			  	    
strContact = "SELECT compId,contName a,contEmailId,contPhoneno FROM QW_CompContactDet where compId = '"&rqAddCompany&"'"
Rs2.open strContact,ConnObj
do until Rs2.EOF 

str = str&"<option value="&Rs2("compId") &">"&Rs2("a")&"</option>"
 
Rs2.movenext
loop 
Rs2.close


			            
str = str&"</select></td></tr><tr><td>Enter email-id:</td><td><Select name=""soldcontactemail_1"" id=""soldcontactemail_1""><option value=""Select"">--Select--</option>"
           		  

strContact1 = "SELECT compId,contName,contEmailId a,contPhoneno FROM QW_CompContactDet where compId = '"&rqAddCompany&"'"
Rs2.open strContact1,ConnObj
do until Rs2.EOF
                  
str = str&"<option   value="&Rs2("a") &">"& Rs2("a") &"</option>"

Rs2.movenext
loop 
Rs2.close

str = str&"</Select></td></tr><tr><td>Enter phone:</td><td><Select name=""soldcontactphone_1"" id=""soldcontactphone_1""><option value=""Select"">--Select--</option>"
           		  
                  
strContact1 = "SELECT contName,contEmailId,contPhoneno FROM QW_CompContactDet where compId = '"&rqAddCompany&"'"
Rs2.open strContact1,ConnObj
do until Rs2.EOF 

str = str&"<option value="&Rs2("contPhoneno") &">"& Rs2("contPhoneno") &" </option>"
                  
Rs2.movenext
loop 
Rs2.close





str = str&"</Select></td></tr><tr><td>Enter faxno:</td><td><Select name=""soldfaxno_1"" id=""soldfaxno_1""><option value=""Select"">--Select--</option>"
           		  
                  
strContact1 = "SELECT contName,contEmailId,contPhoneno,fax a FROM QW_CompContactDet where compId = '"&rqAddCompany&"'"
Rs2.open strContact1,ConnObj
do until Rs2.EOF 

str = str&"<option value="&Rs2("a") &">"& Rs2("a") &" </option>"
                  
Rs2.movenext
loop 
Rs2.close


str = str&"</Select></td><td>"
'str = str&"<a href=""javascript:;"" onClick=""toggleVARetainerAddMoreContactBP1('AddMoreContactBP1');""><span  id=""AddMoreContactlink1"">Add More</span></a>"
str = str&"</td></tr><tr><table id=""AddMoreContactBP1"" style=""display:none""><tr><td>Enter name:</td><td><input type=""text"" name=""editcontactname_2""/></td></tr><tr><td>Enter email-id:</td><td><input type=""text"" name=""editcontactemail_2""/></td></tr><tr><td>Enter phone:</td><td><input type=""text"" name=""editcontactphone_2""/>&nbsp; <a href=""javascript:;"" onClick=""toggleVARetainerAddMoreContactBP2('AddMoreContactBP2');""><span  id=""AddMoreContactlink2"">Add More</span></a> </td></table></tr><tr><table id=""AddMoreContactBP2"" style=""display:none""><tr><td>Enter name:</td><td><input type=""text"" name=""editcontactname_3""/></td></tr><tr><td>Enter email-id:</td><td><input type=""text"" name=""editcontactemail_3""/></td></tr><tr><td>Enter phone:</td><td><input type=""text"" name=""editcontactphone_3""/>&nbsp;<a href=""javascript:;"" onClick=""toggleVARetainerAddMoreContactBP3('AddMoreContactBP3');""><span  id=""AddMoreContactlink3"">Add More</span></a></td></tr></table></tr><tr><table  id=""AddMoreContactBP3"" style=""display:none""><tr><td>Enter name:</td><td><input type=""text"" name=""editcontactname_4""/></td></tr><tr><td>Enter email-id:</td><td><input type=""text"" name=""editcontactemail_4""/></td></tr><tr><td>Enter phone:</td><td><input type=""text"" name=""editcontactphone_4""/>&nbsp; <a href=""javascript:;"" onClick=""toggleVARetainerAddMoreContactBP4('AddMoreContactBP4');""><span  id=""AddMoreContactlink4"">Add More</span></a></td></table></tr><tr><table id=""AddMoreContactBP4"" style=""display:none""><tr><td>Enter name:</td><td><input type=""text"" name=""editcontactname_5""/></td></tr><tr><td>Enter email-id:</td><td><input type=""text"" name=""editcontactemail_5""/></td></tr><tr><td>Enter phone:</td><td><input type=""text"" name=""editcontactphone_5""/><a href=""javascript:;"" onClick=""toggleVARetainerAddMoreContactBP5('AddMoreContactBP5');""><span  id=""AddMoreContactlink5"">Add More</span></a></td></table></tr><tr><td colspan=""2"" align=""right""><input type=""hidden"" name=""Submit"" id=""Submit"" value=""Submit""><input type=""hidden"" id=""getCompanyId"" name=""getCompanyId"" value="&rqAddCompany &" ><input type=""hidden"" id=""getBillId"" name=""getBillId"" value="&rqAddCompany &" ><input type=""hidden"" id=""soldCompId"" name=""soldCompId"" value="&rqAddCompany &" ><input type=""hidden"" id=""shipCompId"" name=""shipCompId"" value="&rqAddCompany &" ><input type=""hidden"" id=""billCompId"" name=""billCompId"" value="&rqAddCompany &" ><input type=""button"" name=""Change"" value=""Sumbit"" class=""buttonc"" onClick=""findcompanyDetails(this.value);"" /></td></tr></table></form>"
		
 'End If 
 
 Response.Write(str)

%>
