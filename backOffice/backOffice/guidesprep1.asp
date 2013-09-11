<% 
If Session("FirstName") = "" Then 
Response.Redirect("/memberlogin.asp")
Else
%>

<!--#include virtual="/includes/header.asp"-->
<!--#include virtual="/includes/innerqualitymaterialbanner.html"-->
<!--#include virtual="/includes/connection.asp"-->
<!-- Body Starts -->
<%
Dim kno

If Request.Form("kno") <> "" Then
	kno = Request.Form("kno")
Else
	kno = Session("KNO")
End If		

Session("KNO") = kno

Set objRs = Server.CreateObject("ADODB.Recordset")

strQuery = "SELECT AreaTitle from KArea WHERE KNo = '" & Session("KNO") & "'"

objRs.Open strQuery, ConnObj

Do Until objRs.EOF

	Session("ChapterName") = objRs("AreaTitle")

objRs.Movenext
Loop
objRs.Close
%>
<div>
  <table width="930" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="235" align="left" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="8">
          <tr>
            <td width="2%" class="Header">&nbsp;</td>
            <td width="25%" class="PageTitle">&nbsp;</td>
            <td width="73%" class="PageTitle">Study Guides</td>
          </tr>
          <tr>
            <!--#include virtual="/includes/innerLeftMenu.asp"-->
            <td width="73%" rowspan="4" background="/images/back/left_line.jpg" class="general-body"><br />
              <div  style="margin-top:-17px; width:95%;"> 
              <!-- Content Start From Here-->
              <div><span class="Header">Dear </span><% If Session("FirstName") = "" Then %><span class="Header">Trial User,</span><% Else %><span class="Header"><% = Session("FirstName") %>&nbsp;<% = Session("LastName") %>, </span><% End If %></div> 
              <p class="SubHeader">Please download and read the study guides for this chapter: </p>
              
			  <ul>
			  
			 
			  
			  
	<% 
	
if (Int(kno)=1) then
	%>
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Introduction</span></td></tr><tr><td><A href="/projdocs/guides/Introduction.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;&nbsp;<A href="/projdocs/guides/Introduction.pdf" target="_blank">Download PDF</A></td></tr><tr><td><a href="http://65.182.191.206/projdocs/flash/Introduction.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://65.182.191.206/projdocs/flash/Introduction.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations) :</span> Please subscribe to PROJstudy Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to Podcasts when driving to work, traveling or resting.<BR><BR><a href="/projdocs/podcasthelp.pdf" target=_blank>Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://65.182.191.206/Podcast/Introduction.rss</span><br /> </td></tr></table>
	 
   
     
	<%elseif (Int(kno)=2) then%>
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Principles</span></td></tr><tr><td><A href="/projdocs/guides/Principles.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;&nbsp;<A href="/projdocs/guides/Principles.pdf" target="_blank">Download PDF</A></td></tr><tr><td> <a href="http://65.182.191.206/projdocs/flash/Principles.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="http://65.182.191.206/projdocs/flash/Principles.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations) :</span> Please subscribe to PROJstudy Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to Podcasts when driving to work, traveling or resting.<BR><BR><a href="/projdocs/podcasthelp.pdf" target=_blank>Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://65.182.191.206/Podcast/Principles.rss</span><br /> </td></tr></table>
    

	
	<%elseif (Int(kno)=3) then%>
 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Introduction to PRINCE2 themes</span></td></tr><tr><td><A href="/projdocs/guides/Themes.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/projdocs/guides/Themes.pdf" target="_blank">Download PDF</A></td></tr><tr><td><a href="http://65.182.191.206/projdocs/flash/Introduction to Themes.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://65.182.191.206/projdocs/flash/Introduction to Themes.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations) :</span> Please subscribe to PROJstudy Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to Podcasts when driving to work, traveling or resting.<BR><BR><a href="/projdocs/podcasthelp.pdf" target=_blank>Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://65.182.191.206/Podcast/Introduction to Themes.rss</span><br /></td></tr></table>
     
	
	 <%elseif (Int(kno)=4) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Business Case</span></td></tr><tr><td><A href="/projdocs/guides/Business Case.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/projdocs/guides/Business Case.pdf" target="_blank">Download PDF</A></td></tr><tr><td> <a href="http://65.182.191.206/projdocs/flash/Business Case.html" target="_blank"><img src="/images/buttons/swf_icon.jpg"  alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://65.182.191.206/projdocs/flash/Business Case.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations) :</span> Please subscribe to PROJstudy Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to Podcasts when driving to work, traveling or resting.<BR><BR><a href="/projdocs/podcasthelp.pdf" target=_blank>Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://65.182.191.206/Podcast/Business Case.rss</span><br /></td></tr></table> 
      

	
	<%elseif (Int(kno)=5) then
	%>
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Organization</span></td></tr><tr><td><A href="/projdocs/guides/Organization.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/projdocs/guides/Organization.pdf" target="_blank">Download PDF</A></td></tr><tr><td><a href="http://65.182.191.206/projdocs/flash/Organization.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<A href="/projdocs/flash/Organization.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations) :</span> Please subscribe to PROJstudy Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to Podcasts when driving to work, traveling or resting.<BR><BR><a href="/projdocs/podcasthelp.pdf" target=_blank>Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://65.182.191.206/Podcast/Organization.rss</span><br /></td></tr></table> 
    

	
	
	<%elseif (Int(kno)=6) then
	%>
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Quality</span></td></tr><tr><td><A href="/projdocs/guides/Quality.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/projdocs/guides/Quality.pdf" target="_blank">Download PDF</A></td></tr><tr><td><a href="http://65.182.191.206/projdocs/flash/Quality.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://65.182.191.206/projdocs/flash/Quality.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations) :</span> Please subscribe to PROJstudy Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to Podcasts when driving to work, traveling or resting.<BR><BR><a href="/projdocs/podcasthelp.pdf" target=_blank>Please click here for help on how to download the Podcasts</a>. <BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://65.182.191.206/Podcast/Quality.rss</span><br /></td></tr></table>

	 
	 
	<%elseif (Int(kno)=7) then
	%>
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Plans</span></td></tr><tr><td><A href="/projdocs/guides/Plans.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png"  alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/projdocs/guides/Plans.pdf" target="_blank">Download PDF</A></td></tr><tr><td><a href="http://65.182.191.206/projdocs/flash/Plans.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://65.182.191.206/projdocs/flash/Plans.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations) :</span> Please subscribe to PROJstudy Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to Podcasts when driving to work, traveling or resting.<BR><BR><a href="/projdocs/podcasthelp.pdf" target=_blank>Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://65.182.191.206/Podcast/Plans.rss</span><br /></td></tr></table>
	

	
	<%elseif (Int(kno)=8) then
	%>
	 
	<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Risk</span></td></tr><tr><td><A href="/projdocs/guides/Risk.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png" alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/projdocs/guides/Risk.pdf" target="_blank">Download PDF</A></td></tr><tr><td><a href="http://65.182.191.206/projdocs/flash/Risk.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://65.182.191.206/projdocs/flash/Risk.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations) :</span> Please subscribe to PROJstudy Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to Podcasts when driving to work, traveling or resting.<BR><BR><a href="/projdocs/podcasthelp.pdf" target=_blank>Please click here for help on how to download the Podcasts</a>. <BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://65.182.191.206/Podcast/Risk.rss</span><br /></td></tr></table>
	 

	 
	  
	<%elseif (Int(kno)=9) then
	%>
    
		<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Change</span></td></tr><tr><td><A href="/projdocs/guides/Change.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png" alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/projdocs/guides/Change.pdf" target="_blank">Download PDF</A></td></tr><tr><td><a href="http://65.182.191.206/projdocs/flash/Change.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://65.182.191.206/projdocs/flash/Change.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations) :</span> Please subscribe to PROJstudy Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to Podcasts when driving to work, traveling or resting.<BR><BR><a href="/projdocs/podcasthelp.pdf" target=_blank>Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://65.182.191.206/Podcast/Change.rss</span><br /></td></tr></table>
        
        
	<%elseif (Int(kno)=10) then%>
		
        <table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Progress</span></td></tr><tr><td><A href="/projdocs/guides/Progress.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png" alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/projdocs/guides/Progress.pdf" target="_blank">Download PDF</A></td></tr><tr><td><a href="http://65.182.191.206/projdocs/flash/Progress.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://65.182.191.206/projdocs/flash/Progress.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations) :</span> Please subscribe to PROJstudy Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to Podcasts when driving to work, traveling or resting.<BR><BR><a href="/projdocs/podcasthelp.pdf" target=_blank>Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://65.182.191.206/Podcast/Progress.rss</span><br /></td></tr></table>
        
        
	<%elseif (Int(kno)=11) then
	%>
    
		<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Introduction to processes</span></td></tr><tr><td><A href="/projdocs/guides/Introduction to processes.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png" alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/projdocs/guides/Introduction to processes.pdf" target="_blank">Download PDF</A></td></tr><tr><td><a href="http://65.182.191.206/projdocs/flash/Introduction to Processes.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://65.182.191.206/projdocs/flash/Introduction to Processes.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations) :</span> Please subscribe to PROJstudy Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to Podcasts when driving to work, traveling or resting.<BR><BR><a href="/projdocs/podcasthelp.pdf" target=_blank>Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://65.182.191.206/Podcast/Introduction to processes.rss</span><br /></td></tr></table>
        
        
<%elseif (Int(kno)=12) then
	%>
    
    
		<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Starting up a project</span></td></tr><tr><td><A href="/projdocs/guides/Starting up a project.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png" alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/projdocs/guides/Starting up a project.pdf" target="_blank">Download PDF</A></td></tr><tr><td><a href="http://65.182.191.206/projdocs/flash/Starting up a Project.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://65.182.191.206/projdocs/flash/Starting up a Project.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations) :</span> Please subscribe to PROJstudy Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to Podcasts when driving to work, traveling or resting.<BR><BR><a href="/projdocs/podcasthelp.pdf" target=_blank>Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://65.182.191.206/Podcast/Starting up a project.rss</span><br /></td></tr></table>        


<%elseif (Int(kno)=13) then
	%>
    
    
		<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Directing a project</span></td></tr><tr><td><A href="/projdocs/guides/Directing a project.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png" alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/projdocs/guides/Directing a project.pdf" target="_blank">Download PDF</A></td></tr><tr><td><a href="http://65.182.191.206/projdocs/flash/Directing a Project.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://65.182.191.206/projdocs/flash/Directing a Project.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations) :</span> Please subscribe to PROJstudy Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to Podcasts when driving to work, traveling or resting.<BR><BR><a href="/projdocs/podcasthelp.pdf" target=_blank>Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://65.182.191.206/Podcast/Directing a project.rss</span><br /></td></tr></table>
        	
            
	 <%elseif (Int(kno)=14) then %>


			<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Initiating a project</span></td></tr><tr><td><A href="/projdocs/guides/Initiating a project.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png" alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/projdocs/guides/Initiating a project.pdf" target="_blank">Download PDF</A></td></tr><tr><td><a href="http://65.182.191.206/projdocs/flash/Initiating a Project.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://65.182.191.206/projdocs/flash/Initiating a Project.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations) :</span> Please subscribe to PROJstudy Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to Podcasts when driving to work, traveling or resting.<BR><BR><a href="/projdocs/podcasthelp.pdf" target=_blank>Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://65.182.191.206/Podcast/Initiating a project.rss</span><br /></td></tr></table>
            
            	 <%elseif (Int(kno)=15) then %>

			<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Controlling a stage</span></td></tr><tr><td><A href="/projdocs/guides/Controlling a stage.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png" alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/projdocs/guides/Controlling a stage.pdf" target="_blank">Download PDF</A></td></tr><tr><td><a href="http://65.182.191.206/projdocs/flash/Controlling a Stage.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://65.182.191.206/projdocs/flash/Controlling a Stage.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations) :</span> Please subscribe to PROJstudy Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to Podcasts when driving to work, traveling or resting.<BR><BR><a href="/projdocs/podcasthelp.pdf" target=_blank>Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://65.182.191.206/Podcast/Controlling a stage.rss</span><br /></td></tr></table>
            

 <%elseif (Int(kno)=16) then %>

			<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Managing product delivery</span></td></tr><tr><td><A href="/projdocs/guides/Managing product delivery.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png" alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/projdocs/guides/Managing product delivery.pdf" target="_blank">Download PDF</A></td></tr><tr><td><a href="http://65.182.191.206/projdocs/flash/Managing Product Delivery.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://65.182.191.206/projdocs/flash/Managing Product Delivery.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations) :</span> Please subscribe to PROJstudy Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to Podcasts when driving to work, traveling or resting.<BR><BR><a href="/projdocs/podcasthelp.pdf" target=_blank>Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://65.182.191.206/Podcast/Managing product delivery.rss</span><br /></td></tr></table>            
            
            
   <%elseif (Int(kno)=17) then %>

			<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Managing a stage boundary</span></td></tr><tr><td><A href="/projdocs/guides/Managing a stage boundary.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png" alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/projdocs/guides/Managing a stage boundary.pdf" target="_blank">Download PDF</A></td></tr><tr><td><a href="http://65.182.191.206/projdocs/flash/Managing a Stage Boundary.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://65.182.191.206/projdocs/flash/Managing a Stage Boundary.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations) :</span> Please subscribe to PROJstudy Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to Podcasts when driving to work, traveling or resting.<BR><BR><a href="/projdocs/podcasthelp.pdf" target=_blank>Please click here for help on how to download the Podcasts</a>. <BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://65.182.191.206/Podcast/Managing a stage boundary.rss</span><br /></td></tr></table>   
            
            
            
    <%elseif (Int(kno)=18) then %>

			<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Closing a project</span></td></tr><tr><td><A href="/projdocs/guides/Closing a project.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png" alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/projdocs/guides/Closing a project.pdf" target="_blank">Download PDF</A></td></tr><tr><td><a href="http://65.182.191.206/projdocs/flash/Closing a Project.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://65.182.191.206/projdocs/flash/Closing a Project.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations) :</span> Please subscribe to PROJstudy Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to Podcasts when driving to work, traveling or resting.<BR><BR><a href="/projdocs/podcasthelp.pdf" target=_blank>Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://65.182.191.206/Podcast/Closing a project.rss</span><br /></td></tr></table>   
            
            
            
   <%elseif (Int(kno)=19) then %>

			<table border="0" cellpadding="10" cellspacing="0" ><tr><td><span class="Header">Tailoring PRINCE2 to the project environment (Practitioner only)</span></td></tr><tr><td><A href="/projdocs/guides/Tailoring PRINCE2 to the project environment.pdf" target="_blank"><img src="/images/buttons/adobeIcon.png" alt="PDF" height="20px" width="20px" border="0"></A>&nbsp;&nbsp;&nbsp;<A href="/projdocs/guides/Tailoring PRINCE2 to the project environment.pdf" target="_blank">Download PDF</A></td></tr><tr><td><a href="http://65.182.191.206/projdocs/flash/Tailoring PRINCE2 to the Project Environment.html" target="_blank"><img src="/images/buttons/swf_icon.jpg" alt="PDF" height="20px" width="20px" border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://65.182.191.206/projdocs/flash/Tailoring PRINCE2 to the Project Environment.html" target="_blank">View Online</a></td></tr><tr><td><span class="SubHeader">Podcasts (audio/visual presentations) :</span> Please subscribe to PROJstudy Podcasts to listen to our audio/visual presentations. This can be copied to your IPhone/IPod and you can listen to Podcasts when driving to work, traveling or resting.<BR><BR><a href="/projdocs/podcasthelp.pdf" target=_blank>Please click here for help on how to download the Podcasts</a>.<BR><BR>To subscribe, copy the following links to iTunes:<br /><span style="color:#0075D0;">http://65.182.191.206/Podcast/Tailoring PRINCE2 to the project environment.rss</span><br /></td></tr></table>   
            
            
            
        
<%	end if %>
              </ul>
             
               <ul>
                      <li>Explain the principles, themes, processes and other syllabus areas of PRINCE2<sup>&reg;</sup> from "Managing Successful Projects with PRINCE2<sup>&reg;</sup>".</li>
                      <li>List the 'Lesson Objectives' for each chapter.</li>
                      <li>Define important terms and concepts relevant to the chapter.</li>
                      <li>Explain roles and responsibilities relevant to the principles/themes/processes.</li>
                 
                        <li>Explain the important management products relevant to the principles/themes/processes.</li>
                     
                    </ul>
                
              <div>
                <!-- Content End From Here-->
                <!--#include virtual="/includes/connectionClose.asp"-->
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Body Ends -->
<!--#include virtual="/includes/footer.html"-->
<% End If %>