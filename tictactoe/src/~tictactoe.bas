1 REM TOCK TAC TOE
2 REM START
3 INK 7: PAPER 6: BORDER 7: CLS: LET ply=1: LET win=0: DIM a(9,2): LET sq=0
4 GO SUB 6
5 GO TO 17
6 REM DRAW_BOARD
7 PRINT AT 2,10; INK 1; "Tic Tac Toe"
8 PLOT INK 5;100,40: DRAW INK 5;0,100
9 PLOT INK 5;150,40: DRAW INK 5;0,100
10 PLOT INK 5;65,70: DRAW INK 5;120,0
11 PLOT INK 5;65,110: DRAW INK 5;120,0
12 REM State 1=player 1, 2=Player 2
13 INK 5: PLOT 50,170: DRAW -40,-40: PLOT 10,170: DRAW 40,-40
14 CIRCLE INK 4;220,150,20
15 PRINT; INK 0; PAPER 3;AT 14,0;"1 2 3";AT 15,0;"4 5 6";AT 16,0;"7 8 9"
16 RETURN
17 REM TEST_PRESS
18 PRINT AT 18,1; INK 7; PAPER 6-ply; "PLAYER ";ply;" Choose Square 1 - 9"
19 REM GET_KEY
20 LET i$=INKEY$
21 IF i$>="1" AND i$<="9" THEN LET square=VAL i$: GO SUB 29
22 IF i$="" THEN GO TO 19
23 REM ** Test for Winning Conditions **
24 GO SUB 38
25 IF sq=9 THEN LET win=-1
26 IF win>0 THEN PRINT AT 18,1;"PLAYER ";win;" has WON!": BEEP .4,3: BEEP 2,10: GO TO 2
27 IF win<0 THEN PRINT AT 18,1;"GAME DRAWN - RESTARTING": BEEP .4,3: BEEP 2,10: GO TO 2
28 GO TO 17
29 REM CHECK_SQUARES
30 IF a(square,1)=1 OR a(square,2)=1 THEN PRINT AT 18,1; INK 3;"Square Taken Already": BEEP .3,1: GO TO 50
31 LET a(square,ply)=1: LET ply=ply+1: LET sq=sq+1
32 PRINT AT 18,1; INK 4;"Good move!": BEEP .4,12
33 IF ply=3 THEN LET ply=1
34 REM DRAW_MOVE
35 GO SUB 50
36 PRINT AT 18,1;"                     "
37 RETURN
38 REM WINNING_CONDITIONS_CHECK
39 FOR n=1 TO 2
40 IF a(1,n)=1 AND a(2,n)=1 AND a(3,n)=1 THEN LET win=n
41 IF a(1,n)=1 AND a(4,n)=1 AND a(7,n)=1 THEN LET win=n
42 IF a(2,n)=1 AND a(5,n)=1 AND a(8,n)=1 THEN LET win=n
43 IF a(3,n)=1 AND a(6,n)=1 AND a(9,n)=1 THEN LET win=n
44 IF a(3,n)=1 AND a(5,n)=1 AND a(7,n)=1 THEN LET win=n
45 IF a(1,n)=1 AND a(5,n)=1 AND a(9,n)=1 THEN LET win=n
46 IF a(4,n)=1 AND a(5,n)=1 AND a(6,n)=1 THEN LET win=n
47 IF a(7,n)=1 AND a(8,n)=1 AND a(9,n)=1 THEN LET win=n
48 NEXT n
49 RETURN
50 REM DRAW_MOVE
51 LET posx=80: LET posy=130: REM where to draw
52 IF square=1 THEN LET posx=80: LET posy=130
53 IF square=2 THEN LET posx=130: LET posy=130
54 IF square=3 THEN LET posx=180: LET posy=130
55 IF square=4 THEN LET posx=80: LET posy=100
56 IF square=5 THEN LET posx=130: LET posy=100
57 IF square=6 THEN LET posx=180: LET posy=100
58 IF square=7 THEN LET posx=80: LET posy=70
59 IF square=8 THEN LET posx=130: LET posy=70
60 IF square=9 THEN LET posx=180: LET posy=70
61 IF ply=1 THEN CIRCLE INK 4;posx-10,posy-10,10
62 IF ply=2 THEN INK 5: PLOT posx,posy: DRAW -20,-20: PLOT posx-20,posy: DRAW 20,-20
63 RETURN