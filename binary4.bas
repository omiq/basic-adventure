1 REM STARTS WITH ROBIN'S ROUTINE TO REMOVE LEADING SPACES
2 REM (HE SAYS IT IS WRONG BUT IT *DOES* WORK!)
3 POKE 95,0:POKE 96,160:POKE 90,0:POKE 91,192:POKE 88,0:POKE 89,192:SYS 41919:POKE 48608,1:POKE 1,PEEK(1)AND254
4 REM CLEAR THE SCREEN
5 PRINT CHR$(147)
6 REM REQUEST NUMBERS UNTIL ZERO ENTERED
7 INPUT A
8 IF A = 0 THEN END
9 REM CONVERT THE NUMBER INTO BINARY STRING
10 PRINT STR$(ABS((A AND 128)=128))+STR$(ABS((A AND 64)=64))+STR$(ABS((A AND 32)=32))+STR$(ABS((A AND 16)=16))+STR$(ABS((A AND 8)=8))+STR$(ABS((A AND 4)=4))+STR$(ABS((A AND 2)=2))+STR$(ABS((A AND 1)=1))
11 PRINT ""
12 REM LOOP BACK AND GET ANOTHER INPUT
13 GOTO 7