? "{clr}text adventure game"

gosub INIT

displayroom:

print lo$(pl)
for i = 0 to oc                 : rem check object locations from the first object to object count
if ol(i) = pl then print ob$(i) : rem if the object is in current location print it
next i

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

rem player
rem ======
pl = 1 : rem player location

RETURN
