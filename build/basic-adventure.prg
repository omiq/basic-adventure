  "TEXT ADVENTURE GAME" '  56 ?  "";LO$(PL);" " H  "" a  "OBJECTS VISIBLE:" ΅  I ² 0 € OC«1 :  CHECK OBJECT LOCATIONS FROM THE FIRST OBJECT TO OBJECT COUNT 	  OL(I) ² PL §  ". ";OB$(I) :  IF THE OBJECT IS IN CURRENT LOCATION PRINT IT 	  I 		  "" 2	
  "EXITS AVAILABLE:" Q	  CHECK EACH POSSIBLE EXIT z	  Κ(EX$(PL),1,2)³±"00" §  ". NORTH" ’	  Κ(EX$(PL),3,2)³±"00" §  ". EAST" Λ	  Κ(EX$(PL),5,2)³±"00" §  ". SOUTH" σ	  Κ(EX$(PL),7,2)³±"00" §  ". WEST" 
  Κ(EX$(PL),9,2)³±"00" §  ". UP" B
  Κ(EX$(PL),11,2)³±"00" §  ". DOWN" L
 I$²"" U
  "" g
  "WHAT NOW?" p
  I$ 
  Θ(I$,3) ² "GO " §  31 £
  I$ ² "N" §  35 Ή
  I$ ² "E" §  35 Ο
  I$ ² "S" §  35 ε
  I$ ² "W" §  35 ϋ
  I$ ² "U" §  35   I$ ² "D" §  35 ,  Θ(I$,1) ² "I" §  47 4  3 h  FULLY WRITTEN OUT MOVE (EG. GO SOUTH OR GO S) {  D$ ² Κ(I$,4,1) !  39 "  ©#  ABBREVIATED MOVE (EG. N) ΅$ D$ ² I$ Ύ%  39 Δ&  ν'  GO TO THE NEW PLAYER LOCATION (PL) (  D$ ² "N" § PL ² Ε(Κ(EX$(PL),1,2)) =)  D$ ² "E" § PL ² Ε(Κ(EX$(PL),3,2)) e*  D$ ² "S" § PL ² Ε(Κ(EX$(PL),5,2)) +  D$ ² "W" § PL ² Ε(Κ(EX$(PL),7,2)) ΅,  D$ ² "U" § PL ² Ε(Κ(EX$(PL),9,2)) ή-  D$ ² "D" § PL ² Ε(Κ(EX$(PL),11,2)) δ.  	/  OBJECTS THE PLAYER IS CARRYING 0  "" 61  "OBJECTS IN YOUR POSSESSION:" 2  I ² 0 € OC«1 :  CHECK OBJECT LOCATION FROM THE FIRST OBJECT TO OBJECT COUNT Ο3  OL(I) ² 0 §  ". ";OB$(I) :  IF THE OBJECT IS IN ZERO PRINT IT Χ4  I ΰ5 ‘ I$ ρ6  I$²""  53 χ7  8  OBJECTS AND LOCATIONS /9  ===================== =:  OBJECTS K;  OB$(20) `< OB$(0)²"MATCHES" w= OB$(1)²"BRASS KEY" > OC ² 2 :  OBJECT COUNT £?  LOCATIONS ±@  LO$(20) ΘA LO$(0)²"INVENTORY" δB LO$(1)²"GRAND ENTRANCE" χC LO$(2)²"STUDY" D RC ² 3 :  ROOM COUNT *E  OBJECT'S LOCATIONS KF  LOC 0 = PLAYER'S INVENTORY XG  OL(20) dH OL(0)²0 pI OL(1)²1 J  EXIT NAMES K  EN$(6) ‘L EN$(0)²"NORTH" ³M EN$(1)²"EAST" ΖN EN$(2)²"SOUTH" ΨO EN$(3)²"WEST" θP EN$(4)²"UP" ϊQ EN$(5)²"DOWN" R  ROOM EXITS S  N E S W U D +T  EX$(20) EU EX$(1)²"000002000000" _V EX$(2)²"010000000000" yW EX$(3)²"000000000000" X  PLAYER Y  ====== ²Z PL ² 1 :  PLAYER LOCATION Έ[    