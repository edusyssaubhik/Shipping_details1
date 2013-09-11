<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<script src="js/pdfobject.js"></script>
<script src="js/pdfobject.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script>
//view: "FitH"

</script>
</head>

<body>
<p>&nbsp;</p>
<div style="width:auto;height:700px" id="pdfRenderer">
  </div>
<%
Session("new_pdf")="DTQQ1007.5-8.pdf"
   a=Session("new_pdf")%>
   
  response.Write("<script> $(document).ready(function(){
   var pdf = new PDFObject({
  url: 'http://projstudy.com/Quotewerks/QW_PDF/<%=a%>',
  id: 'pdfRendered',
  pdfOpenParams: {
    
	view: 'FitBV'
  }
}).embed("pdfRenderer");
});</script>")

</body>
</html>
