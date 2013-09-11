<%@ LANGUAGE="VBSCRIPT" %>
<% OPTION EXPLICIT %>
<%
'-------------------------------------------------------'
'Written By : Mahima'
'Last UpDated : 29/03/2011'
'Description :'
'This Page Abandons Active User Session As Well As All The Sesssion Variables Started In The Active'
'Users Session When Invoked.'
'-------------------------------------------------------'

'Abandons All The Sessions And Redirected To  Login Page.'
'Declare Local Variables'

Dim UserID,str

UserID = Request.Cookies("userName")
str = "default.asp"
Session.Abandon()
Response.Redirect str
Response.end
%>