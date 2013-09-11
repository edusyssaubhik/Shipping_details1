<%
'This function uses is displaying tables based on website'
Function WebsiteTables(Website)

	Select Case Website
	
		Case "1"
			ClassRoomTable = "ps_course"
			EnolledUserTable = "ps_enrolledusers"
			AmountsTable = "ps_classroom_payments"
			MBGPaymentTable = "ps_mbg"
			OnlineTable = "PayPalDB"  
			Finance_pay = "ps_finance_pay" 
			Finance = "ps_finance"       

		Case "2"
			ClassRoomTable = "course"
			EnolledUserTable = "enrolledusers"
			AmountsTable = "proj_classroom_payments"
			MBGPaymentTable = "proj_mbg"
			OnlineTable = "PayPalDB"
			Finance_pay = "proj_finance_pay"
			Finance = "finance"
						
		Case "3"
			ClassRoomTable = "itil_course"
			EnolledUserTable = "itil_enrolledusers"
			AmountsTable = "itil_classroom_payments"
			MBGPaymentTable = "itil_mbg"
			OnlineTable = "PayPalDB"
			Finance_pay = "itil_finance_pay"
			Finance = "itil_finance"			
			
		Case "4"
			ClassRoomTable = "rm_course"
			EnolledUserTable = "rm_enrolledusers"
			AmountsTable = "rm_classroom_payments"
			MBGPaymentTable = "rm_mbg"
			OnlineTable = "PayPalDB"
			Finance_pay = "rm_finance_pay"
			Finance = "rm_finance"
			
		Case "5"
			ClassRoomTable = "course"
			EnolledUserTable = "enrolledusers"
			AmountsTable = "ng_classroom_payments"
			MBGPaymentTable = "ng_mbg"
			OnlineTable = "PayPalDB"
			Finance_pay = "ng_finance_pay"
			Finance = "ng_finance"

	End Select
	
	WebsiteTables = ClassRoomTable & "," & EnolledUserTable & "," & AmountsTable & "," & MBGPaymentTable & "," & OnlineTable & "," & Finance_pay & "," & Finance 
	
End Function
%>