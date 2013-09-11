<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%


Set Pdf = Server.CreateObject("Persits.Pdf")
Set Doc = Pdf.CreateDocument
Doc.ImportFromUrl "www.google.com"
Filename = Doc.Save( Server.MapPath("importfromurl9.pdf"), False )

%>
<img src=""images/Login_bg.png"" />
<%

Set Pdf = Server.CreateObject("Persits.Pdf")
Set Doc = Pdf.CreateDocument
Doc.Title = "AspPDF Chapter 3 Hello World Sample"
Doc.Creator = "John Smith"

Set Page = Doc.Pages.Add

Set Font = Doc.Fonts("Helvetica")
str="hello worldHello World!<img src=""images/Login_bg.png"" />"
Params = "x=0; y=650; width=612; alignment=center; size=50"
Page.Canvas.DrawText str, Params, Font

Filename = Doc.Save( Server.MapPath("hello9.pdf"), False )

Response.Write "Success! Download your PDF file <A HREF=" & Filename & ">here</A>"

%>
