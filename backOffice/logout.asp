<%@ LANGUAGE="VBSCRIPT" %>
<% OPTION EXPLICIT %>
<%
'======================================================='
'Written By : Priyanka'
'Last UpDated : 23/09/2010'
'Description :'
'This Page is Login Page'
'======================================================='
'Abandons All The Sessions And Redirected To  Login Page.'
'Declare Local Variables'

Dim username,str

userName = Request.Cookies("userid")
str = "login.asp"
Session.Abandon()
Response.Redirect str
Response.end
%>