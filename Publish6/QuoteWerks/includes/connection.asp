<%
'======================================================='
 'Written By : Bharath'
 'Last UpaDated: 12/08/2009'
 'Description :'
 'Purpose : Connection String Page'
'======================================================='
%>
<%
'Declare The Variables'
Dim ConnObj

Set ConnObj = Server.CreateObject("ADODB.Connection")

'Connection String'

'ConnObj.Open "Provider = SQLOLEDB; Data Source=SAVITA-PC; Initial Catalog=APMG; User Id=sa; Password=savita123"

ConnObj.Open "PROVIDER=SQLOLEDB;DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=UpIwnfBKPP2aNv9a;DATABASE=apmgstudy"
%>