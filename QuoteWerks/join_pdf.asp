<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>
<%
Set PDF = Server.CreateObject("Persits.PDF")
 Dim Doc(2)
'set Doc(0)=PDF.OpenDocument (Server.MapPath("http://projstudy.com/Quotewerks/input/DTQQ1007.5-8.pdf"))
'set Doc(1)=PDF.OpenDocument (Server.MapPath("http://projstudy.com/Quotewerks/input/DTQQ1007.5-8.pdf"))
set Doc(0)=PDF.OpenDocument ("www.projstudy.com/Quotewerks/input/DTQQ1007.5-8.pdf")
set Doc(1)=PDF.OpenDocument ("www.projstudy.com/Quotewerks/input/DTQQ1007.5-8.pdf")
	'Doc(0).AppendDocument Doc(1)
Doc(0).AppendDocument Doc(1)
			 'Doc(j).AppendDocument  PDF.OpenDocument(Server.MapPath("input/DTQQ1007.5-8.pdf")) ' file need to change
			    Filen=Session.SessionID & ".pdf"
				Path = Server.MapPath( "output1") & "\" & Filen
				FileName = Doc(0).Save(Path, false)
			 

%>
<body>
</body>
</html>
