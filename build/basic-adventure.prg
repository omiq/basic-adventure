  "TEXT ADVENTURE GAME" '  40 5  LO$(PL)   I ² 0 ¤ OC :  CHECK OBJECT LOCATIONS FROM THE FIRST OBJECT TO OBJECT COUNT Õ  OL(I) ² PL §  OB$(I) :  IF THE OBJECT IS IN CURRENT LOCATION PRINT IT Ý  I ü  CHECK EACH POSSIBLE EXIT #	  Ê(EX$(PL),1,2)³±"00" §  "NORTH" I		  Ê(EX$(PL),3,2)³±"00" §  "EAST" p	
  Ê(EX$(PL),5,2)³±"00" §  "SOUTH" 	  Ê(EX$(PL),7,2)³±"00" §  "WEST" º	  Ê(EX$(PL),9,2)³±"00" §  "UP" á	  Ê(EX$(PL),11,2)³±"00" §  "DOWN" ó	  "WHAT NOW?" ü	  I$ 
  È(I$,3) ² "GO " §  24 /
  I$ ² "N" §  28 E
  I$ ² "E" §  28 [
  I$ ² "S" §  28 q
  I$ ² "W" §  28 
  I$ ² "U" §  28 
  I$ ² "D" §  28 ¥
  3 Ù
  FULLY WRITTEN OUT MOVE (EG. GO SOUTH OR GO S) ì
 D$ ² Ê(I$,4,1) õ
  32 û
    ABBREVIATED MOVE (EG. N) & D$ ² I$ /  32 5  ^   GO TO THE NEW PLAYER LOCATION (PL) !  D$ ² "N" § PL ² Å(Ê(EX$(PL),1,2)) ®"  D$ ² "E" § PL ² Å(Ê(EX$(PL),3,2)) Ö#  D$ ² "S" § PL ² Å(Ê(EX$(PL),5,2)) þ$  D$ ² "W" § PL ² Å(Ê(EX$(PL),7,2)) &%  D$ ² "U" § PL ² Å(Ê(EX$(PL),9,2)) O&  D$ ² "D" § PL ² Å(Ê(EX$(PL),11,2)) U'  q(  OBJECTS AND LOCATIONS )  ===================== *  OBJECTS ©+  OB$(20) ¾, OB$(0)²"MATCHES" Õ- OB$(1)²"BRASS KEY" ñ. OC ² 2 :  OBJECT COUNT /  LOCATIONS 0  LO$(20) &1 LO$(0)²"INVENTORY" B2 LO$(1)²"GRAND ENTRANCE" U3 LO$(2)²"STUDY" o4 RC ² 3 :  ROOM COUNT 5  OBJECT'S LOCATIONS ©6  LOC 0 = PLAYER'S INVENTORY ¶7  OL(20) Â8 OL(0)²0 Î9 OL(1)²1 ß:  EXIT NAMES ì;  EN$(6) ÿ< EN$(0)²"NORTH" = EN$(1)²"EAST" $> EN$(2)²"SOUTH" 6? EN$(3)²"WEST" F@ EN$(4)²"UP" XA EN$(5)²"DOWN" iB  ROOM EXITS {C  N E S W U D D  EX$(20) £E EX$(1)²"000002000000" ½F EX$(2)²"010000000000" ×G EX$(3)²"000000000000" äH  PLAYER ñI  ====== J PL ² 1 :  PLAYER LOCATION K    