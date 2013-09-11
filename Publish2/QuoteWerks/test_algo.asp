<% 

Dim arr1(5),arr2(5),arr3(5)

arr1(0) = "PMstudy"
arr1(1) = "Supsh"
arr1(2) = "Savita"
arr1(3) = "ITILstudy"
arr1(4) = "SCRUMstudy"

arr2(0) = "Praveen"
arr2(1) = "Supsh"
arr2(2) = "Savita"
arr2(3) = "Priyanka"
arr2(4) = "Brijesh"

k = 0
f=0
For i = 0 to UBOUND(arr2) 

f=0
		For j = 0 to UBOUND(arr1)
		
			  If (arr2(i) =  arr1(j)) then
			  
			   f=1
                                                 
                        '  arr3(k) = arr1(i)
			  
			'  k = k + 1
                         exit for
			  
			  End If
		
		Next
                    if f = 0 then
		   arr3(k) = arr2(i) ' take out all the uncommon code ID 
            k=k+1
end if

Next


'Output'

For k = 0 to UBOUND(arr3)

Response.Write(arr3(k)&"<br>")

Next
dim x
x=2
y=CInt(x)
y=y+1
response.write(y	)

%>
