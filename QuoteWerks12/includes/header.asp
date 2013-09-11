<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Quotewerks</title>
<link href="/Quotewerks/css/leftNavi.css" rel="stylesheet" type="text/css" />
<link href="/Quotewerks/css/mainContent.css" rel="stylesheet" type="text/css" />



</head>

<body style="margin-top:0px">
<!--[if lte IE 7]><div style="background-color:#FF9; border-bottom:solid 1px #FC0; color:#333; text-align:center; height:20px !important; font-family:Verdana, Geneva, sans-serif; padding-top:6px;display:block; font-size:12px;">Some of UI elements may not work properly in this browser, so kindly upgrade your browser or use other browser</div><![endif]-->


<table border="0" style="border-bottom:1px solid #ccc;" cellspacing="0" cellpadding="0" width="100%" align="center">
  <tr style="background-color:#fbfcf8;">
 
  <td height="100px" colspan="2" align="right" valign="middle" style="border-bottom:#CCC thin solid;">
  <img src="/Quotewerks/images/logotop.png" width="170" height="54"  align="left" style="padding-left:20px"/>
    <p style="padding-right:20px; font-family:Verdana, Geneva, sans-serif; font-size:20px; color:#556018; display:inline">
	Welcome to Datrix QuoteWerks</p><br /><br /><br />
	<span class="welcome_user">Welcome <% =  Session("QWFirstName") %>&nbsp;<% = Session("QWLastName") %> | <label id="header"> <a href="/Quotewerks/logout.asp">Logout</a></label>&nbsp; &nbsp;&nbsp;&nbsp;</span>
	</td>
  </tr>
<% Session.Timeout = 1000 %>