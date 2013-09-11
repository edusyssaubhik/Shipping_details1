<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <% 
        dim url
        url=request.QueryString("name")
     '   url1=""&url&""
         %>
    <title></title>
   
     <script type="text/javascript" src="js/pdfobject.js"></script>
      <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
     <script type="text/javascript" src="js/pdfobject.min.js"></script>
    
    <script type="text/javascript">
        window.onload = function () {
            var pdf = new PDFObject({
                url: "/backoffice/Cerpdf/<%=url%>",
                id: "pdfRendered",
                pdfOpenParams: {
                   
                    view: "FitH",
                    
                }
            }).embed("pdfRenderer");
        }
    </script>
</head>
<body>
    <div id="pdfRenderer" style="height:600px" ></div>
</body>
</html>
