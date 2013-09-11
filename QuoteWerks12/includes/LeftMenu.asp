<td width="2%">&nbsp;</td>
<td width="25%" class="general-body">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" >
  
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/home.asp">Home &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    <% If Session("QWTypeofuser") = "Admin" Then %>
    
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/companyDetails.asp">Add Company Details &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/category.asp">Add Category &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/ViewEditcategory.asp">View/Edit Category &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
     <tr>
      <td class="LeftLinks"><a href="/Quotewerks/Category-Items.asp">Create Quote &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
     <tr>
      <td class="LeftLinks"><a href="/Quotewerks/ViewEditQuote.asp">view qoute &nbsp;&nbsp;&nbsp;</a></td>
    </tr> 
     <tr>
      <td class="LeftLinks"><a href="/Quotewerks/generateReport.asp">Generate Report &nbsp;&nbsp;&nbsp;</a></td>
    </tr> 
    
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/users.asp">Users &nbsp;&nbsp;&nbsp;</a></td>
    </tr>   
     <% Else %>
     
      <tr>
      <td class="LeftLinks"><a href="/Quotewerks/companyDetails.asp">Add Company Details &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/category.asp">Add Category &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/ViewEditcategory.asp">View/Edit Category &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/Category-Items.asp">Create Quote &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/users.asp">View/Edit Users &nbsp;&nbsp;&nbsp;</a></td>
    </tr>  
    
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/generatequote.asp">Generate qoute &nbsp;&nbsp;&nbsp;</a></td>
    </tr>  
    <% End If %>
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/changepassword.asp">Change Password &nbsp;&nbsp;&nbsp;</a></td>
    </tr>   
     <tr>
      <td class="LeftLinks"><a href="/Quotewerks/logout.asp">Log Out &nbsp;&nbsp;&nbsp;</a></td>
    </tr>    
  </table>
</td>
