;--> For those who are using DOSBOX 0.74.
;--> For Sure you know the commands to run this assembly code.
;--> But if you are a beginner don't worry I got you.
;--> Windows: -c "mount c 'c:\My folder with DOS games\'"
;--> Linux: -c "mount c \"/tmp/name with space\""
;--> After this you'll write   ml mainCodeForGame.ASM
;--> After this you'll write   mainCodeForGame.exe
;--> Game will be executed :)
;--> If Anything Does'nt work feel free to ask here
;--> Hoping You get what you want.

.model small
.stack 100h

.data
brickSmasher db '<<BRICK BREAKER>>$'
OPT1 DB 'PRESS 1 TO PLAY THE GAME$'
OPT2 DB 'PRESS 2 TO VIEWS INSTRUCTION$'
OPT3 DB 'PRESS 3 TO VIEW HIGH SCORE$'
BallDrop db 'BALL IS BEING DR0PED IN 5 SECS$'
BallDrop1 db 'DISTROY EVERTHING IN YOUR WAY...$'
UserDecision db 'ENTER YOUR OPTION : $'
LiveLMsg db 'OOPS YOU LOST A LIFE.....$'
E1111 db 'PRESS ANY OTHER KEY TO EXIT$'
Score db 'SCORE : $'
Score_Num db 0
choiceToMoveInGame db 0
userChoice db ?
ball_x_Corordinate dw 50h
ball_y_Corordinate dw 096h
livesHearts dw 3
BAR_x_Corordinate dw 50h
BAR_y_Corordinate dw 0beh
con db 'Congradulation :), You Passed Level 1$'
x db 50h
y db 20h
go db 0
go1 db 1
BarHeight dw 06h
BarWidth dw 050h
oppp1 db 'TO EXIT PRESS ANY OTHER KEY (x3)$'
oppp2 db 'FOR RESTART PRESS ENTER (x3)$'
 w db "Welcome To Brick Breaker",'$'
  user db "Enter your name : ",'$'
  play db  "HELLO PLAYER,  : ",'$'
  string db 10 dup(0)
  string1 db 10 dup('$')
  n db 0
  kkk db 0
  key1 db 0
Instant_Key_Press_To_Menu_Bool dw 0
key db 0
x_velocity dw 03h
y_velocity dw 02h
Bar_x_velocity dw 05h
;Bar_y_velocity dw 01h
Ball_S dw 05 ; 10 pixels total bantee x pe 5 y pe 5		
Time_For_A_Mission db 0
Time_For_A_drop db 0
Time_For_A_drop1 db 0
prev_Time db 0
FOR_Heaven_Counter dw 0
Width_Window dw 140h
Height_Window dw 0C8h

pause db "Game is Paused",'$'
continue db "Press any key to continue...",'$'
menuecal db "Press 5 to go back to main menue.",'$'
HURRAY DB "HURRAY ! YOU WON THE GAME",'$'

fname db "gamename.txt",0
fscore db "score.txt",0
flevel db "level.txt",0
fhandle dw 0
fhandle1 dw 0
fhandle2 dw 0

level1 db "Level 1",'$'
level2 db "Level 2",'$'
level3 db "Level 3",'$'

  stage1 db "<<Stage 1>>",'$'
  live db "Lives",'$'
  stage3 db "<<Stage 3>>",'$'

  un db 2 dup(0)
  tp db 0
   ig db "Instruction/ User Guide",'$'
   p db "-For moving the slider",'$'
   pr db "-->RIGHT Side use '1' to move.",'$'
   pl db "-->LEFT Side use '3' to move.",'$'
   game db "-After 5 secs the ball appears randomly.",'$'
   game1 db"-At the first stage",'$'
   game11 db "-->The brick will collapse in one shot.",'$'
   game2 db "-At the second stage",'$'
   game22 db "-->The brick collapse when hit twicely.",'$'
   game3 db "-At third stage",'$'
   game33 db "-->The brick collaspse when hit thricely.",'$'
   life db "-You have 3 lives only.",'$'
   t db "-The game last for 4 minutes",'$'
   e db "-Press Any Key to return to main menu.",'$'

   stage2 db '<<Stage 2>>$'
   ALLOW DW 0
   ALLOW1 DW 0
   ALLOW2 DW 0
   ALLOW3 DW 0
   ALLOW4 DW 0
   ALLOW5 DW 0
   ALLOW6 DW 0
   ALLOW7 DW 0
   ALLOW8 DW 0

   Pass1 db 'Press Any Key (x3) to Enter Mission 2$'
   Brown db 'Note : Hit the Bricks in Centre to $'
   bR1  DB  'Distroy them Because Some have$'  
   br2  db   'Tranparnt Edges...$'





   con1 db 'Congradulation :), You Passed Level 2$'
   Pass11 db 'Press Any Key (x3) to Enter Mission 3$'



   Brown1 db "Note : There's A magic Brick to $"
   bR11  db  'get destroy some bricks and$'  
   br21  db  'give you some bonus...$'


   player22 db "Players",'$'
   level22 db "Level",'$'
   score22 db "Scores",'$'


   UNIT_Value_OF_Score db 0
   Tens_Value_OF_Score db 0
   T22 db 0
   p22222222 db 0
   level db 8 dup(0)
.code

jmp main


ResetMyCursor Proc

		mov ah , 2
		mov dh , 20
		mov dl , 0
		int 10h
		ret

ResetMyCursor endp
EnterName Proc
		 

		mov ah , 6
		mov al , 0
		mov cx , 0

		mov dh , 24
		mov dl , 79

		mov bh , 00110110b
		int 10h







     		mov ah , 6
			mov al , 0

			mov ch , 4
			mov cl , 4

			mov dh , 20
			mov dl , 35 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 0000
			int 10h

		 
		 
		 
		 
		 
		 MOV AH,02H
		  MOV BX,0
		  MOV DH, 8 ;Row Number
		  MOV DL, 8 ;Column Number
		  INT 10H

		  lea dx,w
		  mov ah,09h
		  int 21h

		  mov dl,10
		  mov ah,02h
		  int 21h

		  MOV AH,02H
		  MOV BX,0
		  MOV DH, 11 ;Row Number
		  MOV DL, 8 ;Column Number
		  INT 10H

		  lea dx,user
		  mov ah,09h
		  int 21h
  
		  mov dx,offset string
		  mov ah,3fh
		  int 21h

		  mov string[10],'$'




ret
EnterName Endp
Menue proc
			
	.if(key1 == 0  )
	call EnterName
	inc key1
	.endif

;******************************************************************************************************
		


;*******************************************************************

	        mov ah , 6
			mov al , 0

			mov ch , 1 
			mov cl , 2

			mov dh , 25
			mov dl , 37 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 0001
			int 10h


			mov ah , 6
			mov al , 0

			mov ch , 2 
			mov cl , 4

			mov dh , 24
			mov dl , 35 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 0100
			int 10h


			mov ah , 6
			mov al , 0

			mov ch , 3 
			mov cl , 5

			mov dh , 24
			mov dl , 34 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 111
			int 10h


			mov ah , 6
			mov al , 0

			mov ch , 4 
			mov cl , 6

			mov dh , 24
			mov dl , 33 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 0000
			int 10h


			;********************************name


	   		  mov dl,10
			  mov ah,02h
			  int 21h 

			  MOV AH,02H
			  MOV BX,0
			  MOV DH, 5 ;Row Number
			  MOV DL, 10 ;Column Number
			  INT 10H

			  mov dx,offset play
			  mov ah,09h
			  int 21h


			  MOV AH,02H
			  MOV BX,0
			  MOV DH, 5;Row Number
			  MOV DL, 23 ;Column Number
			  INT 10H

			  lea dx,string
			  mov ah,09h
			  int 21h

			  ;********************************************



			mov ah , 6
			mov al , 0
			mov ch , 6
			mov cl , 0

			mov dh , 6
			mov dl , 5; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 0000B
			int 10h


			mov ah , 6
			mov al , 0
			mov ch , 20
			mov cl , 33

			mov dh , 20
			mov dl , 40; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 0000B
			int 10h










		mov ah , 2
		mov bh , 0

		mov dh , 2
		mov dl , 11
		int 10h
		mov dx , offset brickSmasher
		mov ah , 9
		int 21h


		mov ah , 2
		mov dh , 8
		mov dl , 8
		int 10h
		mov dx , offset OPT1
		mov ah , 9
		int 21h


		mov ah , 2
		mov dh , 11
		mov dl , 6
		int 10h		
		mov dx , offset OPT2
		mov ah , 9
		int 21h



		mov ah , 2
		mov dh , 14
		mov dl , 7
		int 10h
		mov dx , offset OPT3
		mov ah , 9
		int 21h


		mov ah , 2
		mov dh , 17
		mov dl , 7
		int 10h
		mov dx , offset E1111    ;offset UserDecision
		mov ah , 9
		int 21h


		mov ah , 2
		mov dh , 20
		mov dl , 9
		int 10h
		mov dx , offset UserDecision    ;offset UserDecision
		mov ah , 9
		int 21h








		mov ah , 1
		int 21h
		sub al , 48
		mov userChoice , al  


		;******************* Loading System ***************************  




		








		call Loading






	   mov BAR_x_Corordinate , 50h
       mov BAR_y_Corordinate , 0beh


		;**************************************************************




		call ResetMyCursor
		ret

Menue endp
Loading Proc



       MOV ball_x_Corordinate ,  0
       MOV ball_y_Corordinate , 0



		mov ah , 2ch
		int 21h

		add dh , 0		; 2 SECONDS  
		mov T22 , dh ; put in to local var
		r1:
	
		mov ah , 2ch
		int 21h


		cmp dh , T22	; jab take mere diyaa gaye sec pore ni hun gai it wont exit
		call Print_the_Ball
		add ball_x_Corordinate , 20
		add ball_y_Corordinate , 20
		jne r1				






l9 :
MOV ball_x_Corordinate , 50h 
MOV ball_y_Corordinate , 096h



ret
Loading endp



Drop_The_Ball Proc

		mov ah , 2
		mov bh , 0

		mov dh , 2
		mov dl , 5
		int 10h
		mov dx , offset BallDrop
		mov ah , 9
		int 21h

		
		mov ah , 2
		mov dh , 5
		mov dl , 4
		int 10h
		mov dx , offset BallDrop1
		mov ah , 9
		int 21h






        mov ah , 2ch
		int 21h

		add dh , 5 ;  
		mov Time_For_A_drop , dh ; put in to local var
		repeat_Time:
	
		mov ah , 2ch
		int 21h


		cmp dh , Time_For_A_drop	; jab take mere diyaa gaye sec pore ni hun gai it wont exit
		jne repeat_Time				 ; this jmp aiding my cause


		inc FOR_Heaven_Counter
		call ResetMyCursor

ret
Drop_The_Ball endp



Strip Proc

			mov ah , 6
			mov al , 0

			mov ch , 23 
			mov cl , 0

			mov dh , 25
			mov dl , 40 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 1101b
			int 10h







ret
strip endp



Strip1 Proc

			mov ah , 6
			mov al , 0

			mov ch , 23
			mov cl , 0

			mov dh , 25
			mov dl , 40 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 0010b
			int 10h







ret
strip1 endp


Strip2 Proc

			mov ah , 6
			mov al , 0

			mov ch , 23
			mov cl , 0

			mov dh , 25
			mov dl , 40 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 1000b
			int 10h







ret
strip2 endp

















Print_the_Bar Proc


			



		mov cx, bar_x_Corordinate
		mov dx, bar_y_Corordinate
		horizontalally_Bar :
			mov ah, 0ch
			mov bh, 0
			mov al, 0100
			int 10h
			
			add cx , 1
			mov ax , cx
			sub ax , Bar_x_Corordinate
			cmp ax , BarWidth
			jb horizontalally_Bar


			mov cx , bar_x_Corordinate
			add dx , 1
			mov ax , dx
			sub ax , bar_y_Corordinate
			cmp ax , BarHeight
			jb horizontalally_Bar ; chng





ret
Print_the_Bar Endp
















BRICKS_Formation Proc
			

			
			


			;*************************INNER GAME BACKGROUND ****************************************
			mov ah , 6
			mov al , 0
			mov cx , 0

			mov dh , 24
			mov dl , 79

			mov bh ,00100100b
			int 10h

			;00100100b





			mov ah , 6
			mov al , 0

			mov ch , 0 
			mov cl , 0

			mov dh , 2
			mov dl , 40 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 1101b
			int 10h













			;********************************** BRICKS FORMATION *****************************

			mov ah , 2
	    	mov bh , 0

    		mov dh , 1
	    	mov dl , 15
	    	int 10h


		    lea dx,stage1
	        mov ah,09h
	        int 21h



			
			;**********************drop screeen***************


			











			;mov ax , FOR_Heaven_Counter
            ;CMP ax , 0
			;jne l1 
			;je  l2

			;l2 :
				;call Drop_The_Ball
			
			;**********************drop screeen***************

			l1 :
			
			call hearts


			
			
			mov ah , 6
			mov al , 0

			mov ch , 6
			mov cl , 2

			mov dh , 6
			mov dl , 6 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 01110100b
			int 10h


			; CL DL SE DESIGN AYEE GAA


			; dh or ch se height ctrl hotee


			mov ah , 6
			mov al , 0

			mov ch , 9 
			mov cl , 2

			mov dh , 9
			mov dl , 6 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 11100100b
			int 10h



			mov ah , 6
			mov al , 0
			mov ch , 12
			mov cl , 2

			mov dh , 12
			mov dl , 6; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 11001101b
			int 10h





			; DH OR CH 3 KE MULTIPLES SE BAR REE 


			

			
			

















			;************ FIRST COL UP

			mov ah , 6
			mov al , 0
			mov ch , 9
			mov cl , 10

			mov dh , 9
			mov dl , 17; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 11001101b
			int 10h


			;********************* 2ND COL UP



			mov ah , 6
			mov al , 0

			mov ch , 6
			mov cl , 20

			mov dh , 6
			mov dl , 27  ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 11100100b
			int 10h




			mov ah , 6
			mov al , 0
			mov ch , 12
			mov cl , 20

			mov dh , 12
			mov dl , 27; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 11001101b
			int 10h

			;************ THIRD COL UP


			mov ah , 6
			mov al , 0
			mov ch , 12
			mov cl , 31

			mov dh , 12
			mov dl , 35; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 11001101b
			int 10h




			mov ah , 6
			mov al , 0

			mov ch , 9
			mov cl , 31

			mov dh , 9
			mov dl , 35  ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 11100100b
			int 10h


			mov ah , 6
			mov al , 0

			mov ch , 6
			mov cl , 31

			mov dh , 6
			mov dl , 35 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 01110100b
			int 10h
			
			;********************************** BRICKS FORMATION *****************************

			
			;***************************************** usman work ***************************
			mov ah , 0ch
			mov al , 0100
			mov cx , 247 ; x_
			mov dx , 55 ; y_
			int 10h
			;****************************************


		mov ah , 2
		mov bh , 0

		mov dh , 1
		mov dl , 30
		int 10h
		mov dx , offset SCORE
		mov ah , 9
		int 21h

		
		;************************Score Printing*****************************


		mov ah , 2
		mov bh , 0

		mov dh , 1
		mov dl , 37
		int 10h



		mov bl , 0Ah
		mov ax , 0
		mov al , Score_Num
		div bl

		mov cl , ah
		mov ch , al

		mov dl , ch
		add dl , 48
		MOV UNIT_Value_OF_Score , dl
		mov ah , 2
		int 21h


		mov ah , 2
		mov bh , 0

		mov dh , 1
		mov dl , 38
		int 10h


		
		mov dl , cl
		add dl , 48
		MOV Tens_Value_OF_Score, dl
		mov ah , 2
		int 21h


		;************************Score Printing*****************************




	;	mov dl , Score_Num
	;	add dl , 48
	;	mov ah , 2
	;	int 21h







;******************************* Distruction of Bricks ********************
			cmp allow , 1
			je change 
			jne t1 
			change :
			mov ah , 6
			mov al , 0
			mov ch , 9
			mov cl , 10
			mov dh , 9
			mov dl , 17; IDER SE LENGTH CHOTE HOTEE -1 KARNAA
			mov bh , 00100100b
			int 10h

t1 :
			cmp allow1 , 1
			je change1 
			jne t2 
			change1 :
			mov ah , 6
			mov al , 0

			mov ch , 9
			mov cl , 2

			mov dh , 9
			mov dl , 6 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 00100100b
			int 10h

t2:
			cmp allow2 , 1
			je change2 
			jne t3 
			change2 :
			mov ah , 6
			mov al , 0

			mov ch , 6
			mov cl , 2

			mov dh , 6
			mov dl , 6 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 00100100b
			int 10h


T3 :

			cmp allow3 , 1
			je change3 
			jne t4
			change3 :
			mov ah , 6
			mov al , 0
			mov ch , 12
			mov cl , 2

			mov dh , 12
			mov dl , 6; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 00100100b
			int 10h

t4 :		
			cmp allow4 , 1
			je change4 
			jne t5
			change4 :
			mov ah , 6
			mov al , 0
			mov ch , 12
			mov cl , 20

			mov dh , 12
			mov dl , 27; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 00100100b
			int 10h

T5 :
			cmp allow5 , 1
			je change5 
			jne t6
			change5 :
			mov ah , 6
			mov al , 0

			mov ch , 6
			mov cl , 20

			mov dh , 6
			mov dl , 27  ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 00100100b
			int 10h


T6:

			cmp allow6 , 1
			je change6 
			jne t7
			change6 :
			mov ah , 6
			mov al , 0

			mov ch , 6
			mov cl , 31

			mov dh , 6
			mov dl , 35 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 00100100b
			int 10h
t7 :

			
			cmp allow7 , 1
			je change7 
			jne t8
			change7 :	mov ah , 6
			mov al , 0

			mov ch , 9
			mov cl , 31

			mov dh , 9
			mov dl , 35  ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 00100100b
			int 10h





t8 :
			cmp allow8 , 1
			je change8 
			jne t9
			change8 :
			mov ah , 6
			mov al , 0
			mov ch , 12
			mov cl , 31

			mov dh , 12
			mov dl , 35; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 00100100b
			int 10h




t9 :
;******************************* Distruction of Bricks ********************
ret
BRICKS_Formation endp

Hearts Proc
			mov dx , livesHearts
			cmp dx , 0 
			je noPrint
			mov ah , 2
	    	mov bh , 0

		    mov dh , 1
		    mov dl , 1
		    int 10h
			
		    lea dx,live
	        mov ah,09h
	        int 21h

			mov ah , 2
			mov bh , 0
			mov dh , 1
			mov dl , 6
			int 10h
			mov ah , 09h
			mov al , 3
			mov bh , 0
			mov cx , livesHearts
			int 10h
	noPrint :
ret
Hearts Endp

Print_the_Ball Proc
	

		;write pixels on screen
		mov cx, ball_x_Corordinate
		mov dx, ball_y_Corordinate
		
		horizontalally :
			mov ah, 0ch
			mov bh, 0
			mov al, 0fh
			int 10h

			add cx , 1
			mov ax , cx
			sub ax , ball_x_Corordinate
			cmp ax , Ball_S
			jb horizontalally             ; chng
			
			mov cx , ball_x_Corordinate
			add dx , 1
			mov ax , dx
			sub ax , ball_y_Corordinate
			cmp ax , Ball_S
			jb horizontalally ; chng

RET
Print_the_Ball endp

MagicBlock Proc











ret
MagicBlock endp

livesLostMsg Proc 
mov ah , 2
		mov dh , 17
		mov dl , 6
		int 10h
		mov dx , offset LiveLMsg
		mov ah , 9
		int 21h


        mov ah , 2ch
		int 21h

		add dh , 2		; 2 SECONDS  
		mov Time_For_A_drop1 , dh ; put in to local var
		repeat_Time1:
	
		mov ah , 2ch
		int 21h


		cmp dh , Time_For_A_drop1	; jab take mere diyaa gaye sec pore ni hun gai it wont exit
		jne repeat_Time1				

		MOV DX , livesHearts
		CMP DX , 0
		JE N1
		dec livesHearts

		N1 :
ret
livesLostMsg endp


Instruct Proc

		mov ah , 6
		mov al , 0
		mov cx , 0

		mov dh , 24
		mov dl , 79

		mov bh , 00110111b
		int 10h
		
		mov ah , 2
		mov bh , 0

		mov dh , 1
		mov dl , 9
		int 10h
			
		lea dx,ig
	    mov ah,09h
	    int 21h

		mov ah , 2
		mov bh , 0

		mov dh , 3
		mov dl , 0
		int 10h
			
		lea dx,p
	    mov ah,09h
	    int 21h

		mov ah , 2
		mov bh , 0

		mov dh , 5
		mov dl , 0
		int 10h
			
		lea dx,pr
	    mov ah,09h
	    int 21h

		mov ah , 2
		mov bh , 0

		mov dh , 7
		mov dl , 0
		int 10h
			
		lea dx,pl
	    mov ah,09h
	    int 21h

		mov ah , 2
		mov bh , 0

		mov dh , 9
		mov dl , 0
		int 10h
			
		lea dx,game
	    mov ah,09h
	    int 21h

		mov ah , 2
		mov bh , 0

		mov dh , 11
		mov dl , 0
		int 10h
			
		lea dx,game1
	    mov ah,09h
	    int 21h

		mov ah , 2
		mov bh , 0

		mov dh , 13
		mov dl , 0
		int 10h
			
		lea dx,game11
	    mov ah,09h
	    int 21h

		mov ah , 2
		mov bh , 0

		mov dh , 15
		mov dl , 0
		int 10h
			
		lea dx,game2
	    mov ah,09h
	    int 21h

		mov ah , 2
		mov bh , 0

		mov dh , 17
		mov dl , 0
		int 10h
			
		lea dx,game22
	    mov ah,09h
	    int 21h

		mov ah , 2
		mov bh , 0

		mov dh , 19
		mov dl , 0
		int 10h
			
		lea dx,game3
	    mov ah,09h
	    int 21h

		mov ah , 2
		mov bh , 0

		mov dh , 21
		mov dl , 0
		int 10h
			
		lea dx,game33
	    mov ah,09h
	    int 21h

		
		mov ah , 2
		mov bh , 0

		mov dh , 23
		mov dl , 0
		int 10h
			
		lea dx,t
	    mov ah,09h
	    int 21h
		
		mov ah , 1
		int 21h

ret
Instruct endp

Design Proc

			mov ah , 6
			mov al , 0

			mov ch , 4
			mov cl , 4

			mov dh , 20
			mov dl , 36 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 111
			int 10h

		
		
			
			mov ah , 6
			mov al , 0

			mov ch , 5
			mov cl , 19

			mov dh , 19
			mov dl , 35 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 1101b
			int 10h

			mov ah , 6
			mov al , 0

			mov ch , 5
			mov cl , 5

			mov dh , 19
			mov dl , 19 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 111b
			int 10h












ret
Design endp

MoveMent Proc

		mov ah , 01h
		int 16h
		jz end1

		mov ah , 00h
		int 16h

		cmp ah , 4BH
		je move_me_Left


		cmp ah , 4DH
		je move_me_right

		;**************************************************
		cmp al , 27
		je P_Screen
		jne end1








		P_Screen :
		mov ah , 6
		mov al , 0
		mov cx , 0

		mov dh , 24
		mov dl , 79

		mov bh , 01110111b
		int 10h
        
		
			
		
		call Design
		
		
		
		
		
		
		
		
		
		;******** USMAN YAHAN PAUSE KA LIA KCH LIKH DAIN
		mov ah , 2
		mov bh , 0

		mov dh , 10
		mov dl , 13
		int 10h
			
		lea dx,pause
	    mov ah,09h
	    int 21h

		mov ah , 2
		mov bh , 0

		mov dh , 12
		mov dl , 6
		int 10h
			
		lea dx,continue
	    mov ah,09h
	    int 21h

		mov ah , 2
		mov bh ,0

		mov dh , 14
		mov dl , 4
		int 10h

		lea dx, menuecal
		mov ah,09h
		int 21h

		;*********************************************
		mov ah , 1
		int 21h

		cmp al,53
		je hh 
		jne end1
		hh:
		 jmp Main




		;*********************************************
		mov ah , 1
		int 21h
		;******************************Pause Key





		
		move_me_right :
		mov bx , Bar_x_velocity
		add BAR_x_Corordinate , bx
		MOV BX , 136H
		SUB BX , BarWidth ; bar width
		CMP  BAR_x_Corordinate , BX 
		JA CLOSE_RIGHT
		jmp end1

		CLOSE_RIGHT :
		MOV BAR_x_Corordinate , BX
		RET
		
		move_me_Left :
		mov bx , Bar_x_velocity
		sub BAR_x_Corordinate , bx
		MOV BX , 07h
		CMP BAR_x_Corordinate , BX
		JB CLOSE_LEFT
		jmp end1


		CLOSE_LEFT :
		mov  BX , 07h
		mov BAR_x_Corordinate , bx 
		ret

		end1 :
ret
MoveMent endp


MoveMent_For_Mission2 Proc



		mov ah , 01h
		int 16h
		jz end12

		mov ah , 00h
		int 16h

		cmp ah , 4Bh
		je move_me_Left2


		;cmp al , 49
		;je move_me_Left2



		cmp ah , 4Dh
		je move_me_right2


		;cmp al , 51
		;je move_me_right2




		;**************************************************
		cmp al , 27
		je P_Screen2
		jne end12


		P_Screen2 :
		mov ah , 6
		mov al , 0
		mov cx , 0

		mov dh , 24
		mov dl , 79

		mov bh , 01110111b
		int 10h




		call Design




        ;******** USMAN YAHAN PAUSE KA LIA KCH LIKH DAIN
		mov ah , 2
		mov bh , 0

		mov dh , 10
		mov dl , 13
		int 10h
			
		lea dx,pause
	    mov ah,09h
	    int 21h

		mov ah , 2
		mov bh , 0

		mov dh , 12
		mov dl , 6
		int 10h
			
		lea dx,continue
	    mov ah,09h
	    int 21h

		mov ah , 2
		mov bh ,0

		mov dh , 14
		mov dl , 4
		int 10h

		lea dx, menuecal
		mov ah,09h
		int 21h

		;*********************************************
		mov ah , 1
		int 21h

		cmp al,53
		je hh 
		jne end12
		hh:
		 jmp Main




		;*********************************************
		mov ah , 1
		int 21h
		;******************************Pause Key




		move_me_right2 :
		mov bx , Bar_x_velocity
		add BAR_x_Corordinate , bx
		MOV BX , 136H
		SUB BX , BarWidth ; bar width
		CMP  BAR_x_Corordinate , BX 
		JA CLOSE_RIGHT2
		jmp end12

		CLOSE_RIGHT2 :
		MOV BAR_x_Corordinate , BX
		RET
		
		move_me_Left2 :
		mov bx , Bar_x_velocity
		sub BAR_x_Corordinate , bx
		MOV BX , 09h
		CMP BAR_x_Corordinate , BX
		JB CLOSE_LEFT2
		jmp end12


		CLOSE_LEFT2 :
		mov  BX , 09h ; 9
		mov BAR_x_Corordinate , bx 
		ret

		end12 :



ret
MoveMent_For_Mission2 endp














Give_Me_Speed Proc

		    mov bx , x_velocity
			add ball_x_Corordinate , bx
			
			cmp ball_x_Corordinate , 07h
			jl negative_X

			mov bx ,Width_Window
			SUB BX , 0fh
			cmp ball_x_Corordinate , bx
			jg negative_X



			mov bx , y_velocity
			add ball_y_Corordinate , bx

			CMP ball_y_Corordinate , 19h ; LET SAY NECHE SE JO BALL LAG REEE
			jl negative_y


			mov ax , Height_Window
			cmp ball_y_Corordinate , ax
			jg lives_Lost
			
			;********************************************

			Call Check_Conclusion
			

			;******************************************** Brick_79_79 *********************************
			MOV DX , ALLOW
			CMP DX , 0
			JE DestroyBlock
			JNE B1
			DestroyBlock :
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 79		;(if ax > BAR_y_Corordinate)
			JNG b1						


			MOV AX , 79
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL B1					

			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 79		;(if ax >  BAR_x_Corordinate)
			JNG B1					


			
			MOV AX , 79
			ADD AX , 64
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL B1							; else()
			MOV DX , 1
			ADD ALLOW , DX
			add Score_Num , 1
			neg y_velocity
			RET

B1:
			;******************************************** Brick_79_79 *********************************

			;********************************************Brick_16_79************************************
			MOV DX , ALLOW1
			CMP DX , 0
			JE DestroyBlock1
			JNE E1
			DestroyBlock1 :
			
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 79		;(if ax > BAR_y_Corordinate)
			JNG E1							;else ()

			MOV AX , 79
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL E1							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 16		;(if ax >  BAR_x_Corordinate)
			JNG E1							;else()

			MOV AX , 16
			ADD AX , 39
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL E1							; else()
			MOV DX , 1
			ADD ALLOW1 , DX
			add Score_Num , 1
			neg y_velocity
			RET
E1 :
			;********************************************Brick_16_79************************************
	       
		   ;**********************************Brick_16_79 (2 MARKS BLOCK)*****************************
			MOV DX , ALLOW2
			CMP DX , 0
			JE DestroyBlock3
			JNE F1
			DestroyBlock3 :

			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 55		;(if ax > BAR_y_Corordinate)
			JNG F1							;else ()

			MOV AX , 55
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL F1							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 16		;(if ax >  BAR_x_Corordinate)
			JNG F1							;else()

			MOV AX , 16
			ADD AX , 39
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL F1							; else()
			MOV DX , 1
			ADD ALLOW2 , DX
			add Score_Num , 2
			neg y_velocity
			RET
F1:	
			 ;**********************************Brick_16_79 (2 MARKS BLOCK)*****************************
			
			;**********************************Brick_16_104 *****************************
			MOV DX , ALLOW3
			CMP DX , 0
			JE DestroyBlock4
			JNE G1
			DestroyBlock4 :
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 104		;(if ax > BAR_y_Corordinate)
			JNG G1							;else ()

			MOV AX , 104
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL G1							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 16		;(if ax >  BAR_x_Corordinate)
			JNG G1							;else()

			MOV AX , 16
			ADD AX , 39
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL G1							; else()
			MOV DX , 1
			ADD ALLOW3 , DX
			add Score_Num , 1
			neg y_velocity
			RET
G1 :
			 ;**********************************Brick_16_104*****************************
			


			;**********************************Brick_160_104*****************************
			MOV DX , ALLOW4
			CMP DX , 0
			JE DestroyBlock5
			JNE J1
			DestroyBlock5 :
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 104		;(if ax > BAR_y_Corordinate)
			JNG J1							;else ()

			MOV AX , 104
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL J1							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 160		;(if ax >  BAR_x_Corordinate)
			JNG J1							;else()

			MOV AX , 160
			ADD AX , 64
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL J1							; else()
			MOV DX , 1
			ADD ALLOW4 , DX
			add Score_Num , 1
			neg y_velocity
			RET
J1:
			;**********************************Brick_160_104*****************************

			;**********************************Brick_160_55*****************************
			
			MOV DX , ALLOW5
			CMP DX , 0
			JE DestroyBlock6
			JNE K1
			DestroyBlock6 :
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 55		;(if ax > BAR_y_Corordinate)
			JNG K1							;else ()

			MOV AX , 55
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL K1							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 160		;(if ax >  BAR_x_Corordinate)
			JNG K1							;else()

			MOV AX , 160
			ADD AX , 63
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL K1							; else()
			MOV DX , 1
			ADD ALLOW5 , DX
			add Score_Num , 1
			neg y_velocity
			RET
			
			
			
			
			
			
			
			
			
			;**********************************Brick_160_55*****************************

K1:


			;**********************************Brick_247_55 (mark 2) *****************************
			MOV DX , ALLOW6
			CMP DX , 0
			JE DestroyBlock7
			JNE z1
			DestroyBlock7 :
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 55		;(if ax > BAR_y_Corordinate)
			JNG z1							;else ()

			MOV AX , 55
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL z1							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 247		;(if ax >  BAR_x_Corordinate)
			JNG z1	


			
			MOV AX , 247
			ADD AX , 41
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL z1							; else()
			MOV DX , 1
			add ALLOW6 , DX
			add Score_Num , 2
			neg y_velocity
			RET
			

z1 :		
			;**********************************Brick_247_55 (mark 2) *****************************

			;**********************************Brick_247_79****************************************

			MOV DX , ALLOW7
			CMP DX , 0
			JE DestroyBlock8
			JNE y1
			DestroyBlock8 :

			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 79		;(if ax > BAR_y_Corordinate)
			JNG y1							;else ()

			MOV AX , 79
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL y1							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 247		;(if ax >  BAR_x_Corordinate)
			JNG y1	


			
			MOV AX , 247
			ADD AX , 41
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL y1							; else()
			MOV DX , 1
			ADD ALLOW7 , DX
			add Score_Num , 1
			neg y_velocity
			RET
			





y1 :
		;**********************************Brick_247_105****************************************

		
			MOV DX , ALLOW8
			CMP DX , 0
			JE DestroyBlock9
			JNE s1
			DestroyBlock9 :

			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 105		;(if ax > BAR_y_Corordinate)
			JNG s1							;else ()

			MOV AX , 105
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL s1							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 247		;(if ax >  BAR_x_Corordinate)
			JNG s1	


			
			MOV AX , 247
			ADD AX , 41
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL s1							; else()
			MOV DX , 1
			add ALLOW8 , DX
			add Score_Num , 1
			neg y_velocity
			RET
			

s1 :
		;**********************************Brick_247_105****************************************



ret

	

	negative_Y :  
	neg y_velocity
	RET


	lives_Lost :
	call beep
	call livesLostMsg
	MOV ball_x_Corordinate , 64h 
	MOV ball_y_Corordinate , 096h

	MOV bar_x_Corordinate , 64h 
	MOV bar_y_Corordinate , 0beh
	
	neg y_velocity
	RET


	negative_X :
	neg x_velocity
	ret

	
Give_Me_Speed endp




Check_Conclusion Proc 

			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , BAR_y_Corordinate		;(if ax > BAR_y_Corordinate)
			JNG E1							;else ()

			MOV AX , BAR_y_Corordinate
			ADD AX , BarHeight
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL E1							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , BAR_x_Corordinate		;(if ax >  BAR_x_Corordinate)
			JNG E1							;else()

			MOV AX , BAR_X_Corordinate
			ADD AX , BarWidth
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL E1							; else()
			neg y_velocity
			RET

E1:


ret
Check_Conclusion endp

		
		


	
Mission1_Complete Proc 
        
		
		
		
		mov ah , 6
		mov al , 0
		mov cx , 0

		mov dh , 24
		mov dl , 79

		mov bh ,0000
		int 10h
		
		
		
		
		
		
		
		
		;*******************************
		;Brick pasting still not donee
		;*******************************
		mov ah , 2
		mov bh , 0

		mov dh , 7
		mov dl , 2
		int 10h
			
		lea dx,CON
	    mov ah,09h
	    int 21h

		mov ah , 2
		mov bh , 0

		mov dh , 10
		mov dl , 2
		int 10h
			
		lea dx,Pass1
	    mov ah,09h
	    int 21h

		mov ah , 2
		mov bh ,0

		mov dh , 13
		mov dl , 2
		int 10h

		lea dx, Brown
		mov ah,09h
		int 21h


		mov ah , 2
		mov bh ,0

		mov dh , 15
		mov dl , 9
		int 10h

		lea dx, Br1
		mov ah,09h
		int 21h


		mov ah , 2
		mov bh ,0

		mov dh , 17
		mov dl , 9
		int 10h

		lea dx, Br2
		mov ah,09h
		int 21h



		mov ah , 1
		int 21h

		mov ah , 1
		int 21h


		mov ah , 1
		int 21h

ret
Mission1_Complete endp




Mission2_Complete Proc

mov ah , 6
		mov al , 0
		mov cx , 0

		mov dh , 24
		mov dl , 79

		mov bh ,0001
		int 10h



		;*******************************
		;Brick pasting still not donee
		;*******************************
		mov ah , 2
		mov bh , 0

		mov dh , 7
		mov dl , 2
		int 10h
			
		lea dx,CON1
	    mov ah,09h
	    int 21h

		mov ah , 2
		mov bh , 0

		mov dh , 10
		mov dl , 2
		int 10h
			
		lea dx,Pass11
	    mov ah,09h
	    int 21h

		mov ah , 2
		mov bh ,0

		mov dh , 13
		mov dl , 2
		int 10h

		lea dx, Brown1
		mov ah,09h
		int 21h


		mov ah , 2
		mov bh ,0

		mov dh , 15
		mov dl , 9
		int 10h

		lea dx, Br11
		mov ah,09h
		int 21h


		mov ah , 2
		mov bh ,0

		mov dh , 17
		mov dl , 9
		int 10h

		lea dx, Br21
		mov ah,09h
		int 21h

        







		mov ah , 1
		int 21h

		mov ah , 1
		int 21h

		mov ah , 1
		int 21h



ret
Mission2_Complete endp







BRICKS_Formation_For_Mission2 Proc
;*************************INNER GAME BACKGROUND ****************************************
			mov ah , 6
			mov al , 0
			mov cx , 0

			mov dh , 24
			mov dl , 79

			mov bh ,1010B
			int 10h

			;00100100b



			mov ah , 6
			mov al , 0

			mov ch , 0 
			mov cl , 0

			mov dh , 2
			mov dl , 40 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 0010b
			int 10h










			;********************************** BRICKS FORMATION *****************************

			mov ah , 2
	    	mov bh , 0
			
    		mov dh , 1
	    	mov dl , 14
	    	int 10h
			
		    lea dx,stage2
	        mov ah,09h
	        int 21h
			




			
			;**********************drop screeen***************


			











			;mov ax , FOR_Heaven_Counter
            ;CMP ax , 0
			;jne l1 
			;je  l2

			;l2 :
				;call Drop_The_Ball
			
			;**********************drop screeen***************

			
			
			call hearts


			
			
			mov ah , 6
			mov al , 0

			mov ch , 6
			mov cl , 2

			mov dh , 6
			mov dl , 6 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 01110100b
			int 10h


			; CL DL SE DESIGN AYEE GAA


			; dh or ch se height ctrl hotee


			mov ah , 6
			mov al , 0

			mov ch , 9
			mov cl , 2

			mov dh , 9
			mov dl , 6 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 11100110b
			int 10h



			mov ah , 6
			mov al , 0
			mov ch , 12
			mov cl , 2

			mov dh , 12
			mov dl , 6; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 11001101b
			int 10h





			; DH OR CH 3 KE MULTIPLES SE BAR REE 


			

			;************ FIRST COL UP

			mov ah , 6
			mov al , 0
			mov ch , 9
			mov cl , 10

			mov dh , 9
			mov dl , 17; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 01100111b
			int 10h


			;********************* 2ND COL UP



			mov ah , 6
			mov al , 0

			mov ch , 6
			mov cl , 20

			mov dh , 6
			mov dl , 27  ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 11100100b
			int 10h




			mov ah , 6
			mov al , 0
			mov ch , 12
			mov cl , 20

			mov dh , 12
			mov dl , 27; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 11001101b
			int 10h

			;************ THIRD COL UP


			mov ah , 6
			mov al , 0
			mov ch , 12
			mov cl , 31

			mov dh , 12
			mov dl , 35; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh ,    11001101b                  
			int 10h




			mov ah , 6
			mov al , 0

			mov ch , 9
			mov cl , 31

			mov dh , 9
			mov dl , 35  ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 01100111b
			int 10h


			mov ah , 6
			mov al , 0

			mov ch , 6
			mov cl , 31

			mov dh , 6
			mov dl , 35 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 01110100b  ;01100111b
			int 10h
			
			;********************************** BRICKS FORMATION *****************************

			;***************************************** usman work ***************************
			mov ah , 0ch
			mov al , 0fh
			mov cx , 247 ; x_
			mov dx , 79 ; y_
			int 10h
			;****************************************


		mov ah , 2
		mov bh , 0

		mov dh , 1
		mov dl , 30
		int 10h
		mov dx , offset SCORE
		mov ah , 9
		int 21h

		
		;************************Score Printing*****************************


		mov ah , 2
		mov bh , 0

		mov dh , 1
		mov dl , 37
		int 10h



		mov bl , 0Ah
		mov ax , 0
		mov al , Score_Num
		div bl

		mov cl , ah
		mov ch , al

		mov dl , ch
		add dl , 48
		mov UNIT_Value_OF_Score , dl
		mov ah , 2
		int 21h


		mov ah , 2
		mov bh , 0

		mov dh , 1
		mov dl , 38
		int 10h


		
		mov dl , cl
		add dl , 48
		mov Tens_Value_OF_Score , dl
		mov ah , 2
		int 21h


		;************************Score Printing*****************************



		;***************************DISTRUCTION***********************************


		.if(allow == 1 )
			mov ah , 6
			mov al , 0
			mov ch , 9
			mov cl , 10

			mov dh , 9
			mov dl , 17; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 0001
			int 10h


		.elseif (allow == 2)

			mov ah , 6
			mov al , 0
			mov ch , 9
			mov cl , 10

			mov dh , 9
			mov dl , 17; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 1010B
			int 10h

		
		.endif



		.if(allow7 == 1 )
			mov ah , 6
			mov al , 0

			mov ch , 9
			mov cl , 31

			mov dh , 9
			mov dl , 35  ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 0001
			int 10h



		.elseif (allow7 == 2)
            mov ah , 6
			mov al , 0

			mov ch , 9
			mov cl , 31

			mov dh , 9
			mov dl , 35  ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 1010B
			int 10h
			
			
		
		.endif


		.if(allow1 == 2 )
			mov ah , 6
			mov al , 0

			mov ch , 9
			mov cl , 2

			mov dh , 9
			mov dl , 6 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 1010B
			int 10h




		.endif

		.if(allow2 == 2 )
			mov ah , 6
			mov al , 0

			mov ch , 6
			mov cl , 2

			mov dh , 6
			mov dl , 6 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 1010B
			int 10h

		
		
		
		
		
		.endif
		
		
		.if(allow3 == 2 )
			mov ah , 6
			mov al , 0
			mov ch , 12
			mov cl , 2

			mov dh , 12
			mov dl , 6; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 1010B
			int 10h

		.endif


		.if(allow4 == 2 )
			mov ah , 6
			mov al , 0
			mov ch , 12
			mov cl , 20

			mov dh , 12
			mov dl , 27; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 1010B
			int 10h

		
		.endif
		
		.if(allow5 == 2 )
			mov ah , 6
			mov al , 0

			mov ch , 6
			mov cl , 20

			mov dh , 6
			mov dl , 27  ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 1010B
			int 10h
	
		
		.endif
		
		
		.if(allow6 == 2 )
			mov ah , 6
			mov al , 0

			mov ch , 6
			mov cl , 31

			mov dh , 6
			mov dl , 35 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 1010B
			int 10h
		
		.endif
		
		
		.if(allow8 == 2 )
			mov ah , 6
			mov al , 0
			mov ch , 12
			mov cl , 31

			mov dh , 12
			mov dl , 35; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 1010B
			int 10h

		
		.endif
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		;**************************************************************************


ret
BRICKS_Formation_For_Mission2 endp

BRICKS_Formation_For_Mission3 Proc

			mov ah , 6
			mov al , 0
			mov cx , 0

			mov dh , 24
			mov dl , 79

			mov bh ,111B
			int 10h

			;00100100b



			mov ah , 6
			mov al , 0

			mov ch , 0 
			mov cl , 0

			mov dh , 2
			mov dl , 40 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 1000b
			int 10h

















			;********************************** BRICKS FORMATION *****************************

			mov ah , 2
	    	mov bh , 0
			
    		mov dh , 1
	    	mov dl , 14
	    	int 10h
			
		    lea dx,stage3
	        mov ah,09h
	        int 21h
			




			
			;**********************drop screeen***************


			











			;mov ax , FOR_Heaven_Counter
            ;CMP ax , 0
			;jne l1 
			;je  l2

			;l2 :
				;call Drop_The_Ball
			
			;**********************drop screeen***************

			
			
			call hearts


			
			
			mov ah , 6
			mov al , 0

			mov ch , 6
			mov cl , 2

			mov dh , 6
			mov dl , 6 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 01110100b
			int 10h


			; CL DL SE DESIGN AYEE GAA


			; dh or ch se height ctrl hotee


			mov ah , 6
			mov al , 0

			mov ch , 9
			mov cl , 2

			mov dh , 9
			mov dl , 6 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 11100110b
			int 10h



			mov ah , 6
			mov al , 0
			mov ch , 12
			mov cl , 2

			mov dh , 12
			mov dl , 6; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 11001101b
			int 10h





			; DH OR CH 3 KE MULTIPLES SE BAR REE 


			

			;************ FIRST COL UP

			mov ah , 6
			mov al , 0
			mov ch , 9
			mov cl , 10

			mov dh , 9
			mov dl , 17; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 01100111b
			int 10h


			;********************* 2ND COL UP



			mov ah , 6
			mov al , 0

			mov ch , 6
			mov cl , 20

			mov dh , 6
			mov dl , 27  ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 11100100b
			int 10h




			mov ah , 6
			mov al , 0
			mov ch , 12
			mov cl , 20

			mov dh , 12
			mov dl , 27; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 11001101b
			int 10h

			;************ THIRD COL UP


			mov ah , 6
			mov al , 0
			mov ch , 12
			mov cl , 31

			mov dh , 12
			mov dl , 35; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh ,    11001101b                  
			int 10h




			mov ah , 6
			mov al , 0

			mov ch , 9
			mov cl , 31

			mov dh , 9
			mov dl , 35  ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 01100111b
			int 10h


			mov ah , 6
			mov al , 0

			mov ch , 6
			mov cl , 31

			mov dh , 6
			mov dl , 35 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 01110100b  ;01100111b
			int 10h
			
			;********************************** BRICKS FORMATION *****************************

			;***************************************** usman work ***************************
			mov ah , 0ch
			mov al , 0fh
			mov cx , 160 ; x_
			mov dx , 104 ; y_
			int 10h
			;****************************************


		mov ah , 2
		mov bh , 0

		mov dh , 1
		mov dl , 30
		int 10h
		mov dx , offset SCORE
		mov ah , 9
		int 21h

		
		;************************Score Printing*****************************


		mov ah , 2
		mov bh , 0

		mov dh , 1
		mov dl , 37
		int 10h



		mov bl , 0Ah
		mov ax , 0
		mov al , Score_Num
		div bl

		mov cl , ah
		mov ch , al

		mov dl , ch
		add dl , 48
		mov UNIT_Value_OF_Score , dl
		mov ah , 2
		int 21h


		mov ah , 2
		mov bh , 0

		mov dh , 1
		mov dl , 38
		int 10h


		
		mov dl , cl
		add dl , 48
		mov UNIT_Value_OF_Score , dl
		mov ah , 2
		int 21h


		;************************Score Printing*****************************

		;*************************** Distruction ************************

		.if(allow1 == 1 )
			mov ah , 6
			mov al , 0

			mov ch , 9
			mov cl , 2

			mov dh , 9
			mov dl , 6 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 1010B
			int 10h

         .elseif(allow1 == 2)
			mov ah , 6
			mov al , 0

			mov ch , 9
			mov cl , 2

			mov dh , 9
			mov dl , 6 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 0fh
			int 10h
		.elseif(allow1 == 3)
			mov ah , 6
			mov al , 0

			mov ch , 9
			mov cl , 2

			mov dh , 9
			mov dl , 6 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 111B
			int 10h
		.endif

	
	
	;************** magic brick code ***************************

	.if(allow1 == 3 )
			mov ah , 6
			mov al , 0
			mov ch , 12
			mov cl , 31

			mov dh , 12
			mov dl , 35; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 111B
			int 10h
			;===============2 4 5 8=====================

			mov al , 0

			mov ch , 6
			mov cl , 2

			mov dh , 6
			mov dl , 6 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 111B
			int 10h


			mov ah , 6
			mov al , 0

			mov ch , 6
			mov cl , 20

			mov dh , 6
			mov dl , 27  ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 111B
			int 10h


			mov ah , 6
			mov al , 0
			mov ch , 12
			mov cl , 20

			mov dh , 12
			mov dl , 27; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 111B
			int 10h



			
			mov go , 1





	

	.endif

	.if(go == 1 && go1 == 1 )
	
	MOV ALLOW2 , 3
	MOV ALLOW4 , 3
	MOV ALLOW5 , 3
	MOV ALLOW8 , 3
	mov go1 , 0
	add Score_Num, 5
	.endif

	;************** magic brick code ***************************

	.if(allow2 == 3 )
	mov ah , 6
			mov al , 0

			mov ch , 6
			mov cl , 2

			mov dh , 6
			mov dl , 6 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 111B
			int 10h


	.endif




	.if(allow3 == 3 )
			mov ah , 6
			mov al , 0
			mov ch , 12
			mov cl , 2

			mov dh , 12
			mov dl , 6; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 111B
			int 10h

		.endif




		.if(allow4 == 3 )
			mov ah , 6
			mov al , 0
			mov ch , 12
			mov cl , 20

			mov dh , 12
			mov dl , 27; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 111B
			int 10h

		
		.endif

		.if(allow5 == 3 )
			mov ah , 6
			mov al , 0

			mov ch , 6
			mov cl , 20

			mov dh , 6
			mov dl , 27  ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 111B
			int 10h
	
		
		.endif
		
		.if(allow6 == 3 )
			mov ah , 6
			mov al , 0

			mov ch , 6
			mov cl , 31

			mov dh , 6
			mov dl , 35 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 111B
			int 10h
		
		.endif

		.if(allow7 ==  3 )
			mov ah , 6
			mov al , 0

			mov ch , 9
			mov cl , 31

			mov dh , 9
			mov dl , 35  ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 111B
			int 10h
		.endif


		.if(allow8 == 3 )
			mov ah , 6
			mov al , 0
			mov ch , 12
			mov cl , 31

			mov dh , 12
			mov dl , 35; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 111B
			int 10h

		
		.endif
		
		





ret
BRICKS_Formation_For_Mission3 endp

Give_Me_Speed_For_Mission2 Proc
		  
		    mov bx , x_velocity
			add ball_x_Corordinate , bx
			
			cmp ball_x_Corordinate , 07h
			jl negative_X1

			mov bx ,Width_Window
			SUB BX , 5H
			cmp ball_x_Corordinate , bx
			jg negative_X1



			mov bx , y_velocity
			add ball_y_Corordinate , bx

			CMP ball_y_Corordinate , 19h ; LET SAY NECHE SE JO BALL LAG REEE
			jl negative_y1


			mov ax , Height_Window
			cmp ball_y_Corordinate , ax
			jg lives_Lost1
			
			;********************************************

			Call Check_Conclusion
			




				;******************************************** Brick_79_79 *********************************
			;MOV DX , ALLOW
			;CMP DX , 0
			;JE DestroyBlock
			;JNE B1
			
			.if (allow == 0 || allow == 1  )
			DestroyBlock :
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 79		;(if ax > BAR_y_Corordinate)
			JNG b11						


			MOV AX , 79
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL B11					

			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 79		;(if ax >  BAR_x_Corordinate)
			JNG B11					


			
			MOV AX , 79
			ADD AX , 64
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL B11							; else()
			MOV DX , 1
			ADD ALLOW , DX
			call beep
			add Score_Num , 3
			neg y_velocity
			RET
			.else
			jmp b11
			.endif
B11:
			;******************************************** Brick_79_79 *********************************



			.if (allow1 == 0 || allow1 == 1  )
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 79		;(if ax > BAR_y_Corordinate)
			JNG E11							;else ()

			MOV AX , 79
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL E11							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 16		;(if ax >  BAR_x_Corordinate)
			JNG E11							;else()

			MOV AX , 16
			ADD AX , 39
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL E11							; else()
			MOV DX , 1
			ADD ALLOW1 , DX
			add Score_Num , 1
			neg y_velocity
			RET


			.else
			jmp e11
			.endif

E11:

		.if (allow2 == 0 || allow2 == 1  )
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 55		;(if ax > BAR_y_Corordinate)
			JNG F11							;else ()

			MOV AX , 55
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL F11							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 16		;(if ax >  BAR_x_Corordinate)
			JNG F11						;else()

			MOV AX , 16
			ADD AX , 39
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL F11							; else()
			MOV DX , 1
			ADD ALLOW2 , DX
			add Score_Num , 2
			neg y_velocity
			RET
		.else
		jmp f11
		.endif


F11:	

		.if (allow3 == 0 || allow3 == 1  )
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 104		;(if ax > BAR_y_Corordinate)
			JNG G11							;else ()

			MOV AX , 104
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL G11							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 16		;(if ax >  BAR_x_Corordinate)
			JNG G11							;else()

			MOV AX , 16
			ADD AX , 39
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL G11							; else()
			MOV DX , 1
			ADD ALLOW3 , DX
			add Score_Num , 1
			neg y_velocity
			RET
			.else
			jmp G11
			.endif
G11 :


	.if (allow4 == 0 || allow4 == 1  )
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 104		;(if ax > BAR_y_Corordinate)
			JNG J11							;else ()

			MOV AX , 104
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL J11							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 160		;(if ax >  BAR_x_Corordinate)
			JNG J11							;else()

			MOV AX , 160
			ADD AX , 64
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL J11							; else()
			MOV DX , 1
			ADD ALLOW4 , DX
			add Score_Num , 1
			neg y_velocity
			RET



	.else
	jmp j11
	.endif

J11:

			.if (allow5 == 0 || allow5 == 1  )
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 55		;(if ax > BAR_y_Corordinate)
			JNG K11							;else ()

			MOV AX , 55
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL K11							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 160		;(if ax >  BAR_x_Corordinate)
			JNG K11							;else()

			MOV AX , 160
			ADD AX , 63
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL K11							; else()
			MOV DX , 1
			ADD ALLOW5 , DX
			add Score_Num , 1
			neg y_velocity
			RET
			
	.else
	jmp k11
	.endif
		
			
k11 :
			
			.if (allow6 == 0 || allow6 == 1  )
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 55		;(if ax > BAR_y_Corordinate)
			JNG z11							;else ()

			MOV AX , 55
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL z11							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 247		;(if ax >  BAR_x_Corordinate)
			JNG z11	


			
			MOV AX , 247
			ADD AX , 41
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL z11							; else()
			MOV DX , 1
			ADD ALLOW6 , DX
			add Score_Num , 2
			neg y_velocity
			RET
			
			.else
			jmp Z11
			.endif
			

z11 :		
			
			
			.if (allow7 == 0 || allow7 == 1  )
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 79		;(if ax > BAR_y_Corordinate)
			JNG y11							;else ()

			MOV AX , 79
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL y11							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 247		;(if ax >  BAR_x_Corordinate)
			JNG y11	


			
			MOV AX , 247
			ADD AX , 41
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL y11							; else()
			MOV DX , 1
			ADD ALLOW7 , DX
			add Score_Num , 3
			call beep
			neg y_velocity
			RET
			.else
			jmp Y11
			.endif





y11 :



			.if (allow8 == 0 || allow8 == 1  )
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 105		;(if ax > BAR_y_Corordinate)
			JNG s11							;else ()

			MOV AX , 105
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL s11							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 247		;(if ax >  BAR_x_Corordinate)
			JNG s11	


			
			MOV AX , 247
			ADD AX , 41
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL s11							; else()
			MOV DX , 1
			add ALLOW8 , DX
			add Score_Num , 1
			neg y_velocity
			RET
			.else
			jmp S11
			.endif


s11 :

ret

	negative_Y1 :  
	neg y_velocity
	RET


	lives_Lost1 :
	call beep
	call livesLostMsg
	MOV ball_x_Corordinate , 64h 
	MOV ball_y_Corordinate , 096h

	MOV bar_x_Corordinate , 64h 
	MOV bar_y_Corordinate , 0beh
	
	neg y_velocity
	RET


	negative_X1 :
	neg x_velocity
	ret


ret
Give_Me_Speed_For_Mission2 endp

Give_Me_Speed_For_Mission3 Proc 


			mov bx , x_velocity
			add ball_x_Corordinate , bx
			
			cmp ball_x_Corordinate , 07h
			jl negative_X11

			mov bx ,Width_Window
			SUB BX , 7H
			cmp ball_x_Corordinate , bx
			jg negative_X11



			mov bx , y_velocity
			add ball_y_Corordinate , bx

			CMP ball_y_Corordinate , 19h ; LET SAY NECHE SE JO BALL LAG REEE
			jl negative_y11


			mov ax , Height_Window
			cmp ball_y_Corordinate , ax
			jg lives_Lost11
			
			;********************************************

			Call Check_Conclusion
			
			;*********colution with blocks............***********************************

			.if (allow == 0 )
			DestroyBlock :
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 79		;(if ax > BAR_y_Corordinate)
			JNG b111					


			MOV AX , 79
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL B111					

			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 79		;(if ax >  BAR_x_Corordinate)
			JNG B111					


			
			MOV AX , 79
			ADD AX , 64
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL B111							; else()
			;MOV DX , 1
			;ADD ALLOW , DX
			;add Score_Num , 3
			neg y_velocity
			RET
			.else
			jmp b111
			.endif
B111:

			.if (allow1 == 0 || allow1 == 1 || allow1 == 2    )
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 79		;(if ax > BAR_y_Corordinate)
			JNG E111							;else ()

			MOV AX , 79
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL E111						;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 16		;(if ax >  BAR_x_Corordinate)
			JNG E111							;else()

			MOV AX , 16
			ADD AX , 39
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL E111							; else()
			MOV DX , 1
			ADD ALLOW1 , DX
			add Score_Num , 1
			call beep
			neg y_velocity
			RET


			.else
			jmp e111
			.endif

E111:

			.if (allow2 == 0 || allow2 == 1 || allow2 == 2 && allow1 != 3    )
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 55		;(if ax > BAR_y_Corordinate)
			JNG F111							;else ()

			MOV AX , 55
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL F111							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 16		;(if ax >  BAR_x_Corordinate)
			JNG F111						;else()

			MOV AX , 16
			ADD AX , 39
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL F111							; else()
			MOV DX , 1
			ADD ALLOW2 , DX
			add Score_Num , 2
			neg y_velocity
			RET
		.else
		jmp f111
		.endif


F111:	
			

			.if (allow3 == 0 || allow3 == 1 || allow3 == 2  )
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 104		;(if ax > BAR_y_Corordinate)
			JNG G111							;else ()

			MOV AX , 104
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL G111							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 16		;(if ax >  BAR_x_Corordinate)
			JNG G111							;else()

			MOV AX , 16
			ADD AX , 39
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL G111							; else()
			MOV DX , 1
			ADD ALLOW3 , DX
			add Score_Num , 1
			neg y_velocity
			RET
			.else
			jmp G111
			.endif
G111 :

			.if (allow4 == 0 || allow4 == 1  || allow4 == 2 &&  allow1 != 3 )
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 104		;(if ax > BAR_y_Corordinate)
			JNG J111							;else ()

			MOV AX , 104
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL J111						;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 160		;(if ax >  BAR_x_Corordinate)
			JNG J111							;else()

			MOV AX , 160
			ADD AX , 64
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL J111							; else()
			MOV DX , 1
			ADD ALLOW4 , DX
			add Score_Num , 1
			neg y_velocity
			RET



	.else
	jmp j111
	.endif

J111:

			.if (allow5 == 0 || allow5 == 1 || allow5 == 2  && allow1 != 3  )
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 55		;(if ax > BAR_y_Corordinate)
			JNG K111							;else ()

			MOV AX , 55
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL K111							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 160		;(if ax >  BAR_x_Corordinate)
			JNG K111							;else()

			MOV AX , 160
			ADD AX , 63
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL K111							; else()
			MOV DX , 1
			ADD ALLOW5 , DX
			add Score_Num , 1
			neg y_velocity
			RET
			
	.else
	jmp k111
	.endif
		
			
k111 :

			.if (allow6 == 0 || allow6 == 1 || allow6 == 2  )
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 55		;(if ax > BAR_y_Corordinate)
			JNG z111							;else ()

			MOV AX , 55
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL z111							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 247		;(if ax >  BAR_x_Corordinate)
			JNG z111	


			
			MOV AX , 247
			ADD AX , 41
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL z111							; else()
			MOV DX , 1
			ADD ALLOW6 , DX
			add Score_Num , 2
			neg y_velocity
			RET
			
			.else
			jmp Z111
			.endif
			

z111 :		
			.if (allow7 == 0 || allow7 == 1 || allow7 == 2  ) ;;;*******************
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 79		;(if ax > BAR_y_Corordinate)
			JNG y111							;else ()

			MOV AX , 79
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL y111							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 247		;(if ax >  BAR_x_Corordinate)
			JNG y111	


			
			MOV AX , 247
			ADD AX , 41
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL y111							; else()
			MOV DX , 1
			ADD ALLOW7 , DX
			add Score_Num , 3
			neg y_velocity
			RET
			.else
			jmp Y111
			.endif





y111 :


			.if ((allow8 == 0 || allow8 == 1 ||  allow8 == 2) && allow1 != 3    )
			MOV AX , ball_y_Corordinate
			ADD AX , Ball_S
			CMP AX , 105		;(if ax > BAR_y_Corordinate)
			JNG s111							;else ()

			MOV AX , 105
			ADD AX , 7
			CMP  ball_y_Corordinate , AX	;(if ball_y_Corordinate < ax)
			JNL s111							;	else ()
			
			MOV AX , ball_x_Corordinate
			ADD AX , Ball_S
			CMP AX , 247		;(if ax >  BAR_x_Corordinate)
			JNG s111	


			
			MOV AX , 247
			ADD AX , 41
			CMP  ball_x_Corordinate , AX	;(if ball_x_Corordinate < AX )
			JNL s111							; else()
			MOV DX , 1
			add ALLOW8 , DX
			add Score_Num , 1
			neg y_velocity
			RET
			.else
			jmp S111
			.endif


s111 :


			;******************************************************************************




ret

	negative_Y11 :  
	neg y_velocity
	RET


	lives_Lost11 :
	call beep
	call livesLostMsg
	MOV ball_x_Corordinate , 64h 
	MOV ball_y_Corordinate , 096h

	MOV bar_x_Corordinate , 64h 
	MOV bar_y_Corordinate , 0beh
	
	neg y_velocity
	RET


	negative_X11 :
	neg x_velocity
	ret




ret
Give_Me_Speed_For_Mission3 endp


beep proc
        push ax
        push bx
        push cx
        push dx
        mov     al, 182        
        out     43h, al         
        mov     ax, 400        
                               
        out     42h, al        
        mov     al, ah         
        out     42h, al 
        in      al, 61h        
                               
        or      al, 00000011b   
        out     61h, al         
        mov     bx, 2          
p1:
        mov     cx, 65535
p2:
        dec     cx
        jne     p2
        dec     bx
        jne     p1
        in      al, 61h         
                                
        and     al, 11111100b   
        out     61h, al         

        pop dx
        pop cx
        pop bx
        pop ax

ret
beep endp
























PlayersScoreBoard Proc
      

		mov ah , 6
		mov al , 0
		mov cx , 0

		mov dh , 24
		mov dl , 79

		mov bh , 0001B
		int 10h
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		 mov ah , 2
		 mov bh , 0

		 mov dh , 2
		 mov dl , 8
		 int 10h

		 lea dx,player22
		 mov ah,09h
		 int 21h

		 mov ah , 2
		 mov bh , 0

		 mov dh , 2
		 mov dl , 18
		 int 10h

		 lea dx,level22
		 mov ah,09h
		 int 21h

		 mov ah , 2
		 mov bh , 0

		 mov dh , 2
		 mov dl , 25
		 int 10h

		 lea dx,score22
		 mov ah,09h
		 int 21h

        ;***USMAN SCORE SHOW YAHAN KARAIN
		 mov ah, 3DH
         mov al, 0 ; 0 for reading, 1 for writing. 2 for both
         mov dx, offset fname
         int 21h
         mov fHandle,ax
      ;  MOV BX , AX
         mov ax,0

         mov bx , fHandle
		 ;mov string1[10],'$'

		;reading file
         mov ah,3fh
         lea dx,string1
         mov cx,lengthof string1;10
         mov bx,fhandle
		 int 21h

		  mov ah, 3Eh
          mov bx, fHandle
          int 21h

         mov ah , 2
		 mov bh , 0

		 mov dh , 4
		 mov dl , 8
		 int 10h
		
		 mov string1[10],'$'
         lea dx,string1
         mov ah,09h
         int 21h

		  mov string1[0],'$'
		  mov string1[1],'$'
		  mov string1[2],'$'
		  mov string1[3],'$'
		  mov string1[4],'$'
		  mov string1[5],'$'
		  mov string1[6],'$'
		  mov string1[7],'$'
		  mov string1[8],'$'
		  mov string1[9],'$'
		  mov string1[10],'$'
		  ;;;;;;;;;;;;;;;;;;;;;;
		  mov ah, 3DH
         mov al, 0 ; 0 for reading, 1 for writing. 2 for both
         mov dx, offset flevel
         int 21h
         mov fHandle1,ax
      ;  MOV BX , AX
         mov ax,0

		 
         mov bx , fHandle1
		  ;reading file
         mov ah,3fh
         mov dx,offset level
         mov cx,10
         mov bx,fhandle1
		 int 21h

		  mov ah, 3Eh
          mov bx, fHandle1
          int 21h
          
		  mov level[7],'$'
		 mov ah , 2
		 mov bh , 0

		 mov dh , 4
		 mov dl , 18
		 int 10h
		 
		  mov dx,offset level
          mov ah,09h
          int 21h

		  mov level[0],'$'
		  mov level[1],'$'
		  mov level[2],'$'
		  mov level[3],'$'
		  mov level[4],'$'
		  mov level[5],'$'
		  mov level[6],'$'
		  ;;;;;;;;;;;;;;;;;;;;;;;
		  mov ah, 3DH
         mov al, 0 ; 0 for reading, 1 for writing. 2 for both
         mov dx, offset fscore
         int 21h
         mov fHandle2,ax
      ;  MOV BX , AX
         mov ax,0

         mov bx , fHandle2

		;reading file
         mov ah,3fh
         lea dx,un
         mov cx,2
         mov bx,fhandle2
		 int 21h

		  mov ah, 3Eh
          mov bx, fHandle2
          int 21h

         mov un[2],'$'

		 mov ah , 2
		 mov bh , 0

		 mov dh , 4
		 mov dl , 28
		 int 10h
		 
		 mov dx,offset un
         mov ah,09h
         int 21h

		 mov un[0],'$'
		 mov un[1],'$'
		 mov un[2],'$'
		;******************

	mov ah , 1
	int 21h
ret
PlayersScoreBoard endp



main proc

mov ax , @data
mov ds , ax
mov ax,0
Startttt:
;set video mode
mov ah, 00h
mov al, 13h
int 10h
mov score_Num , 0
MOV ALLOW , 0
MOV ALLOW1, 0
MOV ALLOW2, 0
MOV ALLOW3 , 0
MOV ALLOW4 , 0
MOV ALLOW5 , 0
MOV ALLOW6 , 0
MOV ALLOW7 , 0
MOV ALLOW8 , 0
mov dx , 3
mov livesHearts , dx
mov go , 0
mov go1 , 1

;*************** orignal position ***********************   3 loc chng
	MOV ball_x_Corordinate , 50h 
	MOV ball_y_Corordinate , 096h
	MOV BarWidth , 050h
	MOV bar_x_Corordinate , 50h 
	MOV bar_y_Corordinate , 0beh
	MOV x_velocity , 03h
    MOV y_velocity , 02h
    MOV Bar_x_velocity , 05h

call Menue


mov al , userChoice
cmp al , 1
je PlayingTheGame
jne notOption1

PlayingTheGame :
call BRICKS_Formation

 
;********************************Ball making with time
checkTime :
	mov ah , 2ch
	int 21h
	cmp dl , prev_time
	je  checkTime
	mov prev_time , dl
	

	;call Pause_Screen

	


	MOV DX , livesHearts
	.if(dx == 0 )
	;***********Usman Yahan File Hndling Hone ****************************************
	;;;;;;ya name ki
 	 mov ah, 3DH
     mov al, 1 ; 0 for reading, 1 for writing. 2 for both
     mov dx, offset fname
     int 21h
     mov fHandle,ax
  ;  MOV BX , AX
     mov ax,0

     mov bx , fHandle



   	 mov cx,0
     mov dx, 0
     mov ah,42h
     mov al,2 
     int 21h

  	 mov ah,40h
     mov bx,fhandle
  	 lea dx,string
	 mov cx,10
	 int 21h
    
    ;closing file
     mov ah,3eh
     mov bx,fhandle
     int 21h
    ; yahan hard code mission 1 honaa
   ;;;;;;;yahan score ki
	mov ah, 3DH
    mov al, 1 ; 0 for reading, 1 for writing. 2 for both
    mov dx, offset fscore
    int 21h
    mov fHandle1,ax
  ;  MOV BX , AX
    mov ax,0

    mov bx , fHandle1



	mov cx,0
    mov dx, 0
    mov ah,42h
    mov al,2 
    int 21h

	mov ah,40h
    mov bx,fhandle1
	mov dx,offset unit_value_of_score
	mov cx,lengthof unit_value_of_score
	int 21h
    
	mov ah,40h
    mov bx,fhandle1
	mov dx,offset tens_value_of_score
	mov cx,sizeof tens_value_of_score
	int 21h
    ;closing file
    mov ah,3eh
    mov bx,fhandle1
	int 21h
	;;;;;;;;;;;;;;;;;;;;;;;ya level kay lia


	mov ah, 3DH
    mov al, 1 ; 0 for reading, 1 for writing. 2 for both
    mov dx, offset flevel
    int 21h
    mov fHandle2,ax
  ;  MOV BX , AX
    mov ax,0

    mov bx , fHandle2



	mov cx,0
    mov dx, 0
    mov ah,42h
    mov al,2 
    int 21h

	mov ah,40h
    mov bx,fhandle2
	mov dx,offset level1
	mov cx,7
	int 21h
    
    ;closing file
    mov ah,3eh
    mov bx,fhandle2
    int 21h

   ;yahan bhi write karana



	
	;***********Usman Yahan File Hndling Hone ****************************************

	
	JE Startttt
	.endif
	
	

	mov dl , Score_num
	cmp dl , 11 ; yahan score 11 honaa
	je Mission_2

	
	call Give_Me_Speed
	call BRICKS_Formation
	call Strip
	call Print_the_Ball
	Call MoveMent
	call Print_the_Bar
	jmp checkTime




Mission_2 :

	call Mission1_Complete

;*********************** CODE FOR MISSION 2 ********************************************


	MOV ALLOW , 0
	MOV ALLOW1, 0
	MOV ALLOW2, 0
	MOV ALLOW3 , 0
	MOV ALLOW4 , 0
	MOV ALLOW5 , 0
	MOV ALLOW6 , 0
	MOV ALLOW7 , 0
	MOV ALLOW8 , 0
	;mov dx , 3
	;mov livesHearts , dx

;*************** orignal position ***********************   3 loc chng
	MOV ball_x_Corordinate , 70h 
	MOV ball_y_Corordinate , 096h

	MOV bar_x_Corordinate , 70h 
	MOV bar_y_Corordinate , 0beh


	;**************************** SHORTENING OF BAR , INCREASING OF SPEED ******************************

	mov x_velocity , 03h
    mov y_velocity , 04h

	mov BarWidth , 030h
	mov Bar_x_velocity , 09h

	;**************************** SHORTENING OF BAR , INCREASING OF SPEED ******************************

	call BRICKS_Formation_For_Mission2




	checkTime11 :
	mov ah , 2ch
	int 21h
	cmp dl , prev_time
	je  checkTime11
	mov prev_time , dl
	

	

	MOV DX , livesHearts
	.if(dx == 0 )
	;***********Usman Yahan File Hndling Hone ****************************************

	;;;;;;ya name ki
 	 mov ah, 3DH
     mov al, 1 ; 0 for reading, 1 for writing. 2 for both
     mov dx, offset fname
     int 21h
     mov fHandle,ax
  ;  MOV BX , AX
     mov ax,0

     mov bx , fHandle



   	 mov cx,0
     mov dx, 0
     mov ah,42h
     mov al,2 
     int 21h

  	 mov ah,40h
     mov bx,fhandle
  	 lea dx,string
	 mov cx,10
	 int 21h
    
    ;closing file
     mov ah,3eh
     mov bx,fhandle
     int 21h
    ; yahan hard code mission 1 honaa
   ;;;;;;;yahan score ki
	mov ah, 3DH
    mov al, 1 ; 0 for reading, 1 for writing. 2 for both
    mov dx, offset fscore
    int 21h
    mov fHandle1,ax
  ;  MOV BX , AX
    mov ax,0

    mov bx , fHandle1



	mov cx,0
    mov dx, 0
    mov ah,42h
    mov al,2 
    int 21h

	mov ah,40h
    mov bx,fhandle1
	mov dx,offset unit_value_of_score
	mov cx,lengthof unit_value_of_score
	int 21h
    
	mov ah,40h
    mov bx,fhandle1
	mov  dx,offset tens_value_of_score
	mov cx,sizeof tens_value_of_score
	int 21h
    ;closing file
    mov ah,3eh
    mov bx,fhandle1
	int 21h
	;;;;;;;;;;;;;;;;;;;;;;;ya level kay lia


	mov ah, 3DH
    mov al, 1 ; 0 for reading, 1 for writing. 2 for both
    mov dx, offset flevel
    int 21h
    mov fHandle2,ax
  ;  MOV BX , AX
    mov ax,0

    mov bx , fHandle2



	mov cx,0
    mov dx, 0
    mov ah,42h
    mov al,2 
    int 21h

	mov ah,40h
    mov bx,fhandle2
	mov dx,offset level2
	mov cx,7
	int 21h
    
    ;closing file
    mov ah,3eh
    mov bx,fhandle2
    int 21h



	
   ; yahan hard code mission 2 honaa



   ;yahan bhi write karan



	
	;***********Usman Yahan File Hndling Hone ****************************************

	
	JE Startttt
	.endif
	 
	

	mov dl , Score_num
	cmp dl ,41 ; yahan 41 ata hai
	je Mission_3


	call Give_Me_Speed_For_Mission2
	call BRICKS_Formation_For_Mission2
	call Strip1
	call Print_the_Ball
	Call MoveMent_For_Mission2
	call Print_the_Bar
	jmp checkTime11




	Mission_3 :


	call Mission2_Complete


    ;*********************** CODE FOR MISSION 3 ********************************************


	MOV ALLOW , 0
	MOV ALLOW1, 0
	MOV ALLOW2, 0
	MOV ALLOW3 , 0
	MOV ALLOW4 , 0
	MOV ALLOW5 , 0
	MOV ALLOW6 , 0
	MOV ALLOW7 , 0
	MOV ALLOW8 , 0
	;mov dx , 3
	;mov livesHearts , dx

;*************** orignal position ***********************   3 loc chng
	MOV ball_x_Corordinate , 50h 
	MOV ball_y_Corordinate , 096h

	MOV bar_x_Corordinate , 50h 
	MOV bar_y_Corordinate , 0beh


	;**************************** SHORTENING OF BAR , INCREASING OF SPEED ******************************

	mov x_velocity , 04h
    mov y_velocity , 05h

	mov BarWidth , 030h
	mov Bar_x_velocity , 09h

	;**************************** SHORTENING OF BAR , INCREASING OF SPEED ******************************



	call BRICKS_Formation_For_Mission3









	checkTime112 :
	mov ah , 2ch
	int 21h
	cmp dl , prev_time
	je  checkTime112
	mov prev_time , dl
	


	MOV DX , livesHearts
	.if(dx == 0 )
	
	;***********Usman Yahan File Hndling Hone ****************************************

	;;;;;;ya name ki
 	 mov ah, 3DH
     mov al, 1 ; 0 for reading, 1 for writing. 2 for both
     mov dx, offset fname
     int 21h
     mov fHandle,ax
  ;  MOV BX , AX
     mov ax,0

     mov bx , fHandle



   	 mov cx,0
     mov dx, 0
     mov ah,42h
     mov al,2 
     int 21h

  	 mov ah,40h
     mov bx,fhandle
  	 lea dx,string
	 mov cx,10
	 int 21h
    
    ;closing file
     mov ah,3eh
     mov bx,fhandle
     int 21h
    ; yahan hard code mission 1 honaa
   ;;;;;;;yahan score ki
	mov ah, 3DH
    mov al, 1 ; 0 for reading, 1 for writing. 2 for both
    mov dx, offset fscore
    int 21h
    mov fHandle1,ax
  ;  MOV BX , AX
    mov ax,0

    mov bx , fHandle1



	mov cx,0
    mov dx, 0
    mov ah,42h
    mov al,2 
    int 21h

	mov ah,40h
    mov bx,fhandle1
	mov dx,offset unit_value_of_score
	mov cx,lengthof unit_value_of_score
	int 21h
    
	mov ah,40h
    mov bx,fhandle1
	mov  dx,offset tens_value_of_score
	mov cx,sizeof tens_value_of_score
	int 21h
    ;closing file
    mov ah,3eh
    mov bx,fhandle1
	int 21h
	;;;;;;;;;;;;;;;;;;;;;;;ya level kay lia


	mov ah, 3DH
    mov al, 1 ; 0 for reading, 1 for writing. 2 for both
    mov dx, offset flevel
    int 21h
    mov fHandle2,ax
  ;  MOV BX , AX
    mov ax,0

    mov bx , fHandle2



	mov cx,0
    mov dx, 0
    mov ah,42h
    mov al,2 
    int 21h

	mov ah,40h
    mov bx,fhandle2
	mov dx,offset level3
	mov cx,7
	int 21h
    
    ;closing file
    mov ah,3eh
    mov bx,fhandle2
    int 21h



	
   ; yahan hard code mission 3 honaa

   ;yahan bhi write karan





	
	;***********Usman Yahan File Hndling Hone ****************************************


	JE Startttt
	.endif
	



	

	

	
	.if( ALLOW1 == 3  &&  ALLOW2 == 3 && ALLOW3 == 3 && ALLOW4 == 3 && ALLOW5 == 3 && ALLOW6 == 3 && ALLOW7 == 3 && ALLOW8 == 3  )
	;***********Usman Yahan File Hndling Hone ****************************************


	;;;;;;ya name ki
 	 mov ah, 3DH
     mov al, 1 ; 0 for reading, 1 for writing. 2 for both
     mov dx, offset fname
     int 21h
     mov fHandle,ax
  ;  MOV BX , AX
     mov ax,0

     mov bx , fHandle



   	 mov cx,0
     mov dx, 0
     mov ah,42h
     mov al,2 
     int 21h

  	 mov ah,40h
     mov bx,fhandle
  	 lea dx,string
	 mov cx,10
	 int 21h
    
    ;closing file
     mov ah,3eh
     mov bx,fhandle
     int 21h
    ; yahan hard code mission 1 honaa
   ;;;;;;;yahan score ki
	mov ah, 3DH
    mov al, 1 ; 0 for reading, 1 for writing. 2 for both
    mov dx, offset fscore
    int 21h
    mov fHandle1,ax
  ;  MOV BX , AX
    mov ax,0

    mov bx , fHandle1



	mov cx,0
    mov dx, 0
    mov ah,42h
    mov al,2 
    int 21h

	mov ah,40h
    mov bx,fhandle1
	mov dx,offset unit_value_of_score
	mov cx,lengthof unit_value_of_score
	int 21h
    
	mov ah,40h
    mov bx,fhandle1
	mov  dx,offset tens_value_of_score
	mov cx,sizeof tens_value_of_score
	int 21h
    ;closing file
    mov ah,3eh
    mov bx,fhandle1
	int 21h
	;;;;;;;;;;;;;;;;;;;;;;;ya level kay lia


	mov ah, 3DH
    mov al, 1 ; 0 for reading, 1 for writing. 2 for both
    mov dx, offset flevel
    int 21h
    mov fHandle2,ax
  ;  MOV BX , AX
    mov ax,0

    mov bx , fHandle2



	mov cx,0
    mov dx, 0
    mov ah,42h
    mov al,2 
    int 21h

	mov ah,40h
    mov bx,fhandle2
	mov dx,offset level3
	mov cx,7
	int 21h
    
    ;closing file
    mov ah,3eh
    mov bx,fhandle2
    int 21h



   ; yahan hard code mission 3 honaa kiunkee voh jeet gyaaa yahan pee is liaa yahan bhi write karan
 






	
	;***********Usman Yahan File Hndling Hone ****************************************

	
	
	
	
	
	
	
	
	je exit99
	.ENDIF


	call Give_Me_Speed_For_Mission3
	call BRICKS_Formation_For_Mission3
	call Strip2
	call Print_the_Ball
	Call MoveMent_For_Mission2
	call Print_the_Bar
	jmp checkTime112

















;*********************** CODE FOR MISSION 3 ********************************************



;**********************************************

notOption1 :

cmp al , 2
je InstructionManuel
jne notOption2

InstructionManuel :
call Instruct
Jmp Startttt





notOption2 :

cmp al , 3

je ScoreBoard
jne notOption3

ScoreBoard :

call PlayersScoreBoard
Jmp Startttt

notOption3 :
;**************************************************









;**************************************************













;************************Time Managing For Mission
;mov ah , 2ch
;int 21h

;add cl , 1 ; here i take min from sysytem add my desired minutes 
;mov Time_For_A_Mission , cl ; put in to local var

;repeat_Time:
	
;	mov ah , 2ch
;	int 21h
;	cmp cl , Time_For_A_Mission ; jab take mere diyaa gaye min pore ni hun gai it wont exit
;	jne repeat_Time ; this jmp aiding my cause
;******************************************************************************	




.if( ALLOW1 == 3  &&  ALLOW2 == 3 && ALLOW3 == 3 && ALLOW4 == 3 && ALLOW5 == 3 && ALLOW6 == 3 && ALLOW7 == 3 && ALLOW8 == 3  )
        
		exit99 :

		mov ah , 6
		mov al , 0
		mov cx , 0

		mov dh , 24
		mov dl , 79

		mov bh ,101
		int 10h
	
         

     	    mov ah , 6
			mov al , 0

			mov ch , 4
			mov cl , 2

			mov dh , 20
			mov dl , 37 ; IDER SE LENGTH CHOTE HOTEE -1 KARNAA

			mov bh , 0000
			int 10h



			mov ah , 2
		mov bh , 0

		mov dh , 1
		mov dl , 30
		int 10h
		mov dx , offset SCORE
		mov ah , 9
		int 21h

		
		;************************Score Printing*****************************


		mov ah , 2
		mov bh , 0

		mov dh , 1
		mov dl , 37
		int 10h



		mov bl , 0Ah
		mov ax , 0
		mov al , Score_Num
		div bl

		mov cl , ah
		mov ch , al

		mov dl , ch
		add dl , 48
		MOV UNIT_Value_OF_Score , dl
		mov ah , 2
		int 21h


		mov ah , 2
		mov bh , 0

		mov dh , 1
		mov dl , 38
		int 10h


		
		mov dl , cl
		add dl , 48
		MOV Tens_Value_OF_Score, dl
		mov ah , 2
		int 21h


		;************************Score Printing*****************************









































		mov ah , 2
		mov dh , 5
		mov dl , 7
		int 10h
		mov dx , offset Hurray
		mov ah , 9
		int 21h










		mov ah , 2
		mov dh , 8
		mov dl , 4
		int 10h
		mov dx , offset oppp1
		mov ah , 9
		int 21h


		mov ah , 2
		mov dh , 11
		mov dl , 6
		int 10h		
		mov dx , offset oppp2
		mov ah , 9
		int 21h






		MOV AH , 1
		INT 21H


		MOV AH , 1
		INT 21H


        MOV AH , 1
		INT 21H


		.IF (AL == 13  )
		JE MAIN
		.ENDIF



		.ENDIF


mov ah,04ch
int 021h
main endp
end
