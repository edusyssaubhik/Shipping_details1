<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="new_ship_edit.aspx.cs" Inherits="Shipping_details1.new_ship" %>
<!DOCTYPE html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Quotewerks</title>
<link href="/QuoteWerks/css/leftNavi.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/form.css" rel="stylesheet" type="text/css" />
<link href="/QuoteWerks/css/mainContent.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .auto-style1 {
            height: 46px;
        }
        .auto-style2 {
            height: 87px;
        }
    </style>

</head>
<body style="margin-top:0px;font-size:12px;">
<!--[if lte IE 7]><div style="background-color:#FF9; border-bottom:solid 1px #FC0; color:#333; text-align:center; height:20px !important; font-family:Verdana, Geneva, sans-serif; padding-top:6px;display:block; font-size:12px;">Some of UI elements may not work properly in this browser, so kindly upgrade your browser or use other browser</div><![endif]-->


<table border="0" style="border-bottom:1px solid #ccc;" cellspacing="0" cellpadding="0" width="100%" align="center">
  <tr style="background-color:#fbfcf8;">
 
  <td height="100px" colspan="2" align="right" valign="middle" style="border-bottom:#CCC thin solid;">
  <img src="/Quotewerks/images/logotop.png" width="170" height="54"  align="left" style="padding-left:20px"/>
    <p style="padding-right:20px; font-family:Verdana, Geneva, sans-serif; font-size:20px; color:#556018; display:inline">
	Welcome to Datrix QuoteWerks</p><br /><br /><br />
	<span class="welcome_user">Welcome&nbsp; <asp:Label ID="Label143" runat="server" Text=""></asp:Label>| <label id="header"> <a href="/Quotewerks/logout.asp">Logout</a></label>&nbsp; &nbsp;&nbsp;&nbsp;</span>
	</td>
  </tr>

<form id="form2" runat="server">
    <div>
    
        
<tr>
  <td width="170px" align="left" valign="top" style=" border-right:#CCC thin solid;">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftNavigation" >
      
<td width="2%">&nbsp;</td>
<td width="25%" class="general-body">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" >
  
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/home.asp">Home &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    <% 
        String que3 = "";
        try
        {

            que3 = Request.QueryString["que3"].ToString();
        }
        catch (Exception r) { }
          if(que3.Equals("Admin")) 
            {
        %>
    
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/companyDetails.asp">Add Company Details &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/category.asp">Add Item &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
    
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/ViewEditcategory.asp">View/Edit Item &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
     <tr>
      <td class="LeftLinks"><a href="/Quotewerks/Category-Items.asp">Create Quote &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
     <tr>
      <td class="LeftLinks"><a href="/Quotewerks/ViewEditQuote.asp">view/Edit Qoute &nbsp;&nbsp;&nbsp;</a></td>
    </tr> 
     <tr>
      <td class="LeftLinks"><a href="/Quotewerks/generateReport.asp">Generate Report &nbsp;&nbsp;&nbsp;</a></td>
    </tr> 
    
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/users.asp">Users &nbsp;&nbsp;&nbsp;</a></td>
    </tr>   
     <% 
     }
     else
         {
         %>
     
        <tr>
      <td class="LeftLinks"><a href="/Quotewerks/companyDetails.asp">Add Company Details &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
   <!-- 
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/category.asp">Add Item &nbsp;&nbsp;&nbsp;</a></td>
    </tr>-->
    
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/ViewEditcategory.asp">View Item &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
     <tr>
      <td class="LeftLinks"><a href="/Quotewerks/Category-Items.asp">Create Quote &nbsp;&nbsp;&nbsp;</a></td>
    </tr>
     <tr>
      <td class="LeftLinks"><a href="/Quotewerks/ViewEditQuote.asp">view/Edit Qoute &nbsp;&nbsp;&nbsp;</a></td>
    </tr> 
     <tr>
      <td class="LeftLinks"><a href="/Quotewerks/generateReport.asp">Generate Report &nbsp;&nbsp;&nbsp;</a></td>
    </tr> 
    
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/users.asp">Account Details &nbsp;&nbsp;&nbsp;</a></td>
    </tr>  
    <%    }
            %>
    <tr>
      <td class="LeftLinks"><a href="/Quotewerks/changepassword.asp">Change Password &nbsp;&nbsp;&nbsp;</a></td>
    </tr>   
     <tr>
      <td class="LeftLinks"><a href="/Quotewerks/logout.asp">Log Out &nbsp;&nbsp;&nbsp;</a></td>
    </tr>    
  </table>
</td>


    </table></td>
  <td align="center" valign="top" height="450px">
 
  <div class="myform" id="shipMain">
  








        &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse;width:100%; height: 795px;">
            <tr>
                <td style="width:33%; vertical-align:top"> 
                   <table style="height: 294px">
                       <tr>
                           <td>
                               Sold to
                           </td>
                           <td>
                                   <asp:DropDownList ID="DropDownList38" runat="server" AutoPostBack="True" Height="16px" OnSelectedIndexChanged="DropDownList38_SelectedIndexChanged" Width="170px">
                                   <asp:ListItem>Select</asp:ListItem>
                                   <asp:ListItem>Search From CRM</asp:ListItem>
                               </asp:DropDownList>
                           

                           </td>
                       </tr>
                       <tr>
                           <td class="auto-style27">

                <asp:Label ID="Label1" runat="server" Text=" Company Name" Font-Size="X-Small" Visible="False"></asp:Label>

                               <asp:Label ID="Label144" runat="server" Text="Search by Last Name" Font-Size="X-Small" Visible="False"></asp:Label>

                           </td>
                           <td class="auto-style28">

                               <asp:DropDownList ID="DropDownList18" runat="server"  OnSelectedIndexChanged="DropDownList18_SelectedIndexChanged" Width="172px" AutoPostBack="True" Visible="False">
                               </asp:DropDownList>

                           &nbsp;&nbsp;
                               <br />
&nbsp;
                               <asp:TextBox ID="TextBox5" runat="server" AutoPostBack="True" OnTextChanged="TextBox5_TextChanged" Visible="False" Width="165px"></asp:TextBox>

                           </td>
                       </tr>
                       <tr>
                           <td style="margin-left: 40px" class="auto-style8">
                <asp:Label ID="Label2" runat="server" Text="Enter Company name" Visible="False"></asp:Label>
                           </td>
                       <td>
                    &nbsp;
                    <asp:TextBox ID="TextBox1" runat="server" Width="163px" Enabled="False" Visible="False" AutoPostBack="True" ></asp:TextBox>
                           </td>
                       </tr>
                       <tr>
                           <td class="auto-style8">

                               <asp:Label ID="Label42" runat="server" Text="Enter Address" Visible="False"></asp:Label>
                           </td>
                           <td>

                               <asp:DropDownList ID="DropDownList19" runat="server"  OnSelectedIndexChanged="DropDownList19_SelectedIndexChanged" Width="172px" AutoPostBack="True" Visible="False">
                               </asp:DropDownList>

                               <br />

                           </td>

                       </tr>
                       <tr>
                           <td class="auto-style29">
                <asp:Label ID="Label12" runat="server" Text="Enter Company details:" Visible="False"></asp:Label>
                           </td>
                       <td class="auto-style32"></td>
                       </tr>
                       <tr>
                           <td class="auto-style8">
                <asp:Label ID="Label4" runat="server" Text="Full Name" Visible="False"></asp:Label>
                           </td>
                       <td>
                           <asp:DropDownList ID="DropDownList20" runat="server" OnSelectedIndexChanged="DropDownList20_SelectedIndexChanged" Width="181px" AutoPostBack="True" Visible="False">
                           </asp:DropDownList>
                           <asp:DropDownList ID="DropDownList35" runat="server" AutoPostBack="True" Height="35px" OnSelectedIndexChanged="DropDownList35_SelectedIndexChanged" Visible="False" Width="178px">
                           </asp:DropDownList>
                           <br />
                           </td>
                       </tr>
                       <tr>
                           <td class="auto-style8">
                <asp:Label ID="Label5" runat="server" Text="email ID" Visible="False"></asp:Label>
                           </td>
                       <td>
                           <asp:DropDownList ID="DropDownList21" runat="server" Width="177px" Visible="False" OnSelectedIndexChanged="DropDownList21_SelectedIndexChanged" Height="17px">
                           </asp:DropDownList>
                           <asp:DropDownList ID="DropDownList36" runat="server" AutoPostBack="True" Height="40px" Visible="False" Width="175px">
                           </asp:DropDownList>
                           <br />
                           </td>
                       </tr>
                       <tr>
                           <td class="auto-style8">
                <asp:Label ID="Label6" runat="server" Text="phone no" Visible="False"></asp:Label>
                           </td>
                       <td>
                           <asp:DropDownList ID="DropDownList22" runat="server" OnSelectedIndexChanged="DropDownList22_SelectedIndexChanged"  Width="176px" Visible="False" Height="17px">
                           </asp:DropDownList>
                           <asp:DropDownList ID="DropDownList37" runat="server" AutoPostBack="True" Height="20px" Visible="False" Width="170px" OnSelectedIndexChanged="DropDownList37_SelectedIndexChanged">
                           </asp:DropDownList>
                           <br />
                           </td>
                       </tr>
                       <tr>
                           <td class="auto-style8">
                <asp:Label ID="Label7" runat="server" Text="Enter Fax No" Visible="False"></asp:Label>
                           </td>
                       <td>
                           <asp:DropDownList ID="DropDownList23" runat="server" OnSelectedIndexChanged="DropDownList23_SelectedIndexChanged"  Width="177px" Visible="False">
                           </asp:DropDownList>
                           <br />
                           </td>
                       </tr>
                       <tr>
                           <td class="auto-style8"></td>
                       <td>
                           &nbsp;</td>
                       </tr>
                       <tr>
                           <td class="auto-style8"></td>
                       <td>
                           <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Submit"  Visible="False" Width="152px" />
                           </td>
                       </tr>
                       <tr>
                           <td class="auto-style26"></td>
                       <td class="auto-style16" >
                           <asp:Panel ID="Panel1" runat="server" >
                               <asp:Label ID="Label30" runat="server"></asp:Label>
                               <br />
                               <asp:Label ID="Label28" runat="server"></asp:Label>
                               <br />
                               <asp:Label ID="Label31" runat="server"></asp:Label>
                               <br />
                               <asp:Label ID="Label32" runat="server"></asp:Label>
                               <br />
                               <asp:Label ID="Label33" runat="server"></asp:Label>
                               <br />
                               <asp:Label ID="Label34" runat="server"></asp:Label>
                           </asp:Panel>
                           </td>
                       </tr>
      
                   </table>
                </td>
                <td style="width:33%; vertical-align:top">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label10" runat="server" Text="Ship To"></asp:Label>


                                <table>
                        <tr>
                            <td class="auto-style24">


                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                

                                </td>
                            <td class="auto-style25">
                                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" Enabled="False" OnCheckedChanged="CheckBox1_CheckedChanged1" Text="Same as 'Sold to' address" />
                            </td>

                        </tr>
                        <tr>
                            <td class="auto-style37">


                                <asp:GridView ID="GridView1" runat="server">
                                </asp:GridView>


                                </td>
                            <td class="auto-style38">
                                <asp:Label ID="Label35" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label36" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label37" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label38" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label39" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label40" runat="server"></asp:Label>
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </td>

                        </tr>
                        <tr>
                            <td class="auto-style2">


                                <br />
                                <br />
                                <asp:Label ID="Label145" runat="server" Font-Size="X-Small" Text="Search By Last Name" Visible="False"></asp:Label>


                                </td>
                            <td class="auto-style2">
                                <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Enabled="False" OnCheckedChanged="CheckBox22_CheckedChanged" Text="Add New Address" />
                                <br />
                                   <asp:DropDownList ID="DropDownList39" runat="server" AutoPostBack="True" Height="16px" OnSelectedIndexChanged="DropDownList39_SelectedIndexChanged" Width="170px" Visible="False">
                                   <asp:ListItem>Select</asp:ListItem>
                                   <asp:ListItem>Search From CRM</asp:ListItem>
                               </asp:DropDownList>
                           

                                <br />
                                <br />
                                <asp:TextBox ID="TextBox6" runat="server" AutoPostBack="True" OnTextChanged="TextBox6_TextChanged" Visible="False" Width="155px"></asp:TextBox>
                            </td>

                        </tr>
                        <tr>
                           <td style="margin-left: 40px">
                <asp:Label ID="Label13" runat="server" Text="Enter Company name" Visible="False"></asp:Label>
                           </td>
                       <td>
                    <asp:TextBox ID="TextBox2" runat="server" Width="158px" OnTextChanged="TextBox2_TextChanged" Enabled="False" Visible="False"></asp:TextBox>
                           </td>
                        </tr>
                        <tr>
                            <td>

                                <asp:Label ID="Label41" runat="server" Text="Select any Address" Visible="False"></asp:Label>
                            </td>
                            <td>

                                <asp:DropDownList ID="DropDownList24" runat="server" OnSelectedIndexChanged="DropDownList24_SelectedIndexChanged" AutoPostBack="True" Width="151px" Visible="False">
                                </asp:DropDownList>

                            </td>

                        </tr>
                        <tr>
                           <td class="auto-style30">
                <asp:Label ID="Label14" runat="server" Text="Enter Company details:" Visible="False"></asp:Label>
                           </td>
                       <td class="auto-style30"></td>
                        </tr>
                        <tr>
                           <td>
                <asp:Label ID="Label15" runat="server" Text="Enter Name" Visible="False"></asp:Label>
                           </td>
                       <td>
                           <asp:DropDownList ID="DropDownList26" runat="server" OnSelectedIndexChanged="DropDownList26_SelectedIndexChanged" AutoPostBack="True" Width="155px" Visible="False">
                           </asp:DropDownList>
                           <br />
                           <asp:DropDownList ID="DropDownList40" runat="server" AutoPostBack="True" Height="16px" OnSelectedIndexChanged="DropDownList40_SelectedIndexChanged" Visible="False" Width="151px">
                           </asp:DropDownList>
                           </td>
                        </tr>
                        <tr>
                           <td class="auto-style31">
                <asp:Label ID="Label16" runat="server" Text="Enter  email ID" Visible="False"></asp:Label>
                           </td>
                       <td class="auto-style31">
                           <asp:DropDownList ID="DropDownList27" runat="server" OnSelectedIndexChanged="DropDownList27_SelectedIndexChanged" AutoPostBack="True"  Visible="False" Width="154px">
                           </asp:DropDownList>
                           <br />
                           <asp:DropDownList ID="DropDownList41" runat="server" AutoPostBack="True" Height="16px" Visible="False" Width="147px">
                           </asp:DropDownList>
                           </td>
                        </tr>
                        <tr>
                           <td>
                <asp:Label ID="Label17" runat="server" Text="Enter phone no" Visible="False"></asp:Label>
                           </td>
                       <td>
                           <asp:DropDownList ID="DropDownList28" runat="server" OnSelectedIndexChanged="DropDownList28_SelectedIndexChanged" AutoPostBack="True"  Visible="False" Width="155px">
                           </asp:DropDownList>
                           <br />
                           <asp:DropDownList ID="DropDownList42" runat="server" AutoPostBack="True" Height="16px" Visible="False" Width="151px">
                           </asp:DropDownList>
                           </td>
                        </tr>
                        <tr>
                           <td class="auto-style36">
                <asp:Label ID="Label18" runat="server" Text="Enter Fax No" Visible="False"></asp:Label>
                           </td>
                       <td class="auto-style36">
                           <asp:DropDownList ID="DropDownList29" runat="server" OnSelectedIndexChanged="DropDownList29_SelectedIndexChanged" AutoPostBack="True"  Visible="False" Width="156px">
                           </asp:DropDownList>
                           </td>
                        </tr>
                        <tr>
                            <td class="auto-style14">


                                </td>
                            <td class="auto-style15">
                                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Ship" Visible="False" Width="102px" />
                            </td>

                        </tr>
                        <tr>
                            <td class="auto-style17">


                                </td>
                            <td >
                                <asp:Label ID="Label54" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label55" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label56" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label57" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label58" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label59" runat="server"></asp:Label>
                            </td>

                        </tr>
                        <tr>
                            <td class="auto-style9">


                                </td>
                            <td class="auto-style11"></td>

                        </tr>
                        <tr>
                            <td class="auto-style9">


                                </td>
                            <td class="auto-style11"></td>

                        </tr>
                        <tr>
                            <td class="auto-style9">


                                </td>
                            <td class="auto-style11"></td>

                        </tr>
                        <tr>
                            <td class="auto-style12">


                                </td>
                            <td class="auto-style13">
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />

                                <div id="styledForm1" class="myform">
                                <asp:ImageButton ID="ImageButton1" runat="server" Height="30px" ImageUrl="~/QuoteWerks/images/button-next.png" Width="124px" OnClick="ImageButton1_Click" />
                           </div>
                                     </td>

                        </tr>

                    </table>
                </td>
                <td style="width:33%; vertical-align:top">
                    <table>
                        <tr>
                            <td class="auto-style20">


                                &nbsp;</td>
                            <td class="auto-style21">


                <asp:Label ID="Label19" runat="server" Text="Bill To"></asp:Label>


                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style20">


                                &nbsp;</td>
                            <td >
                                <asp:CheckBox ID="CheckBox3" runat="server" AutoPostBack="True" Enabled="False" OnCheckedChanged="CheckBox3_CheckedChanged" Text="Same as 'Sold to' Address" />
                            </td>
                        </tr>
                        <tr>
                            <td >


                            </td>
                            <td >
                                <asp:Label ID="Label27" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label49" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label50" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label51" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label52" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label53" runat="server"></asp:Label>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style34">


                            </td>
                            <td class="auto-style35">
                                <asp:CheckBox ID="CheckBox4" runat="server" AutoPostBack="True" Enabled="False" OnCheckedChanged="CheckBox4_CheckedChanged" Text="Same as Ship to" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style20">


                            </td>
                            <td class="auto-style21">
                                <asp:Label ID="Label43" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label44" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label45" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label46" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label47" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label48" runat="server"></asp:Label>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style20">


                            </td>
                            <td class="auto-style21">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style20">


                            </td>
                            <td class="auto-style21">
                                <asp:CheckBox ID="CheckBox5" runat="server" AutoPostBack="True" Enabled="False" OnCheckedChanged="CheckBox5_CheckedChanged" Text="Add New Address" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style20">


                                <asp:Label ID="Label146" runat="server" Font-Size="X-Small" Text="Search By Last Name" Visible="False"></asp:Label>


                            </td>
                            <td class="auto-style21">
                                <asp:TextBox ID="TextBox7" runat="server" AutoPostBack="True" Height="22px" OnTextChanged="TextBox7_TextChanged" Visible="False" Width="120px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                           <td style="margin-left: 40px" class="auto-style28">
                <asp:Label ID="Label20" runat="server" Text="Enter Company name" ViewStateMode="Disabled" Visible="False"></asp:Label>
                           </td>
                       <td class="auto-style39">
                           <asp:TextBox ID="TextBox4" runat="server" OnTextChanged="TextBox4_TextChanged" Width="120px" Visible="False" Enabled="False"></asp:TextBox>
                           </td>
                        </tr>
                        <tr>
                            <td>

                                <asp:Label ID="Label66" runat="server" Text="Enter New Address" Visible="False"></asp:Label>

                            </td>
                            <td>

                                <asp:DropDownList ID="DropDownList34" runat="server" AutoPostBack="True" Height="16px" Visible="False" Width="126px">
                                </asp:DropDownList>

                            </td>
                        </tr>
                        <tr>
                           <td>
                <asp:Label ID="Label21" runat="server" Text="Enter Company details:" Visible="False"></asp:Label>
                           </td>
                       <td class="auto-style21">&nbsp;</td>
                        </tr>
                        <tr>
                           <td>
                <asp:Label ID="Label22" runat="server" Text="Enter Name" Visible="False"></asp:Label>
                           </td>
                       <td class="auto-style21">
                           <asp:DropDownList ID="DropDownList30" runat="server" OnSelectedIndexChanged="DropDownList30_SelectedIndexChanged" AutoPostBack="True" Height="16px" Visible="False" Width="131px">
                           </asp:DropDownList>
                           <br />
                           <asp:DropDownList ID="DropDownList43" runat="server" AutoPostBack="True" Height="18px" OnSelectedIndexChanged="DropDownList43_SelectedIndexChanged" Visible="False" Width="128px">
                           </asp:DropDownList>
                           </td>
                        </tr>
                        <tr>
                           <td class="auto-style1">
                <asp:Label ID="Label23" runat="server" Text="Enter  email ID" Visible="False"></asp:Label>
                           </td>
                       <td class="auto-style1">
                           <asp:DropDownList ID="DropDownList31" runat="server" OnSelectedIndexChanged="DropDownList31_SelectedIndexChanged" AutoPostBack="True" Height="20px" Visible="False" Width="132px">
                           </asp:DropDownList>
                           <br />
                           <asp:DropDownList ID="DropDownList44" runat="server" AutoPostBack="True" Height="16px" Visible="False" Width="126px">
                           </asp:DropDownList>
                           </td>
                        </tr>
                        <tr>
                           <td>
                <asp:Label ID="Label24" runat="server" Text="Enter phone no" Visible="False"></asp:Label>
                           </td>
                       <td class="auto-style21">
                           <asp:DropDownList ID="DropDownList32" runat="server" OnSelectedIndexChanged="DropDownList32_SelectedIndexChanged" AutoPostBack="True" Height="19px" Visible="False" Width="130px">
                           </asp:DropDownList>
                           <br />
                           <asp:DropDownList ID="DropDownList45" runat="server" AutoPostBack="True" Height="16px" Visible="False" Width="126px">
                           </asp:DropDownList>
                           </td>
                        </tr>
                        <tr>
                           <td>
                <asp:Label ID="Label25" runat="server" Text="Enter Fax No" Visible="False"></asp:Label>
                           </td>
                       <td class="auto-style21">
                           <asp:DropDownList ID="DropDownList33" runat="server" OnSelectedIndexChanged="DropDownList33_SelectedIndexChanged" AutoPostBack="True" Height="18px" Visible="False" Width="131px">
                           </asp:DropDownList>
                           </td>
                        </tr>
                        <tr>
                            <td class="auto-style14">


                                </td>
                            <td class="auto-style33">
                                <asp:Button ID="Button3" runat="server" Height="22px" OnClick="Button3_Click1" Text="Bill" Visible="False" Width="105px" />
                            </td>

                        </tr>
                        <tr>
                            <td class="auto-style20">


                            </td>
                            <td  >
                                <br />
                                <br />
                                <asp:Label ID="Label60" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label61" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label62" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label63" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label64" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="Label65" runat="server"></asp:Label>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style20">


                            </td>
                            <td class="auto-style21"></td>
                        </tr>
                        <tr>
                            <td class="auto-style22">


                            </td>
                            <td class="auto-style23">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            </table>


    </div>
    </form>
   </body>
</html>
