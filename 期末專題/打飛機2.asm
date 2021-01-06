INCLUDE Irvine32.inc
INCLUDE Macros.inc
;---------------------------------------------------DATA
.DATA
	a WORD 2920 DUP(0)  ; Framebuffer (24x80)

;----------------------遊戲資料---------------------
	gameblock byte "==========================================",0DH,0AH,0
	straight byte "|                                        |",0DH,0AH,0
	flag byte 0
	airplaneX byte 1
	airplaneY byte 20
	bulletX byte ?
	bulletY byte ?
	foe1X byte ?
	foe1Y byte 1
	enemy_flag byte 0
	enemy_next dword ?
	score  dword 0

	speed1 dword 30
	speed2 dword 20
	speed3 dword 10
	speed4 dword 5
	
;----------------------美術畫面---------------------
;--------------------------------------------------------------------------------------------------------------------------------------------打飛機
menuP01   BYTE "====================================================", 0Dh, 0Ah,0
menuP02   BYTE "|       -   ----     ------------     -   -- -     |", 0Dh, 0Ah,0
menuP03   BYTE "|     ----    -         -  -   -     ----  -- -    |", 0Dh, 0Ah,0
menuP04   BYTE "|       -     -      ----  -   --     -   -- -     |", 0Dh, 0Ah,0
menuP05   BYTE "|       -     -         -  -   -     ----  -- -    |", 0Dh, 0Ah,0
menuP06   BYTE "|       --    -      ------------    -- -------    |", 0Dh, 0Ah,0
menuP07   BYTE "|     ---     -         -  -   -      - --  -      |", 0Dh, 0Ah,0
menuP08   BYTE "|       -     -         -  -   --     - -   -- -   |", 0Dh, 0Ah,0
menuP09   BYTE "|       -    --      --    -    --    --   - ---   |", 0Dh, 0Ah,0
menuP10   BYTE "|                                                  |", 0Dh, 0Ah,0
menuP11   BYTE "|                --> 開始遊戲                      |", 0Dh, 0Ah,0
menuP12   BYTE "|                                                  |", 0Dh, 0Ah,0
menuP13   BYTE "|                    結束遊戲                      |", 0Dh, 0Ah,0
menuP14   BYTE "|                                  ↑↓  移動選單  |", 0Dh, 0Ah,0
menuP15   BYTE "|                    製作名單                      |", 0Dh, 0Ah,0
menuP16   BYTE "|                                  enter 選單確定  |", 0Dh, 0Ah,0
menuP17   BYTE "====================================================", 0Dh, 0Ah,0
menuP18   BYTE "|                    開始遊戲                      |", 0Dh, 0Ah,0
menuP19   BYTE "|                --> 結束遊戲                      |", 0Dh, 0Ah,0
menuP20   BYTE "|                --> 製作名單                      |", 0Dh, 0Ah,0
;---------------------------------------------------------------------------------------------------------------------------------------------team29
teamP00   BYTE "====================================================", 0Dh, 0Ah,0
teamP01   BYTE "| -                                                |", 0Dh, 0Ah,0
teamP02   BYTE "|---      ---      --                    -     --- |", 0Dh, 0Ah,0
teamP03   BYTE "| -      -   -        -     ---- -      -  -   -  -|", 0Dh, 0Ah,0
teamP04   BYTE "| - -    -----   - -- -     -  -  -       -    ----|", 0Dh, 0Ah,0
teamP05   BYTE "| - -    -       -    -     -  -  -      -       - |", 0Dh, 0Ah,0
teamP06   BYTE "|  -       --      --   -   -  -  -     ----    -  |", 0Dh, 0Ah,0
teamP07   BYTE "|                                                  |", 0Dh, 0Ah,0
teamP08   BYTE "|       製作人員:                                  |", 0Dh, 0Ah,0
teamP09   BYTE "|                                                  |", 0Dh, 0Ah,0
teamP10   BYTE "|                408262703曾博暘                   |", 0Dh, 0Ah,0
teamP11   BYTE "|                                                  |", 0Dh, 0Ah,0
teamP12   BYTE "|                407040093邱妍瑛                   |", 0Dh, 0Ah,0
teamP13   BYTE "|                                                  |", 0Dh, 0Ah,0
teamP14   BYTE "|                --> 返回首頁 <--                  |", 0Dh, 0Ah,0
teamP15   BYTE "|                                  enter 選單確定  |", 0Dh, 0Ah,0
teamP16   BYTE "====================================================", 0Dh, 0Ah,0
;-------------------------------------------------------------------------------------------------------------------------------------------GAMEOVER
overP00   BYTE "====================================================", 0Dh, 0Ah,0
overP01   BYTE "|  ---------    ------    -----------   ---------  |", 0Dh, 0Ah,0
overP02   BYTE "|  --          --    --   --   -   --   --         |", 0Dh, 0Ah,0
overP03   BYTE "|  --    ---   --    --   --   -   --   ---------  |", 0Dh, 0Ah,0
overP04   BYTE "|  --     --   --------   --   -   --   --         |", 0Dh, 0Ah,0
overP05   BYTE "|  ---------   --    --   --   -   --   ---------  |", 0Dh, 0Ah,0
overP06   BYTE "|                                                  |", 0Dh, 0Ah,0
overP07   BYTE "|   -------    --       --  ---------   ---------  |", 0Dh, 0Ah,0
overP08   BYTE "| --       --   --     --   --          --     --  |", 0Dh, 0Ah,0
overP09   BYTE "| --       --    --   --    ---------   ---------  |", 0Dh, 0Ah,0
overP10   BYTE "| --       --     -- --     --          --  --     |", 0Dh, 0Ah,0
overP11   BYTE "|   -------        --       ---------   --    ---  |", 0Dh, 0Ah,0
overP12   BYTE "|                                  ← → 移動選單  |", 0Dh, 0Ah,0
overP13   BYTE "         你的分數:                                  ", 0Dh, 0Ah,0
overP14   BYTE "|                                  enter 選單確定  |", 0Dh, 0Ah,0
overP15   BYTE "|         --> 再來        返回首頁                 |", 0Dh, 0Ah,0
overP16   BYTE "====================================================", 0Dh, 0Ah,0
overP17   BYTE "|             再來    --> 返回首頁                 |", 0Dh, 0Ah,0
;------------------------------------------------------------------------------------------------------------------------------------------------RULE
ruleP00   BYTE "====================================================", 0Dh, 0Ah,0
ruleP01   BYTE "|              -----       -----  - -              |", 0Dh, 0Ah,0
ruleP02   BYTE "|          -   -   -       -   -  -  -             |", 0Dh, 0Ah,0
ruleP03   BYTE "|         ---  -----       -----  -  -             |", 0Dh, 0Ah,0
ruleP04   BYTE "|          -   -   -       -   -     -             |", 0Dh, 0Ah,0
ruleP05   BYTE "|         ---  -----       -----     -             |", 0Dh, 0Ah,0
ruleP06   BYTE "|         - -   - -                  -             |", 0Dh, 0Ah,0
ruleP07   BYTE "|              -  --        - -    ---             |", 0Dh, 0Ah,0
ruleP08   BYTE "|                                                  |", 0Dh, 0Ah,0
ruleP09   BYTE "|            Ⅰ.運用←、→ 控制飛碟                |", 0Dh, 0Ah,0
ruleP10   BYTE "|            Ⅱ.用空白建可以讓飛碟射擊飛機         |", 0Dh, 0Ah,0
ruleP11   BYTE "|            Ⅲ.被飛機穿透後GAMEOVER!!!            |", 0Dh, 0Ah,0
ruleP12   BYTE "|                                                  |", 0Dh, 0Ah,0
ruleP13   BYTE "|                                                  |", 0Dh, 0Ah,0
ruleP14   BYTE "|                -->   開幹!  <--                  |", 0Dh, 0Ah,0
ruleP15   BYTE "|				   enter 選單確定  |", 0Dh, 0Ah,0
ruleP16   BYTE "====================================================", 0Dh, 0Ah,0
ruleP17   BYTE "|                --> 困難模式 <--                  |", 0Dh, 0Ah,0
;------------------------------------------------------------------------------------------------------------------------------------------------贏了
winP00   BYTE "====================================================", 0Dh, 0Ah,0
winP01   BYTE "|                                                  |", 0Dh, 0Ah,0
winP02   BYTE "|                                                  |", 0Dh, 0Ah,0
winP03   BYTE "|      -------------   -      ------------         |", 0Dh, 0Ah,0
winP04   BYTE "|                     -               ---          |", 0Dh, 0Ah,0
winP05   BYTE "|            --      -               ---           |", 0Dh, 0Ah,0
winP06   BYTE "|           --                     ---             |", 0Dh, 0Ah,0
winP07   BYTE "|          --                      ---             |", 0Dh, 0Ah,0
winP08   BYTE "|         --                       ---             |", 0Dh, 0Ah,0
winP09   BYTE "|        -----------             -----             |", 0Dh, 0Ah,0
winP10   BYTE "|                                                  |", 0Dh, 0Ah,0
winP11   BYTE "|                                                  |", 0Dh, 0Ah,0
winP12   BYTE "|                                  ← → 移動選單  |", 0Dh, 0Ah,0
winP13   BYTE "|       你的分數:                                  |", 0Dh, 0Ah,0
winP14   BYTE "|                                  enter 選單確定  |", 0Dh, 0Ah,0
winP15   BYTE "|         --> 困難模式			           |", 0Dh, 0Ah,0
winP16   BYTE "====================================================", 0Dh, 0Ah,0
winP17   BYTE "|         --> 返回首頁                             |", 0Dh, 0Ah,0



;---------------------------------------------------CODE
.CODE
main PROC
		CALL menu1
;----------------------------------------------------------------------


		
		
main ENDP
;----------------------------------------------------選單一	
menu1 PROC
;---------------------------------------改顏色
		 MOV EAX,yellow
		 call setTextColor
		 CALL Clrscr
		 MOV EDX, OFFSET menuP01
		 CALL WriteString
		 MOV EDX, OFFSET menuP02
		 CALL WriteString
		 MOV EDX, OFFSET menuP03
		 CALL WriteString
		 MOV EDX, OFFSET menuP04
		 CALL WriteString
		 MOV EDX, OFFSET menuP05
		 CALL WriteString
		 MOV EDX, OFFSET menuP06
		 CALL WriteString
		 MOV EDX, OFFSET menuP07
		 CALL WriteString
		 MOV EDX, OFFSET menuP08
		 CALL WriteString
		 MOV EDX, OFFSET menuP09
		 CALL WriteString
		 MOV EDX, OFFSET menuP10
		 CALL WriteString
		 MOV EDX, OFFSET menuP11
		 CALL WriteString
		 MOV EDX, OFFSET menuP12
		 CALL WriteString
		 MOV EDX, OFFSET menuP13
		 CALL WriteString
		 MOV EDX, OFFSET menuP14
		 CALL WriteString
		 MOV EDX, OFFSET menuP15
		 CALL WriteString
		 MOV EDX, OFFSET menuP16
		 CALL WriteString
		 MOV EDX, OFFSET menuP17
		 CALL WriteString
;---------------------------------------------跳轉
		 .REPEAT
			CALL Readkey
			.IF al == 0Dh
				call rule		;近入規則
			.ELSEIF ah == 50h
				call menu2		;選到結束遊戲
			.ELSEIF al == 48h
				call menu3		;選到製作人員
			.ENDIF
		 .UNTIL	(ah == 50h)||(al == 0Dh)||(al == 48h)
menu1 ENDP
;----------------------------------------------------選單二
menu2 PROC
;---------------------------------------改顏色
		 MOV EAX,yellow
		 call setTextColor
		 CALL Clrscr
		 MOV EDX, OFFSET menuP01
		 CALL WriteString
		 MOV EDX, OFFSET menuP02
		 CALL WriteString
		 MOV EDX, OFFSET menuP03
		 CALL WriteString
		 MOV EDX, OFFSET menuP04
		 CALL WriteString
		 MOV EDX, OFFSET menuP05
		 CALL WriteString
		 MOV EDX, OFFSET menuP06
		 CALL WriteString
		 MOV EDX, OFFSET menuP07
		 CALL WriteString
		 MOV EDX, OFFSET menuP08
		 CALL WriteString
		 MOV EDX, OFFSET menuP09
		 CALL WriteString
		 MOV EDX, OFFSET menuP10
		 CALL WriteString
		 MOV EDX, OFFSET menuP18
		 CALL WriteString
		 MOV EDX, OFFSET menuP12
		 CALL WriteString
		 MOV EDX, OFFSET menuP19
		 CALL WriteString
		 MOV EDX, OFFSET menuP14
		 CALL WriteString
		 MOV EDX, OFFSET menuP15
		 CALL WriteString
		 MOV EDX, OFFSET menuP16
		 CALL WriteString
		 MOV EDX, OFFSET menuP17
		 CALL WriteString
;---------------------------------------------跳轉
		 .REPEAT
			CALL Readkey
			.IF al == 0Dh			;退出遊戲	
				invoke ExitProcess,0
			.ELSEIF ah == 50h
				call menu3		;跳到選擇TEAM
			.ELSEIF ah == 48h
				call menu1		;跳到開始遊戲
			.ENDIF
		 .UNTIL	(ah == 50h)||(al == 0Dh)||(ah == 48h)
menu2 ENDP
;----------------------------------------------------選單三
menu3 PROC
		 MOV EAX,yellow
		 call setTextColor
		 CALL Clrscr
		 MOV EDX, OFFSET menuP01
		 CALL WriteString
		 MOV EDX, OFFSET menuP02
		 CALL WriteString
		 MOV EDX, OFFSET menuP03
		 CALL WriteString
		 MOV EDX, OFFSET menuP04
		 CALL WriteString
		 MOV EDX, OFFSET menuP05
		 CALL WriteString
		 MOV EDX, OFFSET menuP06
		 CALL WriteString
		 MOV EDX, OFFSET menuP07
		 CALL WriteString
		 MOV EDX, OFFSET menuP08
		 CALL WriteString
		 MOV EDX, OFFSET menuP09
		 CALL WriteString
		 MOV EDX, OFFSET menuP10
		 CALL WriteString
		 MOV EDX, OFFSET menuP18
		 CALL WriteString
		 MOV EDX, OFFSET menuP12
		 CALL WriteString
		 MOV EDX, OFFSET menuP13
		 CALL WriteString
		 MOV EDX, OFFSET menuP14
		 CALL WriteString
		 MOV EDX, OFFSET menuP20
		 CALL WriteString
		 MOV EDX, OFFSET menuP16
		 CALL WriteString
		 MOV EDX, OFFSET menuP17
		 CALL WriteString
;--------------------------------------跳轉
		 .REPEAT
			CALL Readkey
			.IF al == 0Dh
				call team29	;跳轉製作人員
			.ELSEIF ah == 48h
				call menu2	;跳轉選單二
			.ELSEIF ah == 50h
				CALL menu3	;跳轉開始
			.ENDIF
		 .UNTIL	(al == 0Dh)||(ah == 48h)||(ah == 50h)
menu3 ENDP
;-------------------------------------------------team29
team29 PROC
		 MOV EAX,yellow
		 call setTextColor
		 CALL Clrscr
		 MOV EDX, OFFSET teamP00
		 CALL WriteString
		 MOV EDX, OFFSET teamP01
		 CALL WriteString
		 MOV EDX, OFFSET teamP02
		 CALL WriteString
		 MOV EDX, OFFSET teamP03
		 CALL WriteString
		 MOV EDX, OFFSET teamP04
		 CALL WriteString
		 MOV EDX, OFFSET teamP05
		 CALL WriteString
		 MOV EDX, OFFSET teamP06
		 CALL WriteString
		 MOV EDX, OFFSET teamP07
		 CALL WriteString
		 MOV EDX, OFFSET teamP08
		 CALL WriteString
		 MOV EDX, OFFSET teamP09
		 CALL WriteString
		 MOV EDX, OFFSET teamP10
		 CALL WriteString
		 MOV EDX, OFFSET teamP11
		 CALL WriteString
		 MOV EDX, OFFSET teamP12
		 CALL WriteString
		 MOV EDX, OFFSET teamP13
		 CALL WriteString
		 MOV EDX, OFFSET teamP14
		 CALL WriteString
		 MOV EDX, OFFSET teamP15
		 CALL WriteString
		 MOV EDX, OFFSET teamP16
		 CALL WriteString

;--------------------------------------跳轉
		 .REPEAT
			CALL Readkey
			.IF al == 0Dh
				call menu1
			.ENDIF

		 .UNTIL	(al == 0Dh)
;--------------------------------------結束

team29 ENDP
;-------------------------------------------------------------------------------------------  --------------------------------------------------RULE
rule PROC
		 MOV EAX,yellow
		 call setTextColor
		 CALL Clrscr
		 MOV EDX, OFFSET ruleP00
		 CALL WriteString
		 MOV EDX, OFFSET ruleP01
		 CALL WriteString
		 MOV EDX, OFFSET ruleP02
		 CALL WriteString
		 MOV EDX, OFFSET ruleP03
		 CALL WriteString
		 MOV EDX, OFFSET ruleP04
		 CALL WriteString
		 MOV EDX, OFFSET ruleP05
		 CALL WriteString
		 MOV EDX, OFFSET ruleP06
		 CALL WriteString
		 MOV EDX, OFFSET ruleP07
		 CALL WriteString
		 MOV EDX, OFFSET ruleP08
		 CALL WriteString
		 MOV EDX, OFFSET ruleP09
		 CALL WriteString
		 MOV EDX, OFFSET ruleP10
		 CALL WriteString
		 MOV EDX, OFFSET ruleP11
		 CALL WriteString
		 MOV EDX, OFFSET ruleP12
		 CALL WriteString
		 MOV EDX, OFFSET ruleP13
		 CALL WriteString
		 MOV EDX, OFFSET ruleP14
		 CALL WriteString
		 MOV EDX, OFFSET ruleP15
		 CALL WriteString
		 MOV EDX, OFFSET ruleP16
		 CALL WriteString

		 .REPEAT
			CALL readkey
			.IF al == 0Dh
				call game
			.ELSEIF (ah==50h)||(al==48h)
				call ruleh
			.ENDIF
	     .UNTIL (al == 0Dh)||(ah==50h)||(al==48h)
		 
		 
rule ENDP
;-----------------------------------------------------------------------------------------------------------------------------------------RULE(h)
ruleh PROC
		 MOV EAX,yellow
		 call setTextColor
		 CALL Clrscr
		 MOV EDX, OFFSET ruleP00
		 CALL WriteString
		 MOV EDX, OFFSET ruleP01
		 CALL WriteString
		 MOV EDX, OFFSET ruleP02
		 CALL WriteString
		 MOV EDX, OFFSET ruleP03
		 CALL WriteString
		 MOV EDX, OFFSET ruleP04
		 CALL WriteString
		 MOV EDX, OFFSET ruleP05
		 CALL WriteString
		 MOV EDX, OFFSET ruleP06
		 CALL WriteString
		 MOV EDX, OFFSET ruleP07
		 CALL WriteString
		 MOV EDX, OFFSET ruleP08
		 CALL WriteString
		 MOV EDX, OFFSET ruleP09
		 CALL WriteString
		 MOV EDX, OFFSET ruleP10
		 CALL WriteString
		 MOV EDX, OFFSET ruleP11
		 CALL WriteString
		 MOV EDX, OFFSET ruleP12
		 CALL WriteString
		 MOV EDX, OFFSET ruleP13
		 CALL WriteString
		 MOV EDX, OFFSET ruleP17
		 CALL WriteString
		 MOV EDX, OFFSET ruleP15
		 CALL WriteString
		 MOV EDX, OFFSET ruleP16
		 CALL WriteString

		 .REPEAT
			CALL readkey
			.IF al == 0Dh
				call gameh
			.ELSEIF (ah==50h)||(al==48h)
				call rule
			.ENDIF
	     .UNTIL (al == 0Dh)||(ah==50h)||(al==48h)
 
ruleh ENDP


;-----------------------------------------------------------------------------------------------------------------------------------GAMEOVER(再來)
over PROC
		 MOV EAX,yellow
		 call setTextColor
		 CALL Clrscr
		 MOV EDX, OFFSET overP00
		 CALL WriteString
		 MOV EDX, OFFSET overP01
		 CALL WriteString
		 MOV EDX, OFFSET overP02
		 CALL WriteString
		 MOV EDX, OFFSET overP03
		 CALL WriteString
		 MOV EDX, OFFSET overP04
		 CALL WriteString
		 MOV EDX, OFFSET overP05
		 CALL WriteString
		 MOV EDX, OFFSET overP06
		 CALL WriteString
		 MOV EDX, OFFSET overP07
		 CALL WriteString
		 MOV EDX, OFFSET overP08
		 CALL WriteString
		 MOV EDX, OFFSET overP09
		 CALL WriteString
		 MOV EDX, OFFSET overP10
		 CALL WriteString
		 MOV EDX, OFFSET overP11
		 CALL WriteString
		 MOV EDX, OFFSET overP12
		 CALL WriteString

		 mov eax,score
		 mwrite "|        你的分數: "
		 call writedec

		 .IF EAX==0
			mwrite "                               |"
		 .ENDIF
		 .IF (EAX>10)&&(eax<100)
			mwrite "                              |"
		 .ENDIF
		 .IF (EAX>=100)&&(eax<1000)
			mwrite "                             |"
		 .ENDIF
		 .IF EAX>=1000
			mwrite "                            |"
		 .ENDIF
		 call Crlf

		 MOV EDX, OFFSET overP14
		 CALL WriteString
		 MOV EDX, OFFSET overP15
		 CALL WriteString
		 MOV EDX, OFFSET overP16
		 CALL WriteString
;--------------------------------------跳轉		 
		 .REPEAT
			CALL readkey
			.IF al == 0Dh
				call game
			.ELSEIF (ah == 4Dh)||(ah == 4Bh)	
				CALL overB
			.ENDIF
	     .UNTIL (al == 0Dh)||(ah == 4Dh)||(ah == 4Bh)
;--------------------------------------結束
over ENDP
;-----------------------------------------------------------------------------------------------------------------------------------GAMEOVER(回首頁)
overB PROC
		 MOV EAX,yellow
		 call setTextColor
		 CALL Clrscr
		 MOV EDX, OFFSET overP00
		 CALL WriteString
		 MOV EDX, OFFSET overP01
		 CALL WriteString
		 MOV EDX, OFFSET overP02
		 CALL WriteString
		 MOV EDX, OFFSET overP03
		 CALL WriteString
		 MOV EDX, OFFSET overP04
		 CALL WriteString
		 MOV EDX, OFFSET overP05
		 CALL WriteString
		 MOV EDX, OFFSET overP06
		 CALL WriteString
		 MOV EDX, OFFSET overP07
		 CALL WriteString
		 MOV EDX, OFFSET overP08
		 CALL WriteString
		 MOV EDX, OFFSET overP09
		 CALL WriteString
		 MOV EDX, OFFSET overP10
		 CALL WriteString
		 MOV EDX, OFFSET overP11
		 CALL WriteString
		 MOV EDX, OFFSET overP12
		 CALL WriteString
		;---------------------------------------------------------------------------------------------------------------todo
		 mov eax,score
		 mwrite "|        你的分數: "
		 call writedec

		 .IF EAX==0
			mwrite "                               |"
		 .ENDIF
		 .IF (EAX>10)&&(eax<100)
			mwrite "                              |"
		 .ENDIF
		 .IF (EAX>=100)&&(eax<1000)
			mwrite "                             |"
		 .ENDIF
		 .IF EAX>=1000
			mwrite "                            |"
		 .ENDIF
		 call Crlf

		 MOV EDX, OFFSET overP14
		 CALL WriteString
		 MOV EDX, OFFSET overP17
		 CALL WriteString
		 MOV EDX, OFFSET overP16
		 CALL WriteString
;--------------------------------------跳轉		 
		 .REPEAT
			CALL readkey
			.IF al == 0Dh
				CALL menu1 
			.ELSEIF  (ah == 4Dh)||(ah == 4Bh)
				CALL over
			.ENDIF
	     .UNTIL (al == 0Dh)||(ah == 4Dh)||(ah == 4Bh)
;--------------------------------------結束
overB ENDP

;-----------------------------------------------------------------------------------------------------------------------------------贏了(再來)
win PROC
		 MOV EAX,yellow
		 call setTextColor
		 CALL Clrscr
		 MOV EDX, OFFSET winP00
		 CALL WriteString
		 MOV EDX, OFFSET winP01
		 CALL WriteString
		 MOV EDX, OFFSET winP02
		 CALL WriteString
		 MOV EDX, OFFSET winP03
		 CALL WriteString
		 MOV EDX, OFFSET winP04
		 CALL WriteString
		 MOV EDX, OFFSET winP05
		 CALL WriteString
		 MOV EDX, OFFSET winP06
		 CALL WriteString
		 MOV EDX, OFFSET winP07
		 CALL WriteString
		 MOV EDX, OFFSET winP08
		 CALL WriteString
		 MOV EDX, OFFSET winP09
		 CALL WriteString
		 MOV EDX, OFFSET winP10
		 CALL WriteString
		 MOV EDX, OFFSET winP11
		 CALL WriteString
		 MOV EDX, OFFSET winP12
		 CALL WriteString
		;---------------------------------------------------------------------------------------------------------------todo
		 mov eax,score
		 mwrite "|        你的分數: "
		 call writedec

		 .IF EAX==0
			mwrite "                               |"
		 .ENDIF
		 .IF (EAX>10)&&(eax<100)
			mwrite "                              |"
		 .ENDIF
		 .IF (EAX>=100)&&(eax<1000)
			mwrite "                             |"
		 .ENDIF
		 .IF EAX>=1000
			mwrite "                            |"
		 .ENDIF
		 call Crlf

		 MOV EDX, OFFSET winP14
		 CALL WriteString
		 MOV EDX, OFFSET winP15
		 CALL WriteString
		 MOV EDX, OFFSET winP16
		 CALL WriteString
;--------------------------------------跳轉		 
		 .REPEAT
			CALL readkey
			.IF al == 0Dh
				call gameh
			.ELSEIF (ah==4DH)||(ah==4BH)	
				CALL winB
			.ENDIF
	     .UNTIL (al == 0Dh)||(ah==4DH)||(ah==4BH)
;--------------------------------------結束
win ENDP

;-----------------------------------------------------------------------------------------------------------------------------------贏了(回首頁)
winB PROC
		 MOV EAX,yellow
		 call setTextColor
		 CALL Clrscr
		 MOV EDX, OFFSET winP00
		 CALL WriteString
		 MOV EDX, OFFSET winP01
		 CALL WriteString
		 MOV EDX, OFFSET winP02
		 CALL WriteString
		 MOV EDX, OFFSET winP03
		 CALL WriteString
		 MOV EDX, OFFSET winP04
		 CALL WriteString
		 MOV EDX, OFFSET winP05
		 CALL WriteString
		 MOV EDX, OFFSET winP06
		 CALL WriteString
		 MOV EDX, OFFSET winP07
		 CALL WriteString
		 MOV EDX, OFFSET winP08
		 CALL WriteString
		 MOV EDX, OFFSET winP09
		 CALL WriteString
		 MOV EDX, OFFSET winP10
		 CALL WriteString
		 MOV EDX, OFFSET winP11
		 CALL WriteString
		 MOV EDX, OFFSET winP12
		 CALL WriteString
		 ;---------------------------------------------------------------------------------------------------------------todo
		 mov eax,score
		 mwrite "|        你的分數: "
		 call writedec

		 .IF EAX==0
			mwrite "                               |"
		 .ENDIF
		 .IF (EAX>10)&&(eax<100)
			mwrite "                              |"
		 .ENDIF
		 .IF (EAX>=100)&&(eax<1000)
			mwrite "                             |"
		 .ENDIF
		 .IF EAX>=1000
			mwrite "                            |"
		 .ENDIF
		 call Crlf

		 MOV EDX, OFFSET winP14
		 CALL WriteString
		 MOV EDX, OFFSET winP17
		 CALL WriteString
		 MOV EDX, OFFSET winP16
		 CALL WriteString
;--------------------------------------跳轉		 
		 .REPEAT
			CALL readkey
			.IF al == 0Dh
				CALL menu1 
			.ELSEIF  (ah==4DH)||(ah==4BH)
				CALL win
			.ENDIF
	     .UNTIL (al == 0Dh)||(ah==4DH)||(ah==4BH)
;--------------------------------------結束
winB ENDP

;-----------------------------------------------------------game

game PROC
	mov flag,0
	mov airplaneX,1
	mov airplaneY,20
	.WHILE foe1X == 0
		call RandomRange
			.IF eax > 1 && eax < 42
				mov foe1X,al ;隨機產生敵人位置
			.ENDIF
	.endw
	mov foe1Y,1
	mov enemy_flag,0
	mov score,0
	call Clrscr
	mov edx,offset gameblock
	call writestring
	mov edx,offset straight
	mov ecx,20
	L1:
		call writestring
	Loop L1
	mov edx,offset gameblock
	call writestring
	mGotoxy 50,2
	mwrite "======SCORE======"
	mGotoxy 50,3
	mwrite "|               |"
	mGotoxy 50,4
	mwrite "================="
	lo:
		mGotoxy 0,0
		push dx
		mov dl,42
		mov dh,4
		call gotoxy
		
		mov dl,57
		mov dh,3
		call gotoxy
		mov eax,score
		call writedec
		pop dx

		mov eax,30

		.IF score>=300
			sub eax,3	;27
		.ENDIF

		.IF score>=600
			sub eax,3	;22
		.ENDIF

		.IF score>=900
			sub eax,3	;19
		.ENDIF

		.IF score>=1200
			sub eax,3	;16
		.ENDIF

		.IF score>=2000
			call win
		.ENDIF


		call delay
		call gotoxy
		mov al,' '
		call writechar
		.IF flag==1
			mov dl,bulletX
			mov dh,bulletY
			mov al,' '
			call gotoXY
			call writechar
			dec dh
			dec bulletY
			.IF dh != 0
				.IF dh > 16
					mov al,'.'
				.ELSE
					mov al,'|'
				.ENDIF
				call gotoXY
				call writechar
			.ELSE
				dec flag
			.ENDIF
		.ENDIF
		.IF enemy_flag==20
			mov dl,foe1X
			mov dh,foe1Y
			call gotoxy
			mov al,' '
			call writechar
			push eax
			mov eax,3
			call RandomRange
			mov enemy_next,eax
			pop eax
			inc foe1Y
			inc dh
			mov dl,foe1X
			call gotoxy
			mov al,'V'
			call writechar
			mov enemy_flag,5
			.IF	foe1Y>20
				jmp los
			.ENDIF
		.ELSE 
			inc enemy_flag
		.ENDIF
		mov dl,foe1X
		mov dh,foe1Y
		.IF dl == bulletX && dh == bulletY
			add score,100
			call gotoxy
			mov al,' '
			call writechar
			mov enemy_flag,0
			mov foe1Y,1
			mov foe1X,15
			mov eax,30
			call RandomRange
			.IF eax >= 1 && eax <= 40
				mov foe1X,al
			.ENDIF
		.ENDIF
		call readkey		;非功能鍵存al 功能鍵ah
		.IF (ah == 4bh) && airplaneX != 1 ;左鍵
			dec airplaneX
		.ELSEIF (ah == 4dh) && airplaneX != 40 ;右鍵
			inc airplaneX
		.ELSEIF (al == ' ') && flag==0 ;空白鍵
			mov dl,airplaneX
			mov dh,airplaneY
			dec dh
			mov bulletX,dl
			mov bulletY,dh
			call Gotoxy
			mov al,'@'
			call writechar
			inc flag
		.ENDIF
		mov dl,airplaneX
		mov dh,airplaneY
		call gotoXY
		mov al,'U'
		call writechar
		jmp lo
		los:
			call over
game ENDP
;-----------------------------------------------------------game(hard)
gameh PROC
	mov flag,0
	mov airplaneX,1
	mov airplaneY,20
	mov foe1X,15
	mov foe1Y,1
	mov enemy_flag,0
	mov score,0
	call Clrscr
	mov edx,offset gameblock
	call writestring
	mov edx,offset straight
	mov ecx,20
	L1:
		call writestring
	Loop L1
	mov edx,offset gameblock
	call writestring
	mGotoxy 44,2
	mwrite "======SCORE======"
	mGotoxy 44,3
	mwrite "|               |"
	mGotoxy 44,4
	mwrite "|               |"
	mGotoxy 44,5
	mwrite "|               |"
	mGotoxy 44,6
	mwrite "================="
	lo:
		mGotoxy 0,0
		push dx
		mov dl,50
		mov dh,4
		call gotoxy
		mov eax,score
		call writedec
		pop dx
		mov eax,15

		.IF score>=300
			sub eax,3	;12
		.ENDIF

		.IF score>=600
			sub eax,3	;9
		.ENDIF

		.IF score>=900
			sub eax,3	;8
		.ENDIF

		.IF score>=1200
			sub eax,3	;7
		.ENDIF
		call delay
		call gotoxy
		mov al,' '
		call writechar
		.IF flag==1
			mov dl,bulletX
			mov dh,bulletY
			mov al,' '
			call gotoXY
			call writechar
			dec dh
			dec bulletY
			.IF dh != 0
				.IF dh > 16
					mov al,'.'
				.ELSE
					mov al,'|'
				.ENDIF
				call gotoXY
				call writechar
			.ELSE
				dec flag
			.ENDIF
		.ENDIF
		.IF enemy_flag==20
			mov dl,foe1X
			mov dh,foe1Y
			call gotoxy
			mov al,' '
			call writechar
			push eax
			mov eax,3
			call RandomRange
			mov enemy_next,eax
			.IF enemy_next==0
				.IF foe1X!=1
				dec foe1X 
				.ENDIF
			.ELSEIF enemy_next==2
				.IF foe1X!=30
					inc foe1X 
				.ENDIF
			.ENDIF
			pop eax
			inc foe1Y
			inc dh
			mov dl,foe1X
			call gotoxy
			mov al,'V'
			call writechar
			mov enemy_flag,5
			.IF	foe1Y>20
				jmp los
			.ENDIF
		.ELSE 
			inc enemy_flag
		.ENDIF
		mov dl,foe1X
		mov dh,foe1Y
		.IF dl==bulletX && dh== bulletY
			add score,100
			call gotoxy
			mov al,' '
			call writechar
			mov enemy_flag,0
			mov foe1Y,1
			mov foe1X,15
			mov eax,30
			call RandomRange
			.IF eax>=1 && eax <=30
				mov foe1X,al
			.ENDIF
		.ENDIF
		call readkey		;非功能鍵存al 功能鍵ah
		.IF (ah == 4bh) && airplaneX!=1 ;左鍵
			dec airplaneX
		.ELSEIF (ah == 4dh) && airplaneX!=30 ;右鍵
			inc airplaneX
		.ELSEIF (al == ' ') && flag==0 ;空白鍵
			mov dl,airplaneX
			mov dh,airplaneY
			dec dh
			mov bulletX,dl
			mov bulletY,dh
			call Gotoxy
			mov al,'@'
			call writechar
			inc flag
		.ENDIF
		mov dl,airplaneX
		mov dh,airplaneY
		call gotoXY
		mov al,'U'
		call writechar
		jmp lo
		los:
			call over
gameh ENDP
END main


