<!--#include virtual="/QuoteWerks/includes/header.asp"-->
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->
<!--#include virtual="/QuoteWerks/includes/pagination.asp"-->
<% 
	If Session("QWUserName") = "" Then 
		Response.Redirect("default.asp")
     End if
     Dim rqcountry
       if Request.Form("country")<> "" then
        rqcountry = Request.Form("country")
        Session("country") = rqcountry
        end if
	
%>


<link href="/QuoteWerks/css/leftNavi.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/form.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/mainContent.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="/QuoteWerks/js/get_category.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
  <%

  dim x,l,m,n
     x=request.Form("ids")
	 
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
	 <td>Select Category</td>
	 <td>
	 <select name="category" id="category" onChange="load_titledesp(this.value);" >
         <option  value="Select category">Select Category</option>
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
<%
if x <>"" then
	 'response.Write(x)
	 Set rs = Server.CreateObject("ADODB.Recordset")
    SQL = "SELECT ManufacturerPartNumber a,TittleDescription b FROM [QW_category] where ManufacturerPartNumber in ("& x &")"

      Dim i,j
      rs.open SQL, ConnObj

	 end if
  
%>
<td width="69"><select name="select2" size="10" multiple id="d">
 <%
if x <>"" then
 While Not rs.EOF
 %>
<option value="<%=rs("a")%>"><%=rs("b")%> &nbsp;(<%=rs("a")%>)</option>
<%
rs.MoveNext
wend
end if
%>
</select></td>

</tr>
<tr>
<td></td> 
 <td align="right"></td>
</tr>
</table>
</center>
<center> <div id="styledForm1" class="myform"> <button type="submit"  name="type1" value="Add1"  onClick="select_element('V1')" >Next</button></div></center>

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
