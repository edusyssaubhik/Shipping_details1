<!--#include virtual="/QuoteWerks/includes/header.asp"-->
<!--#include virtual="/QuoteWerks/includes/connection.asp"-->
<!--#include virtual="/QuoteWerks/includes/pagination.asp"-->
<% 
	If Session("QWUserName") = "" Then 
		Response.Redirect("default.asp")
     End if
	
%>


<link href="/QuoteWerks/css/leftNavi.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/form.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/mainContent.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="/QuoteWerks/js/get_category.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    function load_update(x) {
        //update by Saubhik
        if(document.getElementById("replace").value!="select")
        {
            var option=document.getElementById("replace").value;
           // window.location = "Edit-Category-Item.asp?qid=" + x+"&opt="+option;
            window.location = "verifylogin.aspx?qid=" + x + "&opt=" + option;
        }
        else
        {
            alert("Please select any one option");
        }
    }

</script> 
<%
  dim x,l,m,n
  dim a
a=""  
if request.QueryString("qid") <> "" then
     a=request.QueryString("qid")
    end if
  %>
  <body onLoad="">
    <tr>
      <td width="170px" align="left" valign="top" style=" border-right:#CCC thin solid;"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftNavigation" width="170">
          <!--#include virtual="/QuoteWerks/includes/LeftMenu.asp"-->
        </table></td>
      <td width="730" align="left" valign="top"  style="padding-left:5px; padding-right:5px" height="450px">
	  
	  <div id="styledForm" class="myform">
	  <center>
   <div>
    
   
     
	 <table width="366" height="244">
	<tr><td colspan="3">
      Select Edit Options (For CRM)
	    </td>
        <td>
            <select name="replace" id="replace">
                <option value="select">---Select---</option>
                <option value="R1">Replace Quotes in CRM</option>
                <option value="A1">Add new Quote(Without Replacement) in CRM</option>
            </select><br /><br />
 <button type="submit" name="type" value="Add"  onClick="return load_update(<%=a%>);">Edit</button>
        </td>

	</tr>
           </table>
</body>

<!--#include virtual="/QuoteWerks/includes/connectionClose.asp"-->
<!-- Body Ends -->
