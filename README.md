環境安裝:2019-https://www.dcard.tw/f/fju/p/234561890/	2017-https://www.pianshen.com/article/4631256212/

vis:https://visualstudio.microsoft.com/zh-hant/downloads/

Irvine32-x86:http://asmirvine.com/gettingStartedVS2017/index.htm

起始碼:

.386

.model flat,stdcall

.stack 4096

ExitProcess proto,dwExitCode:dword

INCLUDE Irvine32.inc					;帶入Irvine32

.data

.code

main PROC




invoke ExitProcess,0

main ENDP

END main
