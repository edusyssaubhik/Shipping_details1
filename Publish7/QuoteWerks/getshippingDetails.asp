
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->

<%

SET Rs = Server.CreateObject("ADODB.Recordset")
SET Rs1 = Server.CreateObject("ADODB.Recordset")
SET Rs2 = Server.CreateObject("ADODB.Recordset")



''''''''''''''from company.js page''''''''''''''
rqAddCompany = Request.QueryString("company")


If rqAddCompany <>  "" Then

Session("Company1") =  rqAddCompany


'response.Write(rqAddCompany & "hiii")

End If


    rqAddress = Request.Form("selectcompanyaddress_2")
	rqsoldcompanyname = Request.Form("soldcompanyname")
	
	if rqAddressForm <> "" then
		rqAddress = rqAddressForm
	else
		rqAddress = rqCountrySession 
	end if
	
	Session("Address") = rqAddress
	'Session("rqsoldcompanyname") = rqsoldcompanyname
	


	
%>



<%

'if rqAddCompany <> "" then
  
 str = "<form action=""getshippingDetails.asp"" method=""post"" id=""hello1""><table id=""hello2""><tr><td>Enter company name:</td>"

			
strCompany = "SELECT compId,CompName FROM QW_Company where compId = '"&rqAddCompany&"'"

Rs.open strCompany,ConnObj
            
 str = str&"<td><input type=""text"" readonly=""readonly"" name=""shipcompanyname"" id=""shipcompanyname"" value="&Rs("CompName")&" /></td></tr><tr><td>Enter Address:</td><td><Select name=""soldcompanyaddress_2"" id=""soldcompanyaddress_2""><option value=""Select"">--Select--</option>"
 

strAddress = "SELECT CompAddress FROM QW_CompAddress where compId = '"&rqAddCompany&"'"

Rs1.open strAddress,ConnObj

do until Rs1.EOF 
str = str&"<option value="& Rs1("CompAddress") &" >"&Rs1("CompAddress")&"</option>"
	
Rs1.movenext
loop 
Rs1.close

str = str&"</select></td><td>"

'str = str&"<a href=""javascript:;"" onClick=""toggleVARetainerAddMoreBP1('AddMoreBP1');""><span id=""AddMorelink1"">Add More</span></a>"


str = str&"</td></tr><tr id=""AddMoreBP1"" style=""display:none""><td><b>Enter Address:</b></td><td><input type=""text"" name=""editcompanyaddress_2"" size=""20"">&nbsp; <a href=""javascript:;"" onClick=""toggleVARetainerAddMoreBP2('AddMoreBP2');""><span  id=""AddMorelink2"">Add More</span></a></td></tr><tr id=""AddMoreBP2"" style=""display:none""><td><b>Enter Address:</b></td><td><input type=""text"" name=""editcompanyaddress_2"" size=""20"">&nbsp; <a href=""javascript:;"" onClick=""toggleVARetainerAddMoreBP3('AddMoreBP3');""><span  id=""AddMorelink3"">Add More</span></a></td></tr><tr id=""AddMoreBP3"" style=""display:none""><td><b>Enter Address:</b></font></td><td><input type=""text"" name=""editcompanyaddress_4"" size=""20"">&nbsp; <a href=""javascript:;"" onClick=""toggleVARetainerAddMoreBP4('AddMoreBP4');"" ><span  id=""AddMorelink4"">Add More</span></a></td></tr><tr id=""AddMoreBP4"" style=""display:none""><td><b>Enter Address:</b></font></td><td><input type=""text"" name=""editcompanyaddress_5"" size=""20"">&nbsp; <a href=""javascript:;"" onClick=""toggleVARetainerAddMoreBP5('AddMoreBP5');""><span  id=""AddMorelink5"">Add More</span></a></td></tr><tr id=""AddMoreBP5"" style=""display:none""><td><b>Enter Address:</b></td><td><input type=""text"" name=""editcompanyaddress_6"" size=""20"">&nbsp; <a href=""javascript:;"" onClick=""toggleVARetainerAddMoreBP6('AddMoreBP6');""><span  id=""AddMorelink6"">Add More</span></a></td></tr><tr id=""AddMoreBP6"" style=""display:none""><td><b>Enter Address:</b></td><td><input type=""text"" name=""editcompanyaddress_7"" size=""20"">&nbsp; <a href=""javascript:;"" onClick=""toggleVARetainerAddMoreBP7('AddMoreBP7');""><span  id=""AddMorelink7"">Add More</span></a></td></tr><tr id=""AddMoreBP7"" style=""display:none""><td><b>Enter Address:</b></td><td><input type=""text"" name=""editcompanyaddress_20"" size=""20""></td> </tr><tr><td colspan=""2""><b>Enter Contact details:</b></td></tr><tr><td>Enter name:</td><td><Select name=""soldcontactname_2"" id=""soldcontactname_2"" onchange=""findcontactAddress1(this.value)""><option value=""Select"">--Select--</option>"
            

			  	    
strContact = "SELECT compId,contName,contEmailId,contPhoneno FROM QW_CompContactDet where compId = '"&rqAddCompany&"'"
Rs2.open strContact,ConnObj
do until Rs2.EOF 

str = str&"<option value="&Rs2("compId") &">"&Rs2("contName")&"</option>"
 
Rs2.movenext
loop 
Rs2.close


			            
str = str&"</select></td></tr><tr><td>Enter email-id:</td><td><Select name=""soldcontactemail_2"" id=""soldcontactemail_2""><option value=""Select"">--Select--</option>"
           		  

strContact1 = "SELECT compId,contName,contEmailId,contPhoneno FROM QW_CompContactDet where compId = '"&rqAddCompany&"'"
Rs2.open strContact1,ConnObj
do until Rs2.EOF
                  
str = str&"<option value="&Rs2("contEmailId") &">"& Rs2("contEmailId") &"</option>"

Rs2.movenext
loop 
Rs2.close

str = str&"</Select></td></tr><tr><td>Enter phone:</td><td><Select name=""soldcontactphone_2"" id=""soldcontactphone_2""><option value=""Select"">--Select--</option>"
           		  
                  
strContact1 = "SELECT contName,contEmailId,contPhoneno FROM QW_CompContactDet where compId = '"&rqAddCompany&"'"
Rs2.open strContact1,ConnObj
do until Rs2.EOF 

str = str&"<option value="&Rs2("contPhoneno") &">"& Rs2("contPhoneno") &" </option>"
                  
Rs2.movenext
loop 
Rs2.close


str = str&"</Select></td></tr><tr><td>Enter faxno:</td><td><Select name=""soldfaxno_2"" id=""soldfaxno_2""><option value=""Select"">--Select--</option>"
           		  
                  
strContact1 = "SELECT contName,contEmailId,contPhoneno,fax FROM QW_CompContactDet where compId = '"&rqAddCompany&"'"
Rs2.open strContact1,ConnObj
do until Rs2.EOF 

str = str&"<option value="&Rs2("fax") &">"& Rs2("fax") &" </option>"
                  
Rs2.movenext
loop 
Rs2.close


str = str&"</Select></td><td>"
'str = str&"<a href=""javascript:;"" onClick=""toggleVARetainerAddMoreContactBP1('AddMoreContactBP1');""><span  id=""AddMoreContactlink1"">Add More</span></a>"
str = str&"</td></tr><tr><table id=""AddMoreContactBP1"" style=""display:none""><tr><td>Enter name:</td><td><input type=""text"" name=""editcontactname_2""/></td></tr><tr><td>Enter email-id:</td><td><input type=""text"" name=""editcontactemail_2""/></td></tr><tr><td>Enter phone:</td><td><input type=""text"" name=""editcontactphone_2""/>&nbsp; <a href=""javascript:;"" onClick=""toggleVARetainerAddMoreContactBP2('AddMoreContactBP2');""><span  id=""AddMoreContactlink2"">Add More</span></a> </td></table></tr><tr><table id=""AddMoreContactBP2"" style=""display:none""><tr><td>Enter name:</td><td><input type=""text"" name=""editcontactname_3""/></td></tr><tr><td>Enter email-id:</td><td><input type=""text"" name=""editcontactemail_3""/></td></tr><tr><td>Enter phone:</td><td><input type=""text"" name=""editcontactphone_3""/>&nbsp;<a href=""javascript:;"" onClick=""toggleVARetainerAddMoreContactBP3('AddMoreContactBP3');""><span  id=""AddMoreContactlink3"">Add More</span></a></td></tr></table></tr><tr><table  id=""AddMoreContactBP3"" style=""display:none""><tr><td>Enter name:</td><td><input type=""text"" name=""editcontactname_4""/></td></tr><tr><td>Enter email-id:</td><td><input type=""text"" name=""editcontactemail_4""/></td></tr><tr><td>Enter phone:</td><td><input type=""text"" name=""editcontactphone_4""/>&nbsp; <a href=""javascript:;"" onClick=""toggleVARetainerAddMoreContactBP4('AddMoreContactBP4');""><span  id=""AddMoreContactlink4"">Add More</span></a></td></table></tr><tr><table id=""AddMoreContactBP4"" style=""display:none""><tr><td>Enter name:</td><td><input type=""text"" name=""editcontactname_5""/></td></tr><tr><td>Enter email-id:</td><td><input type=""text"" name=""editcontactemail_5""/></td></tr><tr><td>Enter phone:</td><td><input type=""text"" name=""editcontactphone_5""/><a href=""javascript:;"" onClick=""toggleVARetainerAddMoreContactBP5('AddMoreContactBP5');""><span  id=""AddMoreContactlink5"">Add More</span></a></td></table></tr><tr><td colspan=""2"" align=""right""><table  id=""AddMoreContactBP3"" style=""display:none""><tr><td>Enter name:</td><td><input type=""text"" name=""editcontactname_4""/></td></tr><tr><td>Enter email-id:</td><td><input type=""text"" name=""editcontactemail_4""/></td></tr><tr><td>Enter phone:</td><td><input type=""text"" name=""editcontactphone_4""/>&nbsp; <a href=""javascript:;"" onClick=""toggleVARetainerAddMoreContactBP4('AddMoreContactBP4');""><span  id=""AddMoreContactlink4"">Add More</span></a></td></table></tr><tr><table id=""AddMoreContactBP4"" style=""display:none""><tr><td>Enter name:</td><td><input type=""text"" name=""editcontactname_5""/></td></tr><tr><td>Enter email-id:</td><td><input type=""text"" name=""editcontactemail_5""/></td></tr><tr><td>Enter phone:</td><td><input type=""text"" name=""editcontactphone_5""/><a href=""javascript:;"" onClick=""toggleVARetainerAddMoreContactBP5('AddMoreContactBP5');""><span  id=""AddMoreContactlink5"">Add More</span></a></td></table></tr><tr><td colspan=""2"" align=""right""><input type=""hidden"" name=""Submit"" value=""Ship"" id=""ship""><input type=""button"" name=""Change"" value=""Ship"" class=""buttonc"" onClick=""findShipDetails(this.value);"" /></td></tr></table></form>"
		
 'End If 
 
 Response.Write(str)

%>
