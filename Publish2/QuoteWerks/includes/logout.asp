<td width="2%">&nbsp;</td>
<td width="25%" class="general-body"><table width="100%" border="0" cellspacing="0" cellpadding="0" >
    <tr>
      <td class="LeftLinks"><a href="/hotelbooking/home.asp">Home &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    <tr>
      <td class="LeftLinks"><a href="/hotelbooking/overview.asp">Overview &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
   
    <% If Session("Accessgranted") <> "Booking Manager" AND Session("Accessgranted") <> "Agent"  Then %>
    <tr>
      <td class="LeftLinks"><a href="/hotelbooking/country.asp">Countries &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    <tr>
      <td class="LeftLinks"><a href="/hotelbooking/website.asp">Website &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    <tr>
      <td class="LeftLinks"><a href="/hotelbooking/websiteCountry.asp">Assign Website &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    <tr>
      <td class="LeftLinks"><a href="/hotelbooking/zone.asp">Zone &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    <tr>
      <td class="LeftLinks"><a href="/hotelbooking/state.asp">States &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    <tr>
      <td class="LeftLinks"><a href="/hotelbooking/city.asp">Cities &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    
    <tr>
      <td class="LeftLinks"><a href="/hotelbooking/users.asp">Users &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    
    <tr>
      <td class="LeftLinks"><a href="/hotelbooking/bookingmgr.asp">Booking Managers &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    <% End If %>
    <tr>
      <td class="LeftLinks"><a href="/hotelbooking/hotels.asp"> <% If Session("Accessgranted") = "Booking Manager" Then %>Agent <% Else %>Hotels<% End If %> &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    <tr>
      <td class="LeftLinks"><a href="/hotelbooking/classes.asp">Classes &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    <tr>
      <td class="LeftLinks"><a href="/hotelbooking/changepassword.asp">Change Password &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    <tr>
      <td class="LeftLinks"><a href="/hotelbooking/logout.asp">Logout &nbsp;&nbsp;&nbsp;</a></td>
    </tr>    
  </table></td>
</td>
