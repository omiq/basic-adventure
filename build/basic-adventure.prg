E  TEXT ADVENTURE GAME BY CHRIS GARRETT 2024 RETROGAMECODERS.COM O  118   PL²0 § PL ² PP :  PLAYER LOCATION CAN NOT BE 00 AS THAT IS INVENTORY Ù PP ² PL :  BACKUP THE LOCATION IN CASE ILLEGAL MOVE MADE ò  "";LO$(PL);" " û  "" 	  "OBJECTS VISIBLE:" j	  I ² 0 ¤ OC«1 :  CHECK OBJECT LOCATIONS FROM THE FIRST OBJECT TO OBJECT COUNT ½		  OL(I) ² PL §  ". ";OB$(I) :  IF THE OBJECT IS IN CURRENT LOCATION PRINT IT Å	
  I Î	  "" é	  "EXITS AVAILABLE:" 
  CHECK EACH POSSIBLE EXIT 1
  Ê(EX$(PL),1,2)³±"00" §  ". NORTH" Y
  Ê(EX$(PL),3,2)³±"00" §  ". EAST" 
  Ê(EX$(PL),5,2)³±"00" §  ". SOUTH" ª
  Ê(EX$(PL),7,2)³±"00" §  ". WEST" Ð
  Ê(EX$(PL),9,2)³±"00" §  ". UP" ù
  Ê(EX$(PL),11,2)³±"00" §  ". DOWN"  I$²""   ""    "WHAT NOW?" )  I$ F  È(I$,3) ² "GO " §  39 \  I$ ² "N" §  43 r  I$ ² "E" §  43   I$ ² "S" §  43   I$ ² "W" §  43 ´  I$ ² "U" §  43 Ê  I$ ² "D" §  43 å  È(I$,1) ² "I" §  55    È(I$,4) ² "GET " §  70 "!  È(I$,5) ² "TAKE " §  66 A"  È(I$,5) ² "DROP " §  90 d#  È(I$,8) ² "EXAMINE " §  104 $  È(I$,4) ² "LOOK" § "": RD$(PL):"": 62 °%  È(I$,1) ² "Q" §  179 ¸&  3 ì'  FULLY WRITTEN OUT MOVE (EG. GO SOUTH OR GO S) ÿ( D$ ² Ê(I$,4,1) )  47 *  -+  ABBREVIATED MOVE (EG. N) 9, D$ ² I$ B-  47 H.  q/  GO TO THE NEW PLAYER LOCATION (PL) 0  D$ ² "N" § PL ² Å(Ê(EX$(PL),1,2)) Á1  D$ ² "E" § PL ² Å(Ê(EX$(PL),3,2)) é2  D$ ² "S" § PL ² Å(Ê(EX$(PL),5,2)) 3  D$ ² "W" § PL ² Å(Ê(EX$(PL),7,2)) 94  D$ ² "U" § PL ² Å(Ê(EX$(PL),9,2)) b5  D$ ² "D" § PL ² Å(Ê(EX$(PL),11,2)) h6  7  OBJECTS THE PLAYER IS CARRYING 8  "" º9  "OBJECTS IN YOUR POSSESSION:" :  I ² 0 ¤ OC«1 :  CHECK OBJECT LOCATION FROM THE FIRST OBJECT TO OBJECT COUNT S;  OL(I) ² 0 §  ". ";OB$(I) :  IF THE OBJECT IS IN ZERO PRINT IT [<  I d=  "" >  "        PRESS A KEY TO CONTINUE         " ¡? ¡ I$ ²@  I$²""  63 ¸A  ØB  ALTERNATIVE ACTION TO GET çC F²«1:R$²"" D R$ ² Ê(I$,6) :  R$ IS OBJECT REQUESTED E  73 \F  ALLOW PLAYER TO GET AVAILABLE OBJECT AND PUT IN INVENTORY kG F²«1:R$²"" H R$ ² Ê(I$,5) :  R$ IS OBJECT REQUESTED ¯I  GET THE OBJECT ID ÀJ  I ² 1 ¤ OC èK  OB$(I«1) ² R$ § F²I :  IT EXISTS ðL  I M  CAN'T FIND IT? N  "" [O  F²«1 §  "CAN'T SEE THAT HERE, CHECK SPELLING AND BE SPECIFIC?" :  87 sP  OL(F«1)²PL §  84 ¦Q  OL(F«1)²0 §  "YOU ALREADY HAVE THAT" :  87 ËR  "I CAN'T SEE THAT AROUND HERE" ÔS  87 T OL(F«1)²0 :  SET THE OBJECT LOCATION TO INVENTORY AKA ROOM ZERO "U  "" =V  "GOT THE ";OBJ$(F«1) FW  "" OX  62 UY  Z  DROP OBJECTS THE PLAYER IS CARRYING [ F²«1:R$²"" º\ R$ ² Ê(I$,6) :  R$ IS OBJECT REQUESTED Ò]  GET THE OBJECT ID ã^  I ² 1 ¤ OC _  OB$(I«1) ² R$ § F²I :  IT EXISTS `  I (a  CAN'T FIND IT? 1b  "" c  F²«1 §  "CAN'T SEEM TO FIND THAT, CHECK SPELLING AND BE SPECIFIC?" :  102 »d  OL(F«1)²0 §  "OK, DROPPED!" : OL(F«1)²PL :  102 êe  "NO CAN DO, ARE YOU SURE YOU HAVE THAT?" óf  62 ùg  &h  EXAMINE OBJECTS THE PLAYER IS CARRYING 5i F²«1:R$²"" aj R$ ² Ê(I$,9) :  R$ IS OBJECT REQUESTED yk  GET THE OBJECT ID l  I ² 1 ¤ OC ²m  OB$(I«1) ² R$ § F²I :  IT EXISTS ºn  I Ïo  CAN'T FIND IT? Øp  "" *q  F²«1 §  "CAN'T SEEM TO FIND THAT, CHECK SPELLING AND BE SPECIFIC?" :  116 Or  OL(F«1)²0 §  OD$(F«1) :  116 ~s  "NO CAN DO, ARE YOU SURE YOU HAVE THAT?" t  62 u  ©v  OBJECTS AND LOCATIONS Åw  ===================== Óx  OBJECTS ïy OC ² 2 :  OBJECT COUNT ýz  OB$(OC) { OB$(0)²"MATCHES" )| OB$(1)²"BRASS KEY" C}  OBJECT DESCRIPTIONS Q~  OD$(OC) ± OD$(0)²"A SMALL BOOK OF PROMOTIONAL MATCHES ADVERTISING PATTY'S BAR AND GRILL, NORTH LAKES" ç OD$(1)²"A LARGE AND HEAVY KEY MADE OUT OF BRASS." ÷  LOCATIONS  RC ² 3 :  ROOM COUNT   LO$(RC) 6 LO$(0)²"INVENTORY" Q LO$(1)²"DANK BASEMENT" k LO$(2)²"FURNACE ROOM"  LO$(3)²"SERVICE HATCH"   ROOM DESCRIPTIONS ¬  RD$(RC) º RD$(0)²"" J RD$(1)²"A CHILLINGLY DAMP, BARE-BRICKED ROOM WITH POURED CEMENT FLOOR AND TIMBER BEAMED CEILING. WINDOW FRAMES ARE BOARDED ALONG ONE WALL." ç RD$(2)²"THIS ROOM IS OBVIOUSLY A LATER ADDITION, THROWN TOGETHER WITH DRYWALL, AND JUST LARGE ENOUGH TO SECTION OFF THE FURNACE FROM THE MAIN BASEMENT." P RD$(3)²"UP ABOVE THE FURNACE, THIS TINY SPACE MUST HAVE BEEN BUILT TO ALLOW ACCESS TO HVAC DUCTING." i  OBJECT'S LOCATIONS   LOC 0 = PLAYER'S INVENTORY   OL(OC) £ OL(0)²0 ¯ OL(1)²1 À  EXIT NAMES Í  EN$(6) à EN$(0)²"NORTH" ò EN$(1)²"EAST"  EN$(2)²"SOUTH"  EN$(3)²"WEST" ' EN$(4)²"UP" 9 EN$(5)²"DOWN" J  ROOM EXITS `      N E S W U D n  EX$(20)  EX$(1)²"000002000000" ¢ EX$(2)²"010000000300" ¼  EX$(3)²"000000000002" É¡  PLAYER Ö¢  ====== õ£ PL ² 1 :  PLAYER LOCATION ¤ PP ² 1 :  PLAYER PREVIOUS LOCATION 7¥  53281,6 :  53280,6 C¦  ""  e§  "             MURDER HOUSE" ¨  "         A TEXT ADVENTURE GAME" °©  "           BY CHRIS GARRETT" Îª  "                 2024" Ö« "" à¬  "" ­  "          RETROGAMECODERS.COM" ® "" ¯ "" ° "" '±  62 -²  H³  53281,6 :  53280,14 [´  "GOODBYE!" dµ  "" o¶  ¸(0) x·  ""   