<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>
<%
dim str
' We r gonna access the API to send pdf url........
str="google"
                        dim objHttp, respbody, respstream, respxml, resp

                        set objHttp = Server.CreateObject("Msxml2.ServerXMLHTTP")
                                        	
                        objHttp.open "POST", "http://localhost:54626/api/Account/Post", false
						objHttp.setRequestHeader "Content-type", "application/x-www-form-urlencoded"
						objHttp.Send str
                            
                        resp = objHttp.responseText
						response.Write(resp)

%>
<body>
</body>
</html>
