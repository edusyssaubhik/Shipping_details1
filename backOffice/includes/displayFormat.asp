<%
'This Function Uses is Displaying Price Formats in India and US'
Function CurrencyFormat_Front(Country)

	Select Case Country
	
		Case "India"
			CurrencyFormat_Front = " Rs. "

			
		Case "United Kingdom"
			CurrencyFormat_Front = " &#163; "

       
			
	End Select
	
End Function	

'This Function Uses is Displaying Price Formats in UAE and SG'
Function CurrencyFormat_Back(Country)

	Select Case Country
	
		Case "UAE", "Singapore", "Hong Kong"
			CurrencyFormat_Back = " USD "
	
	   Case "Australia"
			CurrencyFormat_Back = " AUD"
	
	End Select
	
End Function

'This Function Uses is Displaying Week Course Completed On'
Function CourseCompletedOn()

	Select Case Session("CountryOrigin")
	
		Case "India", "UAE", "Singapore", "Hong Kong"
			Response.Write("Tuesday")
	
		Case "US", "Canada", "United Kingdom"
			Response.Write("Thursday")
						
	End Select 

End Function

'This Function Uses is Displaying Week PMP Exan On'
Function PMPExamOn()

	Select Case Session("CountryOrigin")
	
		Case "India", "UAE", "Singapore", "Hong Kong"
			Response.Write("Thursday")
	
		Case "US", "Canada", "United Kingdom"
			Response.Write("Friday")
						
	End Select 

End Function

'This Function Uses is Displaying Price Foramts in India,UAE and SG'
Function PMPFee_India_UAE_SG()

	Select Case Session("CountryOrigin")
	
		Case "India", "UAE", "Singapore", "Hong Kong"
			Response.Write(" USD ")
			
	End Select
	
End Function

'This Function Uses is Displaying Price Foramts in US'
Function PMPFee_US()

	Select Case Session("CountryOrigin")
	
		Case "US", "Canada"
			Response.Write(" $ ")
	
	End Select
	
End Function

'Display Week Format'
Function WeekDays()

End Function

%>