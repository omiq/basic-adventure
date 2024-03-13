? "{clr}text adventure game"

gosub INIT

displayroom:

print lo$(pl)
for i = 0 to oc                 : rem check object locations from the first object to object count
if ol(i) = pl then print ob$(i) : rem if the object is in current location print it
next i

rem check each possible exit
if mid$(ex$(pl),1,2)<>"00" then print "north"
if mid$(ex$(pl),3,2)<>"00" then print "east"
if mid$(ex$(pl),5,2)<>"00" then print "south"
if mid$(ex$(pl),7,2)<>"00" then print "west"
if mid$(ex$(pl),9,2)<>"00" then print "up"
if mid$(ex$(pl),11,2)<>"00" then print "down"


getcommand:
print "what now?"
input i$

goto displayroom


INIT: 
rem objects and locations 
rem =====================
rem objects
dim ob$(20)
ob$(0)="matches"
ob$(1)="brass key"
oc = 2 : rem object count

rem locations
dim lo$(20)
lo$(0)="inventory"
lo$(1)="grand entrance"
lo$(2)="study"
rc = 3 : rem room count

rem object's locations
rem loc 0 = player's inventory
dim ol(20)
ol(0)=0
ol(1)=1

rem exit names
dim en$(6)
en$(0)="north"
en$(1)="east"
en$(2)="south"
en$(3)="west"
en$(4)="up"
en$(5)="down"


rem room exits
rem N E S W U D
dim ex$(20)
ex$(1)="000200000000"
ex$(2)="000010000000"
ex$(3)="000000000000"



rem player
rem ======
pl = 1 : rem player location

RETURN
