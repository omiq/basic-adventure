rem text adventure game by chris garrett 2024 retrogamecoders.com

rem set up variables etc
gosub INIT

displayroom:
rem show room details
gosub clrscr
if pl=0 then pl = pp                    : rem player location can not be 00 as that is inventory
pp = pl                                 : rem backup the location in case illegal move made
print rv$+lo$(pl)+ro$
print ""
print "Objects visible:"+lb$
for i = 0 to oc-1                       : rem check object locations from the first object to object count
if ol(i) = pl then print ". ";ob$(i)    : rem if the object is in current location print it
next i
print ""
print wt$+"exits available:"+lb$
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
print yl$+"what now?"+lb$
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
if left$(i$,8) = "examine " then gosub examineobject
if left$(i$,4) = "look" then ?"":print rd$(pl):?"":gosub waitkey
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
print cy$+rv$+"        press a key to continue         "+ro$
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

examineobject:
rem examine objects the player is carrying

f=-1:r$=""
r$ = mid$(i$,9)         : rem r$ is object requested

rem get the object id
for i = 1 to oc 
if ob$(i-1) = r$ then f=i : rem it exists
next i

rem can't find it? 
print ""
if f=-1 then print "can't seem to find that, check spelling and be specific?" : goto doneexamining
if ol(f-1)=0 then print od$(f-1) : goto doneexamining
print "no can do, are you sure you have that?"


doneexamining:
gosub waitkey
RETURN


newscreen:
rem clear screen and set up colours
POKE 53281,6 : POKE 53280,6: rem screen colours
lb$=chr$(154): wt$=chr$(5): rem light blue, white
yl$=chr$(158): cy$=chr$(159): rem yellow and cyan
rv$=chr$(18): ro$=chr$(146): bl$=chr$(13) + chr$(187) + chr$(32): rem reverse on and off to make listing the code easier

clrscr:
print wt$: print chr$(147): print chr$(19);: rem clear screen, white text
RETURN



INIT: 
rem set up the game and the display
gosub newscreen

rem objects and locations 
rem =====================
rem objects
oc = 2 : rem object count
dim ob$(oc)
ob$(0)="matches"
ob$(1)="brass key"

rem object descriptions
dim od$(oc)
od$(0)="a small book of promotional matches advertising patty's bar and grill, north lakes"
od$(1)="a large and heavy key made out of brass."


rem locations
rc = 3 : rem room count
dim lo$(rc)
lo$(0)="inventory"
lo$(1)="dank basement"
lo$(2)="furnace room"
lo$(3)="service hatch"

rem room descriptions
dim rd$(rc)
rd$(0)=""
rd$(1)="a chillingly damp, bare-bricked room with poured cement floor and timber beamed ceiling. window frames are boarded along one wall."
rd$(2)="this room is obviously a later addition, thrown together with drywall, and just large enough to section off the furnace from the main basement."
rd$(3)="up above the furnace, this tiny space must have been built to allow access to hvac ducting."


rem object's locations
rem loc 0 = player's inventory
dim ol(oc)
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
gosub newscreen
? "             murder house"
? "         a text adventure game"
? "           by chris garrett"
? "                 2024"
?""
? lg$
? "          retrogamecoders.com"
?""
?""
?""

gosub waitkey

RETURN

gameover:
gosub clrscr
POKE 53281,6 : POKE 53280,14
print "Goodbye!"
print ""
print fre(0)
print ""


