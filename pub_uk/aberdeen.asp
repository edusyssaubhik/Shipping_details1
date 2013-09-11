<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/navigation.asp"-->
<!--#include virtual="/includes/uk.asp"-->

<%
 '======================================================='
'Written By : Priyanka'
'Written Date : 09/10/2012'
'Last Modified By : Priyanka'
'Last Modified Date : 10/10/2012'
'Description : '
'This is index Page'
'======================================================='%

%>
<style type="text/css">

.GoogleMapvenue{
width:400px;
height:200px;}

</style>

<div id="container" class="container_12">
		
		
	<div id="breadcrumb"><p><a href="/index.asp">Home</a>&nbsp;&gt;&nbsp;<a href="/our-venues.asp" class="current">Our Venues</a>&nbsp;&gt;&nbsp;<a href="/venue/aberdeen.asp" class="current">Aberdeen</a></p></div>
	
	<div id="content">
		
		<div id="main_content">
		
			<div class="post">
			
						<h2>Aberdeen</h2>
                        
				<div class="entry venue">
                <!--#include virtual="/emailPrint.asp"-->
                
				<!-- blah -->
                            
                          <%
        
							'About us How We Work - Heading'
							'Assingning and calling BIGetVenu function and displaying the same'
							 Response.Write(BlGetVenue)
									  
					     %>
				
				</div><!-- /entry -->	
                	
			</div>
            
			<div class="clear"></div>
			
		</div><!-- /main_content -->
		
		
				<div id="sidebar">
                
                		 <%
        
							'About us Who We Work With - image'
							'Assingning and calling CfGetAboutUsWhoWeWorkWith function and displaying the same'
							 Response.Write(CfGetImageWhoWeWorkWith)
									  
					     %>
			
			
 						<%
        
							'About us Who We Work With - image'
							'Assingning and calling CfGetAboutUsTrustPilot function and displaying the same'
							 Response.Write(CfGetImageTrustPilot)
									  
					     %>
                         
                         <%
        
							'About us Testimonial -image'
							'Assingning and calling CfGetAboutUsTestimonial function and displaying the same'
							 Response.Write(CfGetImageTestimonial)
									  
					     %>
                         
		</div><!-- /sidebar -->
		
		<div class="clear"></div>
		
	</div><!-- /content -->
	
			

<div class="clear"></div>

</div><!-- /container -->
		


<!--#include virtual="/includes/footer.html"-->
