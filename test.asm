INCLUDE Irvine32.inc ;帶入Irvine32

.data
	test1 BYTE "Test finish",0
.code
	main PROC
		mov  edx,offset test1		
		call Crlf
		call WriteString
		call Crlf
	invoke ExitProcess,0
	main ENDP
	END main
