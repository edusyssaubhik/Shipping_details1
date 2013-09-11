<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    

<link rel="stylesheet" type="text/css" href="/QuoteWerks/css/Styles.css">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }
        .auto-style2 {
            border: #bfbfbf 1px solid;
            height: 20px;
        }

        
#quote-container
{
	width:898px;
	height:auto;
	background-color:#fff;
	border:#CCC 1px solid;

}
#quote-wrapper
{
	width:898px;
	height:auto;


}
#quote-header
{
	width:860px;
	height:65px;
	font-family:Arial, Helvetica, sans-serif;
	font-size:11px;
	margin-left:19px;
	margin-top:26px;
}
#quote-sellingchart
{
	width:866px;
	height:170px;
	font-family:Arial, Helvetica, sans-serif;
	font-size:10px;
	margin-left:16px;
}
#quote-descriptionchart
{
	width:866px;
	height:auto;
	font-family:Arial, Helvetica, sans-serif;
	font-size:10px;
	margin-left:16px;
	margin-bottom:20px;
}
#quote-lowerbody
{
	width:866px;
	height:160px;
	font-family:Arial, Helvetica, sans-serif;
	font-size:10px;
	margin-left:16px;

}
#quote-left
{
    float:left;
	
}

#quote-middle
{
	width:187px;
    float:left;
	padding-left:260px;
}
#quote-right
{
	width:162px;
    float:right;
}
#quote-footer
{
	width:866px;
	height:52px;
	font-family:Arial, Helvetica, sans-serif;
	font-size:10px;
	margin-left:16px;
	border-top:#999 1px solid;
	text-align:center;
	color:#666;
	padding-top:10px;

}

#quote-footer-left
{
	width:250px;
	float:left;
	font-size:10px;
	padding-top:8px;
	color:#666;
    text-align:left;
}
#quote-footer-right
{
	width:200px;
	float:right;
	font-size:10px;
	padding-top:16px;
	color:#666;
    text-align:right;
}

.titlebackground
{
	background:#efefef;
	border:#bfbfbf 1px solid;
	padding-left:4px;
} 
.title-border
{
	border:#bfbfbf 1px solid;
}

.small-text
{ font-size:10px;
 
}
.borderbottom
{
	border-bottom:#333 1px solid;
}
.quote-box
{
	background:#efefef;
	border:#bfbfbf 1px solid;
	padding:10px 0px 10px 8px;
}
.quote-discountbox-up
{
	width:155px;
	height:68px;
	border:#CCC 1px solid;
	padding:4px;
}

.quote-discountbox-down
{
	width:157px;
	height:20px;
	background:#efefef;
	margin-top:4px;
	padding:3px;
	border:#bfbfbf 1px solid;
}






    </style>
</head>
<body>
    <div id="quote-container">
<div id="quote-wrapper">
  <div id="quote-header">
     <table width="100%" border="0" cellspacing="0" cellpadding="0" height="65px">
         <tr>
           <td width="210px" valign="top"><img src="/QuoteWerks/images/logo.jpg" /></td>
           <td width="420px" valign="top">N1 Chorley Business & Technology Centre Euxton Lane, Chorley PR7 6TE</br> Phone: 0800 7810626 Fax: 01257           270478</td>
           <td valign="top"><img src="/QuoteWerks/images/quote.jpg" align="right"/>
             <table width="100%" border="0" cellspacing="0" cellpadding="0">
             
               <% 
			 'For rowcounter = firstRow To lastRow 
			 
		  %>
  <tr>
    <td style="text-align:right; padding-top:6px;"><b>Quote Number</b></td>
    <td style="text-align:right; padding-top:6px;"><b><% =quoteno %></b></td>
  </tr>
  <tr>
    <td style="text-align:right; padding-top:6px;"><b>Date</b></td><% date_create=rqcreatedate  
        'response.Write(MonthName(Month(date_create),3)&"gogole")
        %>
    <td style="text-align:right; padding-top:6px;"><b><% =MonthName(Month(date_create),3) & " " & DAY(date_create) & ", "  & YEAR(date_create)%></b></td>
  </tr>
</table>

           </td>
        </tr>
    </table>

  </div>
  




  <div id="quote-sellingchart">
     <table width="100%" border="0" cellspacing="6" cellpadding="0" height="170px">
  <tr>
    <td valign="top" class="titlebackground" width="226" height="18">Sold To</td>
    <td valign="top" class="titlebackground" width="226" height="18">Ship To</td>
    <td valign="top" width="226">&nbsp;</td>
    <td valign="top" class="titlebackground" width="226">Your Account Manager</td>
  </tr>
   <tr>
   
   
    <td valign="top">
<% =Session("sold_name1") %><br /><% =Session("email1") %><br />
<% =Session("SoldAddress")  %><br />   

      Phone:  <%=Session("ph1")%></td>
  
   
    <td valign="top">
<% =Session("ship_name1") %><br />
<% =Session("email2") %><br /> <% =Session("ShipAddress")  %> <br />    Phone:<%=Session("ph2")%>  </td>
    <td valign="top" class="small-text"><b>To accept this quotation, please tick
    required line items, enter a PO number,
    sign & date below and return.</b><br /><br />
    
    <b>Please email us if your organisation does
    not use PO numbers.</b></td>
    <td valign="top" align="center"><img src="UserImage/<%=id1 %>/<%=id1 %>_image.jpg" height="60" width="60" /><br /><img src="UserSign/<%=id1 %>/<%=id1 %>_sign.jpg" height="20" width="20" /><br /><b><% = rqfirstname%>&nbsp;<%= rqlastname%></b> <br /><br /> <b><% =rqofficialemailid %></b> <br /><br /> <b><% =rqphoneno %> </b></td>
  </tr>
</table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="titlebackground" width="70" width="226" height="18"><b>P.O. Number</b></td>
    <td width="150px">&nbsp;</td>
    <td class="titlebackground" width="70" width="226" height="18"><b>Terms</b></td>
    <td>14 days before course, or 30 days from invoice, whichever is sooner</td>
    <td>&nbsp;</td>
  </tr>
</table>
  </div>
  
  
<div id="quote-descriptionchart">
  <table width="100%" border="0" cellspacing="2" cellpadding="0">
  <tr>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
    <td height="20">&nbsp;</td>
  </tr>
 
  <tr>
    <td valign="top" width="24" class="auto-style1"></td>
    <td valign="top" width="33" class="auto-style2" align="center"><b>Line</b></td>
    <td valign="top" width="38" class="auto-style2" align="center"><b>Qty</b></td>
    <td valign="top" width="70" class="auto-style2" align="center"><b>Course Code</b></td>
    <td valign="top" width="335" class="auto-style2" align="center"><b>Description</b></td>
   <td valign="top" width="53" class="auto-style2" align="center"><b>Date</b></td>
    <td valign="top" width="63" class="auto-style2" align="center"><b>Location</b></td>
    <td valign="top" width="30" class="auto-style2" align="center"><b>Days</b></td>
    <td valign="top" width="41" class="auto-style2" align="center"><b>RRP <% = currency1%> </b></td>
    <td valign="top" width="49" class="auto-style2" align="center"><b>Discount</b></td>
    <td valign="top" width="41" class="auto-style2" align="center"><b>Unit <% = currency1%></b></td>
    <td valign="top" width="49" class="auto-style2" align="center"><b>Total</b></td>
  </tr>
    <% 
	'Dim item_id,sql1
		   'item_id=""
	       dim  SrNo,id,code ,add
		   add = 0.00
		   SrNo=1
        Set Rs6  = Server.CreateObject("ADODB.Recordset")
        Set Rs7 = Server.CreateObject("ADODB.Recordset")
   
   			 For rowcounter = firstRow To lastRow 
			 
			
			 id=arrAllUsers(22,rowcounter)
		     code=arrAllUsers(4,rowcounter)

        'newly aaded calculation of rrp,dis
		 add=CDBL(CDBL(add)+CDbl(arrAllUsers(14,rowcounter)))
       dim x,rrp,discount,unit,rrp1,dis1,unit1
          x=CDbl(arrAllUsers(7,rowcounter))
         rrp=CDbl(arrAllUsers(8,rowcounter))
        discount=CDbl(arrAllUsers(10,rowcounter))
         unit=CDbl(arrAllUsers(11,rowcounter))
         rrp1=CDbl(rrp/x)
         dis1=CDbl(discount/x)
         unit1=CDbl(unit/x)
        
        	'item_id=item_id &"'"&arrAllUsers(4,rowcounter)&"',"
		  %>
  <tr>
    <td valign="top" width="24" class="title-border" >&nbsp;</td>
    <td valign="top" width="33" align="center"><% = SrNo %></td>
    <td valign="top" width="38" align="center"><% = arrAllUsers(7,rowcounter) %></td>
    <td valign="top" width="63" align="center" ><% = arrAllUsers(4,rowcounter) %></td>
    <td valign="top" width="344" align="center"><% = arrAllUsers(3,rowcounter) %></td>
      
   <td valign="top" width="53" align="center">
        <% if id ="0" then %>
            N/A
        <% else if id <> "" then 
          '  response.Write(id)
             strq="select b.city ci,b.startdate st,b.enddate ed from course b  where b.courseid="&id&""
      '     response.Write(strq)
            Rs6.Open strq,ConnObj

	  If Not Rs6.EOF Then
            city=Rs6("ci")
            st=Rs6("st")
            ed=Rs6("ed")
            %>
        <%=st %> &nbsp; to &nbsp <%=ed %>
        <%
       end if 
        Rs6.Close
       else if id="" then 
        %>
        N/A
        <%  end if 
            end if 
            end if 
            %>
    </td>
    <td valign="top" width="63" align="center"><% if city<>"" then %><%=city %> <%else %>N/A <% end if  
      
          city=""%></td>-->
    <td valign="top" width="30" align="center">
        <%
            

            strq1="select CustomNumber01 a from QW_Category  where  ManufacturerPartNumber='"&code&"'"
          '  response.Write(strq)
            Rs7.Open strq1,ConnObj

	  If Not Rs7.EOF Then
           
             %>
       <%=Rs7("a") %>
         <%
         end if 
        Rs7.Close
                     
                        
             %>
         </td>
    <td valign="top" width="41" align="center"><%=currency1%><% = rrp1 %></td>
    <td valign="top" width="49" align="center"><%=currency1%><% = dis1 %></td>
    <td valign="top" width="41" align="center"><%=currency1%><% = unit1 %></td>
    <td valign="top" width="49" align="center"><%=currency1%><% = arrAllUsers(11,rowcounter) %></td>

  </tr>
  <% 

   SrNo = SrNo + 1
   
  Next
'  if item_id<>"" then
'  item_id=Left(item_id,Len(item_id)-1)
'  end if
  %> 
</table>
 
 
</div> 
 
 
 <div id="quote-lowerbody">
   <div id="quote-left">
   <input type="hidden"  id="id3" value="<%=item_id %>" />
     <div style="margin-left:-26px;">I am authorised to place this order:</div>
       <table width="192" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="36" height="22">Signature:</td>
    <td class="borderbottom" height="22">&nbsp;</td>
  </tr>
  <tr>
    <td width="36" height="22">Date:</td>
    <td class="borderbottom" height="22">&nbsp;</td>
  </tr>
  <tr>
    <td width="36" height="22">Name:</td>
    <td class="borderbottom" height="22">&nbsp;</td>
  </tr>
  <tr>
    <td width="36" height="22">Position:</td>
    <td class="borderbottom" height="22">&nbsp;</td>
  </tr>
</table>


   </div>
   
    <div id="quote-middle">
      <div class="quote-box">
        <b>Please note: discounts are applied
assuming prompt payment and will be
removed from overdue invoices.</b>
      </div>
   </div>
   
    <div id="quote-right">
       <div class="quote-discountbox-up">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><b>RRP Total</b></td>
    <td align="right"><%=currency1%><%= rqtotalActualPrice%></td>
  </tr>
  <tr>
    <td><b>Discount Total</b></td>
    <td align="right"><%=currency1%><% = rqtotalDiscount%></td>
  </tr>
  <tr>
    <td><b>SubTotal</b></td>
    <td align="right"><%=currency1%><%= rqtotalsellingPrice %></td>
  </tr>
  <tr>
    <td><b>VAT</b></td>
    <td align="right"><%=currency1%><%=rqtax%></td>
  </tr>
   <tr>
    <td><b>Total Shipping Charge</b></td>
    <td align="right"><%=currency1%><%=add%></td>
  </tr> 
</table>

       </div>
        <div class="quote-discountbox-down">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>Total</td>
    <td><%=currency1%><% = rqtotalAmount%></td>
  </tr>
</table>

       </div>
   </div>
   
 </div>
 
</body>
</html>
