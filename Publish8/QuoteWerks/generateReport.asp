<!--#include virtual="/QuoteWerks/includes/header.asp"-->
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->
<head>
<% 
'If not Session("userName") then redirect to  login page'
	If Session("QWUserName") = "" Then 
		Response.Redirect("default.asp")
	Else
	
%>
<%
'======================================================='
'Written By : savita'
'Created Date : 5/03/2013'
'Description :'
'This page is for generating report '
'======================================================='
%>
<%
'Declaring variables
Dim rqAction ,rqCountry,rqWebsite
Dim rqId,arrAllcountries,objRs2,objRs3,objRs4
Dim arrAllEmpDet, firstRow, lastRow, numRows, rqRow, rqPage
Dim message,strquery1
Dim objRsComp

message = Session("message")
Session("message") = ""
   
'Creating the Recordset objects'
SET objRs1 = Server.CreateObject("ADODB.Recordset")
	
'Retrive the values from this page'
If Request.QueryString("action") <> "" Then
	rqAction = Request.QueryString("action")
Else
	rqAction = Request.Form("action")
End If	

If Request.Form("type") <> "" Then
	rqType = Request.Form("type")
Else
	rqType = Request.QueryString("type")
End If

If Request.Form("userId") <> "" Then
	rquserId = Request.Form("userId")
Else
	rquserId = Request.QueryString("userId")
End If

If Request.Form("Company") <> "" Then
	rqCompany = Request.Form("Company")
Else
	rqCompany = Request.QueryString("Company")
End If


If Request.Form("category") <> "" Then
	rqCategory = Request.Form("category")
Else
	rqCategory = Request.QueryString("category")
End If

'Retriving seach options'
If Request.Form("userId") <> "" Then
	rqUserId = Request.Form("userId")
Else
	rqUserId = Request.QueryString("userId")
End If

If Request.Form("CompId") <> "" Then
	rqCompId = Int(Request.Form("CompId"))
Else
	rqCompId = Int(Request.QueryString("CompId"))
End If

If Request.Form("fromDate") <> "" Then
	rqFromDate = Request.Form("fromDate")
Else
	rqFromDate = Request.QueryString("fromDate")
End If

If Request.Form("toDate") <> "" Then
	rqToDate = Request.Form("toDate")
Else
	rqToDate = Request.QueryString("toDate")
End If

'For Pagination'
rqPage =  Request.QueryString("page")
rqRow  =  Request.QueryString("row")
 
'Recordset   
Set objRsQuote = Server.CreateObject("ADODB.Recordset")
Set objRsuserId = Server.CreateObject("ADODB.Recordset")
Set objRsDesc = Server.CreateObject("ADODB.Recordset")
Set objRs = Server.CreateObject("ADODB.Recordset")

Function Search(Category)
'response.Write(rqCategory)
If rqCategory = "SalesManager" Then
strQuote = strQuote & " And userId = '"& rqUserId &"'"
ElseIf rqCategory = "Company" Then 
strQuote = strQuote & " And companyId = '"& rqCompId &"'"
ElseIf  rqCategory = "Date" Then 
strQuote = strQuote & " And sentDate Between '" & rqFromDate & "' AND '" & DateAdd("d", +1,CDate(rqToDate)) & "'"
Else
End If

End Function

'Test'
If rqAction = "" Then
	rqAction = "In Process"
End If	

'Displayig the records based on user action/selection'
If rqAction = "In Process" OR rqAction = "" Then

strQuote = "SELECT quoteId, sentDate, userId, totalAmount, tax, companyId, status,PONumber FROM QW_QuoteOverview WHERE status = 'In Process' order by sentDate desc"


Else

strQuote = "SELECT quoteId, sentDate, userId, totalAmount, tax, companyId, status,PONumber FROM QW_QuoteOverview WHERE status = '"& rqAction &"' order by sentDate desc"
strQuote = strQuote & Search(rqCategory)

End If 




objRsQuote.Open strQuote, ConnObj


If Not objRsQuote.EOF Then

	arrAllRecords = objRsQuote.getrows
	firstRow = 0
	lastRow = 9
	numRows = Ubound(arrAllRecords,2)
	If lastRow > numRows Then
	   lastRow = numRows
	End If
	
	allNumRows = numRows
	
	cnt = 1

End If

'Pagination code'
If cnt = 1 Then

 If Request.QueryString("page") = "" Then
	
	iPageCurrent = 1
	
	numRows = Ubound(arrAllRecords,2)
	
	 firstRow = 0 
	 
	 If numRows > 9 Then
	    lastRow = 9  
	 Else
	 	lastRow = numRows
	 End If 
	 
  Else
	
	numRows = Ubound(arrAllRecords,2)
	
	iPageCurrent = Request.QueryString("page") 
    firstRow = ((10 * iPageCurrent)-10) 
    lastRow = firstRow + 9 

    If lastRow > numRows Then
    lastRow = numRows
	
   End If

    If firstRow < 0 Then
       firstRow = 0
    End If

 End if
 
End If

If rqCategory = "SalesManager" Then
'Calling distinct category
struserId = "SELECT Distinct userId FROM QW_QuoteOverview"

objRsuserId.Open struserId, ConnObj

ElseIf rqCategory = "Company" Then

Set objRsComp = Server.CreateObject("ADODB.Recordset")

strCompany = "SELECT CompId, CompName FROM QW_Company"

objRsComp.Open strCompany, ConnObj

End If

%>
<script language ="JavaScript" type="text/javascript">
    /*function check_d()
    {
      if(document.getElementById("category").value=="")
      {
        alert("Please select Category");
        return false;
      }
      else
      {
        return true;  
      }
        
    }*/

    function enableAll(element) {
        var isChecked = element.checked;

    }
    // Function To Validate Fields And Display An Alert Message If Any Field Is Empty.

    function validate_required(field, alerttxt) {
        with (field) {
            if (field.value == "")
            { alert(alerttxt); return false }
            else { return true }
        }
    }

    function Form_Validator(theform) {

        if (theform.category.value == "") {
            alert("Please select category.");
            theform.category.focus();
            return (false);
        }
    }
    function Form_Validator1(theform) {

        if (theform.userId.value == "") {
            alert("Please select Manager Name.");
            theform.userId.focus();
            return (false);
        }
    }
    function Form_Validator2(theform) {
        if (theform.CompName.value == "") {
            alert("Please select Company Name.");
            theform.CompName.focus();
            return (false);
        }
    }
    function Form_Validator3(theform) {
        if (theform.fromDate.value == "") {
            alert("Please Enter From Date.");
            theform.fromDate.focus();
            return (false);
        }

        if (theform.toDate.value == "") {
            alert("Please Enter To Date.");
            theform.toDate.focus();
            return (false);
        }
    }


</script>
<script language="javascript">
    function Form_Validator(theform) {

        if (theform.comment.value == "") {
            alert("Please enter the comment");
            theform.comment.focus();
            return (false);
        }

    }

    function Form_Validator1(theform) {

        if (theform.status.value == "") {
            alert("Please select the status");
            theform.status.focus();
            return (false);
        }

    }

    function searchby() {

        document.forms["myform"].submit();

    }

    function visible_text(i) {
        var status = "status_" + i;
        var c = "",la="";
        var sta1 = document.getElementById(status).value;
        var text1 = "text_" + i;
        var la = "la_" + i;
        c = document.getElementById(text1);
       var lab = document.getElementById(la)
        if (sta1 != "") {

            lab.style.display = "";

            c.style.display = "";
        }
        else {
            lab.style.display = "none";
            c.style.display = "none";
            alert("Please select the status");
        }
    }
</script>

</head>
<!-- Body Starts -->
<body>
<link href="/QuoteWerks/css/leftNavi.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/form.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/mainContent.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="/QuoteWerks/js/search.js"></script>
<body style="margin-top:0px">
<table border="0" width="100%">
<tr>
  <td width="170px" align="left" valign="top" style=" border-right:#CCC thin solid;"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftNavigation" >
      <!--#include virtual="/QuoteWerks/includes/LeftMenu.asp"-->
    </table></td>
  <td width="730px" align="center" valign="top" height="450px">
          <div id="topbar">
        <ul class="topNav"  >
          <li><a href="/Quotewerks/generateReport.asp?action=In Process">Quote Inprocess</a></li>
        </ul>
      </div>
      <div id="topbar" style="margin-left:10px;">
        <ul class="topNav">
          <li><a href="/Quotewerks/generateReport.asp?action=Quote Sent">Quote Sent</a></li>
        </ul>
      </div>
      <div  id="topbar" style="margin-left:10px;"  >
        <ul class="topNav">
          <li><a href="/Quotewerks/generateReport.asp?action=P O Received">P O Received</a></li>
        </ul>
      </div>
      <div  id="topbar" style="margin-left:10px;"  >
        <ul class="topNav">
          <li><a href="/Quotewerks/generateReport.asp?action=Invoice Sent">Invoice Sent</a></li>
        </ul>
      </div>
      <div  id="topbar" style="margin-left:10px;"  >
        <ul class="topNav">
          <li><a href="/Quotewerks/generateReport.asp?action=Payment Received">Payment Received</a></li>
        </ul>
      </div>
      <div  id="topbar" style="margin-left:10px;"  >
        <ul class="topNav">
          <li><a href="/Quotewerks/generateReport.asp?action=Quote Cancelled">Quote Cancelled</a></li>
        </ul>
      </div>

  <div id="styledForm" class="myform">
    <table  border="0" cellspacing="0" cellpadding="4" align="left">
      <tr>
        <td><form action="generateReport.asp" name="myform" method="post" onSubmit="return Form_Validator(this)">
            <table width="40%" border="0" cellspacing="0" cellpadding="8px">
              <tr>
                <td>Search By Category: </td>
                <td><select name="category" onChange="searchby();">
                    <option value="">--Select--</option>
                    <option <% If rqCategory = "SalesManager" Then %> selected="selected" <% End If %> value="SalesManager" >Sales Manager</option>
                    <option <% If rqCategory = "Company" Then %> selected="selected" <% End If %> value="Company">Company</option>
                    <option <% If rqCategory = "Date" Then %> selected="selected" <% End If %> value="Date">Quote Sent Date</option>
                  </select></td>
              </tr>
            </table>
          </form>
          <% If rqCategory = "SalesManager" Then %>
          <form action="generateReport.asp" method="post" onSubmit="return Form_Validator1(this)">
            <table width="40%" border="0" cellspacing="0" cellpadding="8px">
              <tr><br>
                <td colspan="2" ><p> Search Report By Sales Manager </p></td>
              </tr>
              <tr>
                <td>Search By Sales Manager: </td>
                <td><select name="userId">
                    <option value="">--Select--</option>
                      <% If Session("QWTypeofuser") = "Admin" Then %>
                    <% Do Until objRsuserId.EOF %>
                   
                    <option <% If rquserId = objRsuserId("userId") Then %> selected="selected" <% End If %> value="<% = objRsuserId("userId") %>">
                    <% = objRsuserId("userId") %>
                    </option>
                   
                    <% objRsuserId.Movenext
							   Loop
							   objRsuserId.Close %>
                                <% Else %>
                     <option value="<% = Session("QWUserName") %>">
                    <% = Session("QWUserName") %> </option>
                    <% End If %>
                  </select></td>
                <td>

                <input type="hidden" name="category" value="SalesManager" />
                <input type="Submit" name="Search" value="Search" /></td>
              </tr>
            </table>
          </form>
          <% ElseIf rqCategory = "Company" Then  %>
          <form action="generateReport.asp" method="post" onSubmit="return Form_Validator2(this)">
          <table width="50%" border="0" cellspacing="0" cellpadding="8px">
            <tr><br>
              <td colspan="2" ><p> Search Report By Company Name </p></td>
            </tr>
            <tr>
              <td>Search By Company Name: </td>
              <td><select name="CompId">
                  <option value="">--Select--</option>
                  <% Do Until objRsComp.EOF %>
                  <option <% If rqCompId = CInt(objRsComp("CompId")) Then %> selected="selected" <% End If %> value="<% = objRsComp("CompId") %>">
                  <% = objRsComp("CompName") %>
                  </option>
                  <% objRsComp.Movenext
							   Loop
							   objRsComp.Close %>
                </select></td>
              <td>
              <input type="hidden" name="category" value="Company" />
              <input type="Submit" name="Search" value="Search" /></td>
            </tr>
          </table>
          </form>
          <% ElseIf rqCategory = "Date" Then  %>
          <form action="generateReport.asp" method="post" onSubmit="return Form_Validator3(this)">
            <table width="40%" border="0" cellspacing="0" cellpadding="8px">
              <tr><br>
                <td colspan="2" ><p> Search Report By Date Sent </p></td>
              </tr>
              <tr>
                <td>From Sent Date:</td>
                <td><input type="text" name="fromDate" value="<% = rqFromDate %>" />
                  (format: yyyy/mm/dd)</td>
              </tr>
              <tr>
                <td>To Sent Date:</td>
                <td><input type="text" name="toDate" value="<% = rqToDate %>" />
                  (format: yyyy/mm/dd)</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>
                <input type="hidden" name="category" value="Date" />
                <input type="submit" value="Submit" /></td>
              </tr>
            </table>
          </form>
          <% End If %></td>
      </tr>
      <tr>
      	<td><h3><% = rqAction %></h3></td>
      </tr>
      <tr>
      <td>
      <div id="main">
<fieldset>
        <table border="0" cellpadding="0" cellspacing="0" class="table1" width="950px">
          <tr>
           <td bgcolor="#A7DBFB" align="center"><b>Sales Manager Name</b></td>
           <td  align="center"><b>Quote Id</b></td>
            <td  align="center"><b>Sent Date</b></td>
            <td  align="center"><b>Company Name</b></td>
			<td  align="center"><b>Tax</b></td>
			<td  align="center"><b>Total Amount</b></td>			
            <td  align="center"><b>Comments</b></td>
            <td  align="center"><b>History</b></td>
            <td  align="center"><b>Status</b></td>
                      
            <td  align="center" ><b>Quote</b></td> 
            <% If rqAction = "P O Received" OR rqAction = "Invoice Sent" Then %>    
            <td  align="center"><b>Enroll</b></td>         
          <% End If %>
          </tr>  
          
             <% dim index
                 index=0
                 If IsArray(arrAllRecords) Then
          		 For rowcounter = firstRow to lastRow 
		      index=index+1
		  	 quoteId = arrAllRecords(0,rowcounter)
	         sentDate = Trim(arrAllRecords(1,rowcounter))
	         userId = arrAllRecords(2,rowcounter)
	         totalAmount = arrAllRecords(3,rowcounter)
	         tax = arrAllRecords(4,rowcounter)
	         companyId = arrAllRecords(5,rowcounter)
			 quoteStatus = arrAllRecords(6,rowcounter)
			 PONumber = arrAllRecords(7,rowcounter)
		 %>
          <tr>
           <td align="center"><% = userId %></td>
           <td  align="center"><% = quoteId %></td>
            <td  align="center"><% = sentDate %></td>
            <td  align="center"><% 
			strCompanyName = "SELECT CompName FROM QW_Company WHERE CompId = '"& companyId &"'"
			objRs.Open strCompanyName, ConnObj
			If Not objRs.EOF Then
			Response.Write(objRs("CompName"))
			End If
			objRs.Close
			 %></td>
			<td  align="center"><% = tax %></td>
			<td  align="center"><% = totalAmount %></td>			
            <td><form name="comment" action="/Quotewerks/addQuoteComments.asp" method="post" onSubmit="return Form_Validator(this)">
                <input type="hidden" name="quoteid" value="<% = quoteId %>">
                <Textarea name="comment" rows="5" cols="20" ></Textarea>
                <BR />
                <input type="hidden" name="action" value="<% = rqAction %>" />
                <input type="hidden" name="page" value="<% = rqPage %>" />
                <input type="hidden" name="row" value="<% = rqRow %>" />
                <input type="hidden" name="state" value="<% = rqState %>" />
                <input type="submit" name="type" value="Save">
                <% If rqAction <> "closed" Then %>
                <input type="submit" name="type" value="Close" />
                <% End If %>
              </form></td>
            <td><iframe src="/Quotewerks/viewQuoteComments.asp?quoteId=<% = quoteId %>" frameborder="0" height="100" scrolling="yes" width="200"></iframe></td>
            
            
            <form name="comment" action="/Quotewerks/addQuoteComments.asp" method="post" onSubmit="return Form_Validator1(this)">
              <input type="hidden" name="quoteid" value="<% = quoteId %>">
              <input type="hidden" name="action" value="<% = rqAction %>" />
              <input type="hidden" name="page" value="<% = rqPage %>" />
              <input type="hidden" name="row" value="<% = rqRow %>" />
              <input type="hidden" name="state" value="<% = rqState %>" />
              <td><br />
                <select name="status" id="status_<%=index %>" onChange="visible_text(<%=index %>)">
                  <option value="">--Select--</option>
                  <% If quoteStatus <> "In Process" Then %>
                  <option value="In Process">In Process</option>
                  <% End If %>
                  <% If quoteStatus <> "Quote Sent" And quoteStatus <> "P O Received" And quoteStatus <> "Invoice Sent" And quoteStatus <> "Payment Received" Then %>
                    <option value="Quote Sent">Quote Sent</option>
                  <% End If %>
                  <% If quoteStatus <> "P O Received" And quoteStatus <> "Invoice Sent" And quoteStatus <> "Payment Received" Then %> 
                    <option value="P O Received">P O Received</option>
                  <% End If %> 
                  <% If quoteStatus <> "Invoice Sent" And quoteStatus <> "Payment Received" Then %>
                    <option value="Invoice Sent">Invoice Sent</option>
                  <% End If %>  
                  <% If quoteStatus <> "Payment Received" Then %>
                    <option value="Payment Received">Payment Received</option>
				  <% End If %>
                  <% If quoteStatus <> "Quote Cancelled" Then %>                    
                    <option value="Cancelled">Quote Cancelled</option>
				  <% End If %>                    
                </select>
                <br />
                <br />
             <input type="hidden" name="index" value="<%=index %>">
          <div style="float:left; width: 207px;">
            <label id="la_<%=index %>" style="display:none; width: 55px; float: left;" >PO # : </label><input id="text_<%=index %>" name="text_<%=index %>" type="text" style="display:none" value="<%=arrAllRecords(7,rowcounter) %>"   /></div>
             <br />    <input type="submit" name="type" value="Submit" /></td>
            </form>
            <td><ul>
            <% If quoteStatus = "Quote Sent" OR quoteStatus = "P O Received" OR quoteStatus = "Invoice Sent" or quoteStatus="Payment Received" Then %>
            <li><a href="/Quotewerks/ViewEditQuote.asp?action=View&id=<% = quoteId %>" target="_blank">View Quote</a></li>
            <% End If %>
           
             <% If quoteStatus = "P O Received" OR quoteStatus = "Invoice Sent" Then %>
           <li><a href="/Quotewerks/ViewEditQuote.asp?action=View_PO&id=<% = quoteId %>" target="_blank">View P.O</a></li>
            <% End If %>
            
             <% If quoteStatus = "Invoice Sent" Then %>
            <li><a href="/Quotewerks/ViewEditQuote.asp?action=View_IS&id=<% = quoteId %>" target="_blank">View Invoice</a></li>
            <% End If %>
            </ul>
            </td>
            
             <% If quoteStatus = "P O Received" OR quoteStatus = "Invoice Sent" Then %>
          <td><ul><li><a href="/datrix-enrollment.asp?QuoteID=<% = quoteId %>" target="_blank">Enroll</a></li>
          <li><a href="/datrix-enrollment.asp?State=View&QuoteID=<% = quoteId %>" target="_blank">View Enrolled Users</a></li>
          <li><a href="/backOffice/courses.asp?type=add&brand=Datrix" target="_blank">Add Onsite Classes</a></li>
          </td>  
            <% End If %>
            
            </tr> 
 <% Next %>
            <tr id="htMap">
              <td colspan="12"><!--#include virtual="/Quotewerks/includes/pagination.asp"-->
               <% 
			   If rqUserId <> "" Then
			    ps = getPaginationString(page, (numRows + 1), 10, 2, "generateReport.asp?action="&rqAction&"&category="& rqCategory &"&userId="&rqUserId)
			   ElseIf rqCompId <> "" And rqCompId <> 0 Then
			    ps = getPaginationString(page, (numRows + 1), 10, 2, "generateReport.asp?action="&rqAction&"&category="& rqCategory &"&compId="&rqCompId)
			   ElseIf rqFromDate <> "" Then
			    ps = getPaginationString(page, (numRows + 1), 10, 2, "generateReport.asp?action="&rqAction&"&category="& rqCategory &"&fromDate="&rqFromDate&"&toDate="&rqToDate)
			   Else
			    ps = getPaginationString(page, (numRows + 1), 10, 2, "generateReport.asp?action="&rqAction&"&category="& rqAction)
			   End If
				  Response.Write(ps)
	           %>
              
                 <% = ((firstRow + 1) & " - " & (lastRow + 1) & " of " & (numRows + 1)) %>
              </td>
            </tr>                 
          <% End If%>
    </table>

    </fieldset>
    </div>
    </td>
    </tr>
    <% End If %>
</Body>
<!-- Body Ends -->
