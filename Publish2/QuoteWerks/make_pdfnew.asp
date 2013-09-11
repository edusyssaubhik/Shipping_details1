<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--

'<%
'
'Set Pdf = Server.CreateObject("Persits.Pdf")
'Set Doc = Pdf.CreateDocument
'' A4 paper size - if US required remove/comment the line below.
'Set Page = Doc.Pages.Add(995.3, 841.9) 
'Doc.ImportFromUrl Server.MapPath("query_s.asp")
'
'Filename = Doc.Save( Server.MapPath("quotation.pdf"), False ) 
'    'Response.Write "Success! Download your PDF file <A HREF="Filename & ">here</A>
'
'
'
'
'%>
<HTML>
<HEAD>
<TITLE>AspPDF File Appending Demo</TITLE>
</HEAD>
<BODY>
<FONT FACE="Arial" SIZE="2">

<h3>AspPDF File Appending Demo</h3>

AspPDF is capable of "stitching" together two or more
arbitrary PDF documents to form a new document.


<FORM ENCTYPE="multipart/form-data" METHOD="POST">

<B>Select two PDF file (limit size to 300K please)</B>:<P>

<INPUT TYPE="FILE" NAME="File1" SIZE="40"><BR>
<INPUT TYPE="FILE" NAME="File2" SIZE="40">
<P>
<INPUT TYPE="SUBMIT" VALUE="Upload PDF Files">

</FORM>
-->
<%
'	Set Upload = Server.CreateObject("Persits.Upload")
'	Upload.IgnoreNoPost = True ' to use form and upload script on the same page

'	Upload.OverwriteFiles = False ' generate unique file names

	' capture uploaded file. Save method returns the number of uploaded files.
	'nCount = Upload.Save( Server.MapPath("hello.pdf") )

	Dim Doc(2)
         
	
		' Create instance of AspPDF
		Set PDF = Server.CreateObject("Persits.PDF")
         
		For i = 1 to 2
	'		Set File = Server.MapPath("hello.pdf")

	'		If File.Size > 307200 Then
'				Response.Write "<font color=red><b>The file " & File.OriginalFileName & " exceeds 300KB. Please select a smaller file.</b></font>"
'				Response.End
'			End If

			' Open the file with AspPDF, handle exceptions			
			On Error Resume Next
			Set Doc(i) = PDF.OpenDocument( Server.MapPath("hello.pdf") )
			If Err <> 0 Then
			'	Response.Write "<font color=red><b>An error occurred when opening the file " & File.OriginalFileName & ": <font color=red>" & Err.Description & "</b></font>"
			Response.End
			End If

			' cancel On error resume next
			On Error Goto 0

			' If a document is secure and the password is invalid, OpenDocumen returns Nothing.
			If Doc(i) Is Nothing Then
				Response.Write "<font color=red><b>The file " & File.OriginalFileName & " is password-protected. Please select another file.</b></font>"
				Response.End
			End If

			' Now stich the second file to first if this is the 2nd iteration
			If i = 2 Then
				Doc(1).AppendDocument Doc(2)

				Path = Server.MapPath( "outline") & "\" & Session.SessionID & ".pdf"
				FileNam e = Doc(1).Save( Path, false)

				Response.Write "<P><B>Success. Your PDF file <font color=gray>" & FileName & "</font> can be downloaded <A HREF=""files/" & FileName & """><B>here</B></A></B>."
			End If

		Next
	
%>
<P>

<B><A HREF="demo_append.zip">Download source code (ASP/VBScript) for this demo</A></B>

</font>
</BODY>
</HTML>

