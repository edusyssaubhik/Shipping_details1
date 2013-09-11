<!--#include virtual="/includes/captcha.asp"-->
<!--#include virtual="/includes/connection.asp"-->

<%
 '======================================================='
'Written By : Priyanka'
'Written Date : 09/10/2012'
'Last Modified By : Priyanka'
'Last Modified Date : 12/10/2012'
'Description : HAve content function, image function, BL function'
'This is UK Page'
'======================================================='%
%>
<script language="javascript">


    $(function() {

       var data = "/includes/searchTerms.asp";
          
        $.get(data).success(initAutocomplete);
          
        function initAutocomplete(data) {        
            var availableTags = data.split("sH");
            $("#s").autocomplete({
                minLength: 3,
                delay: 600,
                source: availableTags
            });
            $("#form_course").autocomplete({
                source: availableTags
            });

        }
    });



</script>




<%


'Our Customer love us'
Function CfGetOurCustomer()

CfGetOurCustomer = "<div style=""width:272px; height:374px; float:right; font-size:14px;""><a href=""http://www.trustpilot.co.uk/review/www.datrixtraining.com"" target=""_blank""><img src=""/images/buttons/tp_badge-180.png"" alt=""Trustpilot Badge"" style=""padding-left:30px;""></a><div style=""padding-left:40px;""><p>Satisfaction Guarantee</p><p>Independent Reviews</p><p>92% Repeat Customers</p><p>Continuous Improvement</p><i><b>Buy with Confidence</b></i><a class=""link"" href=""http://www.trustpilot.co.uk/review/www.datrixtraining.com"" target=""_blank"">Read More </a></div>"

End Function  


'Trust Pilot'
Function CfGetTrustPilot()

CfGetTrustPilot = "<div style=""height:32px; background:#b9b7b8; margin-top:58px; padding:12px 0px 0px 70px;""><img src=""/images/buttons/T-logo.jpg"" /></div>"

End Function  


'Learning Bank'
Function CfGetLowestPrices()

CfGetLowestPrices = "<div class=""home-box deal-of-the-week"" style=""margin-right: 13px;margin-top:20px;""><h3>Satisfaction Guarantee </h3><p style=""line-height: 15px; ""><img src=""/images/buttons/100-guarantee.png"" style=""float: right;"" />Our training team strives to consistently deliver the highest standards of training. All our courses are covered by our Satisfaction Guarantee.</p><a href=""/satisfaction-guarantee.asp"" class=""link"" style=""position: absolute; bottom: 12px; left: 15px;"">See More</a></div>"

End Function  


'Who We Work With'
Function CfGetWhoWeWorkWithImages()

CfGetWhoWeWorkWithImages = "<h3>Who We Work With</h3><table><tbody><tr><td><img src=""/images/buttons/aol.jpg"" style=""margin: 5px 10px 0 10px;""></td><td><img src=""/images/buttons/bnfl.jpg"" style=""margin: 5px 10px 0 10px;""></td><td><img src=""/images/buttons/boots.jpg"" style=""margin: 5px 10px 0 10px;""></td></tr><tr><td><img src=""/images/buttons/deutsche-bank.jpg"" style=""margin: 10px 10px;""></td><td><img src=""/images/buttons/enterprise.jpg"" style=""margin: 10px 10px;""></td><td><img src=""/images/buttons/matalan.jpg"" style=""margin: 10px 10px;""></td></tr><tr><td><img src=""/images/buttons/nhs.jpg"" style=""margin: 0 10px;""></td><td><img src=""/images/buttons/logo_morrisons-homepage.png"" style=""margin: 0 10px;""></td><td><img src=""/images/buttons/rbs.jpg"" style=""margin: 0 10px;""></td></tr></tbody></table><a href=""/our-customers.asp"" class=""link"" style=""position: absolute; bottom: 12px; left: 15px;"">See more of our customers</a>"

End Function    


'Our 1 Hour Quote Guarantee'
Function CfGetQuoteGuarantee()

CfGetQuoteGuarantee = "<h3>Our 1 Hour Quote Guarantee</h3><p style=""line-height: 15px;""><img style=""float: right;"" src=""/images/buttons/box3-image.jpg"">With some training companies, asking for a quotation can take a long time.</p><p>That's why at Datrix we guarantee that when you request a quote, you will receive a clear quotation from us within 60 minutes.</p><a href=""/one-hour-quote.asp"" class=""link"" style=""position: absolute; bottom: 12px; left: 15px;"">Request a Quote</a>"

End Function    

'Company Logos'
Function CfGetCorporateCustomers()

CfGetCorporateCustomers = "<a href=""/training/courses/citrix.asp""><img src=""/images/buttons/citrix-125x75.gif"" alt=""CITRIX Training Courses""></a><a href=""/training/courses/cisco.asp""><img src=""/images/buttons/cisco-125x75.gif"" alt=""CISCO Training Courses""></a><a href=""/training/courses/vmware.asp""><img src=""/images/buttons/vmware-125x75.gif"" alt=""VMware Training Courses""></a><a href=""/microsoft.asp""><img src=""/images/buttons/microsoft-125x75.gif"" alt=""Microsoft Training"" style=""margin-right: 0px;""></a>"

End Function    

'Course Logos'
Function CfGetOfficialCourseLogos()

CfGetOfficialCourseLogos = "<img src=""/images/buttons/logo_agile-small.png"" alt=""Agile""><img src=""/images/buttons/logo_prince2-small.png"" alt=""PRINCE2 Certification Courses""><img src=""/images/buttons/logo_msp-small.png"" alt=""MSP Training Courses""><img src=""/images/buttons/logo_itil-small.png"" alt=""ITIL Training Courses"">"

End Function 


'Course Enquiries'
Function CfGetCourseEnquiries()

CfGetCourseEnquiries = "<p></p><div class=""threecol-one""><strong>Lines are open Monday to Friday, 9:00am to 5:30pm</strong><p></p><p><strong>Course enquiries</strong></p><p>National &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0800 781 0626</p><p>London &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;020 7788 0590</p><p>Manchester &nbsp; &nbsp; &nbsp; 0161&nbsp;714 2244</p><p>Liverpool &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0151 515 2030</p><p>Preston &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;01772 507 824</p><p>Nottingham &nbsp; &nbsp; &nbsp; 0115 851 5288</p><p>Leeds &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0113 369 7070</p><p>Sheffield &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0114 223 4830</p><p>Birmingham &nbsp; &nbsp; &nbsp;0121 4371123</p><p>Bristol &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0117 2468007</p><p>Glasgow &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0141 2650015</p><p>&nbsp;</p><p><strong>Customer Service</strong></p><p>Exam results &nbsp; &nbsp; 01772 507822</p><p>Accounts &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;01772 507826</p><p>After sales &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;01772 623467</p><p>&nbsp;</p><p><strong>National Administration Centre</strong></p><p>Chorley Business &amp; Technology Centre<br>East Terrace<br>Euxton Lane<br>Chorley<br>Lancashire<br>PR7 6TE</p></div>"

End Function    
   

'Contact Us'
Function CfGetContactUs()

	%>	
<script language="javascript">

 function echeck(str) {

 		var str1 = str.value
 		var at="@"
 		var dot="."
 		var lat=str1.indexOf(at)
 		var lstr=str1.length
 		var ldot=str1.indexOf(dot)
 		if (str1.indexOf(at)==-1){
 		   alert("Invalid E-mail ID")
 		   return false
 		}

 		if (str1.indexOf(at)==-1 || str1.indexOf(at)==0 || str1.indexOf(at)==lstr){
 		   alert("Invalid E-mail ID")
 		   return false
 		}

 		if (str1.indexOf(dot)==-1 || str1.indexOf(dot)==0 || str1.indexOf(dot)==lstr){
 		    alert("Invalid E-mail ID")
 		    return false
 		}


 		 if (str1.indexOf(at,(lat+1))!=-1){
 		    alert("Invalid E-mail ID")
 		    return false
 		 }

 		 if (str1.substring(lat-1,lat)==dot || str1.substring(lat+1,lat+2)==dot){
 		    alert("Invalid E-mail ID")
 		    return false
 		 }

 		 if (str1.indexOf(dot,(lat+2))==-1){
 		    alert("Invalid E-mail ID")
 		    return false
 		 }

 		 if (str1.indexOf(" ")!=-1){
 		    alert("Invalid E-mail ID")
 		    return false
 		 }
		 
		 if (str1.indexOf(",")!=-1){
			alert("Invalid E-mail ID")
			return false
		}    

  		 return true
 	}


function validate_required(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
	}
}

//This VAlidation For Edit City

function Form_Validator(theform)
{

  with (theform)
  {

   //check to see if the City field have Numarals
 if (validate_required(FirstName,"Please enter your first name")==false)
			  {FirstName.focus();return false}
			  
   //check to see if the City field have Numarals
 if (validate_required(LastName,"Please enter your last name")==false)
			  {LastName.focus();return false}
			  
   //check to see if the City field have Numarals
 if (validate_required(phone,"Please enter your phone number")==false)
			  {phone.focus();return false}
			  
   //check to see if the City field have Numarals
 if (validate_required(email,"Please enter your email id")==false)
			  {email.focus();return false}
			  
			  			  
 //check to see if the City field have Numarals
 if (validate_required(message,"Please enter Your Message")==false)
			  {message.focus();return false}
			  
 //Check To See If The EmailId Correct Or Not   
	   
        if (echeck(email)==false)
 	         {email.focus();return false}
			  
  }
}

</script>

<%

CfGetContactUs = "<div class=""threecol-one last""><div class=""wpcf7"" id=""wpcf7-f786-p51-o1""><form  method=""post"" class=""wpcf7-form"" onsubmit=""return Form_Validator(this)"" action=""/thank-you.asp""><div style=""display: none;""><input name=""_wpcf7"" value=""786"" type=""hidden""><input name=""_wpcf7_version"" value=""3.1.2"" type=""hidden""><input name=""_wpcf7_unit_tag"" value=""wpcf7-f786-p51-o1"" type=""hidden""><input name=""_wpnonce"" value=""449ca7a789"" type=""hidden""></div><div class=""label"">First Name*</div><p><span class=""wpcf7-form-control-wrap first-name""><input name=""FirstName"" value="""" class=""wpcf7-form-control wpcf7-text wpcf7-validates-as-required"" size=""40"" type=""text""><span style=""color:#FF0000;"">"&ErrorFirstName&"</span></span></p><div class=""label"">Last Name*</div><p><span class=""wpcf7-form-control-wrap last-name""><input name=""LastName"" value="""" class=""wpcf7-form-control wpcf7-text wpcf7-validates-as-required"" size=""40"" type=""text""><span style=""color:#FF0000;"">"&ErrorLastName&"</span></span></p><div class=""label"">Telephone Number*</div><p><span class=""wpcf7-form-control-wrap phone""><input name=""phone"" value="""" class=""wpcf7-form-control wpcf7-text wpcf7-validates-as-required"" size=""40"" type=""text""><span style=""color:#FF0000;"">"&ErrorPhone&"</span></span></p><div class=""label"">Email Address*</div><p><span class=""wpcf7-form-control-wrap email""><input name=""email"" value="""" class=""wpcf7-form-control wpcf7-text wpcf7-email wpcf7-validates-as-required wpcf7-validates-as-email"" size=""40"" type=""text""><span style=""color:#FF0000;"">"&ErrorEmail&"</span></span></p><div class=""label"">Payment</div><p><span class=""wpcf7-form-control-wrap have-radio-button""><input type=""radio"" value=""0"" name=""Payment"" checked=""checked"">I will be paying for the training personally</input><br><input type=""radio"" value=""1""name=""Payment"" >My employer / company will be paying for this training</input></span></p><div class=""label"">Your Message</div><p><span class=""wpcf7-form-control-wrap your-message""><textarea name=""message"" class=""wpcf7-form-control  wpcf7-textarea"" cols=""40"" rows=""10""></textarea><span style=""color:#FF0000;"">"&ErrorMessage&"</span></span></p><p><div class=""label"" id=""new_test_captcha"" style=""margin-left:100px;""><div id=""captchaWrapper""><div id=""uppercontent"">"

If Not Session("Message") = "" Then 
CfGetContactUs =  CfGetContactUs & "<tr><td></td><td>&nbsp;"&Session("Message")&""
Session("Message") = ""
CfGetContactUs =  CfGetContactUs & "</td></tr>"
End If

CfGetContactUs =  CfGetContactUs & "</div><div id=""lowercontent""><div id=""rightPanel"">Captcha Code:<br>"&recaptcha_challenge_writer()&"<div style=""font-size: 2px;"">&nbsp;</div><div style=""height: 5px; width: 100%;"">&nbsp;</div><div id=""captchStatus"" style=""font-size: 10px;"">&nbsp;</div></div></div></div></div></p><p><input value=""Send Enquiry"" class=""wpcf7-form-control  wpcf7-submit"" type=""submit"" onsubmit=""return Form_Validator(this)"" ></p><div class=""wpcf7-response-output wpcf7-display-none""></div></form></div></div><p></p>"


End Function   


'Our Venues'
Function CfGetOurVenues()

CfGetOurVenues = "<p>Our Venues are located with the customer in mind. Each is selected for easy access, comfort and natural light to enhance your learning experience. Different venues offer different features with details available to accompany each description. For more information about our venues, please follow the links or <a href=""/contact-us.asp"">Contact Us</a>.</p><p>&nbsp;</p><div class=""region-map-wrapper""><img id=""region-map"" class=""region-map"" src=""/images/buttons/venue-map.png"" usemap=""#region-map""><map name=""region-map""><area shape=""poly"" coords=""74,8,102,6,84,27,118,26,103,60,115,74,95,92,71,94,54,77,45,54,38,40,53,7,"" alt=""scotland"" title=""scotland"" href=""#scotland"" onclick=""jQuery('#form_region').val('Scotland'); jQuery('#query-form').submit();""><area shape=""poly"" coords=""115,76,129,103,115,101,108,88,"" href=""#northeast"" alt=""northeast"" title=""northeast"" onclick=""jQuery('#form_region').val('North East'); jQuery('#query-form').submit();""><area shape=""poly"" coords=""105,92,114,103,109,114,116,119,114,134,108,140,101,130,102,114,94,102,"" alt=""northwest"" title=""northwest"" href=""#northwest"" onclick=""jQuery('#form_region').val('North West'); jQuery('#query-form').submit();""><area shape=""poly"" coords=""120,107,136,107,146,123,127,130,117,126,121,120,114,116,112,111,"" alt=""yorkshire"" title=""yorkshire"" href=""#yorkshire"" onclick=""jQuery('#form_region').val('Yorkshire'); jQuery('#query-form').submit();""><area shape=""poly"" coords=""120,132,133,135,147,128,151,144,132,161,"" alt=""eastmidlands"" title=""eastmidlands"" href=""#eastmidlands"" onclick=""jQuery('#form_region').val('East Midlands'); jQuery('#query-form').submit();""><area shape=""poly"" coords=""141,154,158,140,173,152,158,172,171,141,169,166,152,169,151,164,150,158,144,148,151,142,166,142,173,161,"" alt=""east"" title=""east"" href=""#east"" onclick=""jQuery('#form_region').val('East'); jQuery('#query-form').submit();""><area shape=""poly"" coords=""147,167,155,172,145,181,141,175,142,171,"" alt=""london"" title=""london"" href=""#london"" onclick=""jQuery('#form_region').val('London'); jQuery('#query-form').submit();""><area shape=""poly"" coords=""140,158,151,164,140,174,144,184,158,177,172,178,170,181,168,180,161,190,150,196,136,194,121,194,122,181,124,162,133,166,"" alt=""southeast"" title=""southeast"" href=""#southeast"" onclick=""jQuery('#form_region').val('South East'); jQuery('#query-form').submit();""><area shape=""poly"" coords=""123,164,107,168,101,185,87,185,64,210,90,208,120,199,120,185,"" alt=""southwest"" title=""southwest"" href=""#southwest"" onclick=""jQuery('#form_region').val('South West'); jQuery('#query-form').submit();""><area shape=""poly"" coords=""104,140,111,145,119,137,133,155,107,166,102,154,"" alt=""westmidlands"" title=""westmidlands"" href=""#westmidlands"" onclick=""jQuery('#form_region').val('West Midlands'); jQuery('#query-form').submit();""><area shape=""poly"" coords=""81,131,100,133,105,148,101,163,107,174,86,174,69,171,87,158,76,140,"" alt=""wales"" title=""wales"" href=""#wales"" onclick=""jQuery('#form_region').val('Wales'); jQuery('#query-form').submit();""></map></div><div class=""query-box-wrapper""><div class=""box-top""></div><div class=""box-content""><form id=""query-form"" class=""queryform"" method=""post"" action=""/our-venues.asp""><label for=""region"">Please select a region</label><select id=""form_region"" name=""region""><option value=""All"" selected=""selected"">All</option><option value=""East"">East</option><option value=""East Midlands"">East Midlands</option><option value=""London"">London</option><option value=""North East"">North East</option><option value=""North West"">North West</option><option value=""Scotland"">Scotland</option><option value=""South East"">South East</option><option value=""South West"">South West</option><option value=""Wales"">Wales</option><option value=""West Midlands"">West Midlands</option><option value=""Yorkshire"">Yorkshire</option></select><input name=""page"" id=""form_page"" value=""1"" type=""hidden""><input value=""Submit"" id=""form_submit"" type=""submit""><div class=""clear""></div></form></div><div class=""box-bottom""></div></div>"

End Function   




'Careers'
Function CfGetCareers()

CfGetCareers = "<div class=""entry grey""><ul class=""accordion"" id=""accordion-2""><li class=""dcjq-parent-li""><a class=""dcjq-parent"" href=""#"">Trainer Vacancies<span class=""dcjq-icon""></span><span class=""dcjq-icon""></span> <span class=""dcjq-count"">(1)</span></a><ul style=""display: none;"" class=""children""><li><a href=""?p=757"">Microsoft Certified Trainer</a><p>Salary: £25,000 - £35,000<br>Contact: Adam Jones a.jones@datrixtraining.com</p></li></ul></li><li class=""dcjq-parent-li""><a class=""dcjq-parent"" href=""#"">Sales Vacancies<span class=""dcjq-icon""></span><span class=""dcjq-icon""></span> <span class=""dcjq-count"">(1)</span></a><ul style=""display: none;"" class=""children""><li><a href=""?p=756"">Corporate Training Sales</a><p>Salary: £16,500 - £40,000<br>Contact: Adam Jones a.jones@datrixtraining.com</p></li></ul></li><li class=""dcjq-parent-li""><a class=""dcjq-parent"" href=""#"">Other Vacancies<span class=""dcjq-icon""></span><span class=""dcjq-icon""></span><span class=""dcjq-count"">(0)</span></a><ul style=""display: none;"" class=""children""></ul></li></ul>"
				
End Function 


'training'
Function CfGetTraining()

CfGetTraining = "<ul class=""accordion"" id=""accordion-2""><li class=""dcjq-parent-li""><a class=""dcjq-parent"" href=""/training/courses/desktop-applications.asp"" title=""View all posts filed under Desktop Applications"">Desktop Applications<span class=""dcjq-icon""></span><span class=""dcjq-icon""></span> <span class=""dcjq-count"">(5)</span></a><ul style=""display: none;"" class=""children""><li><a href=""/training/courses/microsoft-sharepoint-services-end-user.asp"" title=""View all posts filed under Microsoft SharePoint Services (End User)"">Microsoft SharePoint Services (End User)<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/crystal-reports.asp"" title=""View all posts filed under Crystal Reports"">Crystal Reports<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/adobe.asp"" title=""View all posts filed under Adobe"">Adobe<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/microsoft-office-2007.asp"" title=""View all posts filed under Microsoft Office 2007"">Microsoft Office 2007<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/microsoft-office-2010.asp"" title=""View all posts filed under Microsoft Office 2010"">Microsoft Office 2010<span class=""dcjq-icon""></span></a></li></ul></li><li class=""dcjq-parent-li""><a class=""dcjq-parent"" href=""/training/courses/microsoft-it.asp"" title=""View all posts filed under Microsoft Technical IT"">Microsoft Technical IT<span class=""dcjq-icon""></span><span class=""dcjq-icon""></span> <span class=""dcjq-count"">(9)</span></a><ul style=""display: none;"" class=""children"">	<li><a href=""/training/courses/microsoft-windows-7.asp"" title=""View all posts filed under Microsoft Windows 7"">Microsoft Windows 7<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/microsoft-dynamics.asp"" title=""View all posts filed under Microsoft Dynamics"">Microsoft Dynamics<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/microsoft-sharepoint.asp"" title=""View all posts filed under Microsoft SharePoint"">Microsoft SharePoint<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/microsoft-windows-server-2008.asp"" title=""View all posts filed under Microsoft Windows Server 2008"">Microsoft Windows Server 2008<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/microsoft-sql-server.asp"" title=""View all posts filed under Microsoft SQL Server"">Microsoft SQL Server<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/microsoft-exchange-server.asp"" title=""View all posts filed under Microsoft Exchange Server"">Microsoft Exchange Server<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/microsoft-virtualization.asp"" title=""View all posts filed under Microsoft Virtualization (Hyper-V)"">Microsoft Virtualization (Hyper-V)<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/windows-server-2012.asp"" title=""View all posts filed under Microsoft Windows Server 2012"">Microsoft Windows Server 2012<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/microsoft-windows-8.asp"" title=""View all posts filed under Microsoft Windows 8"">Microsoft Windows 8<span class=""dcjq-icon""></span></a></li></ul></li><li class=""dcjq-parent-li""><a class=""dcjq-parent"" href=""/training/courses/prince-2.asp"" title=""View all posts filed under PRINCE2<sup>&reg;</sup>"">PRINCE2<sup>&reg;</sup><span class=""dcjq-icon""></span><span class=""dcjq-icon""></span> <span class=""dcjq-count"">(1)</span></a><ul style=""display: none;"" class=""children""><li><a href=""/training/courses/prince-2.asp"" title=""View all posts filed under PRINCE2<sup>&reg;</sup>"">PRINCE2<sup>&reg;</sup><span class=""dcjq-icon""></span></a></li></ul></li><li class=""dcjq-parent-li""><a class=""dcjq-parent"" href=""/training/courses/technical-it.asp"" title=""View all posts filed under Technical IT"">Technical IT<span class=""dcjq-icon""></span><span class=""dcjq-icon""></span> <span class=""dcjq-count"">(11)</span></a><ul style=""display: none;"" class=""children""><li><a href=""/training/courses/linux.asp"" title=""View all posts filed under Linux"">Linux<span class=""dcjq-icon""></span></a></li><li class=""dcjq-parent-li""><a class=""dcjq-parent"" href=""/training/courses/oracle.asp"" title=""View all posts filed under Oracle"">Oracle<span class=""dcjq-icon""></span><span class=""dcjq-icon""></span> <span class=""dcjq-count"">(2)</span></a><ul style=""display: none;"" class=""children""><li><a href=""/training/courses/oracle-database.asp"" title=""View all posts filed under Oracle Database"">Oracle Database<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/oracle-e-business-suite-r12.asp"" title=""View all posts filed under Oracle e-Business Suite R12"">Oracle e-Business Suite R12<span class=""dcjq-icon""></span></a></li></ul></li><li><a href=""/training/courses/java-web-development.asp"" title=""View all posts filed under Java &amp; Web Development"">Java &amp; Web Development<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/hp-ux.asp"" title=""View all posts filed under HP-UX"">HP-UX<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/unix.asp"" title=""View all posts filed under UNIX"">UNIX<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/my-sql-php.asp"" title=""View all posts filed under My SQL &amp; PHP"">My SQL &amp; PHP<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/citrix.asp"" title=""View all posts filed under Citrix"">Citrix<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/cisco.asp"" title=""View all posts filed under Cisco"">Cisco<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/comptia.asp"" title=""View all posts filed under CompTIA"">CompTIA<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/vmware.asp"" title=""View all posts filed under VMware"">VMware<span class=""dcjq-icon""></span></a></li></ul></li><li class=""dcjq-parent-li""><a class=""dcjq-parent"" href=""/training/courses/professional-development.asp"" title=""View all posts filed under Professional Development"">Professional Development<span class=""dcjq-icon""></span><span class=""dcjq-icon""></span> <span class=""dcjq-count"">(2)</span></a><ul style=""display: none;"" class=""children""><li><a href=""/training/courses/sales-skills.asp"" title=""View all posts filed under Sales Skills"">Sales Skills<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/performance-skills.asp"" title=""View all posts filed under Performance Skills"">Performance Skills<span class=""dcjq-icon""></span></a></li></ul></li><li class=""dcjq-parent-li""><a class=""dcjq-parent"" href=""/training/courses/project-and-programme-management.asp"" title=""View all posts filed under Project and Programme Management"">Project and Programme Management<span class=""dcjq-icon""></span><span class=""dcjq-icon""></span> <span class=""dcjq-count"">(7)</span></a><ul style=""display: none;"" class=""children""><li><a href=""/training/courses/project-management-project-and-programme-management.asp"" title=""View all posts filed under Project Management"">Project Management<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/msp.asp"" title=""View all posts filed under MSP®"">MSP®<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/agile-foundation-and-practitioner.asp"" title=""View all posts filed under Agile"">Agile<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/tailored-project-management.asp"" title=""View all posts filed under Tailored Project Management"">Tailored Project Management<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/apmp.asp"" title=""View all posts filed under APMP"">APMP<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/mop.asp"" title=""View all posts filed under M_o_P™"">M_o_P™<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/lean-six-sigma.asp"" title=""View all posts filed under Lean Six Sigma"">Lean Six Sigma<span class=""dcjq-icon""></span></a></li></ul></li><li class=""dcjq-parent-li""><a class=""dcjq-parent"" href=""/training/courses/elearning.asp"" title=""View all posts filed under E Learning"">E Learning<span class=""dcjq-icon""></span><span class=""dcjq-icon""></span> <span class=""dcjq-count"">(3)</span></a><ul style=""display: none;"" class=""children""><li><a href=""/training/courses/prince2-elearning.asp"" title=""View all posts filed under PRINCE2 Elearning"">PRINCE2 Elearning<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/microsoft-technical-collections.asp"" title=""View all posts filed under Microsoft Technical Collections"">Microsoft Technical Collections<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/microsoft-office-collections.asp"" title=""View all posts filed under Microsoft Office Collections"">Microsoft Office Collections<span class=""dcjq-icon""></span></a></li></ul></li><li class=""dcjq-parent-li""><a class=""dcjq-parent"" href=""/training/courses/best-practice.asp"" title=""View all posts filed under Best Practice"">Best Practice<span class=""dcjq-icon""></span><span class=""dcjq-icon""></span> <span class=""dcjq-count"">(2)</span></a><ul style=""display: none;"" class=""children""><li><a href=""/training/courses/business-analysis-training-best-practice.asp"" title=""View all posts filed under Business Analysis"">Business Analysis<span class=""dcjq-icon""></span></a></li><li><a href=""/training/courses/itil-service-management.asp"" title=""View all posts filed under ITIL<sup>&reg;</sup> Service Management"">ITIL<sup>&reg;</sup> Service Management<span class=""dcjq-icon""></span></a></li></ul></li></ul>"
				
End Function 


'Bespoke Training'
Function CfGetbespoketraining

CfGetbespoketraining = "<p>&nbsp;</p><p><strong>We Are Not Just a Training Provider; We Are Your Training Partner</strong></p><p>&nbsp;</p><p>Training should not be one-size-fits-all. The desired results from training can only be achieved if the training is designed with the business goals as well as the ""human factor"" in mind. While other companies may try to force you into their packaged curriculum and delivery methods, we work with you to understand your unique needs and develop a solution that's right for you.</p><p>Partner with us to develop your training solution, and enjoy options you won't find with other training providers.</p><p>&nbsp;</p><p><strong>Learning Consultancy- Curriculum Planning Services</strong></p><p>If you are trying to determine the training you need, our curriculum planning services can help. We provide you with an on-site Subject Matter Expert and a Learning Architect who will determine project objectives, perform skills assessments, and deliver a curriculum map and training delivery schedule based on your requirements and job roles. We can also design and create an entire training program from scratch to meet your needs.<p>&nbsp;</p><p><strong>Blended Learning Options</strong></p><p>Differing learning styles, training goals, student locations, and budgets often require a combination of instructor-led and self-paced learning. In fact, most of the managed programs we've developed with clients have included multiple delivery methods. For many of our certification training courses, we offer online mentoring, providing students extra time for and assistance with exam preparation.<p>&nbsp;</p><p><strong>Managed Programs</strong></p><p>Our managed programs are designed to be both flexible and scalable, providing you with an optimal and worry-free training solution, whether you’re training a local and a globally distributed audience.<p>&nbsp;</p><p><strong>Private Group Training</strong></p><p>Train large or small groups privately, efficiently, and cost effectively with our On-Site training. You'll receive expert instruction and tailored curriculum delivered to your facility, live over the Internet, or to the location of your choice.<p>&nbsp;</p><p><strong>Talk to Us</strong></p><p><strong>For more information on how our training solutions can help ensure success on your organization's next training initiative, please contact us today.</p><p>&nbsp;</p><p>Call Us Now On 0800 781 0626.</p>"


End Function



'On-Site Delivery'
Function CfGetonsitedelivery

CfGetonsitedelivery = "<p>Using our On-Site delivery method, you can save time and money by training a small or large group of delegates in a physical or a virtual classroom environment. You will receive expert developed and tailored curriculum delivered to your facility, live over the Internet, or to the location of your choice.Our Learning Architects will work with you to pinpoint the training you need and quickly create a targeted, tailored solution that meets your budget, schedule, and training goals.</p><p>&nbsp;</p><p>Get everything you need, with many flexible options:</p><ul type=""disc""><li>Expert instructors</li><li>Tailored curriculum</li><li>Flexible scheduling and delivery methods</li><li>Privacy and confidentiality</li><li>Consistent training for small or large groups, whether in one location or many</li><li>A single point of contact for seamless, successful training coordination and delivery</li><li>A post-training student evaluation report</li></ul><p>&nbsp;</p><p>A few benefits which you will realize, using our on-site training model</p><ul type=""disc""><li>Cost savings, convenience, and privacy</li><li>Minimized travel and increased efficiency</li><li>Expert, tailored content where and when you need it: at your facility, live over the Internet in a virtual classroom, or at the location of your choice</li><li>Organizational focus and insight specific to your culture and objectives</li><li>Reduced initiative adoption risk</li></ul>"


End Function





'===================================================================About Us starts here=================================================================================='

'About us How We Work - Heading'
Function CfGetAboutUsHeading()

CfGetAboutUsHeading = "<h4>Since 2001 Datrix Training has been delivering quality, reliable training solutions with our customers to produce performance improving results, time and again. 92%* of our customers repeat purchase year on year.</h4>"

End Function 


'About us How We Work -Account Management,Customer Service'
Function CfGetAboutUsHowWeWork1()

CfGetAboutUsHowWeWork1 = "<h3><span style=""color: #ff6600;""><strong>How We Work</strong></span></h3><p><strong style=""color: #ff6600;""><img class=""alignright size-full wp-image-37750"" title=""Account Management"" src=""/images/buttons/Triangle.jpg"" alt="""" height=""236"" width=""252"">Account Management</strong></p><p>Each customer is assigned a dedicated Account&nbsp;Manager, who has overall responsibility for managing&nbsp;our relationship. After gaining an understanding of the&nbsp;nature, scope and timing of your requirements, and&nbsp;with the help of our Resources &amp; Training teams, they&nbsp;will present a training solution for your approval.</p><p><span style=""color: #ff6600;""><strong>Customer Service</strong></span><br>Once your order is placed, our Customer Service team&nbsp;reserves the necessary trainers and resources then&nbsp;issues pre-course documentation and joining&nbsp;instructions.</p><p>During the implementation and delivery phases, they&nbsp;will provide attendance &amp; expenditure reports and once<br>training has been delivered, submit trainer and&nbsp;delegate feedback.</p><p>&nbsp;</p>"


End Function 


'About us How We Work -Accreditations,ISO 9001'
Function CfGetAboutUsHowWeWork2()

CfGetAboutUsHowWeWork2 = "<p><span style=""color: #ff6600;""><strong><img class=""size-full wp-image-37752 alignleft"" title=""Accreditation Logos"" src=""/images/buttons/Acc_Logos3.jpg"" alt="""" height=""175"" width=""292"">Accreditations</strong></span><br>Datrix Training is a Microsoft Silver Partner for&nbsp;Learning Solutions and an APMG Authorised Training&nbsp;Organisation for AGILE, PRINCE2<sup>&reg;</sup>, ITIL<sup>&reg;</sup> &amp; MSP<sup>&reg;</sup>&nbsp;courses.&nbsp;Our training follows Vendor ‘best practice’ methods,&nbsp;and oers a world-wide recognised standard of quality.</p><div><span style=""color: #ff6600;""><strong>ISO 9001</strong></span></div><div>We are confident that the documentation of our&nbsp;business processes, measurement of customer&nbsp;satisfaction and management of employee&nbsp;development meets or exceeds ISO9001. We will apply&nbsp;for certification following a planned business system&nbsp;upgrade in 2013.</div><p>&nbsp;</p>"

End Function 

'About us How We Work -Trainers'
Function CfGetAboutUsTrainers()

CfGetAboutUsTrainers = "<p><span style=""color: #ff6600;""><strong>Trainers</strong></span><br>Our ability to develop education solutions that match&nbsp;the requirements, needs and environments of our&nbsp;customers comes from our training consultants being&nbsp;at the heart of our success. Our people are:</p><ul><li>appropriately qualified and accredited</li><li>experts in their field</li><li>skilled at understanding organisations' cultures&nbsp;and objectives</li><li>able to inspire, enthuse and empower participants</li></ul><p>We only trust trainers who consistently deliver&nbsp;outstanding results to our customers. The training&nbsp;team is monitored at weekly review sessions based on&nbsp;continual feedback. Where courses are examined, we&nbsp;aim for all our trainers to be in the top 10% of exam&nbsp;pass statistics.</p><p>Our in-house training team is responsible for our most&nbsp;popular courses and each team member has a specific&nbsp;area of expertise. To supplement their skills we also&nbsp;call upon a nationwide network of freelance&nbsp;associates.&nbsp;This allows us to bring in specialist knowledge to&nbsp;ensure a more rewarding outcome for learners.</p><p style=""text-align: center;""><img class=""aligncenter size-full wp-image-37755"" title=""Process Flow"" src=""/images/buttons/ProcessFlow.jpg"" alt="""" height=""55"" width=""500""></p><p>&nbsp;</p>"

End Function 



'About us How We Work -Capability'
Function CfGetAboutUsCapability()

CfGetAboutUsCapability = "<h3><span style=""text-align: justify; color: #ff6600;"">Capability</span></h3><p>Course Offerings&nbsp;Encompasses three areas:</p><ul><li><strong style=""color: #ff6600;"">Best Management Practice</strong></li></ul><div>PRINCE2<sup>&reg;</sup> ,Managing Successful Programmes,&nbsp;ITIL<sup>&reg;</sup> ,AGILE ,MOR ,MOP,&nbsp;Business Analysis</div><ul><li><strong style=""color: #ff6600;"">Information Technology</strong></li></ul><p>A+,&nbsp;Adobe,&nbsp;Crystal Reports,&nbsp;Cisco,&nbsp;Citrix,&nbsp;Linux,&nbsp;Microsoft,&nbsp;Oracle,&nbsp;UNIX,&nbsp;VMWare</p><ul><li><strong style=""color: #ff6600;"">Professional Development</strong></li></ul><p>Customer Service,&nbsp;Leadership/Management,&nbsp;Personal Productivity,&nbsp;Sales</p><p>The above are the most popular and by no means an&nbsp;exhaustive list of what we can provide. Please ask us if&nbsp;you don’t see what you are looking for.</p><p>&nbsp;</p>"

End Function 


'About us How We Work -Service Offering'

Function CfGetAboutUsServiceOffering()

CfGetAboutUsServiceOffering = "<h3><span style=""color: #ff6600;""><strong><img class=""alignright size-full wp-image-37767"" title=""Project Management Training"" src=""/images/buttons/Classroom.jpg"" alt="" height=""200"" width=""300"">Service Offering</strong></span></h3><ul><li>Blended/e-learning</li><li>Training Needs Analysis</li><li>Private Courses</li><li>Course development</li><li>Public Scheduled Events</li> <li>Clinics/Training Support</li><li>Hire – Classroom/IT training infrastructure</li></ul>"

End Function 

'About us How We Work -Customer Satisfaction'
Function CfGetAboutUsCustomerSatisfaction()

CfGetAboutUsCustomerSatisfaction = "<h3><span style=""color: #ff6600;"">Customer Satisfaction</span></h3><p><strong><span style=""color: #ff6600;"">TrustPilot</span></strong><br>We are proud of what we deliver and are always&nbsp;striving to improve the quality of what we do. Also, we&nbsp;believe honesty is the best policy, so customers should&nbsp;be able to give feedback in an open forum.&nbsp;Our goal is for everyone to give us 5 star write-ups, but&nbsp;TrustPilot does not allow us to delete or amend&nbsp;reviews, we can only reply to them. So if a reviewer&nbsp;posts a negative comment we will ensure the problem&nbsp;is not repeated.</p><p><img class=""alignright size-full wp-image-37761"" title=""TrustPilot"" src=""/images/buttons/TP.jpg"" alt="""" height=""50"" width=""282""></p><p>Honest feedback gives us valuable insight into how we&nbsp;are doing, but in addition to monitoring performance,<br>TrustPilot allows customers to see exactly what&nbsp;delegates really think.<br>This transparency means new and existing customers&nbsp;can buy with confidence.</p><p>&nbsp;</p><p><span style=""color: #ff6600;""><strong><img class=""alignright size-full wp-image-37772"" title=""Microsoft Exchange Server Training"" src=""/images/buttons/Computrer_Classroom_300.jpg"" alt="" height=""200"" width=""300"">Guarantees</strong></span><br>When you deliver 15,000 delegate training days per&nbsp;year, occasionally things can go wrong. We will always<br>try to fix unexpected errors as soon as possible but&nbsp;sometimes they do impact on course eectiveness. For&nbsp;example, if a courier partner misroutes course materials&nbsp;or a power failure occurs.</p><p><strong><span style=""color: #ff6600;"">Complaints</span></strong><br>If things do go wrong our customer service team will&nbsp;respond as quickly as possible and will work to provide&nbsp;a solution until you are satisfied, but for your peace of&nbsp;mind, we support our work with the following guarantees:</p><p><strong><span style=""color: #ff6600;"">Satisfaction Guarantee</span></strong><br>If a course fails to meet the terms of delivery set by the&nbsp;governing body then we will re-run the course again at<br>no extra cost.</p><p><strong><span style=""color: #ff6600;"">Re-train guarantee</span></strong><br>If a delegate who attends a Datrix Training course&nbsp;leaves your employment during the following 90 days,<br>we will re-train their replacement for free.</p><p>&nbsp;</p><h3 style=""text-align: center;""></h3><h3 style=""text-align: center;""></h3><h3 style=""text-align: center;""><span style=""color: #ff6600;"">If you have read this far, hopefully you have a good idea&nbsp;of what we are about. To get a clear picture of how we&nbsp;</span><span style=""color: #ff6600;"">can add value to your training provision, we need to&nbsp;talk.</span></h3><p>&nbsp;</p><p>*Annual repeat booking activity March 2009 – March 2012 – <a href=""http://www.prince2training.us"">PRINCE2 Training</a>&nbsp;- <a title=""PRINCE2 Training"" href=""http://www.prince2training.uk.com"">PRINCE2 Training</a></p>"

End Function 
'===================================================================Learning Bank=================================================================================='

'Learning Bank'
Function CfGetLearningBank()


CfGetLearningBank = "<h3><span style=""color: #ff6600;""><strong><a href=""/images/buttons/PiggyBank_LBank.jpg""><img class=""alignright size-full wp-image-37837"" title=""PiggyBank_LBank"" src=""/images/buttons/PiggyBank_LBank.jpg"" alt="" height=""199"" width=""300""></a>Do you want to make further savings on the cost of your training?</strong></span></h3><p>Put simply, a Learning Bank means making a bulk purchase of training for the year in return for generous discounts from us. The more you buy, the lower the cost of your training.</p><h3></h3><h3><strong style=""color: #ff6600;"">Do you have unused training budget?</strong></h3><p>Many customers use our Learning Bank service as a means to spend their unused training budget before they have finalised their training plans. Sometimes a customer knows exactly what they need to purchase with 75% of their training budget, but are unsure about the remainder, so they purchase the courses they want PLUS a Cash Learning Bank with the remaining 25% to call off against further courses as a discounted rate later in the year.</p><p>When the customer eventually decides the training they need, they can then easily allocate their credit against courses</p><h3></h3><h3><strong style=""color: #ff6600;"">Our most flexible training option</strong></h3><p>With our Learning Bank you have several options available to you and it can be configured in many ways to address your training needs:</p><ul><li>A specified number of training days to call off over the year against pre defined subject areas</li><li>A set number of courses in a particular subject area</li><li>On-site training events to run alongside a project</li><li>Bespoke training programme</li></ul><h3></h3><h3><strong style=""color: #ff6600;"">Why do you offer extra discounts when I purchase my Learning Bank?</strong></h3><p>We offer extra savings to you because Learning Banks enable us to plan our delivery schedule and allocate resources to courses in advance. We both (Datrix Training and the customer) save time and money processing only one order instead of many though the year. For the best value for money and least hassle, a Datrix Training Learning Bank is the answer.</p><p>&nbsp;</p><h3><strong style=""color: #ff6600;"">How do I use my Learning Bank?</strong></h3><p>Using your Learning Bank is easy.</p><p>Simply email our Learning Bank Team learningbank@datrixtraining.com or contact them on 01772 623467 with details of the course(s) you wish to book. (You must email your request from the associated email address and be the registered contact. We can also set up a password for your account if required)</p><p>&nbsp;</p><h3><strong style=""color: #ff6600;"">Datrix Training Learning Banks Features</strong></h3><ul><li><strong>Cost Effective:&nbsp;</strong>Depending upon volumes and the subject area, you can achieve over 50% savings compared to single bookings. Our Learning Banks can be tailored to suit your budget levels.</li></ul><ul><li><strong>Flexible:&nbsp;</strong>Learning Banks can be used organisation wide*, on public courses nationwide.&nbsp;*The purchaser can nominate who in their organisation can or cannot use their particular Learning Bank.</li></ul><ul><li><strong>Unused Budget:&nbsp;</strong>Unused training budget from the current financial year can be moved into a Learning Bank and be used for another 12 months.</li></ul><ul><li><strong>Convenient:&nbsp;</strong>Separate Purchasing processes cost money every time. A one off order for the whole year will significantly reduce the number of invoices processed.</li></ul><ul><li><strong>Easy to Manage:&nbsp;</strong>We provide usage updates when requested.</li></ul><p>&nbsp;</p><p><span style=""color: #ff6600;""><strong>Simple Benefits of a Datrix Training Learning Bank:</strong></span></p><ul><li>Secure your training budget</li><li>More choice of courses, locations &amp; dates etc</li><li>Separate Training &amp; Examination costing</li><li>One point of contact</li><li>One vendor input for your accounts department</li><li>One PO Number</li><li>One Payment</li><li>Large Procurement Saving</li><li>Allocated to any training related service</li><li>Can be called off against Courses, Trainers, Training Rooms, Kit/Computer Hire etc</li></ul><div></div><h3><span style=""color: #ff6600;""><strong>Learning Banks can be used to secure training places for:</strong></span></h3><ul><li>Any course</li><li>Any time (subject to availability)</li><li>Any Datrix Training location or at a location of your choice</li><li>Any delegate</li><li>How your Datrix Training Learning Bank works:</li><li>Identify your training priorities for the year – your Datrix Account Manager (0800 781 0626) will happily help with the available options to produce a plan tailored to your needs.</li></ul><p>&nbsp;</p><p>&nbsp;</p><h2 style=""text-align: center;""><span style=""color: #ff6600;"">If you have further questions, please call our sales advisers today on 0800 781 0626 or request a quotation and let’s talk</span>"


End Function 

'===================================================================Late Availability Courses=================================================================================='

'Late Availability Courses'
Function CfGetLateAvailabilityCourses()

CfGetLateAvailabilityCourses = "<p>Datrix Training courses always offer great value. However, from time to time, you can make even bigger savings on the price of your training by attending a Late Availability course. Late Availability courses are ideal if you can attend at short notice.</p><p>If you are simply looking for a great discount on the price of your training and Late Availability is not quite right for you, then please <a href=""/contact-us.asp"">ask for more information</a> on how you can save money on the price of your training with one of our Learning Banks.</p>"

End Function 

'===================================================================Enquire=================================================================================='


'One Hour Quote Guarantee'
Function CfGet1HourQuoteGuarantee()

CfGet1HourQuoteGuarantee = "<p><a href=""/images/buttons/iStock_Stopwatch_150.jpg""><img class=""alignright size-full wp-image-16117"" title=""Stopwatch_150"" src=""/images/buttons/iStock_Stopwatch_150.jpg"" alt=""One Hour Quote"" height=""99"" width=""150""></a>As no two training courses are the same we don’t believe in sending out quotations without knowing a bit more about what you want from your training. However, we also realise that asking for quotations from some training companies can take-a-long-time. That’s why at Datrix you can be sure that when you submit your Quote Request you’ll receive a clear quotation from us within <strong><span style=""text-decoration: underline;"">ONE HOUR</span></strong>.</p><p>We do however have a couple of exceptions: If the training you need a quote for is complex then we might need to contact you for more information; also we might be able to offer you a slightly different way to deliver your course that could save you time and money.</p><p>We are closed on UK Bank Holidays. Therefore, if you submit a quote request outside these hours then we'll get back you as soon as our sales team returns to the office.</p><p></p>"

End Function 

'Current Time'
Function CfGetCurrentTime()

CfGetCurrentTime = "<div class=""threecol-one""><h3>Current time</h3><p></p><div class=""clock""><div class=""face"">"& formatdatetime((dateadd("h",1,time)),4)&"</div></div><br></div>"

End Function 


'===================================================================Images=================================================================================='


'About us Who We Work With - image'
Function CfGetImageWhoWeWorkWith()

CfGetImageWhoWeWorkWith = "<div id=""widget_sp_image-2"" class=""block widget widget_sp_image""><div class=""widget-top""></div><div class=""widget-content-who-we-work-with""><h3>Who We Work With</h3><a class=""widget_sp_image-image-link"" href=""/our-customers.asp"" target=""_self""><img src=""/images/buttons/our-customers.png"" style=""max-width: 210px;max-height: 159px;"" alt=""our-customers""></a><a href=""/our-customers.asp"" target=""_self"" class=""link""><p>See more of our customers</p></a></div><div class=""widget-bottom""></div></div>"

End Function 


'About us Trust Pilot -image'
Function CfGetImageTrustPilot()

CfGetImageTrustPilot = "<div id=""text-4"" class=""block widget widget_text""><div class=""textwidget""><div class=""widget-top""></div><div class=""trustbox-wrapper""><h3></h3><a class=""trustbox-badge"" href=""http://www.trustpilot.co.uk/review/www.datrixtraining.com"" title=""See reviews on trustpilot.co.uk"" target=""_blank""><img src=""http://trustbox.trustpilot.com/badge/en/4stars/tp_badge-180.png"" alt=""Trustpilot Badge""></a><p>Satisfaction Guarantee<br>Independent Reviews<br>92% Repeat Customers<br>Continuous Improvement<br><strong>Buy with Confidence</strong></p></div><div class=""widget-content-trust-pilot""><a href=""http://www.trustpilot.co.uk/review/www.datrixtraining.com"" class=""link"" target=""_blank"">Read More</a></div><div class=""widget-bottom""></div></div></div>"

End Function 



'About us Testimonial -image'
Function CfGetImageTestimonial()

CfGetImageTestimonial = "<div id=""testimonials-2"" class=""block widget widget_testimonials""><div class=""widget-top""></div><div class=""widget-content-testimonials""><h3>Testimonials</h3><p><i>""To view our customer Testimonials please link the TrustPilot site from the links featured in the site.Alternatively, pleases visit the Our Customers section for more details on who we work with.""</i></p><a href=""/testimonials.asp"" class=""link"">Read more comments</a></div><div class=""widget-bottom""></div></div>"

End Function 



'View pricing information image'
Function CfGetImagePricingInformation()

CfGetImagePricingInformation = "<div id=""text-8"" class=""block widget widget_text""><div class=""textwidget""><a href=""/pricing-information.asp""><img src=""/images/buttons/widget-pricing.png""></a></div></div>"

End Function 

'Image Prince2 Training'
Function CfGetMicrosoftDesktopTraining()

CfGetMicrosoftDesktopTraining = "<div id=""text-12"" class=""block widget widget_text""><div class=""textwidget""><div style=""text-align:center;""><img src=""/images/buttons/widget-microsoft-office-training.png""></div></div></div>"

End Function 


'Image Prince2 Training'
Function CfGetImagePrince2Training()

CfGetImagePrince2Training = "<div id=""text-10"" class=""block widget widget_text""><div class=""textwidget""><div style=""text-align:center;""><img src=""/images/buttons/widget-prince2-training.png""></div></div></div>"

End Function 

'Image Agile Training'
Function CfGetImageAGILETraining()

CfGetImageAGILETraining = "<div id=""text-10"" class=""block widget widget_text""><div class=""textwidget""><div style=""text-align:center;""><img src=""/images/buttons/widget-agile-training.png""></div></div></div>"

End Function


'Image ITIL Training'
Function CfGetImageITILTraining()

CfGetImageITILTraining = "<div id=""text-10"" class=""block widget widget_text""><div class=""textwidget""><div style=""text-align:center;""><img src=""/images/buttons/widget-itil-training.png""></div></div></div>"

End Function

'Image MSP Training'
Function CfGetImageMSPTraining()

CfGetImageMSPTraining = "<div id=""text-10"" class=""block widget widget_text""><div class=""textwidget""><div style=""text-align:center;""><img src=""/images/buttons/widget-msp-training.png""></div></div></div>"

End Function


'Image Enjoy Discounts'
Function CfGetImageEnjoyDiscounts()

CfGetImageEnjoyDiscounts = "<div id=""text-6"" class=""block widget widget_text""><div class=""textwidget""><div class=""widget-top""></div><div class=""widget-content""><a href=""/learningbank.asp"" class=""link"">Enjoy Discounts of up to 50% off the price of your courses</a></div><div class=""widget-bottom""></div></div></div>"

End Function 

'===================================================================Table=================================================================================='

'Table Prince2'
Function BlGetStaticCourses()

'Calling BlGetCity func'
BlGetCity


BlGetStaticCourses = "<table class=""product-details""><tr><th style=""width: 100px;"">Ref Number</th><th style=""width: 320px;"">Course Name</th><th style=""width: 100px; text-align: center;"">Duration</th><th style=""width: 100px;""></th><th style=""width: 100px;""></th></tr>"



Dim  strGetCourses,Rs,rqDays
DIm rqCourseid,rqCourseName,strGetStaticCourses
DIm rqCourse,strGetCerfitionType



Set Rs = server.CreateObject("ADODB.Recordset")
Set Rs1 = server.CreateObject("ADODB.Recordset")
Set Rs2 = server.CreateObject("ADODB.Recordset")

'response.Write(Session("CourseType"))
If Session("CourseType") = "project-and-programme-management" then

strGetStaticCourses = "Select * from datrixCourse where vendorId  = '2' and (certificationId = '8' or certificationId = '9' or certificationId = '5' or certificationId = '6' or certificationId = '7' or certificationId = '10' or certificationId = '11')"


ElseIf Session("CourseType") = "best-practice" then

strGetStaticCourses = "Select * from datrixCourse where vendorId  = '2' and (certificationId = '12' or certificationId = '13')"


ElseIf Session("CourseType") = "professional-development" then

strGetStaticCourses = "Select * from datrixCourse where vendorId  = '2' and (certificationId = '14' or certificationId = '15')"

ElseIf Session("CourseType") = "desktop-applications" then

strGetStaticCourses = "Select * from datrixCourse where vendorId  = '2' and (certificationId = '16' or certificationId = '17' or certificationId = '18' or certificationId = '19' or certificationId = '20')"

ElseIf Session("CourseType") = "elearning" then

strGetStaticCourses = "Select * from datrixCourse where vendorId  = '2' and (certificationId = '21' or certificationId = '22' or certificationId = '23' )"

ElseIf Session("CourseType") = "microsoft-it" then

strGetStaticCourses = "Select * from datrixCourse where vendorId  = '2' and (certificationId = '24' or certificationId = '25' or certificationId = '26' or certificationId = '27' or certificationId = '28' or certificationId = '29' or certificationId = '30' or certificationId = '31' or certificationId = '32' )"

ElseIf Session("CourseType") = "technical-it" then

strGetStaticCourses = "Select * from datrixCourse where vendorId  = '2' and (certificationId = '33' or certificationId = '34' or certificationId = '35' or certificationId = '36' or certificationId = '37' or certificationId = '38' or certificationId = '39' or certificationId = '40' or certificationId = '41' or certificationId = '42' or certificationId = '43')"

ElseIf Session("CourseType") <> "" And Session("CourseType")<> "project-and-programme-management" and Session("CourseType") <> "best-practice" and Session("CourseType") <> "professional-development"  and Session("CourseType") <> "desktop-applications"  and Session("CourseType") <> "elearning" and Session("CourseType") <> "microsoft-it" and Session("CourseType") <> "technical-it" Then

strGetCerfitionType = "Select * from Certification where CertName  = '"&Session("CourseType")&"' and Ven_ID = '2'"
'response.Write(strGetCerfitionType)
Rs1.open strGetCerfitionType,ConnObj

rqCer_ID = Rs1("Cer_ID")
Session("Cer_ID") = rqCer_ID

strGetStaticCourses = "Select * from datrixCourse where vendorId  = '2' and certificationId = '"&Session("Cer_ID")&"'"

End If
	'response.Write(strGetStaticCourses)

Rs.open strGetStaticCourses,ConnObj

Do until Rs.EOF
					
	'rqCourseid = Rs("courseid")
	
	rqCourse =  trim(Rs("courseName"))
	rqRefNumber = Rs("RefNumber")
	rqDays = Rs("duration")

'response.Write(rqCourse)

'For page name'
'response.Write("test")
rqRemoveReg = Replace(trim(rqCourse),"&reg;", "") 
'response.Write(rqRemoveReg)

rqRemoveand = Replace(rqRemoveReg,"&", "and") 
'response.Write(rqRemoveand)

rqRemovePlus = Replace(rqRemoveand,"+", "") 
'response.Write(rqRemovePlus)'

rqRemoveColon = Replace(rqRemovePlus,":", "") 
'response.Write(rqRemoveColon)

rqRemoveBracketSecond = Replace(rqRemoveColon,"(Second Edition)", "") 
'response.Write(rqRemoveBracket)

rqRemovefirstBracket = Replace(rqRemoveBracketSecond,"(", "") 
'response.Write(rqRemoveBracket)

rqRemoveSecondBracket = Replace(rqRemovefirstBracket,")", "") 
'response.Write(rqRemoveBracket)

rqRemoveTM = Replace(rqRemoveSecondBracket,"and#153;", "")

rqRemovecomma = Replace(rqRemoveTM,",", "")

rqRemoveSpace = Replace(rqRemovecomma,"  ", " ")

rqRemovedash = Replace(rqRemoveSpace," - ", "-")

rqRemovecode = Replace(rqRemovedash,"™", "")

rqRemoveSlash = Replace(rqRemovecode,"/", "")

rqCoursePagename = Replace(trim(rqRemoveSlash)," ", "-") 
'response.Write(rqCoursePagename)


BlGetStaticCourses =  BlGetStaticCourses & "<form name=""one-hour-quote"" id =""one-hour-quote""  action = ""/one-hour-quote.asp"" method = ""post""><input type=""hidden"" name=""courseid"" value = "&rqRefNumber&"></form>"

BlGetStaticCourses =  BlGetStaticCourses & "<form name=""trainingCourse"" id =""trainingCourse""  action = ""/course/"&rqCoursePagename&".asp"" method = ""post""><input type=""hidden"" name=""courseid"" value = "&rqRefNumber&"></form>"


BlGetStaticCourses =  BlGetStaticCourses & "<tr><td>"&rqRefNumber&"</td> <td><a style=""text-decoration: underline;"" href=""javascript:document.getElementById('trainingCourse').submit()"">"&rqCourse&"</a></td><td style=""text-align: center;"">"&rqDays&"</td><td style=""padding:0px;""><a href=""javascript:document.getElementById('one-hour-quote').submit()"" class=""button"" >enquire</a></td>"


strGetCourses = "Select * from datrixClasses where vendorId  = '2' and RefNumber = '"&rqRefNumber&"'"
'response.Write(strGetCourses)

Rs2.open strGetCourses,ConnObj


If Not Rs2.EOF Then

BlGetStaticCourses =  BlGetStaticCourses & "<td><a href=""javascript:document.getElementById('trainingCourse').submit()"" class=""button"">see dates</a></td>"


Else

BlGetStaticCourses =  BlGetStaticCourses & "<td></td>"


End If
Rs2.Close

Rs.Movenext
loop


BlGetStaticCourses =  BlGetStaticCourses & "</tr></table>"


End Function 





'===================================================================Table=================================================================================='

'Table Prince2'
Function CfGetTablePrince2()

'Calling BlGetCity func'
BlGetCity

If BlGetCity <> "" Then

CfGetTablePrince2 = "<table class=""product-details""><tr><th style=""width: 100px;"">Ref Number</th><th style=""width: 320px;"">Course Name</th><th style=""width: 320px;""> 	Locations</th><th style=""width: 320px;"">Dates</th><th style=""width: 100px; text-align: center;"">Duration</th><th style=""width: 100px;""></th></tr>"

Else

CfGetTablePrince2 = "<table class=""product-details""><tr><th style=""width: 100px;"">Ref Number</th><th style=""width: 320px;"">Course Name</th><th style=""width: 100px; text-align: center;"">Duration</th><th style=""width: 100px;""></th><th style=""width: 100px;""></th></tr>"

End If


Dim  strGetCourses,Rs,rqDays
DIm rqCourseid,rqCourseName
DIm rqCourse,strGetCerfitionType



Set Rs = server.CreateObject("ADODB.Recordset")
Set Rs1 = server.CreateObject("ADODB.Recordset")


If Session("CourseType") <> "" Then

strGetCerfitionType = "Select * from Certification where CertName  = '"&Session("CourseType")&"' and Ven_ID = '2'"
'response.Write(strGetCerfitionType)
Rs1.open strGetCerfitionType,ConnObj

rqCer_ID = Rs1("Cer_ID")


If BlGetCity <> "" Then

strGetCourses = "Select distinct courseName ,  RefNumber ,duration from datrixClasses where vendorId  = '2' and city = '"&BlGetCity&"' "

Else

strGetCourses = "Select distinct courseName ,  RefNumber ,duration from datrixClasses where vendorId  = '2' and certificateId = '"&rqCer_ID&"'"

End If

End If
'response.Write(strGetCourses)
Rs.open strGetCourses,ConnObj

Do until Rs.EOF
					
	'rqCourseid = Rs("courseid")
	
	rqCourse =  trim(Rs("courseName"))
	rqRefNumber = Rs("RefNumber")
	rqDays = Rs("duration")

'response.Write(rqCourse)

'For page name'

rqRemoveReg = Replace(trim(rqCourse),"&reg;", "") 
'response.Write(rqRemoveReg)

rqRemoveand = Replace(rqRemoveReg,"&", "and") 
'response.Write(rqRemoveand)

rqCoursePagename = Replace(trim(rqRemoveand)," ", "-") 
'response.Write(rqCoursePagename)

CfGetTablePrince2 =  CfGetTablePrince2 & "<form name=""one-hour-quoteTablePrince2"" id =""one-hour-quoteTablePrince2""  action = ""/one-hour-quote.asp"" method = ""post""><input type=""hidden"" name=""courseid"" value = "&rqRefNumber&"></form>"

If BlGetCity <> "" Then

CfGetTablePrince2 =  CfGetTablePrince2 & "<tr><td>"&rqRefNumber&"</td> <td><a style=""text-decoration: underline;"" href=""http://www.datrixtraining.com/course/prince2-combined-foundation-practitioner/"">"&StrQuoteReplace(rqCourse)&"</a></td><td>"&rqCity&"</a></td><td>"&rqStart&" to "&rqEnd&"</a></td><td style=""text-align: center;"">"&rqDays&"</td><td><a href=""javascript:document.getElementById('one-hour-quoteTablePrince2').submit()"" class=""button"">enquire</a></td></tr>"

Else


CfGetTablePrince2 =  CfGetTablePrince2 & "<tr><td>"&rqRefNumber&"</td> <td><a style=""text-decoration: underline;"" href=""/course/"&rqCoursePagename&".asp?courseid="&rqRefNumber&""">"&rqCourse&"</a></td><td style=""text-align: center;"">"&rqDays&"</td><td><a href=""/one-hour-quote.asp?courseid="&rqRefNumber&""" class=""button"">enquire</a></td><td><a href=""one-hour-quoteTablePrince2"" class=""button"">see dates</a></td></tr>"


End If


Rs.Movenext
loop
Rs.Close

CfGetTablePrince2 =  CfGetTablePrince2 & "</table>"


End Function 




'Table Late Prince2 Courses'
Function CfGetTableLatePrince2Courses()

CfGetTableLatePrince2Courses = "<table class=""product-details""><tbody><tr><th style=""width: 100px;"">Ref Number</th><th style=""width: 320px;"">Course Name</th><th style=""width: 100px; text-align: center;"">Duration</th><th style=""width: 100px;""></th><th style=""width: 100px;""></th></tbody></table>"


End Function 


'===================================================================Enquire form=================================================================================='

'Enquire form'
Function CfGetFormEnquire()

		'rqCourseId       =     request.QueryString("courseid")
		rqCourseId     =     request.form("courseid")
		response.Write(rqCourseId)
		
	%>	
<script language="javascript">

 function echeck(str) {

 		var str1 = str.value
 		var at="@"
 		var dot="."
 		var lat=str1.indexOf(at)
 		var lstr=str1.length
 		var ldot=str1.indexOf(dot)
 		if (str1.indexOf(at)==-1){
 		   alert("Invalid E-mail ID")
 		   return false
 		}

 		if (str1.indexOf(at)==-1 || str1.indexOf(at)==0 || str1.indexOf(at)==lstr){
 		   alert("Invalid E-mail ID")
 		   return false
 		}

 		if (str1.indexOf(dot)==-1 || str1.indexOf(dot)==0 || str1.indexOf(dot)==lstr){
 		    alert("Invalid E-mail ID")
 		    return false
 		}


 		 if (str1.indexOf(at,(lat+1))!=-1){
 		    alert("Invalid E-mail ID")
 		    return false
 		 }

 		 if (str1.substring(lat-1,lat)==dot || str1.substring(lat+1,lat+2)==dot){
 		    alert("Invalid E-mail ID")
 		    return false
 		 }

 		 if (str1.indexOf(dot,(lat+2))==-1){
 		    alert("Invalid E-mail ID")
 		    return false
 		 }

 		 if (str1.indexOf(" ")!=-1){
 		    alert("Invalid E-mail ID")
 		    return false
 		 }
		 
		 if (str1.indexOf(",")!=-1){
			alert("Invalid E-mail ID")
			return false
		}    

  		 return true
 	}


function validate_required(field,alerttxt)
{
	with (field)
	{
		if (field.value=="")
		  {alert(alerttxt);return false}
		else {return true}
	}
}

//This VAlidation For Edit City

function Form_Validator(theform)
{

  with (theform)
  {

   //check to see if the City field have Numarals
 if (validate_required(firstname,"Please enter your first name")==false)
			  {firstname.focus();return false}
			  
   //check to see if the City field have Numarals
 if (validate_required(lastname,"Please enter your last name")==false)
			  {lastname.focus();return false}
			  
   //check to see if the City field have Numarals
 if (validate_required(phoneno,"Please enter your phone number")==false)
			  {phoneno.focus();return false}
			  
   //check to see if the City field have Numarals
 if (validate_required(email,"Please enter your email id")==false)
			  {email.focus();return false}
			  
			  
   //check to see if the City field have Numarals
 if (validate_required(Code,"Please enter Course Code")==false)
			  {Code.focus();return false}
			  
   //check to see if the City field have Numarals
 if (validate_required(Date,"Please enter Course Date")==false)
			  {Date.focus();return false}
			  
   //check to see if the City field have Numarals
 if (validate_required(Venue,"Please enter Course Venue")==false)
			  {Venue.focus();return false}
			  
 //check to see if the City field have Numarals
 if (validate_required(Message,"Please enter Your Message")==false)
			  {Message.focus();return false}
			  
 //Check To See If The EmailId Correct Or Not   
	   
        if (echeck(email)==false)
 	         {email.focus();return false}
			  
  }
}

</script>

<%
		

CfGetFormEnquire = CfGetFormEnquire &  "<div class=""threecol-two last""><h3>Fill in the form below to get a <span style=""color: #ff9900;"">One Hour Quote</span></h3><div id=""wpcf7-f722-p712-o1"" class=""wpcf7""><form class=""wpcf7-form"" action=""/thank-you.asp"" method=""post"" onsubmit=""return Form_Validator(this)""><input type=""hidden"" name=""courseid"" value = "&rqCourseId&"><table width=""100%""  align=""center"" class=""product-details""><tr><td ><br />First Name<span style=""color:#FF0000;"">*</span> </td><td><br />&nbsp;<input type=""text"" name=""firstname"" id=""firstname"" size=""27""  value = "&Session("FirstName")&"><span style=""color:#FF0000;"">"&Error1FirstName&"</span></td></tr><tr><td ><br />Last Name<span style=""color:#FF0000;"">*</span> </td><td><br />&nbsp;<input type=""text"" name=""lastname"" id=""lastname"" size=""27"" value = "&Session("LastName")&"><span style=""color:#FF0000;"">"&Error1LastName&"</span></td></tr><tr><td ><br />Telephone Number<span style=""color:#FF0000;"">*</span> </td><td><br />&nbsp;<input type=""text"" name=""phoneno"" id=""phoneno"" size=""27"" value = "&Session("rqPhoneNumber")&"><span style=""color:#FF0000;"">"&Error1Phone&"</span></td></tr><tr><td ><br />Email Address<span style=""color:#FF0000;"">*</span> </td><td><br />&nbsp;<input type=""text"" name=""email"" id=""email"" size=""27"" value = "&Session("Email")&"><span style=""color:#FF0000;"">"&Error1Email&"</span></td></tr><tr><td ><br />Course Code<span style=""color:#FF0000;"">*</span> </td><td><br />&nbsp;<input type=""text"" name=""Code"" id=""Code"" size=""27"" value = "&Session("rqCode")&"><span style=""color:#FF0000;"">"&Error1Code&"</span></td></tr><tr><td ><br />Course Date<span style=""color:#FF0000;"">*</span> </td><td><br />&nbsp;<input type=""text"" name=""Date"" id=""Date"" size=""27"" value = "&Session("rqDate")&"><span style=""color:#FF0000;"">"&Error1Date&"</span></td></tr><tr><td ><br />Course Venue<span style=""color:#FF0000;"">*</span> </td><td><br />&nbsp;<input type=""text"" name=""Venue"" id=""Venue"" size=""27"" value = "&Session("rqVenue")&"><span style=""color:#FF0000;"">"&Error1Venue&"</span></td></tr><tr><td><br />Payment<span style=""color:#FF0000;"">*</span></td><td><br />&nbsp;<input type=""radio"" value=""0"" name=""Payment"" checked=""checked"">I will be paying for the training personally</input><br><input type=""radio"" value=""1""name=""Payment"" >My employer / company will be paying for this training</input></td></tr><tr><td ><br />Your Message<span style=""color:#FF0000;"">*</span></td><td><br />&nbsp;<textarea name=""Message"" id=""Message"" cols=""20"" rows=""10"" value = "&Session("rqSpeReq")&"></textarea><span style=""color:#FF0000;"">"&Error1Message&"</span></td></tr><tr><td colspan = ""4""><div class=""label"" id=""new_test_captcha"" style=""margin-left:100px;""><div id=""captchaWrapper""><div id=""uppercontent""><img id=""captcha_img"" src=""/images/captcha/securimage.php.png""></div><div id=""lowercontent""><div id=""rightPanel"">TYPE ANSWER<br><input name=""captcha_result"" id=""captcha_result"" value="""" onkeypress=""return isNumberKey(event)"" type=""text""><div style=""font-size: 2px;"">&nbsp;</div><div style=""height: 5px; width: 100%;"">&nbsp;</div><div id=""captchStatus"" style=""font-size: 10px;"">&nbsp;</div></div></div></div></div></td></tr><tr><td><p><input value=""Send Enquiry"" class=""wpcf7-form-control  wpcf7-submit"" type=""submit""></p></td></tr></table></form></div></div>"

End Function 


'===================================================================Dates=================================================================================='

'Course Code'
Function CfGetCourseCode()

BlGetCourseName = BlGetCourseDetails

'CfGetCourseCode = "<h2>"&BlGetCourseName(1)&"</h2><img src="" border=""0""/><p class=""course-code"">Course Code: "&BlGetCourseName(0)&"</p>"


End Function 


'H3'
Function CfGetH3()

BlGetCourseName = BlGetCourseDetails

'CfGetH3 = "<h3>"&BlGetCourseName(1)&"</h3>"
                    

End Function 


'Tabs'
Function CfGetTabs()

If BlGetCity <> "" Then

CfGetTabs = "<ul class=""tabs""><li onclick=""jQuery('.tabs li').removeClass('on'); jQuery(this).addClass('on'); jQuery('.tab').hide(); jQuery('#tab-1').show();"">What you'll learn</li><li onclick=""jQuery('.tabs li').removeClass('on'); jQuery(this).addClass('on'); jQuery('.tab').hide(); jQuery('#tab-2').show();"">Audience Profile</li><li onclick=""jQuery('.tabs li').removeClass('on'); jQuery(this).addClass('on'); jQuery('.tab').hide(); jQuery('#tab-3').show();"">Prerequisites</li><li onclick=""jQuery('.tabs li').removeClass('on'); jQuery(this).addClass('on'); jQuery('.tab').hide(); jQuery('#tab-4').show();"">Outline</li><li class=""dates on"" onclick=""jQuery('.tabs li').removeClass('on'); jQuery(this).addClass('on'); jQuery('.tab').hide(); jQuery('#tab-5').show();"">Dates</li></ul>"

Else

CfGetTabs = "<ul class=""tabs""><li class=""on"" onclick=""jQuery('.tabs li').removeClass('on'); jQuery(this).addClass('on'); jQuery('.tab').hide(); jQuery('#tab-1').show();"">What you'll learn</li><li onclick=""jQuery('.tabs li').removeClass('on'); jQuery(this).addClass('on'); jQuery('.tab').hide(); jQuery('#tab-2').show();"">Audience Profile</li><li onclick=""jQuery('.tabs li').removeClass('on'); jQuery(this).addClass('on'); jQuery('.tab').hide(); jQuery('#tab-3').show();"">Prerequisites</li><li onclick=""jQuery('.tabs li').removeClass('on'); jQuery(this).addClass('on'); jQuery('.tab').hide(); jQuery('#tab-4').show();"">Outline</li><li class=""dates on"" onclick=""jQuery('.tabs li').removeClass('on'); jQuery(this).addClass('on'); jQuery('.tab').hide(); jQuery('#tab-5').show();"">Dates</li></ul>"

End If

End Function 



 
 '======================================         'What you'll learn'                           ======================================================= '
 
 
Function CfGetWhatYouWillLearn()


CfGetWhatYouWillLearn = "<p>At the end of this course the delegate will be prepared for the PRINCE2<sup>&reg;</sup> practitioner exam</p><p>The purpose of the Practitioner qualification is to confirm whether the candidate has achieved sufficient understanding of how to apply and tailor PRINCE2<sup>&reg;</sup> in a scenario situation. A successful Practitioner candidate should, with suitable direction, be able to start applying the method to a real project but may not be sufficiently skilled to do this appropriately for all situations. Their individual project management expertise, complexity of the project and the support provided for the use of PRINCE2<sup>&reg;</sup> in their work environment will all be factors that impact what the Practitioner can achieve.</p><p>Candidates should be able to apply and understand how to tailor PRINCE2<sup>&reg;</sup> effectively to a project within an organization environment supporting PRINCE2<sup>&reg;</sup>. Specifically candidates should :-</p><ul><li>Understand the relationships between the roles, management products, principles, themes, techniques and processes</li><li>Be able to apply the principles, themes and processes to a project</li><li>Be able to create and assess management products.</li></ul><p>&nbsp;</p>"


End Function 


Function CfGetWhatYouWillLearnITIL()


CfGetWhatYouWillLearnITIL = "<p>The ITIL<sup>&reg;</sup> Foundation Certificate is a three day course in which delegates will gain a comprehensive grounding in the aspects of ITIL<sup>&reg;</sup> service management. Delegates will prepare for and sit the one hour, multiple- choice ITIL<sup>&reg;</sup> Foundation certificate in service management exam. The course consists of short lectures, exercises, discussions, examination technique training, mock examinations and culminates in an invigilated exam on the third day.</p>"


End Function 



Function CfGetWhatYouWillLearnAgile()


CfGetWhatYouWillLearnAgile = "<p>On a traditional project, the Project Manager may be actively involved in directing work and telling their team what needs to be done a style often referred to as Command and control.</p><p>Agile PM follows a different style. In the early stages, the Agile PM creates a high level plan, based on outline requirements and a high level view of the solution to be created. From that point onwards the end project is created iteratively and incrementally, with each increment building on the output of increments preceding it.</p><p>Unlike a traditional project, the detailed plans for each step are created by the team members themselves and not the Project Manager. Within each stage of the project the team works in an iterative and incremental style in close collaboration with a representative of the</p><p>business/customer in order to understand the detail of the next step and to create and validate an evolving solution.</p><p>Agile Project Management comprises established and proven components that provide an holistic approach to the management and governance of projects. It has an overarching philosophy and guiding principles, together with a lifecycle (or process) and a set of deliverables to be created and maintained as the project progresses from a controlled start through to completion. It provides clearly defined roles with specific responsibilities designed to bring together all the stakeholders involved in the project.</p><p>Agile Project Management provides proven scalability and the ability to work with corporate management processes, supported by a track record of success over many years in IT and non-IT projects.</p><p>The Agile Project Management qualification aims to address the needs of those working in a project-focused environment who want to be Agile.</p><p>Based on the proven fundamentals within DSDM Atern, the new certification provides the ability to deliver Agile Projects in organizations requiring standards, rigour and visibility around Project Management, while at the same time enabling the fast pace, change and empowerment provided by Agile.</p><p>Specifically delegates should be able to:-<ul><li>Explain how to lay the foundations for successful agile projects</li><li>Explain how an agile project is managed</li><li>Clarifiy the different management styles needed for successful agile projects (compared to ""traditional"" projects)</li><li>Provide integration with PRINCE2</li></ul></p><p>&nbsp;</p>"


End Function 

Function CfGetWhatYouWillLearnMSP()


CfGetWhatYouWillLearnMSP = "<p>This course follows on from the MSP<sup>&reg;</sup> Foundation course (MSP2). The purpose is to take delegates to the next level after Foundation and include the knowledge and skills to be able to apply the MSP<sup>&reg;</sup> method in the correct programme environment. Delegates will gain sufficient knowledge and experience in the processes and principles of</p><p>Programme Management (MSP<sup>&reg;</sup>) to act as a Programme Manager for a programme with a coherent project portfolio or to act as a member of a Programme Support Office. You will have an opportunity to prepare for, and sit, the APMG MSP<sup>&reg;</sup> Practitioner exam.</p><p>Following the completion of the course participants will be able to:<br>Describe and apply all facets of the programme processes, in accordance with the MSP<sup>&reg;</sup> method</p><ul><li>Set up and manage complex programmes</li><li>Identify and control risk</li><li>Monitor the objectives of a programme and the essential adjustments needed to respond to changes in the environment</li></ul></p><p><b>Accreditation</b></br>This course leads to the MSP<sup>&reg;</sup> practitioner level certification. The Foundation qualification is a pre-requisite for the Practitioner examination and the Practitioner examination is normally taken on the final day of the course.The Practitioner examination is a closed book objective test examination based on a given scenario and lasting 150 minutes. There are 9 questions each worth 20 marks, making a total of 180 marks available. The pass mark is 50%. Managing Successful Programmes describes the framework and strategies of Programme Management. Programme Management is an integral part of OGC's Best Practice portfolio.</p><p>&nbsp;</p>"


End Function



Function CfGetWhatYouWillLearnAPMP()

CfGetWhatYouWillLearnAPMP = "<p>APM qualifications are aligned to the International Project Management Association (IPMA) competency levels, and the APMP qualification is recognised as IPMA Level D. This five-day intensive course provides delegates with comprehensive training to prepare them for the APMP examination (based on the APM Body of Knowledge, 5th Edition).</p><p>It will enable delegates to:-</p><ul><li>understand all elements of the APMP syllabus</li><li>get to grips with the specific examination languag</li><li>learn strategies and tactics for approaching the examination </li></ul><p>Delegates will learn how to:-</p><ul><li>explain the context of Project Management</li><li>plan the project strategy</li><li>execute project plans and strategy </li><li>demonstrate the use of various project management techniques</li><li>define a project Business Case and it’s use throughout the life cycle</li><li>design a project’s organisation structure and recognise appropriate levels of governance</li><li>communicate with the project team through effective leadership</li><li>understand the examination guidelines</li></ul>Please note the cost of the APMP exam is included with this course. Your account manager will be able to assist you should you have any questions.</p>"

End Function 

Function CfGetWhatYouWillLearnPMP()

CfGetWhatYouWillLearnPMP = "<p>No modern business can flourish without the ability to evolve and adapt to meet today’s rapidly changing demands and work environments. To cope with this change, a bewildering array of concepts, methods, tools and techniques have been developed that can leave newcomers to Project Management confused and bemused. This course has been created to assist those without the fundamental concepts and experience of projects to understand the terminology and underlying reasoning behind Project Management.</p>"

End Function 


 '======================================    End Of     'What you'll learn'                           ======================================================= '


 'Audience Profile'



 '======================================         'Audience Profile'                           ======================================================= '
Function CfGetAudienceProfile()


CfGetAudienceProfile = "<p>This course is aimed at project managers, project management consultants and aspiring project managers. It is also relevant to other key staff involved in the design, development and delivery of projects who are required, or wish, to have a greater depth of knowledge of the method, including:-</p><p>Project Board members</p><ul><li>Senior Responsible Owners</li><li>Project Sponsors</li><li>Senior management involved in making project-level decisions</li></ul><p>Team Managers</p><ul><li>Product Delivery Managers</li><li>Project team members</li><li>Business Analysts</li><li>Subject matter experts delivering or providing expertise to a project</li></ul><p>Project Assurance</p><ul><li>Business Change Analysts</li><li>Change Board members</li><li>Risk managers</li><li>Auditors</li><li>Stakeholder representatives</li></ul><p>Project Support</p><ul><li>Project Office support staff</li><li>Programme Office personnel</li></ul>"


End Function


Function CfGetAudienceProfileAgile()


CfGetAudienceProfileAgile = "<p>This course is aimed at project managers, project management consultants and aspiring project managers. It is also relevant to other key staff involved in the design, development and delivery of projects who are required, or wish, to have a greater depth of knowledge of working in an Agile way.</p>"


End Function



Function CfGetAudienceProfileITIL()


CfGetAudienceProfileITIL = "<p>The target groups of the ITIL<sup>&reg;</sup> Foundation Certificate are:</p><ul><li>Individuals who require a basic understanding of the refreshed ITIL<sup>&reg;</sup> framework and how it may be used to enhance the quality of IT service management within an organisation.</li><li>IT professionals that are working within an organisation that has adopted and adapted ITIL<sup>&reg;</sup>, who need to be informed about and thereafter contribute to, an ongoing service improvement programme.</li></ul>"


End Function

Function CfGetAudienceProfileMSP()


CfGetAudienceProfileMSP = "<p>The intended audience for this course consists of programme managers, aspiring programme managers, programme board members and programme or portfolio support staff.  The course builds on the knowledge gained from the Foundation course and prepares delegates to the Practitioner level.</p>"


End Function



Function CfGetAudienceProfileAPMP()


CfGetAudienceProfileAPMP = "<p>This course is aimed at project managers, project management consultants and aspiring project managers. It is also relevant to other key staff involved in the design, development and delivery of projects-</p><ul><li>This course is for people with at least two years’ project experience.</li><li>It is suitable for project managers and aspiring project managers.</li></ul>"


End Function

Function CfGetAudienceProfilePMP()


CfGetAudienceProfilePMP = "<p><p>New Project Managers, Team Managers, Supervisors, Resources, Project Support Staff, Project Administrators or anyone beginning work on a project.</p></p>"


End Function



 '======================================    End Of     'Audience Profile'                           ======================================================= '



 


 'Prerequisites'
 
'========================================         Start Of  Prerequisites                 ====================================================' 
 
Function CfGetPrerequisites()


CfGetPrerequisites = "<p>Delegates must have attained the Foundation qualification, or achieved Foundation level qualification in a previous version. Delegates that did not complete their Foundation course with Datrix may not have all the necessary knowledge expected of attendees for this course. In particular, this may apply to those looking to renew their Practitioner accreditation in a previous version, but can also apply to those who took Foundation courses with other training organisations, online or CD-ROM based learning and self-study.</p><p>In these situations a more detailed refresher may be required, in which case delegates should book the Combined Foundation and Practitioner course.</p><p>Delegates must have completed the Practitioner EX02 exam paper prior to the course. This paper can be downloaded using the link to the pre-course reading material. This is supplied once your booking has been placed.</p><p>In addition, delegates should allow for around 2 to 3 hours of evening work prior to taking the Practitioner examination. This is to finalise exam preparation and confirm understanding in any areas of uncertainty.</p>"


End Function 


Function CfGetPrerequisitesITIL()


CfGetPrerequisitesITIL = "<p>There are no formal entry requirements although delegates should have a general awareness of IT and a basic understanding of the business environment.</p>"


End Function 


Function CfGetPrerequisitesAgile()


CfGetPrerequisitesAgile = "<p>There are no formal pre-requisites for this course.  However, it is anticipated that delegates will possess knowledge of projects or have experience of working in a project environment.<br></p><p>This is to ensure that the intensive nature of the course does not cause delegates to struggle through the course.  If such knowledge or experience does not exist, delegates may be advised to split the course into the separate Foundation and Practitioner courses.  The course may be booked as a single unit, to achieve the cost effectiveness, but schedule each course in different weeks.  Please call your local office for further details.</p>"


End Function 


Function CfGetPrerequisitesMSP()


CfGetPrerequisitesMSP = "<p>Experience of working in a Programme environment is essential. However, if this is not present, Project Management experience or Project Board experience can be substituted, but it is not recommended that delegates attempt this course without any experience at all.<br>Delegates must possess a pass at MSP<sup>&reg;</sup> Foundation level before attending this course. In addition, delegates are expected to complete approximately 2 to 3 hours of evening work in order to consolidate the learning provided each day and to practise examination questions to assist in passing the qualifications.</p>"


End Function 


Function CfGetPrerequisitesAPMP()


CfGetPrerequisitesAPMP = "<p><ul><li>Ideally delegates will have some experience of working in a project environment and have a basic understanding of project management issues.</li><li>Delegates will be provided with pre-course reading two weeks prior to attending the course by email. The success on the course will be enhanced by close attention to the pre-reading materials.</li><li>This is an intensive 5-day course and delegates will be expected to undertake at least 15 hours pre-course work in order to be fully prepared for the workshop</li></p>"


End Function 


Function CfGetPrerequisitesPMP()


CfGetPrerequisitesPMP = "<p>None. This course is an ideal starting point for anyone new to Project management, those without project experience or anyone preparing to take further steps into project planning and control</p>"


End Function 


'========================================         End Of  Prerequisites                 ===================================================='

 'Outline'
 
 
'========================================         Outline                ===================================================='
 
Function CfGetOutline()


CfGetOutline = "<p><b>DAY 1</b><br>Introduction to Principles, Themes and Processes<br>Business Case Theme<br>Organisation Theme<br>Starting Up a Project<br><br><b>DAY 2</b><br>Review of Day 1<br>Initiating a Project<br>Risk Theme<br>Quality Theme<br>Change Theme<br><br><b>DAY 3</b><br>Review of Day 2<br>Progress Theme<br>Controlling a Stage<br>Managing Product Delivery<br>Managing a Stage Boundary<br>Plans Theme<br>Closing a Project<br>Directing a Project – Review<br>Revision and exam<br><br><b>DAY 4</b><br>Understanding the practitioner examination format<br>Tips and tricks for answering the Practitioner Questions<br>Review of PRINCE2<sup>&reg;</sup><br>Practice questions under examination conditions<br>Review of answers<br><br><b>DAY 5</b><br>Practitioner examination only<br>The timetable and order of events may be varied by the trainer where they see an opportunity to give delegates a better learning experience.<br></p>"


End Function 


Function CfGetOutlineITIL()


CfGetOutlineITIL = "<p>Candidates can expect to gain competencies in the following upon successful completion of the education and examination components related to this certification:</p><ul><li>Service management as a practice – the concept of good practice, the concept of a service, the concept of service management, define roles, processes and functions</li><li>he Service Lifecycle – The service lifecycle and its key concepts, the business value of the phases of the lifecycle</li><li>Key Concepts and Definitions – Key terminology of service management, key principles and models </li><li>Service Strategy – The four main activities of service strategy, the main goals and objectives of service strategy, basic overview of value creation through services, overview of the five service strategy processes</li><li>Service Design – The importance of people, processes, products and partners, the five major aspects of service design, different sourcing approaches and options, overview of the seven service design processes</li><li>Service Transition – The service V model, overview of the five service transition processes</li><li>Service Operation – IT service versus technology components, quality of service versus costs of service, reactive versus proactive, overview of the five key service operation processes</li><li>Continual Service Improvement – Objectives of continual service improvement, the seven step improvement process</li><li>Continual Service Improvement – Objectives of continual service improvement, the seven step improvement process</li><li>Roles – The role of the process owner, the role of a service owner, the role of the RACI model in determining organisational structure</li><li>Technology and Architecture – Requirements for an integrated set of service management technology, how service automation assists with integrated processes</li></ul></p>"


End Function 





Function CfGetOutlineAGILE()


CfGetOutlineAGILE = "<p><ul><ul>The basics of Agile project management<li>The philosophy</li><li>Principles</li><li>Lifecycle</li><li>Products</li><li>Roles and responsibilities</li></ul><ul>Atern practices<li><li>Facilitated workshops</li><li>MoSCow prioritisation</li><li>Iterative development</li><li>Modelling</li><li>Timeboxing</li></ul><ul>Areas affected by the use of an Atern approach<li>Requirements</li><li>Estimating and Measurement</li><li>Quality</li><li>Planning and Control</li><li>Project Management</li><li>Risk</li><li>Testing</li><li>Configuration Management</li></ul></ul><br /><br />Exam timing: The foundation exam is sat on the afternoon of the third day, on successful completion of the foundation exam delegates become eligible to sit the practitioner examination which is held at 2pm of the final day (day 4).</p>"


End Function 

Function CfGetOutlineMSP()


CfGetOutlineMSP = "<p><b>Transformational Flow</b><ul type=""square""><li>Identifying a Programme</li><li>Defining a Programme</li><li>Managing the Tranches</li><li>Delivering the Capability</li><li>Realising the Benefits</li><li>Closing a Programme</li></ul><b>Writing Terms of Reference</b><ul type=""square""><li>Sponsoring group</li><li>Programme Director</li><li>Business Change Manager</li><li>Programme Manager</li><li>Programme Support Office</li><li>Capabilities and characteristics</li></ul><b>Compiling a Blueprint</b><ul type=""square""><li>Expanding the Programme Vision Statement</li><li>The required business model</li><li>Service levels & Key Performance measures</li><li>Support systems</li></ul><b>Planning a Programme</b><ul type=""square""><li>Scheduling projects</li><li>Resource sharing</li><li>Defining tranches</li><li>Handling dependencies</li></ul><b>Running a Programme</b><ul type=""square""><li>Issue management</li><li>Risk management</li><li>Quality management</li><li>Benefits Realisation</li><li>Programme Benefit Reviews</li></ul><b>Case Study</b><ul type=""square""><li>APM Programme Scenario</li><li>Exam based exercises</li><li>Writing Terms of Reference</li><li>Writing a Blueprint</li><li>Creating a Programme Plan</li><li>Risk Management Strategy</li></ul><b>Exam preparation</b><ul type=""square""><li>Group question practice</li><li>Individual practice</li><li>Exam feedback</li><li>Practitioner Advanced Exam assignments</li></ul></p>"


End Function


Function CfGetOutlineAPMP()


CfGetOutlineAPMP = "<p><b>Project Management in Context</b><ul type=""square""><li>Project management; Programme management; Portfolio management; Project context; Project sponsorship; Project office</li></ul><b>Planning and Project Strategy</b><ul type=""square""><li>Planning and Project success & benefits management; Stakeholder management; Project management plan; Project risk management; Project quality management; Health, safety and environmental management</li></ul><b>Executing the Strategy</b><ul type=""square""><li>Scope management; Scheduling; Resource management; Budgeting and cost management; Change control; Earned value management; Information management & reporting; Issue management</li></ul><b>Techniques</b><ul type=""square""><li>Requirements management; Estimating; Configuration management</li></ul><b>Business and Commercial</b><ul type=""square""><li>Business Case; Procurement; Project life cycles; Handover & closeout</li></ul><b>Organisation and Governance</b><ul type=""square""><li>Project Reviews; Organisation Structure; Organisational roles; Methods & procedures; Governance of project management</li></ul><b>People and Profession</b><ul type=""square""><li>Communication; Teamwork; Leadership; Conflict management; Negotiation</li></ul><b>Examination Guidelines</b><ul type=""square""><li>Examination structure; 'list', 'state', 'describe' 'explain' meanings; Question structure; Group and individual examination practice</li></ul>Extensive examination practice and feedback is included in the workshop. Delegates can choose to sit the APMP examination at around 13:00 on the final day of the course. The examination consists of:<ul><li>10 essay based questions to be selected from a total of 16. Each worth 50 marks</li><li>3 hours</li><li>Closed-book</li><li>Candidates require a minimum of 275 marks out of 500 (55%) to pass</li></ul>By successfully passing the APMP examination candidates can choose to further develop their knowledge and understanding by attending the APMPQ Assessment Centre. The attainment of accreditations offered by professional bodies such as the Association for Project Management (APM) is increasingly seen as a recognised indicator of competence in project management. APM qualifications are aligned to the International Project Management Association (IPMA) competency levels, and the APMP qualification is recognised as IPMA Level D.</p>"


End Function

Function CfGetOutlinePMP()


CfGetOutlinePMP = "<p>The course includes such topics as Project Management Concepts, Why Projects Fail, the Project Lifecycle, Planning and Estimating, Risks, Monitoring and Control.</p>"


End Function



'========================================       End Of Outline                ===================================================='
'===================================================================To be changed from here=========================================================================


'Pricing Information'
Function CfGetPricingInformation

CfGetPricingInformation = "<h3><b>We will beat or match any like-for-like* training quotation</b></h3><h4><span style=""color: #ff6600;""><a href=""/images/buttons/Price_Gun.jpg""><img class=""alignright size-full wp-image-37842"" title=""Price_Gun"" src=""/images/buttons/Price_Gun.jpg"" alt="" height=""198"" width=""300""></a>How can I find out the price of your courses?</span></h4><p>For our latest and lowest prices, please contact our friendly and&nbsp;knowledgeable&nbsp;advisers &nbsp;using our <strong><a href=""/contact-us/contactUs.asp"">contact request form</a></strong>, request a<strong> <a href=""http://www.datrixtraining.com/one-hour-quote/"">1 hour quotation</a></strong>&nbsp;or freephone us on <strong>0800 781 0626</strong> (UK Monday – Friday 9am – 5.30pm).</p><h4 style=""color: #ff6600;"">Why doesn't datrixtraining.com show prices?</h4><p>Courses supplied by different training companies are…..different, even courses with the same name / subject area. When you compare courses from different providers on the web, please don't assume they are all the same and they certainly should not be treated as like-for-like.<br><br>Classroom learning is a personal experience full of human interaction and human dynamics. So before you make a purchase, we strongly recommend you talk to our friendly advisers, many of whom have been in the training industry over 10 years, they will be very pleased to receive your enquiry by phone or email.<br><br>We work with new and existing customers on an account management basis. We agree a buy price including discounts which can be adjusted depending upon a customer’s personal objectives, budgets, projects or their ongoing requirements.<br><br>This personal service is part of a experience that you can't receive buying online. We don't believe that buying training should be transactional and purchased over the web by credit card.  Our advisers will give you the lowdown on the course experience, the added extras and the best value price in the market. If you carry out your purchase 100% online, then the first time you meet a representative of your training provider is on the morning of your course, by then its too late to change your mind if the experience isn’t up to your expectations.<h4 style=""color: #ff6600;"">Does no price mean that you're going to be expensive?</h4>No, not at all. We work with some of the UK's biggest organisations who employ very experienced training buyers who continue to buy from us and have done since 2001. These professional buyers continually search the market to purchase the very best value training they can for their employees. The best purchasers know the difference between cheap and best value training, the best purchasers talk to Datrix Training.<br><br><h4 style=""color: #ff6600;"">I just Googled a course I want at what I think is a really good price from a web company. I phoned their sales person and they said it’s as good as a Datrix course, should I book it?</h4>Where you spend your money is your choice of course, but please make an informed decision and remember the sales person is likely on commission to sell to you.<br><br>Why not talk to our advisers about what we can do for you on 0800 781 0626 or email them via the contact page? Our sales advisers have the ability to discuss and adjust prices to give you the best value purchase. We invest in our sales advisers’ training, as a result 90% of all our enquires convert to a place on one of our courses. (Even better is that 92% re book with us again!)<br><br><h4 style=""color: #ff6600;"">What differences should I look out for when choosing a training supplier?</h4>Class sizes – How many people are on the course? Its economic reality, the more people you squeeze into a room, the lower you can sell places for.<br>Natural Daylight – No windows and a basement classroom means lower costs for the training provider<br>Venue Quality – The worse the venue, the lower the cost, the cheaper the training<br>Lunches – Is it included?<br>Post Course Support – Does it exist?<br>Pre Requisites – We ensure your co-delegates are up to speed before the course. How can that be possible when taking online bookings? A delegates who fails to meet course pre requisites will often slow down your course adversely affecting your learning.<br><br><h4 style=""color: #ff6600;"">Are your scheduled course dates real or fictitious?</h4>Good question. Our dates are real of course!<br><br>Not every company advertises ""real"" course dates. If a training company claims to have a date every week in a your local town on their website, you may think you’ve found a solution. But that’s not always the case, its an old trick to drive enquiries to the company.<br><br>Here's how it works with some training companies: You book a date either online or over the phone. Just before the course you receive a message telling you that the date or venue has changed or worse still it is cancelled. In reality your date probably never existed, but as it was the date you needed, you booked it in good faith.<br><br>If you booked online, they have your money too so it's not easy to go elsewhere until you are refunded.<br><br><h4 style=""color: #ff6600;"">Well how can I be sure the date I book is real?</h4>When you book a date, if the sales adviser assures you not to worry about cancellation / rescheduling, ask them to back up their words with a WRITTEN guarantee that if the course is cancelled, you get 1) a refund and 2) free replacement training!<br><br>If they won't give that guarantee, you know why! At Datrix Training, the dates you see on our website all exist and are scheduled to run in our quality venues.<br><br><h4 style=""color: #ff6600;"">I spoke to a sales person at another company who said their exam pass rates are better than yours is this true?</h4>This question usually refers to PRINCE2 Courses as the exam takes place during the training week.<br><br>For example, with PRINCE2<sup>&reg;</sup> there are 2 exams: Foundation & Practitioner. Foundation is simple enough, basically everyone passes apart from one or two delegates who (normally) don’t complete the pre course reading so the pass rate is likely about 99-100%.<br><br>The Practitioner is a trickier exam: 2.5 hours and pass rates are lower. Maybe about 79% as a national average, but that can go up and down.<br><br>So the scenario usually starts with a customer asking about pass rates. Once we agree we are talking about the PRINCE2<sup>&reg;</sup> Practitioner exam, a customer may say something like ""well I've spoken to a sales adviser at xyz company and they have the highest pass marks in the country"".<br><br>The APM Group (the governing body for PRINCE2) won't let other ATOs (Authorised Training Organisation) know each other’s pass rates. ATO pass rates are closely guarded secrets so to claim to be #1 is difficult as you can’t compare your results to anyone else’s. (We know, we'd love to compare ours!)<br><br>There's also the question of time frame and quantity. If a small ATO ran one course last month with 3 delegates and they all passed the PRINCE2 Practitioner exam, they rightly claim a 100% pass rate. However, a company training maybe 112 people in one week on the same exam may have 12 fails and boast an 89% pass rate. The smaller firm has the better pass rate, but if you’re planning on buying a lot of course places, would the pass rates hold up with more  delegates?<br><br><h4 style=""color: #ff6600;"">If you have further questions, please call our sales advisers today on 0800 781 0626 or request a quotation and let's talk</h4>*Like-for-like means the course quotation you have must be comparable to the quality of training offered by Datrix Training. Comparable include class size, venue quality, refreshments provision,  examination pass rates, cancellation policy, payment terms, trainer expenses, hidden costs. If in doubt please contact our friendly and knowledgeable  advisers. We are confident we can offer you the best solution available in the marketplace."


End Function





'Testimonials'
Function CfGetTestimonials

CfGetTestimonials = "<p><strong>Richard L,&nbsp;Assistant Finance Manager</strong></p><p>Location: Sheffield</p><p>Excellent tutor in Alan Lloyd</p><p>Many thanks to tutor Alan Lloyd, he's a major reason I passed both exams. Extremely knowledgeable, and he provides very good exam tuition. Would be better if 300 page course manual was given out a month before course started, as 1 week is really not very long to have a chance of passing both exams.</p><hr class=""dotted-hr""><p>&nbsp;</p><h5>P Edwards, Network Manager</h5><p>Location: North WestCourse: PRINCE2 Combined Foundation &amp; Practitioner</p><p>The purpose of this email is to let you know that I really enjoyed the training sessions. Yes they were painful, the workload was immense (and I've had a busy weekend catching up on the washing and the ironing, dusting and cleaning) but our trainer made quite a dry subject matter very entertaining. I was very impressed by the professionalism of the whole training, from booking process, venue and course contents. Thanks very much for all of your support.</p><hr class=""dotted-hr""><p>&nbsp;</p><h5>RS</h5><p>Location: LondonCourse: PRINCE2 Combined Foundation &amp; Practitioner</p><p>Our trainer was a fantastic tutor for the PRINCE2 Foundation and Practitioner course. He made an intensive week really enjoyable.</p><hr class=""dotted-hr""><p>&nbsp;</p><h5>Name confidential</h5><p>Location: N/aCourse: PRINCE2 Combined Foundation &amp; Practitioner</p><p>Today I found out that I passed the Prince2 Practitioner exam, news which was greeted with much joy. I wanted to say a big thank you as the course delivery was excellent and the trainer was one of the best I have been on a course with. I would not hesitate in recommending Datrix to others for their training requirements.</p><hr class=""dotted-hr""><p>&nbsp;</p><h5>J.S.</h5><p>Location: EastCourse: PRINCE2 Combined Foundation &amp; Practitioner</p><p>First of all, can I say that I thoroughly enjoyed the Practitioner course training in Nottingham. The venue and facilites were excellent. the trainer was SUPERB. He knew his stuff and taught the course very well. I would have no hesitation in recommending Datrix to anyone who asked me for the PRINCE2 training. Oh and I passed it as well – YAY!!</p><hr class=""dotted-hr""><p>&nbsp;</p><h5>Paul Thompson</h5><p>Location: North West<br>Course: 10135 Exchange 2010</p><p>A great course well delivered in 5 days at Liverpool. Lunches were great as was the trainer, thanks.</p>"


End Function


'How we work'
Function CfGetHowWeWork

CfGetHowWeWork = "<p>Our sales team are the first point of contact for all enquiries. The sales team are trained to listen and respond to your training needs. Where required, the team are trained to advise and recommend courses. In the event you would like to talk to one of the training team about a course, then we can arrange this for you.</p><p>&nbsp;</p><p><strong>Booking</strong></p><p>If you are certain what you need then booking a course is quick and easy: Your account manager will email or fax a booking form with all the necessary course information on it. To confirm your course, simply sign and faxback the booking for to the number at the top.</p><p>Following agreement with your Datrix Training account manager, or one of our training team, you will be faxed or emailed a course Booking Form showing all the details of the course including date, location, price and course specific details. To confirm your course booking, you will need to sign and faxback the order to your account manager.</p><p>Your booking form is received by your account manager.</p><p>When your course booking is entered onto our system by our Administration Team, you will receive a confirmation email showing the details of your booking.</p><p>Our course Customer Service Team are responsible for sending out your course Joining Instructions 3-4 weeks before your course date. Joining Instructions have all the details of the booking including venue directions, delegates name(s).</p><p><strong>Customer Services can be contacted on 01772 507827 Monday - Friday 9am - 5.30pm.</strong></p><p>On the day of your course you will be asked to sign in before starting you course.</p><p>At the end of the course, all delegates are asked to complete a course evaluation form.</p>"


End Function



'Microsoft Software Assurance Training Vouchers (SATV)'
Function CfGetMicrosoftSoftwareAssurance

CfGetMicrosoftSoftwareAssurance = "<p><a href=""/images/buttons/logo_licensing1.gif""><img class=""alignleft size-full wp-image-1132"" title=""logo_licensing"" src=""/images/buttons/logo_licensing1.gif"" alt=""Microsoft Software Assurance"" height=""32"" width=""274""></a></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p><strong>Don't let your Microsoft Software Assurance Training Vouchers (SATV) expire</strong></p><p>If you have a volume licensing agreement with Microsoft, the chances are that you also have SATVs as part of that agreement.</p><p>Every year £1,000s of Microsoft SATVs expire unused where customers fail to redeem their SATVs on <em>Microsoft Official Curriculum courses </em>from a<em> Microsoft Partner for Learning Solutions</em>.</p><p>You can redeem your vouchers against our public scheduled Microsoft courses or use them for tailored Microsoft courses.</p><p>&nbsp;</p><p><strong>Frequently Asked Questions</strong></p><p>&nbsp;</p><p><strong>How can find out if my organisation has SATVs that I can redeem with Datrix Training?</strong></p><p>Please contact our advisers on 0800 781 0626 or contact us through the website. We will ask you to complete this form to give us authority to contact Microsoft on your behalf and ascertain your entitlement and the expiry of your vouchers.</p><p>&nbsp;</p><p><strong>I have SATVs how do I use them?</strong></p><p>We can help you, but basically you assign your vouchers to learners in your organisation then we assign the learners to the courses you ask us to and that's it.</p><p>&nbsp;</p><p><strong>Do I have to pay anything?</strong></p><p>No, you've already paid as part of your software licensing agreement. So if your SATVs are valid, you redeem them against our courses. If you want buy more training than the SATVs value covers, we can offer you a discounted bundle deal to maximise your purchasing power.</p><p>&nbsp;</p><p><strong>Where do I get the form to check if I have SATVs?</strong></p><p>Follow this link:&nbsp;<a href=""http://datrixtraining.com/wp-content/uploads/2012/05/Software-Assurance-Client-Approval-Form.pdf"">Software Assurance Client Approval Form</a></p><p>&nbsp;</p><p><strong>Where can I find out more about SATVs?</strong></p><p>Download the&nbsp;Microsoft&nbsp;information sheet here:&nbsp;<a href=""http://datrixtraining.com/wp-content/uploads/2012/05/SATV_Customer_FAQ.pdf"">SATV_Customer_FAQ</a></p><p>&nbsp;</p><p><strong>To check if you have an entitlement to free Microsoft training, contact our advisers on 0800 781 0626 or through the website</strong></p><p>&nbsp;</p><p>&nbsp;</p>"


End Function



'How we work'
Function CfGetWhoWeWorkWith

CfGetWhoWeWorkWith = "<h2 style=""text-align: center;"">Datrix Training works with sector leading organisations to deliver performance improving training solutions</h2><p>&nbsp;</p><p>We work on projects ranging from hundreds of people to individual courses for a single delegate. Whichever scale of project we work on, you can be sure of our maximum attention to detail, customer care and of course a great learning experience.</p><p>&nbsp;</p><p>&nbsp;</p><p><a href=""/images/buttons/Customers.jpg""><img class=""aligncenter size-full wp-image-37848"" title=""Customers"" src=""/images/buttons/Customers.jpg"" alt=""  width=""700""></a></p>"
%>
<style type="text/css">
			#gallery-1 {
				margin: auto;
				
			}
			#gallery-1 .gallery-item {
				float: left;
				margin-top: 10px;
				text-align: center;
				width: 20%;
			}
			#gallery-1 img {
				border:hidden;
			}
			#gallery-1 .gallery-caption {
				margin-left: 0;
			}
</style>
        
<%        
CfGetWhoWeWorkWith = CfGetWhoWeWorkWith & "<div id=""gallery-1"" class=""gallery galleryid-674 gallery-columns-5 gallery-size-thumbnail""><dl class=""gallery-item""><dt class=""gallery-icon""><a href=""http://www.datrixtraining.com/our-customers/aol_logo/"" title=""AOL_logo""><img src=""http://www.datrixtraining.com/wp-content/uploads/2012/02/AOL_logo.png"" class=""attachment-thumbnail"" alt=""AOL_logo"" title=""AOL_logo"" height=""75"" width=""125""></a></dt></dl><dl class=""gallery-item""><dt class=""gallery-icon""><a href=""http://www.datrixtraining.com/our-customers/bnfl-2/"" title=""BNFL""><img src=""http://www.datrixtraining.com/wp-content/uploads/2012/02/BNFL.png"" class=""attachment-thumbnail"" alt=""BNFL"" title=""BNFL"" height=""75"" width=""125""></a></dt></dl><dl class=""gallery-item""><dt class=""gallery-icon""><a href=""http://www.datrixtraining.com/our-customers/boots-2/"" title=""boots""><img src=""http://www.datrixtraining.com/wp-content/uploads/2012/02/boots.png"" class=""attachment-thumbnail"" alt=""boots"" title=""boots"" height=""75"" width=""125""></a></dt></dl><dl class=""gallery-item""><dt class=""gallery-icon""><a href=""http://www.datrixtraining.com/our-customers/deutsche_bank_ag-logo/"" title=""Deutsche_Bank_AG-logo""><img src=""http://www.datrixtraining.com/wp-content/uploads/2012/02/Deutsche_Bank_AG-logo.png"" class=""attachment-thumbnail"" alt=""Deutsche_Bank_AG-logo"" title=""Deutsche_Bank_AG-logo"" height=""75"" width=""125""></a></dt></dl><dl class=""gallery-item""><dt class=""gallery-icon""><a href=""http://www.datrixtraining.com/our-customers/enterprise-2/"" title=""enterprise""><img src=""http://www.datrixtraining.com/wp-content/uploads/2012/02/enterprise.png"" class=""attachment-thumbnail"" alt=""enterprise"" title=""enterprise"" height=""75"" width=""125""></a></dt></dl><br style=""clear: both""><dl class=""gallery-item""><dt class=""gallery-icon""><a href=""http://www.datrixtraining.com/our-customers/matalan_logo/"" title=""Matalan_logo""><img src=""http://www.datrixtraining.com/wp-content/uploads/2012/02/Matalan_logo.png"" class=""attachment-thumbnail"" alt=""Matalan_logo"" title=""Matalan_logo"" height=""75"" width=""125""></a></dt></dl><dl class=""gallery-item""><dt class=""gallery-icon""><a href=""http://www.datrixtraining.com/our-customers/nhs-logo/"" title=""NHS-Logo""><img src=""http://www.datrixtraining.com/wp-content/uploads/2012/02/NHS-Logo.png"" class=""attachment-thumbnail"" alt=""NHS-Logo"" title=""NHS-Logo"" height=""75"" width=""125""></a>		</dt></dl><dl class=""gallery-item""><dt class=""gallery-icon""><a href=""http://www.datrixtraining.com/our-customers/morrisions-2/"" title=""Morrisons""><img src=""http://www.datrixtraining.com/wp-content/uploads/2012/02/Morrisions.jpg"" class=""attachment-thumbnail"" alt=""Morrisons"" title=""Morrisons"" height=""75"" width=""125""></a></dt></dl><dl class=""gallery-item""><dt class=""gallery-icon""><a href=""http://www.datrixtraining.com/our-customers/rbs_group/"" title=""RBS_Group""><img src=""http://www.datrixtraining.com/wp-content/uploads/2012/02/RBS_Group.png"" class=""attachment-thumbnail"" alt=""RBS_Group"" title=""RBS_Group"" height=""75"" width=""125""></a>			</dt></dl><dl class=""gallery-item""><dt class=""gallery-icon""><a href=""http://www.datrixtraining.com/our-customers/customers/"" title=""Customers""><img src=""http://www.datrixtraining.com/wp-content/uploads/2012/02/Customers-150x150.jpg"" class=""attachment-thumbnail"" alt=""Customers"" title=""Customers"" height=""150"" width=""150""></a></dt></dl><br style=""clear: both""><br style=""clear: both;""></div>"&CfGetTestimonials&""

End Function


'Satisfaction Guarantee'
Function CfGetSatisfactionGuarantee

CfGetSatisfactionGuarantee = "All Datrix Training courses are covered by our Satisfaction Guarantee*. Post course training evaluations that are handed to every course delegate are compiled weekly to ensure that every one of our training team consistently delivers the highest standards of training. The scores are reviewed by the directors and senior training team. In the event you every have any other issues you would like to bring to the attention of the directors, <a href=""/contact-us/contactUs.asp"">please contact us</a> or by post:</p><p>The Directors,<br>Datrix Training Limited,<br>Chorley Business &amp; Technology Centre,<br>East Terrace,<br>Euxton Lane,<br>Chorley,<br>Lancashire,<br>PR7 6TE</p><p>If the delegate who attends a Datrix course leaves your organisation during the following 90 days, we will retrain their replacement for free*.</p><p class=""small"">*Free Replacement Training: Replacement delegates must use manuals from first course. Proof of entitlement will be required. Replacement exams are not included in offer, but can be purchased from us at cost price.</p><p class=""small"">**Satisfaction Guarantee Terms: If the course fails to meet the terms of delivery set by the governing body then Datrix Training will re-run the course again at no extra cost. In the event the course is a non authorised event free resits will be at the directors' discretion. If you would like to claim under the satisfaction guarantee please contact us in writing no more than 10 working days after the last day of the training course.</p>"


End Function



'Privacy Policy'
Function CfGetPrivacyPolicy

CfGetPrivacyPolicy = "<p>Datrix Training Limited respects your privacy at all times, and will not pass your details onto any third party, unless it is information required by a training associate in direct response to a training enquiry by yourself, or where the law requires us to pass on information.</p><p>We will only contact you in relation to course bookings you have made with us. In addition, we may contact you from time to time to keep you informed of training news, offers and developments at Datrix Training Limited.</p>"


End Function


'Copyrights & Trademarks'
Function CfGetCopyrights

CfGetCopyrights = "PRINCE2<sup>&reg;</sup> is a registered trade mark of the Cabinet Office | MSP<sup>&reg;</sup> is a registered trade mark of the Cabinet Office | M_o_R<sup>&reg;</sup> is a registered trade mark of the Cabinet Office | P3O<sup>&reg;</sup> is a registered trade mark of the Cabinet Office | P3M3<sup>&reg;</sup> is a registered trade mark of the Cabinet Office | MoP™ is a trade mark of the Cabinet Office | MoV<sup>&reg;</sup> is a registered trade mark of the Cabinet Office ITIL<sup>&reg;</sup> is a registered trade mark of the Cabinet Office. The Swirl logo™ is a trade mark of the Cabinet Office."


End Function


'Terms Of Business'
Function CfGetTermsOfBusiness

CfGetTermsOfBusiness= "<b>Datrix Training Limited Terms and Conditions</b><br><Br>These terms contain the entire agreement between the parties and unless otherwise agreed in writing by a Director of Datrix Training Ltd these Terms of Business prevail over any other terms of business or purchase conditions put forward by the Customer.<br><Br>A Purchase Order (PO) must clearly state the PO number, course dates and fee together with all the invoicing details and authorised signature. All courses must be taken within twelve months of the date of the original order.<br><Br>No deviation from these terms and conditions will be allowed without the express written permission of a Director of Datrix Training Ltd. No communication either verbal or printed on our websites or brochures will override these Terms and Conditions.<br><Br>All prices are shown exclude Value Added Tax (VAT).<br><br><b>1. Payment terms – Instructor Led Courses</b><br>The full fee, including VAT, is payable 14 days before course start date. Any Discounts are subject to payment within 14 days of invoice date. Where invoices are not paid 14 days in advance of the course start date then the full list price shall fall due. Late payment invoices will be subject to a surcharge at the rate of 8% over the Bank of England base rate. Datrix Training Ltd reserves the right to pass overdue debt to a commercial recovery company and or pursue overdue debt through legal proceedings, in this event a 15% surcharge will apply to cover the costs incurred.<br><Br>Where more than one course is booked on the same booking form, full payment for all courses, including VAT, is required 14 days before the commencement of the first course or within 14 days of invoice whichever is sooner. Where the relevant invoice has not been paid by course commencement then we reserve the right to refuse the delegate(s) in question admittance to that course; in these circumstances the invoice in question will remain payable in full.<br><br><b>2. Payment terms – Room Hire</b><br>The full fee, including VAT, is payable 14 days in advance of the date of commencement of the first hire period. Any Discounts are subject to payment within 14 days of invoice date. Where invoices are not paid by the due date then the full list price shall fall due. Late payment invoices will be subject to a surcharge at the rate of 8% over the Bank of England base rate. Datrix Training Ltd reserves the right to pass overdue debt to a commercial recovery company and or pursue overdue debt through legal proceedings, in this event a 15% surcharge will apply to cover the costs incurred. Where more than one hire period is booked on the same booking form, full payment for all courses, including VAT, is required 14 days before the commencement of the first course or within 14 days of invoice whichever is sooner.<br><Br>Where the relevant invoice has not been paid by the first day of room hire commencement we reserve the right to refuse the delegate(s) admittance into the training room; in these circumstances the invoice in question will remain payable in full.<br><br><b>3. Payment terms – E-learning and blended training</b><br>Invoices for E-learning and blended training are payable within 30 days of invoice date E-Learning vouchers will be despatched upon payment of invoice in full E-learning vouchers are non-returnable and non-refundable. We reserve the right to surcharge late payment invoices at the rate of 8% over the prevailing bank base rate. We accept all major credit and debit cards for payment.<br><br><b>4. Payment Terms – Learning Banks, Training Vouchers & Exam Vouchers</b><br>Learning Banks, Training Vouchers & Exam Vouchers cannot be cancelled and they are not refundable and may not be allocated or used until they have been paid for.<br><Br>Learning Banks, Training Vouchers & Exam Vouchers are redeemable against public scheduled courses only and places are subject to availability on a first come first served basis.<br><Br>Learning Banks, Training Vouchers & Exam Vouchers must be used within 12 months of purchase,<br><Br>Any Learning Banks, Training Vouchers & Exam Vouchers not redeemed within 12 months will expire and no refund will be offered.<br><br><b>5. Cancellation</b><br>Unless written cancellation is received at least 30 calendar days before the start date of the course, the fees including VAT are payable in full. Please ensure you have written confirmation from us that your cancellation request has been made, proof of sending a cancellation request is not sufficient. Notification of all cancellations must be made in writing to Customer Services. Customer Services can be contacted at:<br><Br>Customer Services, Datrix Training Ltd, Chorley Business & Technology Centre, East Terrace, Euxton Lane, Chorley, Lancashire, PR7 6TE<br><Br>All cancellations are subject to a minimum fee of £100 + VAT. Datrix Training Ltd will issue a separate invoice for the amount. Re-schedule and administration fees are payable immediately on invoice.<br><Br>Any course materials you have received or that we have sent to you in good faith of the original order, should be returned to Customer Services at the address above in their original condition, the cost of returning any training materials to us must be paid for by you. It is your responsibility to ensure that any such materials arrive at Customer Services. We recommend parcel tracking or a reputable courier that will enable you to track your parcel: proof of posting will not be accepted. Any materials, manuals or goods sent to you which are not returned, or are not returned in an acceptable condition may be subject to a fair and reasonable fee in line with the costs incurred by us.<br><Br>Datrix Training Ltd is compliant with the Consumer Protection (Distance Selling) Regulations 2000.<br><br><b>6. Refunds</b><br>In the case where a refund is made to the Customer by Datrix Training Ltd, the refund may take up to 28 days to complete.<br><br><b>7. Re-Scheduling</b><br>A course or exam booking may be rescheduled or transferred to a later date once only. If this is within 30 calendar days of the commencement of the course, a payment of an additional 50% of the course fee will be required.<br><Br>All re-schedules are subject to a minimum fee of £100 + VAT. Datrix Training Ltd will issue a separate invoice for the amount.<br><Br>Subsequent transfers will be treated as cancellation and the full course fee will remain payable. No cancellation is permitted of subsequent courses after the first course has commenced. All re-scheduling requests must be made, in writing, to Customer Services.<br><Br>Courses & Exams booked using Learning Banks, Training Vouchers & Exam Vouchers may be rescheduled once only. If this is within 30 calendar days of the commencement of the course, a payment of an additional 50% of the course fee will be required.<br><br><b>8. Changes to Course Programme</b><br>Datrix Training Ltd reserves the right to alter any part of the published programme; if this is necessitated by circumstances beyond our control. However, we will use reasonable efforts to ensure that the program, if altered, remains comparable with the published format.<br><br><b>9. No – Shows</b><br>Non-attendance of any course for any reason whatsoever is deemed to be a cancellation with no notice and payment is due in full. If a delegate leaves during a course, the full fee remains due.<br><br><b>10. Course Suitability</b><br>The Customer accepts that it is their responsibility that the course booked is suitable for the requirements and abilities of the delegates attending. If a delegate leaves a course part way, the full fee remains due.<br><Br>Datrix Training Ltd's employees may recommend courses or learning solutions, however, the assessment and the final decision concerning suitability of the course is the Customer’s responsibility. In cases where we have made recommendations, we do so in good faith and will not be wilfully misleading.<br><br><b>11. Customer Hosted Events</b>Unless otherwise agreed in writing, the Customer will be responsible for the provision and set – up of equipment for training being conducted on their premises. Datrix Training Ltd reserves the right to cancel or discontinue the course if, in the Trainer’s opinion, the venue, equipment or conditions are unsuitable. The Customer is also responsible for catering and refreshments at Customer hosted events. For additional information contact Customer services. If a Customer’s room setup is unsuitable and the Trainer has no other option than to cancel a course part way, the full fee remains due.<br><br><b>12. Trainer expenses – Customer Hosted events</b><br>Reasonable trainer expenses will be added to invoices for Customer hosted events. These expenses will cover travel, hotel and subsistence. It is the responsibility of the Customer to ensure that the delegate(s) meet the prerequisites of the course(s) on to which they are booked.<br><br><b>13. Liability</b><br>Datrix Training Ltd’s liability for loss and damage shall be limited to a claim for damages. The maximum aggregate liability will be the charges for the course out of which the loss or damage has arisen. Datrix Training will not be liable for indirect, special or consequential loss (including loss of anticipated profit or data), howsoever arising, even if it has been advised of such potential loss. In the event a Customer requests a Datrix Training representative to work on its computer systems, it is the responsibility of the Customer to ensure suitable backups are in place to enable a restore, by the customer if necessary. Datrix Training Ltd will not be responsible for the data restore.<br><Br>Datrix Training Ltd will use its best endeavours to ensure that any software introduced to Customer machines will be free from computer viruses. Datrix Training Ltd will not be liable for any damage resulting from any such computer viruses arising from software installed on Customer computer systems.<br><br><b>14. Force Majeure</b><br>Datrix Training Ltd shall be entitled to delay or cancel delivery or to reduce the amount delivered if it is prevented or delayed in the provision of the agreed contract through any circumstances beyond its reasonable control including Acts of God (including fire, heavy snowfall, flood, earthquake, storm, hurricane or other natural disaster), war, invasion, act of foreign enemies, hostilities (regardless of whether war is declared), civil war, rebellion, revolution, insurrection, military or usurped power or confiscation, terrorist activities, nationalisation, government sanction, blockage, embargo, labour dispute, strike, lockout or interruption or failure of electricity or telephone service. It is the responsibility of the delegates to ensure that they can attend the training courses which they are scheduled to attend. Datrix Training Ltd will not be responsible, financially or actually, for their non-attendance, whatsoever the reason that non-attendance may be. Datrix Training Ltd shall not be liable for any compensation or refunds under this clause.<br><br><b>15. Non Solicitation</b><br>For a period of 12 months following either the invoice date or the date of course delivery, of any contract carried out for the Customer by Datrix Training Ltd or an associate company of Datrix Training Ltd, the Customer, its affiliates of associated companies will not directly nor indirectly employ or solicit for employment any officer or employee of Datrix Training Ltd.<br><Br>If the Customer breaches this clause, Datrix Training Ltd shall be entitled to recover from the Customer a fee of 30% of the gross annual salary of the officer or employee of Datrix Training Ltd solicited for employment.<br><br><b>16. Examinations</b><br>Examination fees are non discountable. We reserve the right to withhold examination results until the relevant invoice(s) have been paid.<br><br><b>17. Referral Scheme</b><br>Datrix Training Ltd operates several referral schemes. To be eligible for a referral incentive, the person you refer to us must be a new customer and not have previously placed an order with Datrix Training. Where an incentive is offered in exchange for a referral, the incentive will be awarded only when the customer has attended their courses and the course fee has been settled."


End Function


'Computer Hire'
Function CfGetComputerHire

CfGetComputerHire = "<p>Datrix Training can deliver almost all of our IT courses at a location of your choice.</p><p>&nbsp;</p><p>If your IT course is to take place using your own computers we can advise on how to set up the courses and by arrangement we can also set up the course for you.</p><p>&nbsp;</p><p>If you don’t have computers then we offer a computer hire service. We will courier the equipment to your site in good time for the course and arrange collection afterwards. The computer will arrive pre installed. We wil of course require a power supply in your nominated room. We can supply laptops, towers, screens, keybordas / mice and and all other equipment.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p><strong>Please note:</strong> Computer hire carries an additional charge. Where we set up your course, this may carry an additional charge. Computer hire is subject to availability, please check before confirming your booking course with us.</p>"


End Function


'Room Hire'
Function CfGetRoomHire

CfGetRoomHire = "<p>Our training rooms are available to hire for your own training courses / meetings / seminars / events.</p><p>&nbsp;</p><p>Where customers wish to deliver their in house courses using their own trainers and materials, we will work with them to ensure their event runs smoothly. We can organise refreshments and course support for you as required.</p><p>&nbsp;</p><p>Bookings are subject to availability.&nbsp;For more information and availability please contact our sales advisers"


End Function


'Cookies'
Function CfGetCookies

CfGetCookies = "<p>Like most modern websites, datrixtraining.com may use cookies. A cookie is a small file on your computer that helps us to improve your online experience. By using our website, we'll assume that you are happy for us to use cookies.</p>"


End Function


'To get  courseType'
Function BlGetCity()

 
   Dim generatorLink(3),i
   Dim valur,svrUrl,Rqsplit
   ' Code for getting URL and splitting and using as per for requrement'	
		svrHttps = request.servervariables("HTTPS")
		svrHost = request.servervariables("HTTP_HOST")
		svrUrl = request.servervariables("URL")
		
		RqRetriveURLCount = Split(svrUrl,"/")
		rqCount = 0
		for i = 0 to  UBound(RqRetriveURLCount)
		
		rqCount = rqCount + 1
		
		NEXT
		
		RetriveURL = Split(svrUrl,"/",int(rqCount))
 
 
 'response.Write(RetriveURL(2))

If RetriveURL(1) = "popular-courses" Then

 Rqsplit = Split(RetriveURL(2),"-",int(rqCount))
 cityName = Split(Rqsplit(2),".",int(rqCount))
 BlGetCity = cityName(0)
'response.Write(BlGetCity)


	'	If int(rqCount)  = 3 Then
'		Rqsplit = Split(svrUrl,"/",3)
'		Else
'		Rqsplit = Split(svrUrl,"/",4)
'		RqName = Rqsplit(3)
'		End If 
'		
'		'response.Write(svrUrl)
'		
'		If Rqsplit(2) = "prince2-training-Manchester.asp" Then
'		
'		BlGetCity = "Manchester"
'		
'		ElseIf Rqsplit(2) = "prince2-training-Leeds.asp" Then
'		
'		BlGetCity = "Leeds"
'		
'		ElseIf Rqsplit(2) = "prince2-training-London.asp" Then
'		
'		BlGetCity = "London"
'		
'		ElseIf Rqsplit(2) = "prince2-training-Sheffield.asp" Then
'		
'		BlGetCity = "Sheffield"
'		
'		ElseIf Rqsplit(2) = "prince2-training-Bristol.asp" Then
'		
'		BlGetCity = "Bristol"
'		
'		ElseIf Rqsplit(2) = "prince2-training-Liverpool.asp" Then
'		
'		BlGetCity = "Liverpool"
'		
'		ElseIf Rqsplit(2) = "prince2-training-Glasgow.asp" Then
'		
'		BlGetCity = "Glasgow"
'		
'		ElseIf Rqsplit(2) = "prince2-training-Birmingham.asp" Then
'		
'		BlGetCity = "Birmingham"
'		
'		End If
		
		
ElseIf RetriveURL(1) = "venue" Then

cityName = Split(RetriveURL(2),".",int(rqCount))
BlGetCity = cityName(0)
'response.Write(BlGetCity)

ElseIf RetriveURL(1) = "training" Or RetriveURL(1) = "course"  Then

If RetriveURL(1) = "course" Then

cityName = Split(RetriveURL(2),".",int(rqCount))

ElseIf RetriveURL(1) = "training" then

cityName = Split(RetriveURL(3),".",int(rqCount))

End IF

BlGetCourseType = cityName(0)
Session("CourseType")=BlGetCourseType




If Session("CourseType") = "prince-2" then

Session("CourseType") = "PRINCE2"

ElseIf Session("CourseType") = "project-management-project-and-programme-management" Then

Session("CourseType") = "Project Management"

ElseIf Session("CourseType") = "tailored-project-management" Then

Session("CourseType") = "Tailored Project Management"

ElseIf Session("CourseType") = "msp" Then

Session("CourseType") = "MSP"

ElseIf Session("CourseType") = "mop" Then

Session("CourseType") = "mop"

ElseIf Session("CourseType") = "lean-six-sigma" Then

Session("CourseType") = "Lean Six Sigma"

ElseIf Session("CourseType") = "business-analysis-training-best-practice" Then

Session("CourseType") = "Business Analysis"

ElseIf Session("CourseType") = "itil-service-management" Then

Session("CourseType") = "ITIL Service Management"

ElseIf Session("CourseType") = "sales-skills" Then

Session("CourseType") = "Sales Skills"

ElseIf Session("CourseType") = "performance-skills" Then

Session("CourseType") = "Performance Skills"

ElseIf Session("CourseType") = "microsoft-office-2010" Then

Session("CourseType") = "Microsoft Office 2010"

ElseIf Session("CourseType") = "microsoft-office-2007" Then

Session("CourseType") = "Microsoft Office 2007"

ElseIf Session("CourseType") = "microsoft-sharepoint-services-end-user" Then

Session("CourseType") = "Microsoft SharePoint"

ElseIf Session("CourseType") = "crystal-reports" Then

Session("CourseType") = "Crystal Reports"

ElseIf Session("CourseType") = "adobe" Then

Session("CourseType") = "Adobe"

ElseIf Session("CourseType") = "prince2-elearning" Then

Session("CourseType") = "PRINCE2 E Learning"

ElseIf Session("CourseType") = "microsoft-office-collections" Then

Session("CourseType") = "Microsoft Office Collections"

ElseIf Session("CourseType") = "microsoft-technical-collections" Then

Session("CourseType") = "Microsoft Technical Collections"

ElseIf Session("CourseType") = "windows-server-2012" Then

Session("CourseType") = "Microsoft Windows Server 2012"

ElseIf Session("CourseType") = "microsoft-windows-server-2008" Then

Session("CourseType") = "Microsoft Windows Server 2008"

ElseIf Session("CourseType") = "microsoft-windows-8" Then

Session("CourseType") = "Microsoft Windows 8"

ElseIf Session("CourseType") = "microsoft-windows-7" Then

Session("CourseType") = "Microsoft Windows 7"

ElseIf Session("CourseType") = "microsoft-dynamics" Then

Session("CourseType") = "Microsoft Dynamics"

ElseIf Session("CourseType") = "microsoft-virtualization" Then

Session("CourseType") = "Microsoft Virtualization"

ElseIf Session("CourseType") = "microsoft-exchange-server" Then

Session("CourseType") = "Microsoft Exchange Server"

ElseIf Session("CourseType") = "microsoft-sharepoint" Then

Session("CourseType") = "Microsoft SharePoint"

ElseIf Session("CourseType") = "microsoft-sql-server" Then

Session("CourseType") = "Microsoft SQL Server"

ElseIf Session("CourseType") = "comptia" Then

Session("CourseType") = "CompTIA"

ElseIf Session("CourseType") = "citrix" Then

Session("CourseType") = "Citrix"

ElseIf Session("CourseType") = "vmware" Then

Session("CourseType") = "VMware"

ElseIf Session("CourseType") = "oracle-database" Then

Session("CourseType") = "Oracle Database"

ElseIf Session("CourseType") = "oracle-e-business-suite-r12" Then

Session("CourseType") = "Oracle e-Business Suite R12"

ElseIf Session("CourseType") = "cisco" Then

Session("CourseType") = "Cisco"

ElseIf Session("CourseType") = "linux" Then

Session("CourseType") = "Linux"

ElseIf Session("CourseType") = "hp-ux" Then

Session("CourseType") = "HP-UX"

ElseIf Session("CourseType") = "java-web-development" Then

Session("CourseType") = "Java and Web Development"

ElseIf Session("CourseType") = "my-sql-php" Then

Session("CourseType") = "My SQL and PHP Courses"

ElseIf Session("CourseType") = "unix" Then

Session("CourseType") = "UNIX"

ElseIf Session("CourseType") = "agile-foundation-and-practitioner" Then

Session("CourseType") = "AGILE"


Else

Session("CourseType") = Session("CourseType")

End If

'response.Write(Session("CourseType"))

End If


 

End Function 




'Cities pages'
Function CfGetCities

CfGetCities = "<div class=""logo_map_cont""><div class=""coruse_images""><img alt=""PRINCE2 Training Courses - Accredited by APM Group"" src=""/images/buttons/prince_logo.jpg""></div><div class=""venue_images""><img src=""/images/buttons/Arthur_House-150x150.jpg"" alt=""></div><div class=""map_cont""><div class=""the_big_map"" id=""the_map"" style=""width:200px""></div></div></div><div class=""feature_box""><ul style=""font-size:13px;"" class=""landingUL""><li><strong>10 years</strong> of <strong>PRINCE2® training</strong> course delivery <strong>across</strong> the <strong>UK</strong> and Europe .</li><li><strong>92%</strong> of Datrix Training <strong>customers re-book</strong> with us .</li><li><strong>1 hour quote guarantee</strong> .</li><li>Our <strong>class sizes</strong> are <strong>40% smaller</strong> than the national average to  give you a <strong>better learning experience</strong>. </li><li>Only <strong>high quality venues</strong> in <strong>accessible locations</strong> to enhance  your learning experience. </li><li><strong>Excellent</strong> PRINCE2<sup>&reg;</sup> Training <strong>pass rates</strong> in <strong>Manchester</strong>. </li><li>Full time employed instructors with <strong>industry topping pass rates </strong>.</li><li><strong>Lunch</strong> and <strong>refreshments included in</strong> the <strong>price</strong> of your course. </li><li><strong>Exam(s)</strong> and <strong>Official Course manual included</strong> in the price of your course. </li><li><strong>Best price guarantee</strong> on like-for-like training. </li></ul></div></div><div class=""tab-bottom""></div><div class=""note_quote""><p>For more details on any of these points, please ask our sales advisers for details.</p><p class=""quote"">Enquire for 1 Hour quote or call us at <br>  <strong>0161 714 2244</strong> now!</p></div><div class=""entry venue thirdlevel""><h3>PRINCE2®  Combined Foundation &amp; Practitioner </h3>"


End Function

'====================  Newly added function ==================================================================='

 

Function CfLiveCourses()


CfLiveCourses = "<p>Ever wondered if you can get PRINCE2<sup>&reg;</sup> or ITIL<sup>&reg;</sup> certified without even stepping out of your house? How you can save time and money by avoiding the daily commute and beat the stress by getting trained in the comfort of your own home?</p><p><br>Andy had the same questions - check out the video to see how Datrix’s Live Class was the perfect answer for him!</p><p><a href=""http://www.youtube.com/user/datrixtraining?feature=watch"" target=""_blank"" style=""padding-left:10px;""><img src=""/images/buttons/datrix-youtube.jpg"" alt=""Datrix's Official Youtube Channel"" border=""0""></a></p><p>Datrix's Live Class brings together the best of both classroom training and online training. You get trained and certified in the same time as a regular classroom course, but from the comfort and convenience of your home or office. <br><br> <b>Key Benefits</b></p><ol type=""1""><li>PRINCE2 training in just 5 days and ITIL training in just 2 days from the comfort of your home. </li><li>Take the exams online at your home - no need to travel to an exam centre.</li><li>Real-time live training from global, experienced, APMG certified faculty.</li><li>Industry leading pass rates - for classroom and live classes.</li><li>5.	Free Foundation Exam Retake - a first in the industry. </li><li>Direct interaction with faculty and fellow delegates - just like in a classroom!</li><li>All study materials, including a free headset, delivered right to your doorstep .</li><li>Choose your own exam dates.</li><li>Free re-scheduling.</li></ol></p><p><img src=""/images/buttons/Datrix-Methodology.png""  border=""0""></p>"




End Function 


'Table Prince2'
Function CfGetTableLive()

'Calling BlGetCity func'
BlGetCity




CfGetTableLive = "<table class=""product-details""><tr><th style=""width: 320px;"">Course </th><th style=""width: 220px;"">Dates</th><th style=""width: 100px;""></th></tr>"




Dim  strGetCourses,Rs,rqDays
DIm rqCourseid,rqCourseName
DIm rqCourse,strGetCerfitionType



Set Rs = server.CreateObject("ADODB.Recordset")
Set Rs1 = server.CreateObject("ADODB.Recordset")








strGetCourses = "Select * from datrixClasses where vendorId  = '1' AND country = 'United Kingdom' AND coursetype = 'Live' AND certificateId = '1'"



'response.Write(strGetCourses)
Rs.open strGetCourses,ConnObj

Do until Rs.EOF
					
	'rqCourseid = Rs("courseid")
	
	rqCourse =  trim(Rs("courseName"))
	rqRefNumber = Rs("RefNumber")
	rqDays = Rs("duration")
	rqStart = Rs("startdate")
	rqEnd = Rs("enddate")
	

'response.Write(rqCourse)

'For page name'

rqRemoveReg = Replace(trim(rqCourse),"&reg;", "") 
'response.Write(rqRemoveReg)

rqRemoveand = Replace(rqRemoveReg,"&", "and") 
'response.Write(rqRemoveand)

rqCoursePagename = Replace(trim(rqRemoveand)," ", "-") 
'response.Write(rqCoursePagename)



CfGetTableLive =  CfGetTableLive & "<tr><td><a style=""text-decoration: underline;"" href=""/course/"&rqCoursePagename&".asp?courseid="&rqRefNumber&""">"&rqCourse&"</a></td><td>"&DAY(rqStart) & " - " & MonthName(Month(rqStart),3) & " - "& DAY(rqEnd) & "</td><td><a href=""/one-hour-quote.asp?courseid="&rqRefNumber&""" class=""button"">enquire</a></td></tr>"





Rs.Movenext
loop

CfGetTableLive =  CfGetTableLive & "</table>"


End Function 




'Live couses Home page box'

Function CfGetLivecourseBox()

CfGetLivecourseBox = "<div class=""home-box"" style=""margin-right: 13px;""><h3>Datrix Live Class</h3><p style=""line-height: 18px;""><a href=""http://www.youtube.com/watch?v=Jjl9qMVexhk"" target=""_blank"" style=""padding-left:10px;""><img src=""http://projstudy.com/images/buttons/datrix-youtube.jpg"" alt=""Datrix's Official Youtube Channel"" border=""0""></a></p><a href=""/training/courses/liveclass.asp"" class=""link"" style=""position: absolute; bottom: 12px; left: 15px;"">Learn More</a></div>"

End Function  


'ContactformBox'

Function CfGetContactformBox()

CfGetContactformBox = "<div class=""home-box deal-of-the-week"" style=""margin-right: 13px; margin-top:20px;""><h3>Customer Support</h3><p style=""line-height: 15px; ""><img src=""/images/buttons/Customer-Support.jpg"" style=""float: right; width:150px; height:150px;"" />At Datrix, we strive to have only one kind of customers – happy ones. So if you have a query, just call us at <b>0800 781 0626</b> and we will get right back to you.</p><a href=""/customer-support.asp"" class=""link"" style=""position: absolute; bottom: 12px; left: 15px;"">See More</a></div>"

End Function  


'Faculty Scrolling Box '

Function CfGetFacultyScrollingBox()

CfGetFacultyScrollingBox = "<div class=""home-box deal-of-the-week"" style=""margin-top:20px;""><h3>Instructor Profiles</h3><table><tr><td width=""50%"">The success of any training class greatly depends on the proficiency of the instructor.We owe our high success and consistently great student feedback to the quality of our instructors. All our instructors are experts in the field they teach with an average work experience of 15+ years in areas like Information Technology, Construction, Government, Healthcare, Manufacturing etc. </td></tr></table> <a href=""/faculty.asp"" class=""link"" style=""position: absolute; bottom: 12px; left: 15px;"">See More</a></div>"

End Function   


'Faculty page with images'

Function CfFaculty()

CfFaculty = "<p>The success of any training class greatly depends on the proficiency of the instructor. We owe our high success and consistently great student feedback to the quality of our instructors. All our instructors are experts in the field they teach with an average work experience of 15+ years in areas like Information Technology, Construction, Government, Healthcare, Manufacturing etc. Their practical examples and real life personal experiences make it easier for students to understand and appreciate complex project management concepts.</p><p>Before teaching any Datrix class, each instructor goes through a rigorous ""Train the Trainer"" program about adult learning techniques required to make their classes interesting, enjoyable and enriching. An average Datrix faculty has more than 500 hours of experience in successfully delivering our boot camps.</p><p>We would like you to go through the profiles of our faculty - and you will agree with us that no other training provider has the quality of faculty as we do.</p><p><table width=""97%"" border=""0"" cellspacing=""0"" cellpadding=""5""><tr><td colspan = ""2""><hr style=""border:1px solid #CCCCCC;""></td></tr><tr><td colspan=""2""><b>Bilkis Saibudeen<br>MCT, CCI, MCSE, CCNA, CompTia A+, Network+, MCDBA, MCDST<br><br></b></td></tr><tr><td><p><img src=""/images/faculty/image001.jpg"" width=""125px"" height=""145px"" border=""0""></p></td><td style=""vertical-align: middle; padding-left: 20px;""><p align=""justify"">A result-driven IT professional with extensive experience in the engineering, administration support and training of Information systems, Bilkis is a Microsoft Certified Trainer and Citrix Certified Instructor who is a highly skilled, astute, knowledgeable, qualified and experienced individual with a solid background in information technology.<br><br>Bilkis is an effective communicator and motivator with a track record of achievement in consulting and managing projects successfully and efficiently based on a thorough understanding of IT technologies, processes and strategies. Bilkis  a proven record of accomplishment in working with clients from various sectors, including military, corporate, financial, sales and the public sector.</p></td></tr><tr><td colspan = ""2""><hr style=""border:1px solid #CCCCCC;""></td></tr><tr><td colspan=""2""><b>Mark Eaton<br> MCSE, Approved PRINCE2<sup>&reg;</sup> Trainer, MCT, CCEA,<br><br></b></td></tr><tr><td><p><img src=""/images/faculty/image002.jpg"" width=""125px"" height=""145px"" border=""0""></p></td><td style=""vertical-align: middle; padding-left: 20px;""><p align=""justify"">Mark  has been involved in IT domain providing training for over 16 years . His main areas of expertise include PRINCE2,Microsoft Office, Office SharePoint Server and MIcrosoft Windows technologies. Mark also delivers courses in Citrix, TCP/IP, VoIP, Security, Crystal Reports, Microsoft Project – and many others. <br><br>Clients for whom he has delivered training include HSBC, The Law Society, Norwich Union, Nomura Bank, WestPac Bank and Inmarsat, as well as public bodies such as Kent County Council, Surrey County Council, The American Embassy and GCHQ<br><br>Mark's professional qualifications include Microsoft's Certified Systems Engineer, Office User Specialist, and Certified Trainer; a Certificate of Education in Adult Education and Training and PRINCE2 Practitioner and Authorised Trainer.</p></td></tr><tr><td colspan = ""2""><hr style=""border:1px solid #CCCCCC;""></td></tr><tr><td colspan=""2""><b>Paul Williams<br>ITIL Foundation, CompTia A+, CompTia N+, PRINCE2<sup>&reg;</sup> Trainer, Network Essentials<br><br></b></td></tr><tr><td><p><img src=""/images/faculty/image20.jpg"" width=""125px"" height=""145px"" border=""0""></p></td><td style=""vertical-align: middle; padding-left: 20px;""><p align=""justify"">Paul has 15+ years of experience training delegates in various IT certifications. His background encompasses the Real Estate, Software and Training Industries. Paul has experience training in certifications like CompTiaA+, CompTiaN+, ITIL, PRINCE2 and various Microsoft Certifications.<br><br>Paul graduated from Preistly College, Warrington with a Diploma in Information Technology.</p></td></tr><tr><td colspan = ""2""><hr style=""border:1px solid #CCCCCC;""></td></tr><tr><td colspan=""2""><b>Tony Cotgrave<br>PRINCE2 Accredited Trainer, Agile Accredited Trainer, MSP Practitioner, MCSE, MCSA, MCT<br><br></b></td></tr><tr><td><p><img src=""/images/faculty/image21.jpg"" width=""125px"" height=""145px"" border=""0""></p></td><td style=""vertical-align: middle; padding-left: 20px;""><p align=""justify"">Tony has over 18 years of experience working across Manufacturing, IT, Automotive and Education industries. Tony has an extensive Project Management experience and has served as a Director in an IT firm leading a sizeable team.<br><br>Tony has experience in training delegates for certifications like Agile, PRINCE2, MSP, MCSE, MCSA etc. Tony is a proven success in managing and developing teams and has successfully directed complex projects from concept stage to making them fully operational.<br><br>Tony holds a BTEC National Diploma in Construction besides holding certifications in AutoCAD Basic and 3D.</p></td></tr><tr><td colspan = ""2""><hr style=""border:1px solid #CCCCCC;""></td></tr><tr><td colspan=""2""><b>Barbara Siefken<br>PMP, ITIL, CSM, MS<br><br></b></td></tr><tr><td><p><img src=""/images/faculty/image003.jpg"" width=""125px"" height=""145px"" border=""0""></p></td><td style=""vertical-align: middle; padding-left: 20px;""><p align=""justify"">For the last 20 years, Barbara has applied her software and project management skills in product development, quality assurance, and sales. She holds a Bachelor’s degree in Computer Science from Stony Brook University and a Master's in Computer Science from NYU-Poly. She is a certified Math 7-12 teacher, and has spent a year as a visiting professor on loan to Southern University. Projects at Texaco, Bell Laboratories, and Tektronix ranged from designing the STI graphics system to leading the QA program for the TDS oscilloscope project. More recently, she has helped a handful of startups to introduce new products and expand their markets. Barbara enjoys collaborating and is an active member of the Portland Chapter of PMI<sup>&reg;</sup> and the Lake Oswego ARES emergency communications team. Other training pursuits include the Entrepreneurial Edge, Dale Carnegie, and Miller Heiman.</p></td></tr><tr><td colspan = ""2""><hr style=""border:1px solid #CCCCCC;""></td></tr><tr><td colspan=""2""><b>Buddy Peacock<br>PMP, CSM<br><br></b></td></tr><tr><td><p><img src=""/images/faculty/image006.jpg"" width=""125px"" height=""145px"" border=""0""></p></td><td style=""vertical-align: middle; padding-left: 20px;""><p align=""justify"">Buddy is a multifaceted senior Information Technology professional with over 30 years of experience in the industry. Having been an MIS Director for an eye wear manufacturing company as well as founding and having a hands-on leadership role in an application software development firm, Buddy’s experience in managing software development projects covers a broad spectrum of the methodologies that exist in that arena. His confident ""face of technology"" clearly communicates technology value propositions to senior internal and external stakeholders. He is a customer focused leader who ensures industry-leading levels of customer satisfaction and is a highly motivational team builder, coach, and mentor who forges top-performing, committed and organized personnel, with superior retention rates.</p></td></tr><tr><td colspan = ""2""><hr style=""border:1px solid #CCCCCC;""></td></tr><tr><td colspan=""2""><b>Colin McInnes<br>PMP<br><br></b></td></tr><tr><td><p><img src=""/images/faculty/image007.jpg"" width=""125px"" height=""145px"" border=""0""></p></td><td style=""vertical-align: middle; padding-left: 20px;""><p align=""justify"">Colin is a certified Project Management Professional with over 15 years’ rich experience in project management. Mr. McInnes has worked on a wide variety of multi-million dollar projects and programs in the defense and telecommunications sectors. Although Colin has successfully executed in all project phases, he is particularly adept at front end project activities including proposal preparation, project planning, and assembling and establishing highly effective teams. He holds a B.Sc. in Electrical Engineering from Queen's University.</p></td></tr><tr><td colspan = ""2""><hr style=""border:1px solid #CCCCCC;""></td></tr><tr><td colspan=""2""><b>Elizabeth Lynne Warren<br>BBA, PMP, ITIL Expert<br><br></b></td></tr><tr><td><p><img src=""/images/faculty/image009.jpg"" width=""125px"" height=""145px"" border=""0""></p></td><td style=""vertical-align: middle; padding-left: 20px;""><p align=""justify"">Lynne has extensive experience coming from management and project related positions in a variety of industries which include: public utilities, technology, landscaping, residential construction, magazine publishing, and finally independent consulting. She is highly skilled in employee management, career planning, and development. Her strength and proficiency were demonstrated in playing a key role on major projects including assembling and leading effective teams. She has enhanced her knowledge by doing professional development courses such as Chamber of Commerce Leadership Program, Facilitative Leadership, Psychology of Supervision, Intervention Skills, Team Problem Solving, Technical Writing, and Distribution Field Engineering Training Program. She has gained her Bachelor’s in Business Administration from the American InterContinental University and is a certified Project Management Professional (PMP).</p></td></tr><tr><td colspan = ""2""><hr style=""border:1px solid #CCCCCC;""></td></tr><tr><td colspan=""2""><b>Jaimie M. Rush<br>MBA, PMP, ITIL<br><br></b></td></tr><tr><td><p><img src=""/images/faculty/image011.jpg"" width=""125px"" height=""145px"" border=""0""></p></td><td style=""vertical-align: middle; padding-left: 20px;""><p align=""justify"">Jaimie M. Rush is a dynamic executive and certified project leader (PMP<sup>&reg;</sup>) with over 15 years of service in the field of project management and holds an MBA degree from Brigham Young University. Jaimie's work experience includes organizing, prioritizing, planning and executing a diverse range of high-visibility, high-risk, multi-million dollar initiatives in the areas of product launch/development, product redesign, system implementations, corporate/sales events, and process/operational improvements. Strong project leader with focus on project management principles, guidelines and methodology. She currently holds the position of Director, Project Management at the Los Angeles Times Media Group and is also a part-time Business Instructor for University of La Verne and University of Redlands.</p></td></tr><tr><td colspan = ""2""><hr style=""border:1px solid #CCCCCC;""></td></tr><tr><td colspan=""2""><b>Rebecca Zuckerman<br>Ph.D., PMP<br><br></b></td></tr><tr><td><p><img src=""/images/faculty/image013.png"" width=""125px"" height=""145px"" border=""0""></p></td><td style=""vertical-align: middle; padding-left: 20px;""><p align=""justify"">Rebecca Zuckerman Ph.D., PMP has over 20 years experience working in the chemical industry. She is a trained Medicinal Chemist and Project Manager in the field of oncology. Rebecca has interfaced between several scientific disciplines and knows the importance of utilizing effective project management tools and techniques. She is a strong mentor and motivator of teams and has a keen interest in how people learn best. Rebecca is now an educational trainer on an overview of the brain and accelerated learning techniques. Rebecca holds a Ph.D. in Chemistry from the University of California at Berkeley and certifications in Clinical Trial Management and Project Management from San Francisco State University, Extended Learning.</p></td></tr><tr><td colspan = ""2""><hr style=""border:1px solid #CCCCCC;""></td></tr><tr><td colspan=""2""><b>Sandra A Strech<br>MPA, CCTM, PMP<br><br></b></td></tr><tr><td><p><img src=""/images/faculty/image014.jpg"" width=""125px"" height=""145px"" border=""0""></p></td><td style=""vertical-align: middle; padding-left: 20px;""><p align=""justify"">Sandra Strech has 15 years of experience in the field of project management. She has developed federal and local government programs in health, human services and education. She developed an award winning HIV Care Act program for the State of Illinois and wrote a Master's degree program for Southern Illinois University. She created the Office of Institutional Research and Reports for Kishwaukee College. In San Diego, she developed a Department of Education program for the San Diego State University Foundation before working with the County of San Diego. She served as a Contract Manager developing a transportation program for senior citizens and working with technology services to improve IT systems there. Later she developed a Process Management Program for the Health and Human Services Agency, creating and providing trainings including a 'Project Management Boot Camp. Sandra holds a Master’s degree in Public Administration with majors in Program Evaluation and Human Resources Management and a Bachelor's degree in Psychology. In addition to her PMP, Sandra is a Certified Community Transit Manager.</p></td></tr><tr><td colspan = ""2""><hr style=""border:1px solid #CCCCCC;""></td></tr><tr><td colspan=""2""><b>Jack Ferguson<br>SSGB, SSBB, SMC, AEC<br><br></b></td></tr><tr><td><p><img src=""/images/faculty/image016.jpg"" width=""125px"" height=""145px"" border=""0""></p></td><td style=""vertical-align: middle; padding-left: 20px;""><p align=""justify"">Jack has been CEO of two sales and manufacturing businesses over the past 22 years. He has also served as a controller and CFO. Jack has worked in the aviation, electronic, injection molding, and music industries. Most recently he has been in the commercial aircraft and turbine engine market. Manufacturing and remanufacturing turbine engines requires strict attention to detail; Quality, Schedule, budgets and communication to all stakeholders must be coordinated. He has practiced project management methodology throughout his carrier, and understands the value of having a consistent methodology to keep focused on details.</p></td></tr><tr><td colspan = ""2""><hr style=""border:1px solid #CCCCCC;""></td></tr><tr><td colspan=""2""><b>Dale Thornhill<br>ITIL, PMP, SMC, AEC<br><br></b></td></tr><tr><td><p><img src=""/images/faculty/image018.jpg"" width=""125px"" height=""145px"" border=""0""></p></td><td style=""vertical-align: middle; padding-left: 20px;""><p align=""justify"">Dale is a dynamic certified ITIL, PMP, Environmental Safety & Compliance Officer with 14 years of Global Program & Project Management Delivery Leadership with 8 years Naval Reserve service. Dale is a Certified SCRUMstudy Trainer for Scrum (SMC-T) & Agile (AEC-T) he holds several industry certifications & degrees, MBA in Global Management University of Phoenix, M.A. Project Management George Washington University & B.A. in Mass Communications North Carolina State.Experienced in mentoring, training, managing & deploying successful large scale complex IT programs & projects across industries like Health Care, Telecom, Banking, Retail, Automotive, Aviation, and State & Federal Government IT.</p></td></tr><tr><td colspan = ""2""><hr style=""border:1px solid #CCCCCC;""></td></tr><tr><td colspan=""2""><b>Ruth Kim<br>PMP, ITIL, SMC, AEC, SSGB<br><br></b></td></tr><tr><td><p><img src=""/images/faculty/image020.jpg"" width=""125px"" height=""145px"" border=""0""></p></td><td style=""vertical-align: middle; padding-left: 20px;""><p align=""justify"">Having more than 10 years of experience in the field of project management across multiple industries, Ruth has expertise in training, consulting, and project management methodology implementation. She is currently a managing partner for a software company. Being a good practitioner and having a passion for project management, she has established and enforced PM standards for her project managers in her software consulting organization, and the organizations she worked for previously (including General Motors and Adexa). Ruth has completed her Bachelor’s degree in Mechanical Engineering and has a Master’s degree from Stanford University with concentrated studies in Organizational Behavior Management and Team Based Design.</p></td></tr></table></p> "



End Function


'Coustomer Support'


Function CfcoustomerSupport()

CfcoustomerSupport = "<p>At Datrix, we strive to have only one kind of customers – happy ones. Most of our customers have such a great experience that they don’t even need to contact customer support. And on the odd occasion when they do, we put in all our efforts to ensure that their query is resolved right away. So if you are a Datrix customer and have a query, just call us at <b>0800 781 0626</b> or fill up the form below and we will get right back to you.<br><br></p><div><table width=""50%""  cellpadding =""5"" cellspacing=""5""><tr><td>Your Name: </td><td><input type=""text"" name = ""name""></td></tr><tr><td>Name of company: </td><td><input type=""text"" name = ""Companyname""></td></tr><tr><td>Contact Number: </td><td><input type=""text"" name = ""ContactNum""></td></tr><tr><td>Query: </td><td><textarea name=""query"" id=""query"" rows=""5""></textarea></td></tr><tr><td>&nbsp;</td><td><input type=""submit"" name=""submit"" value=""Submit""></td></tr></table></div>"



End Function



'StaticCoursesWhatYouWillLearn'


Function CfGetStaticCoursesWhatYouWillLearn

Set Rs = server.CreateObject("ADODB.Recordset")

rqCourseId       =     request.QueryString("courseid")


strGetCourses = "Select * from datrixCourse where RefNumber  = '"&rqCourseId&"' and vendorId = '2'"
Rs.Open strGetCourses,ConnObj

If Not Rs.EOF Then

Whatyoulearn = Rs("Whatyoulearn")


End IF



CfGetStaticCoursesWhatYouWillLearn = ""& Whatyoulearn &""





End Function


'CoursesAudienceProfile'

Function CfGetStaticCoursesAudienceProfile

Set Rs = server.CreateObject("ADODB.Recordset")

rqCourseId       =     request.QueryString("courseid")


strGetCourses = "Select * from datrixCourse where RefNumber  = '"&rqCourseId&"' and vendorId = '2'"

Rs.Open strGetCourses,ConnObj

If Not Rs.EOF Then

AudienceProfile = Rs("AudienceProfile")


End IF


CfGetStaticCoursesAudienceProfile = ""& AudienceProfile &""

End Function

'CoursesPrerequisites'

Function CfGetStaticCoursesPrerequisites

Set Rs = server.CreateObject("ADODB.Recordset")

rqCourseId       =     request.QueryString("courseid")


strGetCourses = "Select * from datrixCourse where RefNumber  = '"&rqCourseId&"' and vendorId = '2'"

Rs.Open strGetCourses,ConnObj

If Not Rs.EOF Then

Prerequisites = Rs("Prerequisites")


End IF


CfGetStaticCoursesPrerequisites = ""& Prerequisites &""

End Function


'StaticCoursesOutline'


Function CfGetStaticCoursesOutline

Set Rs = server.CreateObject("ADODB.Recordset")

rqCourseId       =     request.QueryString("courseid")


strGetCourses = "Select * from datrixCourse where RefNumber  = '"&rqCourseId&"' and vendorId = '2'"

Rs.Open strGetCourses,ConnObj

If Not Rs.EOF Then

Outline = Rs("Outline")


End IF



CfGetStaticCoursesOutline = ""& Outline &""





End Function



'*************** End Of Newly added functions *****************************************************************'


Function CfCfGetTableDates()

CfCfGetTableDates = BlGetCourseDetails

End Function

'===================================================================Business logic=================================================================================='


'To get course Name'
Function BlGetCourseDetails()

'Calling BlGetCity func to get coursetype'
BlGetCity

Dim strGetCourses,Rs1,rqDays
DIm rqCourseid,rqCourseName
DIm rqCourse,rqLateAvailability
Dim myArray(5),i,rqRefNO

Set Rs1 = server.CreateObject("ADODB.Recordset")
Set Rs3 = server.CreateObject("ADODB.Recordset")


If request.form("courseid") <> "" then

rqCourseId       =     request.form("courseid")
'response.Write(rqCourseId)
Else

Session("CourseType")  = Session("CourseType") 

End IF



If request.form("courseid") <> "" then

strGetCourses = "Select * from datrixClasses where RefNumber = '"&rqCourseId&"' and vendorId  = '2' and startdate >'"& now()&"' order by classdate"

Else

If Session("CourseType") <> "" then

strGetCerfitionType = "Select * from Certification where CertName  = '"&Session("CourseType")&"' and Ven_ID = '2'"
'response.Write(strGetCerfitionType)
Rs3.open strGetCerfitionType,ConnObj

rqCer_ID = Rs3("Cer_ID")

strGetCourses = "Select * from datrixClasses where certificateId = '"&rqCer_ID&"' and vendorId  = '2' and startdate >'"& now()&"' order by classdate"

End If


End If

'response.Write(strGetCourses)

Rs1.open strGetCourses,ConnObj


BlGetCourseDetails = "<table width=""100%""><tr class=""header dottedrow""><th width=""50%"">Locations</th><th width=""30%"">Dates</th><th width=""20%""></th></tr>"

If Rs1.EOF Then
           
BlGetCourseDetails =  BlGetCourseDetails & "<form name=""seeDates"" id =""seeDates""  action=""/one-hour-quote.asp"" method = ""post""><input type=""hidden"" name=""courseid"" value = "&rqCourseId&"></form>"		   
		   
		   
BlGetCourseDetails = BlGetCourseDetails& "<tr><td colspan = ""4"" align=""center"">There are no dates scheduled for this event at present.</td></tr><tr><td colspan = ""4"" align=""center""><a href=""javascript:document.getElementById('seeDates').submit()"" class=""link"">Please contact us for details on how we can deliver this course for you</a></td></tr>"
 
 
Else

Do until Rs1.EOF
					
	rqCourse = trim(Rs1("courseName"))
	rqStartDate = Rs1("startdate")
	rqEndDate = Rs1("enddate")
	rqCity = Rs1("city")
	rqhotelname = Rs1("hotelname")
	rqhotelphonenumber = Rs1("hotelphonenumber")
	rqhoteladdress = Rs1("hoteladdress")
	rqcountry = Rs1("country")
	rqDays = Rs1("duration")
	rqRefNO  = Rs1("RefNumber")
	
	'Response.Write(formatdatetime(cdate(rqStartDate)))
	

If datevalue(rqStartDate) >= datevalue(now() + 5 ) AND datevalue(rqStartDate) <= datevalue((now() + 30))  then 
rqLateAvailability = "<span class=""highlight"">- Late Availability!</span>"
End If

myArray(0)  = ""&rqCourseId&""
myArray(1)  = ""&rqCourse&""
myArray(2)  = ""&rqStartDate&" to "&rqEndDate&""

If rqLateAvailability <> "" then

myArray(3)  = ""&rqCity&""

If rqhotelname <> ""  Then
myArray(3)  =  myArray(3) & "("&rqhotelname&")" 
End If

myArray(3)  =  myArray(3) & "("&rqDays&")"&rqLateAvailability


Else

myArray(3)  = ""&rqCity&"" 

If rqhotelname <> ""  Then
myArray(3)  =  myArray(3) & "("&rqhotelname&")" 
End If

myArray(3)  =  myArray(3) & "("&rqDays&")"

End if

myArray(4) = ""&rqCity&""

myArray(5) = ""&rqRefNO&""




BlGetCourseDetails =  BlGetCourseDetails & "<form name=""courseEnquire"" id =""courseEnquire""  action=""/one-hour-quote.asp"" method = ""post""><input type=""hidden"" name=""courseid"" value = "&myArray(5)&"></form>"		   


BlGetCourseDetails = BlGetCourseDetails& "<tr class=""dottedrow""><td valign=""top""><a href=""/venue/"&myArray(4)&".asp"">"&myArray(3)&"</td><td valign=""top"">"&myArray(2)&"</td><td><a href=""javascript:document.getElementById('courseEnquire').submit()"" class=""button"">enquire</a></td></tr>"

               
Rs1.Movenext
loop

End If

BlGetCourseDetails = BlGetCourseDetails& "</table>"
     	'Response.Write(BlGetCourseDetails)

End Function 


'Venue info'
Function BlGetVenue()

'calling BlGetCity func'
BlGetCity
		
						 Dim strQuery,Rs,arrAllQueries
                         Dim firstRow,lastRow,numRows,rowcounter


 						Set Rs  = Server.CreateObject("ADODB.Recordset")


				strQuery = "select id, location, imageName, locationaddress, country, hotelName,Region,phoneNo,Postcode,GooglemapURL from proj_locations where location = '"&BlGetCity&"'  and vendorId = '2'  order by location"
				
						  Rs.Open strQuery,ConnObj


                         Do until Rs.EOF
   

BlGetVenue = "<ul class=""tabs""><li class=""on"" onclick=""jQuery('.tabs li').removeClass('on'); jQuery(this).addClass('on'); jQuery('.tab').hide(); jQuery('#tab-1').show();"">Address</li><li onclick=""jQuery('.tabs li').removeClass('on'); jQuery(this).addClass('on'); jQuery('.tab').hide(); jQuery('#tab-2').show();"">Other Information</li></ul><div class=""tab-top""></div><div class=""tab-content""><div class=""tab"" id=""tab-1""><div class=""the_big_map"" id=""the_map"" style=""width=""450px"""">"&Rs("GooglemapURL")&"</div><p style=""width: 200px; margin-bottom: 10px;""><strong>Region</strong>: "&Rs("Region")&"</p><p style=""width: 200px; margin-bottom: 10px;""><strong>Address</strong>: "&Rs("locationaddress")&"</p><p style=""width: 200px; margin-bottom: 10px;""><strong>Postcode</strong>: "&Rs("Postcode")&"</p><p style=""width: 200px; margin-bottom: 10px;""><strong>Telephone</strong>: "&Rs("phoneNo")&"</p><div class=""clear""></div></div><div class=""tab"" id=""tab-2"" style=""display: none;""><img src=""/images/cities/"&Rs("imageName")&""" border=""0"" alt="""&Rs("location")&""" align=""right""/><p style=""margin-bottom: 10px;""><strong>Parking</strong>: </p><p style=""margin-bottom: 10px;""><strong>Refreshments</strong>: </p><p style=""margin-bottom: 10px;""><strong>Features</strong>: </p><p style=""margin-bottom: 10px;""><strong>Type</strong>: Datrix</p></div></div><div class=""tab-bottom""></div><p><a class=""view-more-details"" href=""javascript:history.go(-1)"">Go back to your results</a></p>"

Rs.movenext
						loop
						Rs.close()

End Function   

%>


