rem text adventure game by chris garrett 2024 retrogamecoders.com

gosub INIT

displayroom:
if pl=0 then pl = pp                    : rem player location can not be 00 as that is inventory
pp = pl                                 : rem backup the location in case illegal move made
print "{clr}{white}{rvs on}";lo$(pl);" {rvs off}"
print ""
print "{white}Objects visible:{lightblue}"
for i = 0 to oc-1                       : rem check object locations from the first object to object count
if ol(i) = pl then print ". ";ob$(i)    : rem if the object is in current location print it
next i
print ""
print "{white}exits available:{lightblue}"
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
print "{yellow}what now?{lightblue}"
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
if left$(i$,5) = "take " then gosub takeobject
if left$(i$,5) = "drop " then gosub dropobject
if left$(i$,1) = "q" then goto gameover

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

waitkey:
print "{cyan}{rvs on}        press a key to continue         {rvs off}"
waitingforkey:
get i$
if i$="" goto waitingforkey
RETURN

takeobject:
rem alternative action to get
f=-1:r$=""
r$ = mid$(i$,6)         : rem r$ is object requested
goto getobjid

getobject:
rem allow player to get available object and put in inventory
f=-1:r$=""
r$ = mid$(i$,5)         : rem r$ is object requested

getobjid:
rem get the object id
for i = 1 to oc 
if ob$(i-1) = r$ then f=i : rem it exists
next i

rem can't find it? 
print ""
if f=-1 then print "can't see that here, check spelling and be specific?" : goto donegetting
if ol(f-1)=pl then goto gotit
if ol(f-1)=0 then print "you already have that" : goto donegetting
print "I can't see that around here"
goto donegetting

gotit:
ol(f-1)=0 : rem set the object location to inventory aka room zero
print ""
print "got the ";obj$(f-1)

donegetting:
print ""
gosub waitkey
RETURN


DROPOBJECT:
rem drop objects the player is carrying

f=-1:r$=""
r$ = mid$(i$,6)         : rem r$ is object requested

rem get the object id
for i = 1 to oc 
if ob$(i-1) = r$ then f=i : rem it exists
next i

rem can't find it? 
print ""
if f=-1 then print "can't seem to find that, check spelling and be specific?" : goto donedropping
if ol(f-1)=0 then print "ok, dropped!" : ol(f-1)=pl : goto donedropping
print "no can do, are you sure you have that?"


donedropping:
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
lo$(1)="dank basement"
lo$(2)="furnace room"
lo$(3)="service hatch"
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
rem     N E S W U D
dim ex$(20)
ex$(1)="000002000000"
ex$(2)="010000000300"
ex$(3)="000000000002"



rem player
rem ======
pl = 1 : rem player location
pp = 1 : rem player previous location


WELCOMESCREEN:
POKE 53281,6 : POKE 53280,6
? "{clr}{white}"                          :
? "             murder house"
? "         a text adventure game"
? "           by chris garrett"
? "                 2024"
?""
? "{lightgrey}"
? "          retrogamecoders.com"
?""
?""
?""

gosub waitkey

RETURN

gameover:
POKE 53281,6 : POKE 53280,14
print "{clr}{lightblue}Goodbye!"
print ""
print fre(0)
print ""


