  "TEXT ADVENTURE GAME" '  37 5  LO$(PL)   I ² 0 ¤ OC :  CHECK OBJECT LOCATIONS FROM THE FIRST OBJECT TO OBJECT COUNT Õ  OL(I) ² PL §  OB$(I) :  IF THE OBJECT IS IN CURRENT LOCATION PRINT IT Ý  I ü  CHECK EACH POSSIBLE EXIT #	  Ê(EX$(PL),1,2)³±"00" §  "NORTH" I		  Ê(EX$(PL),3,2)³±"00" §  "EAST" p	
  Ê(EX$(PL),5,2)³±"00" §  "SOUTH" 	  Ê(EX$(PL),7,2)³±"00" §  "WEST" º	  Ê(EX$(PL),9,2)³±"00" §  "UP" á	  Ê(EX$(PL),11,2)³±"00" §  "DOWN" ó	  "WHAT NOW?" ü	  I$ 
  È(I$,3) ² "GO " §  24 /
  I$ ² "N" §  27 E
  I$ ² "E" §  27 [
  I$ ² "S" §  27 q
  I$ ² "W" §  27 
  I$ ² "U" §  27 
  I$ ² "D" §  27 ¥
  3 ¸
 D$ ² Ê(I$,4,1) Á
  30 Ç
  Ó
 D$ ² I$ Ü
  30 â
  
  D$ ² "N" § PL ² Å(Ê(EX$(PL),1,2)) 2  D$ ² "E" § PL ² Å(Ê(EX$(PL),3,2)) Z   D$ ² "S" § PL ² Å(Ê(EX$(PL),5,2)) !  D$ ² "W" § PL ² Å(Ê(EX$(PL),7,2)) ª"  D$ ² "U" § PL ² Å(Ê(EX$(PL),9,2)) Ó#  D$ ² "D" § PL ² Å(Ê(EX$(PL),11,2)) Ù$  õ%  OBJECTS AND LOCATIONS &  ===================== '  OBJECTS -(  OB$(20) B) OB$(0)²"MATCHES" Y* OB$(1)²"BRASS KEY" u+ OC ² 2 :  OBJECT COUNT ,  LOCATIONS -  LO$(20) ª. LO$(0)²"INVENTORY" Æ/ LO$(1)²"GRAND ENTRANCE" Ù0 LO$(2)²"STUDY" ó1 RC ² 3 :  ROOM COUNT 2  OBJECT'S LOCATIONS -3  LOC 0 = PLAYER'S INVENTORY :4  OL(20) F5 OL(0)²0 R6 OL(1)²1 c7  EXIT NAMES p8  EN$(6) 9 EN$(0)²"NORTH" : EN$(1)²"EAST" ¨; EN$(2)²"SOUTH" º< EN$(3)²"WEST" Ê= EN$(4)²"UP" Ü> EN$(5)²"DOWN" í?  ROOM EXITS ÿ@  N E S W U D A  EX$(20) 'B EX$(1)²"000002000000" AC EX$(2)²"010000000000" [D EX$(3)²"000000000000" hE  PLAYER uF  ====== G PL ² 1 :  PLAYER LOCATION H    