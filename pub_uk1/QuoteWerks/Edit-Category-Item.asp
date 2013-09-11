<!--#include virtual="/QuoteWerks/includes/header.asp"-->
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->
<!--#include virtual="/QuoteWerks/includes/pagination.asp"-->
<% 
	If Session("QWUserName") = "" Then 
		Response.Redirect("default.asp")
     End if
	
%>


<head>


<link href="/QuoteWerks/css/leftNavi.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/form.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/mainContent.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="/QuoteWerks/js/get_category.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            height: 181px;
        }
    </style>
</head>
 <%
  dim x,l,m,n
  dim a
  Set objRs2 = Server.CreateObject("ADODB.Recordset")
  Set objRs5 = Server.CreateObject("ADODB.Recordset") 
      Dim i,j
      'rs.open SQL, ConnObj
     
     'added by Saubhik
if request.QueryString("opt") <> "" then
   option_crm=request.QueryString("opt")
  session("opt")=option_crm
     end if
     if  session("opt")="" then
     Response.Redirect("Choose_option.asp?qid="&request.QueryString("qid"))
     end if

if request.QueryString("qid") <> "" then
     a=request.QueryString("qid")
     Session("qid_edit")=a
     SQL5="select countryId v from QW_QuoteOverview where quoteId = '"&a&"' "
objRs5.Open SQL5, ConnObj
      While Not objRs5.EOF
     Session("country")=objRs5("v")
objRs5.MoveNext
    wend
     objRs5.Close
 SQL = "SELECT distinct itemName b,itemCode a FROM QW_QuoteDetails where quoteId = '"&a&"' "
     
 'objRs2.Open SQL, ConnObj
'response.write(strEmpDet1)
else if request.Form("ids")<> "" then

      x=request.Form("ids")
'response.Write("else"&x)
     SQL = "SELECT ManufacturerPartNumber a,TittleDescription b FROM [QW_category] where ManufacturerPartNumber in ("& x &")"
  
end if	 
end if
objRs2.Open SQL, ConnObj
'response.Write(SQL)
  %>
  <body onLoad="load_category();create();">
    <tr>
      <td width="170px" align="left" valign="top" style=" border-right:#CCC thin solid;"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftNavigation" width="170">
          <!--#include virtual="/QuoteWerks/includes/LeftMenu.asp"-->
        </table></td>
      <td width="730" align="left" valign="top"  style="padding-left:5px; padding-right:5px" height="450px">
	  
	  <div id="styledForm" class="myform">
	  <center>
   <div>
    
   
     
	 <table width="366" height="244">
         <tr>
             <td class="auto-style1"> </td><td class="auto-style1"></td>
         <td class="auto-style1"><div id="styledForm1" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <button type="submit"  name="type1" value="Add1"  onClick="select_element('V2')" >&nbsp; Next</button>&nbsp; </div></td></tr>
	 <tr>
	 <td>Select Course Type</td>
	 <td>
	 <select name="category" id="category" onChange="load_titledesp(this.value);" >
         <option  value="Select category">Select Course Type</option>
       </select>
  
	 </td>
	 </tr>
    <td width="43"><select name="select" size="10" multiple id="s" >
     <option value=""></option>
    </select></td>
<td width="18" valign="center">
 <center>
 <div>
 <button type="submit" name="type" value="Add"  onClick="listbox_moveacross('s', 'd')">Add >></button><br><br>
 </div>
 <div>
 <button type="submit" onClick="listbox_moveback('d', 's')" value="Cancel"> << Remove </button>
 </div>
</center></td>
<td width="69"><select name="select2" size="10" multiple id="d">
 <%
 While Not objRs2.EOF
 %>
<option value="<%=objRs2("a")%>"><%=objRs2("b")%> &nbsp;(<%=objRs2("a")%>)</option>
<%
objRs2.MoveNext
wend
objRs2.Close
%>
</select></td>

</tr>
<tr>
<td></td> 
 <td align="right"></td>
</tr>
</table>
</center>

     </div>

    </table>
  </td>
  </tr>
  <tr>
 
  </tr>
  </table>
</body>

<!--#include virtual="/QuoteWerks/includes/connectionClose.asp"-->
<!-- Body Ends -->
