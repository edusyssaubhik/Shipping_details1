&lt;%@LANGUAGE=&quot;VBSCRIPT&quot; CODEPAGE=&quot;1252&quot;%&gt;&lt;% 'OPTION EXPLICIT %&gt;<!--#include virtual="/QuoteWerks/includes/connection.asp"-->&lt;%  If Session(&quot;QWUserName&quot;) = &quot;&quot; Then  Response.Redirect(&quot;default.asp&quot;) Else %&gt;&lt;%  '=======================================================' 'Written By : Mahima' 'Written Date : 29/03/2011' 'Description :' 'This page is for User Details ' '=======================================================' Dim rqType,rqfirstName,rqlastName ,rquserName,rqpassword ,rqofficialemailid ,rqpersonalemailid Dim rqAction,rqtypeofuser,rquserId,rqaddedBy ,rqaddedDate,rqphoneNo,rqDesignation Dim objRs,strEmpDet,rqDelGID, strQuery1 ,Rs1,upuser,  upuser1,rqDeleteuserId,rqID,strBody Dim objmail 'Retrive the type of action'     rqAction = Request.QueryString(&quot;action&quot;) rqType =  Request.form(&quot;type&quot;) 'Retrive the values from this page' rquserName =  Request.Form(&quot;userName&quot;)  rqDeleteuserId = Request.QueryString(&quot;id&quot;) rqfirstName = Request.Form(&quot;firstname&quot;) rqlastName = Request.Form(&quot;lastname&quot;) rqpassword = Request.Form(&quot;password&quot;) rqofficialemailid = Request.Form(&quot;officialemailid&quot;) rqpersonalemailid = Request.Form(&quot;personalemailid&quot;) rqphoneNo = Request.Form(&quot;phoneno&quot;) rqDesignation = Request.Form(&quot;Designation&quot;) rqtypeofuser = Request.Form(&quot;typeofuser&quot;) rqaddedDate= Now() rqaddedBy = Session(&quot;QWuserName&quot;) rqID = Request.Form(&quot;id&quot;) 'RESPONSE.WRITE(rquserName)   'Generating default/random password for logged in users'   Dim pChar1, pCount1,i,pass1,userID,EmailID      ' Here you can add other characters such as lowercase or special.    pChar1 = &quot;ABCDEFGHIJKLMNPQRSTUVWXYZ@#$&amp;0123456789&quot;        pCount1 = Len(pChar1)         Dim psw1    psw1 = &quot;DAT&quot;        Randomize    For i = 1 To 6 ' password length   psw1 = psw1 &amp; Mid( pChar1, 1 + Int(Rnd * pCount1), 1 )   pass1=psw1    Next        EmailID = Split(rqofficialemailid,&quot;@&quot;)        'userName = EmailID(0) '    '   Response.Write(userName)     'Creating Record Objects' Set objRs = Server.CreateObject(&quot;ADODB.Recordset&quot;) Set  Rs1 = Server.CreateObject(&quot;ADODB.Recordset&quot;) 'Response.write(rquserName)  If rqType = &quot;Add User Details&quot; then          strQuery1 = &quot;SELECT userid FROM users where userid = '&quot; &amp; EmailID(0) &amp; &quot;'&quot;           Rs1.Open StrQuery1,ConnObj     ' Response.Write(strQuery1)       If (Not Rs1.BOF) and (Not Rs1.EOF) Then   'response.write(&quot;A&quot;)        upuser=Ucase( userID )         upuser1=Ucase(Rs1(&quot;userid&quot;))          If  upuser =  upuser1 Then          'If rquserName = Rs1(&quot;userName&quot;) Then   Session(&quot;message&quot;) = &quot;This User Name Already Exists&quot; Response.Redirect(&quot;/QuoteWerks/users.asp&quot;)         End If       Else      'response.write(&quot;b&quot;)  strEmpDet = &quot;INSERT INTO users(firstname,lastname,userid,password,officialemailid,personalemailid,phoneno,Designation,typeofuser,addedBy,addedDate) values &quot;  strEmpDet= strEmpDet&amp; &quot;('&quot; &amp; rqfirstName&amp; &quot;',&quot; strEmpDet= strEmpDet&amp; &quot;'&quot; &amp; rqlastName &amp; &quot;',&quot; strEmpDet= strEmpDet&amp; &quot;'&quot; &amp; EmailID(0) &amp; &quot;',&quot; strEmpDet= strEmpDet&amp; &quot;'&quot; &amp; pass1 &amp; &quot;',&quot; strEmpDet= strEmpDet&amp; &quot;'&quot; &amp; rqofficialemailid &amp; &quot;',&quot; strEmpDet= strEmpDet&amp; &quot;'&quot; &amp; rqpersonalemailid &amp; &quot;',&quot; strEmpDet= strEmpDet&amp; &quot;'&quot; &amp; rqphoneNo &amp; &quot;',&quot;     strEmpDet= strEmpDet&amp; &quot;'&quot; &amp; rqDesignation &amp; &quot;',&quot;     strEmpDet= strEmpDet&amp; &quot;'&quot; &amp; rqtypeofuser &amp; &quot;',&quot; strEmpDet= strEmpDet&amp; &quot;'&quot; &amp; rqaddedBy&amp; &quot;',&quot; strEmpDet= strEmpDet&amp; &quot;'&quot; &amp; rqaddeddate &amp; &quot;')&quot;  'Response.Write(strEmpDet)     objRs.open strEmpDet,ConnObj   strBody = &quot;
<table width="" bgcolor="" 100%""="" bordrer="" 1""="" #cccccc""="" margin:0px;0px;0px;0px;""="">
<tbody>
<tr>
<td>
<table width="" cellspacing="" cellpadding="" border="" bgcolor="" align="" 600""="" 0""="" center""="" 2""="" 12""="" #ffffff""="">
<tbody>
<tr>
<td width="" bgcolor="" 600px""="" #ffffff""=""><img width="0" height="0" src="" http:="" www.projstudy.com="" quotewerks="" images="" email_headerdatrix.jpg""="" alt="" datrix""="" 600px""="" 103""="" /></td></tr>
<tr>
<td width="" colspan="" 2""="" 540px""="">
<table width="" border="" align="" 0""="" 520px""="" center""="">
<tbody>
<tr height="undefined" 30px""="">
<td><font size="2" face="" arial""="">Dear &quot;&amp;rqfirstName&amp;&quot;&nbsp;&quot;&amp;rqlastName&amp;&quot;,<br />
<br />
Please find below your login details for VMQuotes: <br />
<br />
Username: &quot;&amp;EmailID(0)&amp;&quot;<br />
<br />
Password: &quot;&amp;pass1&amp;&quot;<br />
<br />
Link to login: <a href="" http:="" projstudy.com="" quotewerks="" default.asp""="">http://projstudy.com/Quotewerks/default.asp</a><br />
<br />
Best Regards, <br /><br><br>
VMQuotes Admin</font></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table>&quot; 'response.Write(strBody) Set objmail = Server.CreateObject(&quot;CDONTS.NewMail&quot;) 'response.Write(&quot;called&quot;) objmail.From = &quot;operations@datrixtraining.com&quot; 'objmail.From = &quot;edusyssavita@gmail.com&quot; objmail.To =  &quot;&quot;&amp;rqofficialemailid&amp;&quot;&quot;     objmail.cc = &quot;edusyssavita@gmail.com,edusysayan@gmail.com&quot; objmail.Importance = 2 objmail.Subject = &quot;Login Details - VMQuotes&quot; objmail.BodyFormat = 0 objmail.MailFormat = 0 objmail.Body =  strBody objmail.Send Set objmail = Nothing   Session(&quot;message&quot;) = &quot;You Have Successfully Added User&quot;  Response.Redirect(&quot;/QuoteWerks/Users.asp&quot;) End If 'Updating values into the database'  ElseIf rqType = &quot;Edit User Details&quot; then    'update by Saubhik         ' Response.write(&quot;c&quot;) strEmpDet= &quot;UPDATE users  SET &quot; strEmpDet= strEmpDet&amp; &quot;firstName = '&quot;&amp; rqfirstName &amp;&quot;',&quot; strEmpDet= strEmpDet&amp; &quot;lastName = '&quot;&amp; rqlastName &amp;&quot;',&quot; strEmpDet= strEmpDet&amp; &quot;officialemailid = '&quot;&amp; rqofficialemailid &amp;&quot;',&quot; strEmpDet= strEmpDet&amp; &quot;personalemailid = '&quot;&amp; rqpersonalemailid &amp;&quot;',&quot; strEmpDet= strEmpDet&amp; &quot;PhoneNo = '&quot;&amp; rqphoneNo &amp;&quot;',&quot;                     strEmpDet= strEmpDet&amp; &quot;Designation='&quot; &amp; rqDesignation &amp; &quot;',&quot; 'strEmpDet= strEmpDet&amp; &quot;typeofuser= '&quot; &amp; rqtypeofuser &amp; &quot;',&quot; strEmpDet= strEmpDet&amp; &quot;modifiedBy= '&quot; &amp; rqaddedBy &amp; &quot;',&quot; strEmpDet= strEmpDet&amp; &quot;modifiedDate= '&quot; &amp; rqaddeddate &amp; &quot;'&quot; strEmpDet= strEmpDet&amp; &quot; WHERE id = '&quot;&amp; rqId &amp;&quot;'&quot;    'response.write(strEmpDet) ConnObj.Execute strEmpDet  Session(&quot;message&quot;) = &quot;You Have Successfully Edit User&quot;  Response.Redirect(&quot;/QuoteWerks/users.asp&quot;)    'Deleteing the records from the table' ElseIf rqAction =&quot;deleteUser&quot; then   Response.Write(rqDeleteuserId)     ConnObj.Execute(&quot;DELETE  from users where id = '&quot;&amp; rqDeleteuserId &amp;&quot;'&quot;)   Session(&quot;message&quot;) = &quot;You Have Successfully Deleted User&quot;   response.Redirect(&quot;/QuoteWerks/users.asp&quot;) end If %&gt;&lt;% End If %&gt;<!--#include virtual="/QuoteWerks/includes/connectionClose.asp"-->