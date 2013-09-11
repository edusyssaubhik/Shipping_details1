<%
'Declare The local Variables'
Dim ConnObj

Set ConnObj = Server.CreateObject("ADODB.Connection")

'PROJ
'ConnObj.Open "Provider = SQLOLEDB; Data Source= db.winwinhosting.com; Initial Catalog=apmgstudy; User Id= APMGstudy; Password=fIw4VdokuY2Lb0"

ConnObj.Open "Provider=SQLOLEDB;Data Source=MADHAVA-VAIO; Initial Catalog=apmgstudy; User Id=sa; Password=saubhik1@"
%>
