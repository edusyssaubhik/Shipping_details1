<!--#include virtual="/QuoteWerks/includes/header.asp"-->
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->

<head>
<% 
'If not Session("userName") then redirect to  login page'
	If Session("QWUserName") = "" Then 
		Response.Redirect("default.asp")
	Else
	
%>
<%



rqchangeshipcompId = Session("Company1")

rqchange = request.form("Change")



%>
</head>


<!-- Body Starts -->
<body style="margin-top:0px">
<link href="/QuoteWerks/css/leftNavi.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/form.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/mainContent.css" rel="stylesheet" type="text/css" />


<!--<tr>
  <td width="170px" align="left" valign="top" style=" border-right:#CCC thin solid;"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftNavigation" >
      <!--#include virtual="/QuoteWerks/includes/LeftMenu.asp"-->
    </table></td>
  <!--<td width="730" align="center" valign="top" height="450px">
 
  <div id="styledForm" class="myform">
  
   <form action="addeditcompanydetails.asp" method="post" onSubmit="return Form_Validator(this)">-->
      <table border="0" cellpadding="7">
      <tr><td colspan="2" height="50px">&nbsp;</td></tr>
        <tr>
          <td colspan="2" align="center">-->
         
		     <% 
			   
       
               If rqchange = "Ship" Then 
			 
			   rqship1Companyname = Request.Form ("companyname")
				
			   rqShip1Address = Request.Form("selectcompanyaddress_1")
				
			   rqShip1name = Request.Form("selectcontactname_1")
			
			   rqShip1email = Request.Form("contactemail_1")
			
			   rqship1phone = Request.Form("selectcontactphone_1")
			   
			   
			   Session("rqship1Companyname") = rqship1Companyname
		       Session("rqShip1Address") = rqShip1Address
			   Session("rqShip1name") = rqShip1name
			   Session("rqShip1email") = rqShip1email 
			   Session("rqship1phone") = rqship1phone 
			   
			   response.write(rqship1Companyname)
			   response.write(rqShip1Address)
			   response.write(rqShip1name)
			   response.write(rqship1phone)
	
			   
			   End If 
			   
			 
		    	   
					 
					 
		       If 	rqchange = "Bill" Then
			   
			   rqbillCompanyname = Request.Form ("companyname")
				
			   rqbillAddress = Request.Form("selectcompanyaddress_1")
				
			   rqbillname = Request.Form("selectcontactname_1")
			
			   rqbillemail = Request.Form("contactemail_1")
			
			   rqbillphone = Request.Form("selectcontactphone_1")
			   
			   
			   Session("rqbillCompanyname") = rqbillCompanyname
		       Session("rqbillAddress") = rqbillAddress
			   Session("rqbillname") = rqbillname
			   Session("rqbillemail") = rqbillemail 
			   Session("rqbillphone") = rqbillphone 
		
			  
				   	  
			    End If  
			       
					 
					  

		%>
        
        
        
        
        
        
			</td> 
	 
        </tr>
      </table>
   </div></td>
</tr>
</table>
<% End If %>

</Body>
<!-- Body Ends -->
