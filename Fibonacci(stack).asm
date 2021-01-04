INCLUDE Irvine32.inc

.data
name1 BYTE "Fibonacci Numbers by Team 29",0
name2 BYTE "What is your name?:",0
name3 BYTE "Hi,",0
u_name BYTE 31 DUP(0)

prompt1 BYTE "How many Fibonacci numbers should I display?",0
prompt2 BYTE "Enter an integer in the range (1~25):",0
error BYTE "That number was out of range, try again.",0
space BYTE ", ",0
number DWORD ?
goodbye BYTE "Goodbye, ",0

.code
Fibonacci PROC				;費式數列(遞迴版)
	push ebp
	mov  ebp,esp
	mov  eax,[ebp+8]
	cmp  eax,1
	ja   Recursion
	mov  edx,1
	jmp  L1

Recursion: 
	dec  eax
	mov  ebx,eax
	push ebx
	push eax
	call Fibonacci
	
	pop  eax
	dec  eax
	push edx
	push eax
	call Fibonacci

	pop  eax
	add  edx,eax

L1: 
	pop  ebp
	ret  4
Fibonacci ENDP

TypeName PROC				;輸入姓名
	mov  edx,offset name1
	call WriteString
	call Crlf 
	call Crlf

	mov  edx,offset name2
	call WriteString

	mov  edx,offset u_name
	mov  ecx,30
	call ReadString

	mov  edx,offset name3
	call WriteString

	mov  edx,offset u_name
	call WriteString
	call Crlf
	call Crlf
	
	ret
TypeName ENDP

DisPrompt PROC					;輸入數字與錯誤提示
L1:
	mov  edx,offset prompt1
	call WriteString
	call Crlf

	mov  edx,offset prompt2
	call WriteString

	call Readint
	mov  number,eax

	cmp  eax,1
	jb   err

	cmp  eax,25
	ja   err

	jmp exit_1

err:
	mov  edx,offset error
	call WriteString
	call Crlf
	call Crlf
	jmp  L1

exit_1:
	call Crlf
	ret
DisPrompt ENDP

Serial PROC			;列印數列
	mov  ecx,0
	dec  number
L1:	
	push ecx
	call Fibonacci
	call WriteDec
	mov  edx,offset space
	call WriteString
	inc  ecx
	cmp  ecx,number
	jb   L1

	push ecx
	call Fibonacci
	call WriteDec
	call Crlf
	call Crlf
	ret

Serial ENDP

ByePrint PROC			    ;問候字串
	mov  edx,offset goodbye
	call WriteString
	mov  edx,offset u_name
	call WriteString
	ret
ByePrint ENDP

main PROC				
	call TypeName
	call DisPrompt
	call Serial
	call ByePrint		
	exit
main ENDP
END main
