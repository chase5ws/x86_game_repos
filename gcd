INCLUDE Irvine32.inc

.data
str1 BYTE "Enter a 32 bit number: ",0
str2 BYTE "Greatest common divisor is: ",0
number DWORD ?				;被除數
divisor DWORD ?				;除數


.code

main PROC

	mov edx,offset str1		
	call WriteString		;印出提示字串str1
	call ReadInt
	mov number ,eax			;讀入number

	mov edx,offset str1
	call WriteString		;印出提示字串str1
	call ReadInt
	mov divisor,eax			;讀入divisor

	mov eax,number			;number放在eax
	mov ebx,divisor			;divisor放在ebx
	call GCD
	
	
	exit
main ENDP


abs PROC					;轉絕對值
	cmp eax,0
	jl L1
	jmp next
L1:
	neg eax					
next:
	ret
abs ENDP


GCD PROC
	call abs				;number轉絕對值
	push eax
	mov eax,ebx
	call abs				;divisor轉絕對值
	mov ebx,eax
	pop eax

L2:
	xor edx,edx				
	div ebx					;輾轉相除法
	mov eax,ebx				;除數變為下一次的被除數
	mov ebx,edx				;商數變為下一次的除數
	cmp ebx,0				;整除時離開
	jg L2

	mov edx,offset str2
	call WriteString		;印出提示字串str2
	call Writedec			;印出GCD
	ret
GCD ENDP

END main
