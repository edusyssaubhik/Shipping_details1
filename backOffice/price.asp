<%@ Language = "VBScript" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 30/07/2012'
'Description :'
' Update Price'
'======================================================='

%>
<% If not  Session("UserId") = "" Then %>
<!--#include virtual="./includes/connection.asp"-->
<%
'======================================================='
 'Declare The Variables'
'======================================================='

 Dim arrAllQueries
 Dim rqType,rqPage,rqRow
 Dim firstRow,lastRow,numRows,rowcounter
 Dim strQuery,viewQuestionNo,i
 Dim rqCityId, objRs1
 Dim strQuery1,Rs1,Rs,Rs2
 Dim rsCity,Query,svrHttps,svrHost,RqRetriveURLCount,rqCount,rqCountry
 Dim message,rqBrand
 
 message = Session("message")
 Session("message") = ""

 Set Rs1 = Server.CreateObject("ADODB.Recordset")
 Set Rs  = Server.CreateObject("ADODB.Recordset")
 Set Rs2  = Server.CreateObject("ADODB.Recordset")
 Set objRs1  = Server.CreateObject("ADODB.Recordset")


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
 <title></title>
 <link href="/backoffice/css/pagestyle.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="/js/city.js"></script>
        <script type="text/javascript">
		
//Calculating The Taxes And Dicounts

function calculate() {


   var pricewithouttax = document.updateprice.priceWithOutTax.value;

   var tax = document.updateprice.tax.value;

   var earlybirddiscount = document.updateprice.earlybirddicount.value;
   
   var x = Math.ceil((pricewithouttax / 100 * tax))

   var monthly = parseInt(pricewithouttax) + parseInt(x)

   var discountwithouttax = parseInt(pricewithouttax) - parseInt(earlybirddiscount)

   var z = Math.round((discountwithouttax / 100 * tax))
   
   var discountwithtax = parseInt(discountwithouttax) + parseInt(z)

   if (!isNaN(monthly) &&   
        (monthly != Number.POSITIVE_INFINITY) &&
        (monthly != Number.NEGATIVE_INFINITY)) {
        document.updateprice.priceWithTax.value = Math.ceil(monthly);

    }

    else {
        document.updateprice.priceWithTax.value = "";
       }

    if (!isNaN(discountwithouttax) &&
        (discountwithouttax != Number.POSITIVE_INFINITY) &&
        (discountwithouttax != Number.NEGATIVE_INFINITY)) {

        document.updateprice.afterearlybirddiscountwithouttax.value = round(discountwithouttax);

    }
    // Otherwise, the user's input was probably invalid, so don't
    // display anything.
    else {
        document.updateprice.afterearlybirddiscountprice.value = "";
       }

   if (!isNaN(discountwithtax) &&
        (discountwithtax != Number.POSITIVE_INFINITY) &&
        (discountwithtax != Number.NEGATIVE_INFINITY)) {

        document.updateprice.afterearlybirddiscountwithtax.value = round(discountwithtax);

    }
    // Otherwise, the user's input was probably invalid, so don't
    // display anything.
    else {
        document.updateprice.afterearlybirddiscountprice.value = "";
       }
}

// This simple method rounds a number to two decimal places.
function round(x) {
  return Math.round(x*100)/100;
}



					function validate_required(field,alerttxt)
					{
						with (field)

						{
							var myValue = field.value;
							myValue = myValue.trim();
							var validformat=/^\d+(?:\.\d+)?$/
							if (!validformat.test(myValue))
							  {alert(alerttxt);return false}
							else {return true}
						}
					}
					//****************************************************
					/*DropDown Validation*/
					function validate_dropDown(field,alerttxt)
					{
						with (field)
						{
	
							if (field.value =="0")
							  {alert(alerttxt);return false}
							else {return true}
						}
					}
					/*Date validation*/
					function validate_date(field,alerttxt)
					{	
						 
						with (field)
						{
							var validformat=/^\d{4}\/\d{2}\/\d{2}$/
							var myValue = field.value;
							myValue = myValue.trim();
							if (!validformat.test(myValue))
							  {alert(alerttxt);return false}
							else {return true}
						}
					}
					function showMessage(){
											
					}
					//******************************************************
					function validate_form(thisform)
					{
						
							
						with (thisform)
						{

								
								
								
								//from date
								if (validate_date(fromDate,"Please Enter From Date")==false)
									  {fromDate.focus();return false}
									  
								//to date
								if (validate_date(toDate,"Please Enter To Date")==false)
									  {toDate.focus();return false}
									  
								//Price Without Tax
								if (validate_required(priceWithOutTax,"Please Enter Price Without Tax Amount")==false)
									  {priceWithOutTax.focus();return false}	 
									  
								//Tax
								if (validate_required(tax,"Please Enter Tax")==false)
									  {tax.focus();return false}	 
									   
								//Price With Tax	  
								if (validate_required(priceWithTax,"Please Enter Price With Tax Amount")==false)
									  {priceWithTax.focus();return false}
								
								//EBD Tax
								if (validate_required(earlybirddicount,"Please Enter Early bird dicount")==false)
									  {earlybirddicount.focus();return false}
									  
							    //EBD Without Tax
								if (validate_required(afterearlybirddiscountwithouttax,"Please Enter EBD Without Tax Amount")==false)
									  {afterearlybirddiscountwithouttax.focus();return false}			  
									  
									  	
								//EBD With Tax	  
								if (validate_required(afterearlybirddiscountwithtax,"Please Enter EBD With Tax Amount")==false)
									  {afterearlybirddiscountwithtax.focus();return false}
									  
								  
								
									
							//Course
								if (validate_dropDown(courseName,"Please select course")==false)
									  {courseName.focus();return false}
								
								//Course
								if (validate_dropDown(country,"Please select country")==false)
									  {country.focus();return false}
									  
						}			
							
						
					}		
					

function validate(link)
{ 
		
//Showing Message Before Updating
	//var impMessage;
	//impMessage = confirm("Are You Sure You Want To Update ?");
//	if(impMessage)
//	  {return true;}
//	else 
//	  {return false;}
	
	 if(confirm("Are You Sure You Want To Update ?"))
  {
      return true;
  }
return false;
							
}				
		
					-->
					</script>  
</head>
<body><div id="htMap">
<table border="1" height="150" cellspacing="0" class="dbborder" width="1000px">
 <tr>
   <td colspan="9" height="35"><div align="center"><font color="#00B0EC" face="Arial" size="4">Welcome to <span style="color:#FF3300"> 
    <% if Session("country") = "" And session("brand") = "" then %>
     
  
         <% elseif Session("country") = "" And session("brand") <> "" then %>
   
		      <span style="color:#FF3300"><% =Session("brand") %></span>
       
	     <% else %>
     
		       <span style="color:#FF3300"><% =Session("brand") %>&nbsp;<% =Session("country") %></span>
         
	     <% end if %> </span>
      Back Office</font></div></td>
 </tr>
 <tr>
  <td width="100px" valign="top" rowspan="22">
    <!--#include file="includes/leftMenu.html"-->
  </td>
 </tr>

 <tr>
  <td height="200">
<% 
rqBrand = Request.Form("brand")

If rqBrand = "" Then %>  
  
    <form action="/backoffice/price.asp" name="price" method="post" onsubmit="return validate_form(this)">
   <table  width="100%" cellpadding="3" cellspacing="5">
     <tr align="center"><td >
      <b>Select the Certification type to change the price</b>:
                    		<select name="brand" id="brand">
                            <option value="0" selected="selected">-- Select Course --</option>
                             <%
				'Query For Selecting country'	
				  DIm strCertificate,arrAllCertificate
					strCertificate = "SELECT * FROM Certification where Ven_ID = '"&Session("vendor")&"' ORDER BY Cer_ID ASC"
					response.Write(strCertificate)
					Rs2.Open strCertificate, ConnObj
					
					If Not Rs2.EOF THen
					arrAllCertificate = Rs2.getrows
					NumRows = Ubound(arrAllCertificate,2)
					FirstRow = 0
					LastRow  = NumRows
					End If
					
					If IsArray(arrAllCertificate) Then
					For RowCounter = FirstRow to LastRow 
			
			%>
            

                           <option  value="<% = arrAllCertificate(1,RowCounter)%>"><% = arrAllCertificate(1,RowCounter) %></option>
                             <% Next
                End If
                Rs2.Close
                 %>
                            </select>
                    </td></tr>
                    
                    
                    
                    
      <tr>
        <td colspan="2" align="center"><input type="submit" name="submit" value="Submit" class="buttonc" align="middle"></td>
      </tr>
</table>
</form>
  
  <% elseIf rqBrand <> "" Then %>
  
  
  <form action="/backoffice/updateprice.asp" name="updateprice" method="post" onSubmit="return validate_form(this)">
  
      <table width="1150px" class="dbborder"  height="550" cellspacing="0" border="0" >

<tr><td colspan="4">
      
      
      
			<div style="font-size:18px;margin-left:350px;">You will be changing the price for <% = session("brand") %> <span style="color:#FF0000;"><% = rqBrand%></span></div>

    
    
</td></tr>
                   
                    
  <%If rqBrand = "PRINCE2" Then  %>
  
               <tr><td >Course Name :</td><td colspan="3">
                    		<select name="courseName" id="courseName">
                            <option value="0" selected="selected">-- Select Course --</option>
                            <option value="1">Foundation and Practitioner</option>
                            <option value="2">Foundation</option>
                            <option value="3">Practitioner</option>
                            </select>
                    </td></tr>

  
               <tr><td class="general-bodyBold">Country :</td><td colspan="3">
                    <select name="country" id="country" onChange="clicked1();">
                    <option value="0" selected="selected">--Select Country--</option>
<% If session("brand")  = "Datrix" Then%>
<option value="United Kingdom">United Kingdom</option>      
<% ElseIf session("brand")  <> "Datrix" Then%>
                     <%
				'Query For Selecting country'	
				  DIm strCountryname,arrAllCountry
					strCountryname = "SELECT * FROM proj_countrydetails ORDER BY id ASC"
					response.Write(strCountryname)
					objRs1.Open strCountryname, ConnObj
					
					If Not objRs1.EOF THen
					arrAllCountry = objRs1.getrows
					NumRows = Ubound(arrAllCountry,2)
					FirstRow = 0
					LastRow  = NumRows
					End If
					
					If IsArray(arrAllCountry) Then
					For RowCounter = FirstRow to LastRow 
			
			%>
            

                           <option  value="<% = arrAllCountry(1,RowCounter)%>"><% = arrAllCountry(1,RowCounter) %></option>
                             <% Next
                End If
                objRs1.Close
                 %>
                 <%  End If%>
                 </select>
                    </td></tr>
                    <!--Based on the country selected city will be displayed -->
                    <tr><td class="general-bodyBold">City :</td><td colspan="3">
                    		<select name="city" style="width:140px" id="city" class="TeXtFielddropdown">
                            <option value="" selected="selected">--Select City--</option>
                            </select>
                            <script type="text/javascript">
							document.getElementById("courseName").selectedIndex =0;
							document.getElementById("city").selectedIndex =0;
							</script>
                    </td></tr>
<% Else %>

 				<tr><td class="general-bodyBold">Country :</td><td colspan="3">
                   <b> United Kingdom </b>
                    </td></tr>
                    <!--Based on the country selected city will be displayed -->
                    <tr><td class="general-bodyBold">City :</td><td colspan="3">
                    		<select name="city" style="width:140px" id="city" class="TeXtFielddropdown">
                            <option value="" selected="selected">--Select City--</option>
                            <%
				'Query For Selecting country'	
				  DIm strCity,arrAllCity,CityRowCounter
				  
					strCity = "SELECT * FROM ITIL_city where country = 'United Kingdom' ORDER BY cityid ASC"
					objRs1.Open strCity, ConnObj
					
					If Not objRs1.EOF THen
					arrAllCity = objRs1.getrows
					NumRows = Ubound(arrAllCity,2)
					FirstRow = 0
					LastRow  = NumRows
					End If
					
					If IsArray(arrAllCity) Then
					For CityRowCounter = FirstRow to LastRow 
			
			%>
            

                           <option  value="<% = arrAllCity(1,CityRowCounter)%>"><% = arrAllCity(1,CityRowCounter) %></option>
                             <% Next
                End If
                objRs1.Close
                 %>
                 </select>
                            <script type="text/javascript">
							document.getElementById("courseName").selectedIndex =0;
							document.getElementById("city").selectedIndex =0;
							</script>
                    </td></tr>

<% End IF %>      
                   
                    
                    <tr>
                    <td >From :</td><td width="350px"><input type="text" name="fromDate" /><br />Eg: YYYY/MM/DD</td>
                    <td >To :</td><td width="600px"><input type="text" name="toDate" /><br />Eg: YYYY/MM/DD</td>
                    </tr>
      
                    <!--price will be displayed based on price without tax entered-->
       <tr>
          <td >Price WithOut Tax:</td>
          <td><input type="text" name="priceWithOutTax" size="20" maxlength="15" onchange="calculate();">
            <br>
            &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">(Ex : 17250 )</font></td>
          <td >Tax:</td>
          <td><input type="text" name="tax" size="20" maxlength="6" onchange="calculate();" value="0">
            <br>
            &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">(Ex : 12.36 )</font> </td>
        </tr>
        <tr>
          <td>Price With Tax:</td>
          <td><input type="text" name="priceWithTax" size="20" readonly="true">
            <br>
            &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2"></font></td>
       </tr>
       
          <tr>
          <td>EarlyBird Discount:</td>
          <td><input type="text" name="earlybirddicount" maxlength="10" onchange="calculate()" size="20">
            <br>
            &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">(Ex : 1000 )</font></td>
          <td >Applicable Days:</td>
          <td><input type="text" name="applicabledays" maxlength="10" size="20">
            <br>
            &nbsp;&nbsp;&nbsp;<font face="Arial" color="red" size="2">(Ex : 10 )</font></td>
        </tr>
        <tr>
          <td  width="250px">Price After EarlyBird Discount(WithOut Tax):</td>
          <td><input type="text" name="afterearlybirddiscountwithouttax" readonly="true"></td>
          <td  width="290px">Price After EarlyBird Discount(With Tax):</td>
          <td><input type="text" name="afterearlybirddiscountwithtax" readonly="true"></td>
        </tr>
                    
                    <tr><td colspan="4"><br /><div align="center"><input class="buttonc" type="Submit" Name="Submit" Value="Update"  onclick="return validate(this.href);"/> <input class="buttonc" type="reset" Name="reset" Value="reset" /><input type="hidden" name="brand" value="<% = rqBrand %>" /></div></td></tr>
        </table>

            </form>
</div>
</body>
</html>

<% End If %>
<%
 ConnObj.Close
 Set ConnObj = Nothing
 Else
 Response.Redirect("../backOffice/login.asp")
 End If
%>