<%
'Declare The local Variables'
Dim ConnObj

Set ConnObj = Server.CreateObject("ADODB.Connection")

'PROJ
'ConnObj.Open "Provider = SQLOLEDB; Data Source= db.winwinhosting.com; Initial Catalog=apmgstudy; User Id=apmgstudy; Password=kCmOmrr3H3Ci"

'PROJ
ConnObj.Open "Provider = SQLOLEDB; Data Source= db.winwinhosting.com; Initial Catalog=apmgstudy; User Id= APMGstudy; Password=nGRrB379xePCzK"

'ConnObj.Open "Provider=SQLOLEDB;Data Source=PRIYANKA-1545; Initial Catalog=APMGstudy; User Id=sa; Password=edusys"
%>
