  "TEXT ADVENTURE GAME" '  17 5  LO$(PL)   I ² 0 ¤ OC :  CHECK OBJECT LOCATIONS FROM THE FIRST OBJECT TO OBJECT COUNT Õ  OL(I) ² PL §  OB$(I) :  IF THE OBJECT IS IN CURRENT LOCATION PRINT IT Ý  I ü  CHECK EACH POSSIBLE EXIT #	  Ê(EX$(PL),1,2)³±"00" §  "NORTH" I		  Ê(EX$(PL),3,2)³±"00" §  "EAST" p	
  Ê(EX$(PL),5,2)³±"00" §  "SOUTH" 	  Ê(EX$(PL),7,2)³±"00" §  "WEST" º	  Ê(EX$(PL),9,2)³±"00" §  "UP" á	  Ê(EX$(PL),11,2)³±"00" §  "DOWN" ó	  "WHAT NOW?" ü	  I$ 
  3  
  OBJECTS AND LOCATIONS <
  ===================== J
  OBJECTS X
  OB$(20) m
 OB$(0)²"MATCHES" 
 OB$(1)²"BRASS KEY"  
 OC ² 2 :  OBJECT COUNT °
  LOCATIONS ¾
  LO$(20) Õ
 LO$(0)²"INVENTORY" ñ
 LO$(1)²"GRAND ENTRANCE"  LO$(2)²"STUDY"  RC ² 3 :  ROOM COUNT 7  OBJECT'S LOCATIONS X  LOC 0 = PLAYER'S INVENTORY e   OL(20) q! OL(0)²0 }" OL(1)²1 #  EXIT NAMES $  EN$(6) ®% EN$(0)²"NORTH" À& EN$(1)²"EAST" Ó' EN$(2)²"SOUTH" å( EN$(3)²"WEST" õ) EN$(4)²"UP" * EN$(5)²"DOWN" +  ROOM EXITS *,  N E S W U D 8-  EX$(20) R. EX$(1)²"000200000000" l/ EX$(2)²"000010000000" 0 EX$(3)²"000000000000" 1  PLAYER  2  ====== ¿3 PL ² 1 :  PLAYER LOCATION Å4    