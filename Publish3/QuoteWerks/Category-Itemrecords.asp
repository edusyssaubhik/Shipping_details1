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
     <script type="text/javascript">
   var req1=null;
var req2=null;
    var total = 0.0;  
/*
function take_backup()
{
       var c,f, m,h,k,l,sell,final,tax,ship,h1;
	var count=document.getElementById("count").value;
 //    document.getElementById("t_tax").innerHTML="";
	for(var i=1;i<=count;i++)
	 {
/*[orderid] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[actualPrice] [nvarchar](20) NULL,
	[discount] [nvarchar](10) NULL,
	[discountAmount] [nvarchar](10) NULL,
	[sellingPrice] [nvarchar](10) NULL,
	[FinalPrice] [nvarchar](20) NULL,
	[tax] [nvarchar](10) NULL,
	[shipping] [nvarchar](10) NULL,
	//[totalAmount] [nvarchar](20) NULL, ( what is total amount)
     
    req1=null;
	     var order_id='orderid_'+i
	//	var sell='sell_'+y;
		  h1 = 'qty_' + i;
		  l='act_'+i;
          h = 'dis_' + i;
          k = 'di_'+ i;
		  sell='sell_'+i;
		  final='final_'+i;
		  tax='tax_'+i
		  ship='ship_'+i
		
		var id=document.getElementById(order_id).value;//order id
		var qty=document.getElementById(h1).value;
		var  ac_p=document.getElementById(l).innerHTML;
		var  dis= document.getElementById(h).value; // discount %
		var di=document.getElementById(k).value;// discount value
		var sel=document.getElementById(sell).value;  //
		var fin= document.getElementById(final).value;  
		var tax_x= document.getElementById(tax).value;
		var ship= document.getElementById(tax).value;		 
		// call ajax function to update index rows

if(window.XMLHttpRequest){
    req1=new XMLHttpRequest; //mozilla/safari
 } else if(window.ActiveXObject){
    req1=new ActiveXObject("Microsoft.XMLHTTP"); //internet explorer
 }
 //
 //define callback handler
 if(req1) {
 //
    req1.onreadystatechange=onReadyState1;
    req1.open("GET","/QuoteWerks/getcategories.asp",true);
    req1.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req1.send(null);
 }

			 
       
}	

}

*/




    function calcu(x,y)//(price,name)
    {
    
         var t,f, m,h,k,red;
		 red='e_'+y;
         h = 'qty_' + y;
		 t="act_"+y;
		  k = 'di_'+ y;
		 var sell='sell_'+y;
		 var  final='final_'+y;
		 var tax='tax_'+y
		var disc='dis_' + y;
        // k = 'chk_' + y;
         f = document.getElementById(h).value; // quantity
		 if(f!=""){
         if (int_check(f)) {
              document.getElementById(red).innerHTML="";
             m = parseFloat(f) * parseFloat(x);
             document.getElementById(t).innerHTML = parseFloat(m).toFixed(2);
			  disc=document.getElementById(disc).value
			 
			 if(disc!="")
			 calcu1_dis(y)
             //document.getElementById(h).innerHTML = "";
             //document.getElementById(k).disabled = false;
      
         }
		 else
		  {
		  document.getElementById(red).innerHTML="Enter integer value" 
		  document.getElementById(k).value="";
		  document.getElementById(sell).value=""
		  document.getElementById(disc).value="";
		   document.getElementById(t).innerHTML = "";
			
		  document.getElementById(final).value=""  
		  document.getElementById(tax).value="tax";  
           
		   }
		 }
         else
         {
		  document.getElementById(k).value="";
		  document.getElementById(sell).value=""
		  document.getElementById(disc).value="";
		  
		  document.getElementById(final).value=""  
		  document.getElementById(tax).value="tax";  
          //   document.getElementById(k).disabled = true;
            // document.getElementById(k).checked = false;
             document.getElementById(t).innerHTML = "";
             document.getElementById(h).innerHTML="Enter integer value" 
         }
    }
    function calcu1(x,y)//(price,name)
    {
        var f, m, h, k, b, p, q, i, l;
        var tp = 0
        var w, x,x1;

        
        total = 0.0;
        var inputTags = document.getElementsByTagName('input');
        var y = 0;
        for (var i = 0, length = inputTags.length; i < length; i++) {
            if (inputTags[i].type == 'checkbox') {
                tp++;
              
                k = 'chk_' + tp;
                h = 'e_' + y;
               // alert("ff")
              if (document.getElementById(k).checked == true) {
                  
                    l = tp;
                    p = 'pw_' + l;
                 
                    w = document.getElementById(p).value;
                    x = document.getElementById(w).value;
            
                    x1 = parseFloat(w) * parseFloat(x);
                 
                  // document.getElementById(y).innerHTML = m;
                   // document.getElementById(h).innerHTML = "";
                  //  document.getElementById(k).disabled = false;
                  total = total + parseFloat(x1);
                    
                }
                y++;
            }
        }
        document.getElementById("total").innerHTML = "Your Cart  " + "Rs/~ " + total;
    
    }
function check_digit(x)

{
    var reg = new RegExp("^[0-9]$");//0-9 jjkhh
    //var reg = new RegExp("/^\d{1}$");
    return (reg.test(x));

}
function sub_op(x)
{
    var i, m, k,k1;
    var tot=0.0;
    k = parseInt(x)
    
  //  alert(" google")
    for(i=1;i<=k;i++)
    {
        m='chk_' + i;
        k1='qty_'+i;
        if(document.getElementById(m).checked==true )
        {
            //alert("hello");
            //alert( parseFloat(document.k1.value))
            alert(document.getElementById(i).value)
            //make a count and add
           // alert(" google")
            //tot=tot+parseFloat( document.getElementById(i).value)
           // document.getElementById("total").innerHTML = "Total Amount is "+tot
        }

    }
	}
    //get total no x
	function calcu1_dis(y)//index 
	{ //need all checking
	//alert("ddd")
	    var c,f, m,h,k,l,sell,final,tax;
		var sell='sell_'+y;
		 h1 = 'qty_' + y;
		 l='act_'+y;
         h = 'dis_' + y;
         k = 'di_'+ y;
		 sell='sell_'+y;
		  final='final_'+y;
		  tax='tax_'+y
		  var qty1=document.getElementById(h1).value;
		  var tax_x=document.getElementById(tax).value
		 //alert(k)
		 c=document.getElementById(l).innerHTML;  //new price
		 //alert(c)
         f = document.getElementById(h).value; //discount 
		  //alert(f)
		  if(c!="" && f!="" && qty1!="" ){
		  if(int_check(f) && int_check(qty1)){
		  var df=parseFloat(f)/100;
		
		  m =parseFloat(parseFloat(df) * parseFloat(c)).toFixed(2);
		 //  alert(m)
          document.getElementById(k).value=m;
        //  c=parseFloat(c);
          document.getElementById(sell).value=parseFloat(c-(-m)).toFixed(2);
		  if(tax_x!="tax")
		  load_final_price(tax_x,y);
		  //document.getElementById(tax).value="tax";  
		  //document.getElementById(final).value=""  
		  }
		  else
		  {
		    alert("Please give integer value")
			
		 // document.getElementById(h1).value="";
			
		  document.getElementById(h).value="";
		  document.getElementById(k).value="";
		  document.getElementById(sell).value=""
		  document.getElementById(final).value=""  
		  document.getElementById(tax).value="tax";  
		  
		  }
		  }
		  else
		  {
		  document.getElementById(h).value="";
		  document.getElementById(k).value="";
		  document.getElementById(sell).value=""
		  document.getElementById(final).value=""  
		  document.getElementById(tax).value="tax";  
		  
		  alert("Please add quantity and discount proper way!")
		  }
	}

         
	function back_cal(y)
	{
	    //   di_1  //dis value
	    // sell_1 //selling pr
	    // act_1//actual price
	    var c,f, m,h,k,l,sell,sell1,final,tax;
	    l='act_'+y;
	    tax='tax_'+y
	    final='final_'+y;
	    h = 'dis_' + y;
	    k = 'di_'+ y;
	    sell='sell_'+y;
	    //    dis_1 //percentage
	    c=document.getElementById(l).innerHTML;  //ACT price
	    //alert(c)
	    f = document.getElementById(h).value; //discount 
	    //alert(f)
	   sell1= document.getElementById(sell).value;//=parseFloat(c-(-m)).toFixed(2);
	   if(c!="" && f!="" && sell1!=""  ){
	       if(int_check(c) && int_check(sell1)){
	           if(parseInt(c)!=0)
	           {
	               document.getElementById(h).value=parseFloat(((sell1/c)-1)*100).toFixed(2);
	               var df1=document.getElementById(h).value;
	               var df=parseFloat((c*df1)/100).toFixed(2);
	               document.getElementById(k).value=df;
	               var x=document.getElementById(tax).value;
	               load_final_price(x,y);
	           }
	           else
	           {
	               document.getElementById(h).value="N/A";
	               load_final_price(x,y);
	           }
	           }
	       else
	       {
	          // document.getElementById(tax).value="tax";  
		 
	           document.getElementById(final).value=""
	 
	           alert("Please put every field properly");
	       }
	   }
	}

	
	function load_final_price(x,y)
	{
	var sell='sell_'+y;
	var final='final_'+y;
	 var tax='tax_'+y
	var selling=document.getElementById(sell).value
	if(selling!="" && int_check(selling))
	  {
	   if(x=="tax"){
	     document.getElementById(final).value=""
	   alert("please select tax")
	   }
	   else if(x=='0')
	   {
		  document.getElementById(final).value= selling;
	   }
	   else if(x=='20')
	   {
	      var df=parseFloat(20/100);
		  
		  var m =parseFloat(parseFloat(selling) + parseFloat(selling*df)).toFixed(2);
		   document.getElementById(final).value=m;
	   //alert("calculate please")
	   }
	  }
	  else
	  {
	      document.getElementById(tax).value="tax";  
		 
	     document.getElementById(final).value=""
	  alert("Please give the correct input")
	  }
	}

function check_result()
{
var x=0
var count=document.getElementById("count").value;

	for(var i=1;i<=count;i++)
	 {
       var w="final_"+i;
	   var z="ship_"+i;
       var final_price=document.getElementById(w).value
    var ship=document.getElementById(z).value
         if(final_price=="" ||  ship=="")
		   {
		   x=1
		  // alert("Please put the shipping price correct way!")
		   break;
		   }
     }
	 if(x==1)
	 return false;
	 else
	 return true;
}
function add_actual_price()
{
var add1=0.0;
var count=document.getElementById("count").value;
     document.getElementById("ap").innerHTML="";
	for(var i=1;i<=count;i++)
	 {
         var t="act_"+i;
		
		  var act_price=document.getElementById(t).innerHTML
		   if(act_price!="")
		   {
		   add1=add1+parseFloat(act_price);
	       }
		   else
		   {
		   add1=0.0;
	 document.getElementById("ap").innerHTML=""
 	 alert("Properly calculate the above ACTUAL PRICE AND FINAL PRICE")
		   break;
		   }
	    //alert(i)
	 
	 }
	  add1=parseFloat(add1).toFixed(2)
	 document.getElementById("ap").innerHTML=add1;

}

function add_discount()
{
var add1=0.0;
var count=document.getElementById("count").value;
     document.getElementById("t_discount").innerHTML="";
	for(var i=1;i<=count;i++)
	 {
         var t="di_"+i;
		
		  var dis_price=document.getElementById(t).value
		   if(dis_price!="")
		   {
		   add1=add1+parseFloat(dis_price);
	       }
		   else
		   {
		   add1=0.0;
	 document.getElementById("t_discount").innerHTML=""
 	 alert("Properly calculate the above ACTUAL PRICE AND FINAL PRICE")
		   break;
		   }
	    //alert(i)
	 
	 }
	 add1=parseFloat(add1).toFixed(2)
	 document.getElementById("t_discount").innerHTML=add1;

}

function add_final_price()
{
var add1=0.0;
var count=document.getElementById("count").value;
     document.getElementById("t_final").innerHTML="";
	for(var i=1;i<=count;i++)
	 {
         var t="final_"+i;
		
		  var fi_price=document.getElementById(t).value
		   if(fi_price!="")
		   {
		   add1=add1+parseFloat(fi_price);
	       }
		   else
		   {
		   add1=0.0;
	 document.getElementById("t_final").innerHTML=""
 	 alert("Properly calculate the above ACTUAL PRICE AND FINAL PRICE")
		   break;
		   }
	    //alert(i)
	 
	 }
	 add1=parseFloat(add1).toFixed(2)
	 document.getElementById("t_final").innerHTML=add1;

}


function price_no_tax()
{
var add1=0.0;
var count=document.getElementById("count").value;
     document.getElementById("t_w_tax").innerHTML="";
	for(var i=1;i<=count;i++)
	 {
         var t="sell_"+i;
		
		  var se_price=document.getElementById(t).value
		   if(se_price!="")
		   {
		   add1=add1+parseFloat(se_price);
	       }
		   else
		   {
		   add1=0.0;
	 document.getElementById("t_w_tax").innerHTML=""
 	 alert("Properly calculate the above ACTUAL PRICE AND FINAL PRICE")
		   break;
		   }
	    //alert(i)
	 
	 }
	 add1=parseFloat(add1).toFixed(2)
	 document.getElementById("t_w_tax").innerHTML=add1;

}

function add_ship_price()
{
var add1=0.0;
var count=document.getElementById("count").value;
     document.getElementById("t_ship").innerHTML="";
	for(var i=1;i<=count;i++)
	 {
         var t="ship_"+i;
		
		  var sh_price=document.getElementById(t).value
		   if(sh_price!="")
		   {
		   add1=add1+parseFloat(sh_price);
	       }
		   else
		   {
		   add1=0.0;
	 document.getElementById("t_ship").innerHTML=""
 	 alert("Properly calculate the above ACTUAL PRICE AND FINAL PRICE")
		   break;
		   }
	    //alert(i)
	 
	 }
	 add1=parseFloat(add1).toFixed(2)
	 document.getElementById("t_ship").innerHTML=add1;

}

function add_tax_price()
{
var add1=0.0;
var count=document.getElementById("count").value;
     document.getElementById("t_tax").innerHTML="";
	for(var i=1;i<=count;i++)
	 {
         var f="final_"+i;
		var s="sell_"+i;
		
		  var f_price=document.getElementById(f).value
		  var s_price=document.getElementById(s).value
		  
		   if(f_price!="" && s_price!="")
		   {
		   add1=add1+parseFloat(f_price-s_price);
	       }
		   else
		   {
		   add1=0.0;
	 document.getElementById("t_tax").innerHTML=""
 	 alert("Properly calculate the above ACTUAL PRICE AND FINAL PRICE")
		   break;
		   }
	    //alert(i)
	 
	 }
	 add1=parseFloat(add1).toFixed(2)
	 document.getElementById("t_tax").innerHTML=add1;
	 return add1

}
function total_grant()
{
var add2=0.0
var h=document.getElementById("t_final").innerHTML
//var h1=document.getElementById("t_tax").innerHTML
var h2=document.getElementById("t_ship").innerHTML
   if(h!=""  && h2!="")
   {
      add2=parseFloat(h)+parseFloat(h2)
	  
   }
    add2=parseFloat(add2).toFixed(2)
   document.getElementById("t_grant").innerHTML=add2;
   return add2
}

function result()
{
var o=1;
var count=document.getElementById("count").value;
   //  document.getElementById("t_tax").innerHTML="";
	for(var i=1;i<=count;i++)
	 {
         var f="ship_"+i;
		var sh_price=document.getElementById(f).value
	   if(sh_price!="")
		   {
        if(!int_check(sh_price))
		    {
		     o=0;
			 break;     
		     //return true;
		     }
	       }
	   }
		   if(o==0){
		   alert("Please give integer value for shipping price");
		  
	       document.getElementById("ap").innerHTML=""
	  document.getElementById("t_tax").innerHTML=""
	   document.getElementById("t_ship").innerHTML=""
	    document.getElementById("t_final").innerHTML=""
		 document.getElementById("t_discount").innerHTML=""
		  document.getElementById("t_grant").innerHTML=""
		  document.getElementById("t_w_tax").innerHTML="";
	 document.getElementById(sh_price).focus();
	 return false;
	}
	 

if(check_result() && o==1)
{
add_actual_price();
add_discount();
price_no_tax();
add_final_price();
add_ship_price();
add_tax_price();
total_grant();
return true;
}
else
{
	 document.getElementById("ap").innerHTML=""
	  document.getElementById("t_tax").innerHTML=""
	   document.getElementById("t_ship").innerHTML=""
	    document.getElementById("t_final").innerHTML=""
		 document.getElementById("t_discount").innerHTML=""
		  document.getElementById("t_grant").innerHTML=""
		  document.getElementById("t_w_tax").innerHTML="";
alert("Please calculate final price and shipping price for all Row")
return false;
}	   

}
function result2(i)
{
 //if(int_)
 var t="ship_"+i;
		
		  var sh_price=document.getElementById(t).value
		   if(sh_price!="")
		   {
		   if(int_check(sh_price))
		   {
		     result1();
		     //return true;
		   }
		   else
		   {
		   alert("Please give integer value!");
	document.getElementById("ap").innerHTML=""
	  document.getElementById("t_tax").innerHTML=""
	   document.getElementById("t_ship").innerHTML=""
	    document.getElementById("t_final").innerHTML=""
		 document.getElementById("t_discount").innerHTML=""
		  document.getElementById("t_grant").innerHTML=""
		  document.getElementById("t_w_tax").innerHTML="";

		   document.getElementById(t).focus();
		    //return false;
		   }
		 }
		 
}
function result1()
{
if(check_result())
{
add_actual_price();
add_discount();
add_final_price();
add_ship_price();
add_tax_price();
total_grant();
price_no_tax();

}
else
{

	 document.getElementById("ap").innerHTML=""
	  document.getElementById("t_tax").innerHTML=""
	   document.getElementById("t_ship").innerHTML=""
	    document.getElementById("t_final").innerHTML=""
		 document.getElementById("t_discount").innerHTML=""
		  document.getElementById("t_grant").innerHTML=""
		  document.getElementById("t_w_tax").innerHTML="";

}
}
function int_check(x)
{
 if (x.length == 0) {
            return false;
        }
 if(isNaN(x))
  {
  //alert("please give integer value")
   return false;
  }
  else
  {
   // alert("integer value")
	return true;
  }
}
function load_backup()
  {
  //take_backup();
   var x=document.getElementById("id3").value
  var form = document.createElement("form");
 form.setAttribute("method", "post"); 
form.setAttribute("action", "Category-Items.asp");

// setting form target to a window named 'formresult'
//form.setAttribute("target", "formresult");

var hiddenField = document.createElement("input");              
hiddenField.setAttribute("type", "hidden");
hiddenField.setAttribute("name", "ids");
hiddenField.setAttribute("value", x);
form.appendChild(hiddenField);
document.body.appendChild(form);
form.submit();
  
  // window.location="Category-Items.asp?ids="+x;
   //return true;
  //history.go(-1);
  //history.back();
  //return false;
  
  }
  
 function load_update()
   {
  if(result())
  {
  take_backup();     
  return true;
  }
 else
  {
  alert("please enter the value in proper way!")
  return false;
  }
}

function take_backup()
{
    var c,f, m,h,k,l,sell,final,tax,ship,h1,new_code,q1,q2,q3,q4,q5;
	var querystring = new Array();
    new_code=""
	var count=document.getElementById("count").value;
 //    document.getElementById("t_tax").innerHTML="";
	for(var i=1;i<=count;i++)
	 {
/*[quoteId] [int] NOT NULL,---->session
	[versionNo] [int] NULL,   ---->  1 
	[itemName] [varchar](200) NULL,----> 
	[itemCode] [varchar](20) NULL,
	[cost] [nvarchar](20) NULL,
	[price] [nvarchar](20) NULL,
	[quantity] [int] NULL,
	[actualPrice] [nvarchar](20) NULL,
	[discount] [nvarchar](10) NULL,
	[discountAmount] [nvarchar](10) NULL,
	[sellingPrice] [nvarchar](10) NULL,
	[FinalPrice] [nvarchar](20) NULL,
	[tax] [nvarchar](10) NULL,
	[shipping] [nvarchar](10) NULL,
	[totalAmount] [nvarchar](20) NULL,
	[addedBy ] [varchar](50) NULL,-->session user
	[addedDate] [datetime] NULL,-->now()
 */   
        // req1=null;
	//     var order_id='orderid_'+i
	    //alert(count)
		var item='item_'+i   
		var code='code_'+i
		var cost='cost_'+i
		var price='pw_'+i
	//	var sell='sell_'+y;
		  h1 = 'qty_' + i;
		  l='act_'+i;
          h = 'dis_' + i;
          k = 'di_'+ i;
		  sell='sell_'+i;
		  final='final_'+i;
		  tax='tax_'+i
		  ship='ship_'+i
		var item1=document.getElementById(item).value;//order id
		var code1=document.getElementById(code).value;
		var  cost1=document.getElementById(cost).value;
		var  price1= document.getElementById(price).value; // discount %
		
		var qty=document.getElementById(h1).value; //qty
		var  ac_p=document.getElementById(l).innerHTML;
		var  dis= document.getElementById(h).value; // discount %
		var di=document.getElementById(k).value;// discount value
		var sel=document.getElementById(sell).value;  //
		var fin= document.getElementById(final).value;  
		var tax_x=parseFloat(parseFloat(fin)-parseFloat(sel)).toFixed(2);
		var ship= document.getElementById(ship).value;		// tomorrow need to change in office the tax to ship price  
		var total_price= parseFloat(parseFloat(fin)+parseFloat(ship)).toFixed(2);
	
	    querystring[i-1]="'"+item1+"','"+code1+"','"+cost1+"','"+price1+"',"+qty+",'"+ac_p+"','"+dis+"','"+di+"','"+sel+"','"+fin+"','"+tax_x+"','"+ship+"','"+total_price+"'"
        
		}
   //q1=document.getElementById("t_grant").innerHTML
    //q2 =document.getElementById("t_tax").innerHTML;
   q2=add_tax_price();
    q1=total_grant();
	q3=document.getElementById("ap").innerHTML
	q4=document.getElementById("t_w_tax").innerHTML
	q5=document.getElementById("t_discount").innerHTML
		if(count>1)
		{		
		
		for(var j=0; j < querystring.length; j++)
			new_code=new_code+querystring[j]+";"
		    	
			if(new_code!="")
			  {
			  //alert(new_code)
		new_code=new_code.substring(0,new_code.length-1)
		// call ajax function to update/insert index rows
 	
	// alert(new_code)
if(window.XMLHttpRequest){
    req1=new XMLHttpRequest; //mozilla/safari
 } else if(window.ActiveXObject){
    req1=new ActiveXObject("Microsoft.XMLHTTP"); //internet explorer
 }
 //
 //define callback handler
 if(req1) {
 //
       req1.onreadystatechange=onReadyState1;
    req1.open("GET","/QuoteWerks/update_items.asp?query="+new_code+"&total="+q1+"&tax="+q2+"&act="+q3+"&sell="+q4+"&dis="+q5,true);
    req1.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req1.send(null);
          }

	 }
       }
	   else if(count==1)
	   {
	  
	   var yp=querystring[0];
       sendreq1(yp,q1,q2,q3,q4,q5)	   
	   }
	   
	   
}

function sendreq1(item,q1,q2,q3,q4,q5)
{
 
if(window.XMLHttpRequest){
    req2=new XMLHttpRequest; //mozilla/safari
 } else if(window.ActiveXObject){
    req2=new ActiveXObject("Microsoft.XMLHTTP"); //internet explorer
 }
 //
 //define callback handler
 if(req2) {
 //
    req2.onreadystatechange=onReadyState2;
    req2.open("GET","/QuoteWerks/update_items1.asp?query="+item+"&total="+q1+"&tax="+q2+"&act="+q3+"&sell="+q4+"&dis="+q5,true);
    req2.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    req2.send(null);
          }


}

function onReadyState2() {
 
 var ready1=req2.readyState;
 var data=null;
 if(ready1==4){ //check ready state
// data=req2.responseText;
     var que2="<%=Session("QWUserName")%>"
     var que3="<%=Session("QWTypeofuser") %>"
     window.location = "new_ship_edit.aspx?query=V1&nat=QWQWQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQWEQQAAAAAAAAAAAAAAAAAAAA&que2="+que2+"&que3="+que3;
     // alert("hello") //document.write(data)
 }
 }
function onReadyState1() {
 
    var ready1=req1.readyState;
    var data=null;
    if(ready1==4){ //check ready state
        var que2="<%=Session("QWUserName")%>"
        var que3="<%=Session("QWTypeofuser") %>"
        window.location = "new_ship_edit.aspx?query=V1&nat=QWQWQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQWEQQAAAAAAAAAAAAAAAAAAAA&que2="+que2+"&que3="+que3;
        // alert("hello")
        //document.write(data)     // alert("hello") }
    }

}
 
 /* function next_b()
  {
  if(result())
  {
  var form = document.createElement("form");
 form.setAttribute("method", "post"); 
form.setAttribute("action", "Category-Itemrecords1.asp");

// setting form target to a window named 'formresult'
form.setAttribute("target", "formresult");

var hiddenField = document.createElement("input");              
hiddenField.setAttribute("name", "id");
hiddenField.setAttribute("value", "ddd");
form.appendChild(hiddenField);
document.body.appendChild(form);
form.submit();
}
else
{

alert("please enter the value in proper way!")
}
// creating the 'formresult' window with custom features prior to submitting the form
//window.open(test.html, 'formresult', 'scrollbars=no,menubar=no,height=600,width=800,resizable=yes,toolbar=no,status=no');

   //form.submit();
  
  
  }*/
  
  
  


</script>

  <body>
    <tr>
      <td width="170px" align="left" valign="top" style=" border-right:#CCC thin solid;">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="leftNavigation" width="170">
          <!--#include virtual="/QuoteWerks/includes/LeftMenu.asp"-->
         </table></td>
      <td width="730" height="450px" align="left" valign="top"  style="padding-left:5px; padding-right:5px">
	  <div id="styledForm" class="myform">
	  <center>
	  
   <div>
    

  <%
Dim s,i1,j1,strEmpDet,que,quoteid,arr
Dim s1,quto_no
s=request.QueryString("id")
if s="" then

'Response.Redirect("Category-Items.asp")
 
   end if    'check session also up

 if Session("quote")="" then  'should be null in first page again

    'Set  Rs1 = Server.CreateObject("ADODB.Recordset")
     Set  Rs1 = Server.CreateObject("ADODB.Recordset")

   s1="select max(convert(int,substring(quoteno,6, 10000000)))+1 a from QW_QuoteOverview"

	  Rs1.Open s1,ConnObj
  If (Not Rs1.BOF) and (Not Rs1.EOF) Then
	  Session("quote_no")="DAT00"&Rs1("a") 
      'quto_no="DAT00"& Rs1("a")
	  end if
      Rs1.close 
   strEmpDet = "INSERT INTO QW_QuoteOverview(versionNo,createdDate,userId,quoteno) VALUES (1,'"& Now() &"','"&Session("QWUserName")&"','"&Session("quote_no")&"')"
	 
	 ConnObj.Execute strEmpDet
 	
	SQL = "SELECT TittleDescription a, ManufacturerPartNumber b,Cost c,Price d FROM [QW_category] where ManufacturerPartNumber in ("& s &")"
    ' response.Write(SQL) 
    que="select top 1 quoteId a from QW_QuoteOverview where userId='"&Session("QWUserName")&"' order by quoteId desc"	  	
    
	  Rs1.Open que,ConnObj
	  If (Not Rs1.BOF) and (Not Rs1.EOF) Then
	  Session("quote")=Rs1("a")
      Session("qid_edit")=Rs1("a")
	  end if
'	  Set rs11 = Server.CreateObject("ADODB.Recordset")
 '   SQL1 = "SELECT TittleDescription b, ManufacturerPartNumber a,Cost c,Price d FROM [QW_category] where ManufacturerPartNumber in ("& s &")"

     
      'rs11.open SQL1, ConnObj
      ' While Not rs11.EOF
	  'i1=i1+1
'	   rs()
     'strEmpDet = "INSERT INTO QW_QuoteDetails(quoteId,versionNo,itemName,itemCode,cost,price) values  ('"&Session("quote")&"',1,'"&rs11("b")&"','"&rs11("a")&"','"&rs11("c")&"','"&rs11("d")&"')"
	 'ConnObj.Execute strEmpDet
    'SQL = "SELECT itemName a,itemCode b,cost c,price d,orderid e FROM QW_QuoteDetails where itemCode  in ("& s &") and quoteId='"&Session("quote")&"'"
     
'	   rs11.MoveNext
	   'wend

    else
        
    SQL = "SELECT TittleDescription a, ManufacturerPartNumber b,Cost c,Price d FROM [QW_category] where ManufacturerPartNumber in ("& s &")"
   'response.Write(SQL)
   
'    SQL="SELECT itemName a,itemCode b,cost c,price d,orderid e FROM QW_QuoteDetails where itemCode  in ("& s &") and quoteId='"&Session("quote")&"'"




    end if
  
   

'Response.Write(s)
'SQL=""
Dim i,j
Set rs = Server.CreateObject("ADODB.Recordset")
rs.open SQL, ConnObj
%>
<input type="hidden" id="id3" value="<%=s%>" />
<table width="1053" border="2">
<th width="57">Item</th>
<th width="35">Item Code</th>
<th width="35">Cost</th>
<th width="38">Rate</th>
<th width="58">Quantity</th>
<th width="48">Actual Price</th>
<th width="63">Price Change(%)</th>
<th width="144">Price value</th>
<th width="146">Selling Price</th>
<th width="118">Tax </th>
<th width="146">Final Price</th>
<th width="87">Shipping Charge</th>
<%
While Not rs.EOF
i=i+1 
j=j+1
%>
<tr>
<td><%=rs("a")%><input type="hidden" id="item_<%=i%>" value="<%=rs("a")%>" /></td>
<td><%=rs("b")%><input type="hidden" id="code_<%=i%>" value="<%=rs("b")%>" /></td>
<td><%=rs("c")%><input type="hidden" id="cost_<%=i%>" value="<%=rs("c")%>" /></td>
<td id="pr_<%=i %>"><input type="hidden" id="pw_<%=i %>" value="<%=rs("d")%>" /> <%=rs("d")%></td>
<td>  <input name="qty" type="text" id="qty_<%=i %>" onBlur="calcu(<%=rs("d") %>,<%=i %>)" size="3" maxlength="8" />
<div id="e_<%=j %>" style="color:red" > </div></td>
<td> <div id="act_<%=i %>">0</div> </td>
 <td>  <input name="dis" type=text id="dis_<%=i%>" onBlur="calcu1_dis(<%=i %>)" size="4" maxlength="6" /></td>
 <td> <input name="dis_val" type=text  disabled="disabled" id="di_<%=i %>" onBlur=""/></td>
<td><input type=text name="sel_price" id="sell_<%=i %>" onBlur="back_cal(<%=i %>)"   /></td>
<td> 	
 <select name="tax" id="tax_<%=i%>" onChange="load_final_price(this.value,<%=i%>)" >
         <option  value="0">0%</option>
		 <option  value="20" selected="selected">20%</option>
	  </select>
	 
</td>
<td><input type=text name="final" id="final_<%=i%>" onBlur="" disabled="disabled" /></td>
<td><input name="ship" type=text id="ship_<%=i %>" onBlur="result2(<%=i%>)" value="0" size="10" /></td>
 </tr>
 <%
rs.MoveNext
Wend
if i=0 then
response.Write("No data found")
end if
'closes the connection
rs.close



 %>
 </table>
 <br><button type="submit" name="type" value="refresh"  onClick="result()">Reload Amount</button>
 <br>
 <div><input type="hidden" name="count" id="count" value="<%=i%>" /></div>
 <center>
 <table width="344">
 <tr>
 <td width="140">Actual price =</td>
 <td width="63"><span id="ap">0.00</span></td>
 </tr>
 <tr>
 <td>Discount Amount=</td>
 <td><span id="t_discount">0.00</span></td>
 </tr>
 <tr>
 <td>Price without tax =</td>
 <td><span id="t_w_tax">0.00</span></td>
 </tr>
 <tr>
 <td> Tax  =</td>
 <td><span id="t_tax">0.00</span></td>
 </tr>
 <tr>
 <td>Price with tax =</td>
 <td><span id="t_final">0.00</span></td>
 </tr>
 <tr>
 <td>Shipping Charges =</td>
 <td><span id="t_ship">0.00</span></td>
 </tr>
 <tr>
 <td>Total   =</td>
 <td><span id="t_grant">0.00</span></td>
 </tr>

 </table>
 </center>
   <!--<div id="actual"> Actual price =<span id="ap"></span>
   </div>
  <div id="discount" > Discount Amount=<span id="t_discount">0.00</span></div>
  <div id="f_w_p" > Price without tax =<span id="t_w_tax">0.00</span></div>
  <div id="tax" > Tax  =<span id="t_tax">0.00</span></div>
  <div id="f_p_x" > Price with tax =<span id="t_final">0.00</span></div>
  <div id="ship" > Shipping Charges =<span id="t_ship">0.00</span></div>
  <div id="grant_total" > Total   =<span id="t_grant">0.00</span></div>
-->  
  </div>
<div> 
  <div style="float:left">
  <button type="submit" name="type" value="Add"  onClick="return load_backup();">Back</button>
</div>
  <div style="float:right">
 <button type="submit" name="type" value="Add"  onClick="return load_update();">Next</button>
  </div>

<div style="float:left">
  
</div>
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
