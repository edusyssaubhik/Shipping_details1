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

ConnObj.Open "Provider = SQLOLEDB; Data Source=SAUBHIK-PC; Initial Catalog=apmgstudy1; User Id=sa; Password=saubhik1@"

'ConnObj.Open "PROVIDER=SQLOLEDB;DATA SOURCE=db.winwinhosting.com;UID=apmgstudy;PWD=fIw4VdokuY2Lb0;DATABASE=apmgstudy"
%>