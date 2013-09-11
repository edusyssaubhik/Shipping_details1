<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shipping_details.aspx.cs" Inherits="Shipping_details1.shipping_details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style8 {
            width: 211px;
        }
        .auto-style9 {
            width: 195px;
        }
        .auto-style11 {
            width: 146px;
        }
        .auto-style12 {
            width: 195px;
            height: 37px;
        }
        .auto-style13 {
            width: 146px;
            height: 37px;
        }
        .auto-style14 {
            width: 195px;
            height: 17px;
        }
        .auto-style15 {
            width: 146px;
            height: 17px;
        }
        .auto-style16 {
            height: 120px;
        }
        .auto-style17 {
            width: 195px;
            height: 127px;
        }
        .auto-style18 {
            width: 146px;
            height: 127px;
        }
        .auto-style20 {
            width: 163px;
        }
        .auto-style21 {
            width: 152px;
        }
        .auto-style22 {
            width: 163px;
            height: 245px;
        }
        .auto-style23 {
            width: 152px;
            height: 245px;
        }
        .auto-style24 {
            width: 195px;
            height: 51px;
        }
        .auto-style25 {
            width: 146px;
            height: 51px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse;width:100%">
            <tr>
                <td style="width:33%; vertical-align:top"> 
                   <table style="height: 294px">
                       <tr>
                           <td class="auto-style8">

                <asp:Label ID="Label1" runat="server" Text=" Company Name"></asp:Label>

                           </td>
                           <td>

                     <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="69px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="margin-bottom: 27px" Width="190px">
        </asp:DropDownList>

                           </td>
                       </tr>
                       <tr>
                           <td style="margin-left: 40px">
                <asp:Label ID="Label2" runat="server" Text="Enter Company name"></asp:Label>
                           </td>
                       <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="182px"></asp:TextBox>
                           </td>
                       </tr>
                       <tr>
                           <td>

                               Enter Address</td>
                           <td>

                               <asp:DropDownList ID="DropDownList17" runat="server" Height="16px" OnSelectedIndexChanged="DropDownList17_SelectedIndexChanged" Width="187px">
                               </asp:DropDownList>

                           </td>

                       </tr>
                       <tr>
                           <td>
                <asp:Label ID="Label12" runat="server" Text="Enter Company details:"></asp:Label>
                           </td>
                       <td>&nbsp;</td>
                       </tr>
                       <tr>
                           <td>
                <asp:Label ID="Label4" runat="server" Text="Enter Name"></asp:Label>
                           </td>
                       <td>
                     <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" Height="69px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="margin-bottom: 27px" Width="190px">
        </asp:DropDownList>
                           </td>
                       </tr>
                       <tr>
                           <td>
                <asp:Label ID="Label5" runat="server" Text="Enter  email ID"></asp:Label>
                           </td>
                       <td>
                     <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" Height="78px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="margin-bottom: 27px" Width="190px">
        </asp:DropDownList>
                           </td>
                       </tr>
                       <tr>
                           <td>
                <asp:Label ID="Label6" runat="server" Text="Enter phone no"></asp:Label>
                           </td>
                       <td>
                     <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" Height="69px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="margin-bottom: 27px" Width="190px">
        </asp:DropDownList>
                           </td>
                       </tr>
                       <tr>
                           <td>
                <asp:Label ID="Label7" runat="server" Text="Enter Fax No"></asp:Label>
                           </td>
                       <td>
                     <asp:DropDownList ID="DropDownList6" runat="server" AutoPostBack="True" Height="69px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="margin-bottom: 27px" Width="190px">
        </asp:DropDownList>
                           </td>
                       </tr>
                       <tr>
                           <td></td>
                       <td>
                           <asp:Button ID="Button2" runat="server" Height="22px" Text="Sold" Width="78px" />
                           </td>
                       </tr>
                       <tr>
                           <td></td>
                       <td></td>
                       </tr>
                       <tr>
                           <td class="auto-style16"></td>
                       <td class="auto-style16">
                           <asp:Label ID="Label28" runat="server"></asp:Label>
                           </td>
                       </tr>
      
                   </table>
                </td>
                <td style="width:33%; vertical-align:top">
                    &nbsp;<table>
                        <tr>
                            <td class="auto-style24">


                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label10" runat="server" Text="Ship To"></asp:Label>


                                </td>
                            <td class="auto-style25">
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Same as Sold Address" />
                            </td>

                        </tr>
                        <tr>
                            <td class="auto-style9">


                                </td>
                            <td class="auto-style11">
                                <br />
                                <asp:Label ID="Label26" runat="server"></asp:Label>
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </td>

                        </tr>
                        <tr>
                            <td class="auto-style9">


                                </td>
                            <td class="auto-style11">
                    <asp:CheckBox ID="CheckBox3" runat="server" Text="Add New Address" OnCheckedChanged="CheckBox3_CheckedChanged" />
                            </td>

                        </tr>
                        <tr>
                           <td style="margin-left: 40px">
                <asp:Label ID="Label13" runat="server" Text="Enter Company name"></asp:Label>
                           </td>
                       <td>
                    <asp:TextBox ID="TextBox2" runat="server" Width="182px"></asp:TextBox>
                           </td>
                        </tr>
                        <tr>
                            <td>

                               Enter Address</td>
                            <td>

                     <asp:DropDownList ID="DropDownList16" runat="server" AutoPostBack="True" Height="69px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="margin-bottom: 27px" Width="190px">
        </asp:DropDownList>

                            </td>

                        </tr>
                        <tr>
                           <td>
                <asp:Label ID="Label14" runat="server" Text="Enter Company details:"></asp:Label>
                           </td>
                       <td>&nbsp;</td>
                        </tr>
                        <tr>
                           <td>
                <asp:Label ID="Label15" runat="server" Text="Enter Name"></asp:Label>
                           </td>
                       <td>
                     <asp:DropDownList ID="DropDownList7" runat="server" AutoPostBack="True" Height="69px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="margin-bottom: 27px" Width="190px">
        </asp:DropDownList>
                           </td>
                        </tr>
                        <tr>
                           <td>
                <asp:Label ID="Label16" runat="server" Text="Enter  email ID"></asp:Label>
                           </td>
                       <td>
                     <asp:DropDownList ID="DropDownList8" runat="server" AutoPostBack="True" Height="78px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="margin-bottom: 27px" Width="190px">
        </asp:DropDownList>
                           </td>
                        </tr>
                        <tr>
                           <td>
                <asp:Label ID="Label17" runat="server" Text="Enter phone no"></asp:Label>
                           </td>
                       <td>
                     <asp:DropDownList ID="DropDownList9" runat="server" AutoPostBack="True" Height="69px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="margin-bottom: 27px" Width="190px">
        </asp:DropDownList>
                           </td>
                        </tr>
                        <tr>
                           <td>
                <asp:Label ID="Label18" runat="server" Text="Enter Fax No"></asp:Label>
                           </td>
                       <td>
                     <asp:DropDownList ID="DropDownList10" runat="server" AutoPostBack="True" Height="69px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="margin-bottom: 27px" Width="190px">
        </asp:DropDownList>
                           </td>
                        </tr>
                        <tr>
                            <td class="auto-style14">


                                </td>
                            <td class="auto-style15">
                                <asp:Button ID="Button1" runat="server" Text="Ship" Width="74px" />
                            </td>

                        </tr>
                        <tr>
                            <td class="auto-style17">


                                </td>
                            <td class="auto-style18"></td>

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
                            <td class="auto-style13"></td>

                        </tr>

                    </table>
                </td>
                <td style="width:33%; vertical-align:top">
                    <table>
                        <tr>
                            <td class="auto-style20">


                            </td>
                            <td class="auto-style21"></td>
                        </tr>
                        <tr>
                            <td class="auto-style20">


                <asp:Label ID="Label19" runat="server" Text="Bill To"></asp:Label>


                            </td>
                            <td class="auto-style21">
                    <asp:CheckBox ID="CheckBox4" runat="server" Text="Same as Sold Address" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style20">


                            </td>
                            <td class="auto-style21">
                                <asp:Label ID="Label27" runat="server"></asp:Label>
                                <br />
                                <br />
                                <br />
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style20">


                            </td>
                            <td class="auto-style21">
                    <asp:CheckBox ID="CheckBox5" runat="server" Text="Same as Ship Address" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style20">


                            </td>
                            <td class="auto-style21">
                                <br />
                                <br />
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style20">


                            </td>
                            <td class="auto-style21"></td>
                        </tr>
                        <tr>
                            <td class="auto-style20">


                            </td>
                            <td class="auto-style21">
                    <asp:CheckBox ID="CheckBox6" runat="server" Text="Add New company" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style20">


                            </td>
                            <td class="auto-style21"></td>
                        </tr>
                        <tr>
                           <td style="margin-left: 40px">
                <asp:Label ID="Label20" runat="server" Text="Enter Company name"></asp:Label>
                           </td>
                       <td>
                    <asp:TextBox ID="TextBox3" runat="server" Width="182px"></asp:TextBox>
                           </td>
                        </tr>
                        <tr>
                           <td>
                <asp:Label ID="Label21" runat="server" Text="Enter Company details:"></asp:Label>
                           </td>
                       <td>&nbsp;</td>
                        </tr>
                        <tr>
                           <td>
                <asp:Label ID="Label22" runat="server" Text="Enter Name"></asp:Label>
                           </td>
                       <td>
                     <asp:DropDownList ID="DropDownList11" runat="server" AutoPostBack="True" Height="69px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="margin-bottom: 27px" Width="190px">
        </asp:DropDownList>
                           </td>
                        </tr>
                        <tr>
                           <td>
                <asp:Label ID="Label23" runat="server" Text="Enter  email ID"></asp:Label>
                           </td>
                       <td>
                     <asp:DropDownList ID="DropDownList12" runat="server" AutoPostBack="True" Height="78px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="margin-bottom: 27px" Width="190px">
        </asp:DropDownList>
                           </td>
                        </tr>
                        <tr>
                           <td>
                <asp:Label ID="Label24" runat="server" Text="Enter phone no"></asp:Label>
                           </td>
                       <td>
                     <asp:DropDownList ID="DropDownList13" runat="server" AutoPostBack="True" Height="69px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="margin-bottom: 27px" Width="190px">
        </asp:DropDownList>
                           </td>
                        </tr>
                        <tr>
                           <td>
                <asp:Label ID="Label25" runat="server" Text="Enter Fax No"></asp:Label>
                           </td>
                       <td>
                     <asp:DropDownList ID="DropDownList14" runat="server" AutoPostBack="True" Height="69px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="margin-bottom: 27px" Width="190px">
        </asp:DropDownList>
                           </td>
                        </tr>
                        <tr>
                            <td class="auto-style14">


                                </td>
                            <td class="auto-style15">
                                <asp:Button ID="Button3" runat="server" Text="Bill" Width="74px" Height="26px" />
                            </td>

                        </tr>
                        <tr>
                            <td class="auto-style20">


                            </td>
                            <td class="auto-style21">
                                <br />
                                <br />
                                <br />
                                <br />
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
                                <asp:Label ID="Label29" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            </table>


    </div>
    </form>
</body>
</html>
