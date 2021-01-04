INCLUDE Irvine32.inc

.data
	str1 BYTE "Enter a number: ",0
	str2 BYTE "Answer is: ",0
	number DWORD ?	

.code

	main proc
		mov  edx,offset str1		
		call WriteString

		call ReadInt
		cmp eax,0 ;判斷第0項(跳到l2)
		je l2	  
		sub eax,1 ;不是第0項(-1=ecx迴圈數)
		mov  ecx,eax 
		
		;call DumpRegs 
		xor eax,eax ;清空eax
		mov bl,0	;第0項 = 0
		mov dl,1	;第1項 = 1
		mov al,1	;第2項 = 1

	l1:
		mov dh,dl	;dh = dl 
		add dl,bl	;dl + bl 
		mov al,dl	;al = dl 
		mov bl,dh	;bl = dh
		;call DumpRegs ;暫存器檢查點
		cmp ecx,0
		je l2
	loop l1

	l2:
		;call DumpRegs
		mov number,eax
		mov  edx,offset str2	;印"Answer is:"
		call WriteString
		call Writedec			;印number值
		exit
	

invoke ExitProcess,0
main endp
end main
