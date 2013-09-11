<%
'Comments'
'1 - PMstudy'
'2 - PROJstudy'
'3 - ITILstudy'
'4 - 6sigmastudy'
'5 - RMstudy'
'6 - HRDstudy'
'7 - HRCIstudy'
'8 - NGstudy'
'9 - PROGstudy'
%>
<% If rqWebsite = "1" Then %>
<!--#includes virtual="/MIS/includes/connection-PM.asp"-->
<% ElseIf rqWebsite = "2" Then %>
<!--#includes virtual="/MIS/includes/connection-PROJ.asp"-->
<% ElseIf rqWebsite = "3" Then %>
<!--#includes virtual="/MIS/includes/connection-ITIL.asp"-->
<% ElseIf rqWebsite = "4" Then %>
<!--#includes virtual="/MIS/includes/connection-6sigma.asp"-->
<% ElseIf rqWebsite = "5" Then %>
<!--#includes virtual="/MIS/includes/connection-RM.asp"-->
<% ElseIf rqWebsite = "6" Then %>
<!--#includes virtual="/MIS/includes/connection-HRD.asp"-->
<% ElseIf rqWebsite = "7" Then %>
<!--#includes virtual="/MIS/includes/connection-HRCI.asp"-->
<% ElseIf rqWebsite = "8" Then %>
<!--#includes virtual="/MIS/includes/connection-NG.asp"-->
<% ElseIf rqWebsite = "9" Then %>
<!--#includes virtual="/MIS/includes/connection-PROG.asp"-->
<% End If %>
