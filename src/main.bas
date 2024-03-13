? "{clr}text adventure game"

gosub INIT

displayroom:
if pl=0 then pl = pp                    : rem player location can not be 00 as that is inventory
pp = pl                                 : rem backup the location in case illegal move made
print "{clr}{rvs on}";lo$(pl);" {rvs off}"
print ""
print "Objects visible:"
for i = 0 to oc-1                       : rem check object locations from the first object to object count
if ol(i) = pl then print ". ";ob$(i)    : rem if the object is in current location print it
next i
print ""
print "exits available:"
rem check each possible exit
if mid$(ex$(pl),1,2)<>"00" then print ". north"
if mid$(ex$(pl),3,2)<>"00" then print ". east"
if mid$(ex$(pl),5,2)<>"00" then print ". south"
if mid$(ex$(pl),7,2)<>"00" then print ". west"
if mid$(ex$(pl),9,2)<>"00" then print ". up"
if mid$(ex$(pl),11,2)<>"00" then print ". down"


getcommand:
i$=""
print ""
print "what now?"
input i$
if left$(i$,3) = "go " then gosub fullmove
if i$ = "n" then gosub abrmove
if i$ = "e" then gosub abrmove
if i$ = "s" then gosub abrmove
if i$ = "w" then gosub abrmove
if i$ = "u" then gosub abrmove
if i$ = "d" then gosub abrmove
if left$(i$,1) = "i" then gosub inventory
if left$(i$,4) = "get " then gosub getobject


goto displayroom

fullmove:
rem fully written out move (eg. GO SOUTH or GO S)
d$ = mid$(i$,4,1)
gosub moves
return

abrmove:
rem abbreviated move (eg. N)
d$ = i$
gosub moves
return


MOVES:
rem go to the new player location (PL)
if d$ = "n" then pl = val(mid$(ex$(pl),1,2))
if d$ = "e" then pl = val(mid$(ex$(pl),3,2))
if d$ = "s" then pl = val(mid$(ex$(pl),5,2))
if d$ = "w" then pl = val(mid$(ex$(pl),7,2))
if d$ = "u" then pl = val(mid$(ex$(pl),9,2))
if d$ = "d" then pl = val(mid$(ex$(pl),11,2))

return

INVENTORY:
rem objects the player is carrying
print ""
print "Objects in your possession:"
for i = 0 to oc-1                       : rem check object location from the first object to object count
if ol(i) = 0 then print ". ";ob$(i)     : rem if the object is in zero print it
next i
print ""
print "press a key to continue"

waitkey:
get i$
if i$="" goto waitkey
RETURN

getobject:
rem allow player to get available object and put in inventory
f=-1:r$=""
r$ = mid$(i$,5)         : rem r$ is object requested

rem get the object id
for i = 1 to oc 
if ob$(i-1) = r$ then f=i : rem it exists
next i

if f=-1 then print "can't see that here, check spelling and be specific?" : goto donegetting
if ol(f-1)=pl then goto gotit
if ol(f-1)=0 then print "you already have that"

goto donegetting

gotit:
ol(f-1)=0 : rem set the object location to inventory aka room zero
print ""
print "got the ";obj$(f-1)
donegetting:
print ""
print "press a key to continue"
gosub waitkey
RETURN

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
ex$(1)="000002000000"
ex$(2)="010000000000"
ex$(3)="000000000000"



rem player
rem ======
pl = 1 : rem player location
pp = 1 : rem player previous location
RETURN
