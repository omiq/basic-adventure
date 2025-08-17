rem text adventure game by chris garrett 2025 retrogamecoders.com

rem set up variables etc
gosub INIT

displayroom:
rem show room details
gosub clrscr
if pl=0 then pl = pp                    : rem player location can not be 00 as that is inventory
pp = pl                                 : rem backup the location in case illegal move made
print rv$+lo$(pl)+ro$
print ""
if pl=5 then gosub YOUWIN
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
if left$(i$,1) = "h" then gosub help
if left$(i$,4) = "quit" then gosub gameover
if left$(i$,4) = "exit" then gosub gameover
if left$(i$,5) = "drop " then gosub dropobject
if left$(i$,8) = "examine " then gosub examineobject
if left$(i$,4) = "look" or left$(i$,1) = "l" then ?"":print rd$(pl):?"":gosub waitkey
if left$(i$,1) = "q" then goto gameover
if left$(i$,4) = "use " then gosub useobject

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

useobject:
rem use an object the player is carrying

f=-1:r$=""
r$ = mid$(i$,5)         : rem r$ is object requested

rem get the object id
for i = 1 to oc 
if ob$(i-1) = r$ then f=i : rem it exists
next i

rem can't find it? 
print ""
if f=-1 then print "can't seem to find that, check spelling and be specific?" : goto doneusing
if ol(f-1)=0 then gosub objectactions : goto doneusing
print "no can do, are you sure you have that?"


doneusing:
gosub waitkey
RETURN


objectactions:
rem actions for using objects
if f=1 and pl=3 then print "boom! the furnace explodes, filling the room with fire and smoke!":gosub waitkey:gosub gameover: rem matches in furnace room
if f=1 and pl=2 then print "suddenly the furnace roars to life, filling the room with heat and light!":ex$(2)="010604000300":m=m-1: if m<=0 then print "You are out of matches":ol(f-1)=-1: return : rem remove matches from inventory
if f=1 and pl <> 2 then print "you strike a match and light it, illuminating the room for a moment.":m=m-1: if m<=0 then print "You are out of matches":ol(f-1)=-1: rem remove matches from inventory
if f=2 and pl=4 then print "click! the door has unlocked!":ex$(4)="020005000000":ol(f-1)=-1: rem remove key from inventory
if f=2 and pl<>4 then print "you try to use the key, but it doesn't fit any locks here."
RETURN

help:
rem show help screen                          :                                       :
gosub newscreen
print "you have woken up in a dark and damp    basement, with no memory of how you got here."
print ""
print "your head is pounding and you feel      disoriented. you need to find a way out."
print ""
print "enter the command you want to use:"
print "  North, South, East, West, Up, Down"
print "  (n, s, e, w, u, d)"
print ""
print "  get <object>, take <object>"
print "  drop <object>"
print "  examine <object>"
print "  i, look"
print "  i, inventory"
print "  h, help"
print "  q, quit, exit"
print ""
print ""
gosub waitkey
RETURN

YOUWIN:
rem show win screen

gosub newscreen
print "Congratulations! You have escaped the   murder house!"
print ""
print "now you know where the exit is feel free to go back in and explore, just do not hang around too long!"
print ""
gosub waitkey
gosub clrscr
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
ob$(0)="matches": m=6 : rem matches, 6 in inventory to start
ob$(1)="key"

rem object descriptions
dim od$(oc)
od$(0)="a small book of promotional matches advertising patty's bar and grill, north lakes"
od$(1)="a large and heavy key made out of brass."

rem locations
rc = 6 : rem room count
dim lo$(rc)
lo$(0)="inventory"
lo$(1)="dank basement"
lo$(2)="furnace room"
lo$(3)="service hatch"
lo$(4)="a store room?"
lo$(5)="outside the house"
lo$(6)="cramped stairwell"


rem room descriptions                          :                                       :                                       :
dim rd$(rc)
rd$(0)=""
rd$(1)="a chillingly damp, bare-bricked room    with poured cement floor and timber     beamed ceiling. window frames are       boarded along one wall."
rd$(2)="this room is obviously a later addition, thrown together with drywall, and just large enough to section off the furnace from the main basement. you smell gas."
rd$(3)="up above the furnace, this tiny space   must have been built to allow access to hvac ducting. the smell of gas is strong here, and the furnace hums ominously."
rd$(4)="the dark and dusty room is empty, with  a single light bulb hanging from the    ceiling. there is an old wooden door on the far wall covered in cobwebs." 
rd$(5)="outside the house, you can see the front door and a path leading to the street."
rd$(6)="a tiny, twisty stairwell that was       previously obscured by the dark."



rem object's locations
rem loc 0 = player's inventory
dim ol(oc)
ol(0)=0 : rem matches are in inventory at the start of the game
ol(1)=6 : rem key is in the stairwell

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
ex$(2)="010004000300"
ex$(3)="000000000002"
ex$(4)="020000000000"
ex$(5)="040000000000"
ex$(6)="000000020000"


rem player
rem ======
pl = 1 : rem player location
pp = 1 : rem player previous location


WELCOMESCREEN:
rem welcome screen
gosub newscreen
gosub INTRO
gosub newscreen

? "             murder house"
? "         a text adventure game"
? "           by chris garrett"
? "                 2025"
?""
? lg$
? "          retrogamecoders.com"
?""
?" press h for help or other key to start"
?""

waitforstartkey:
get i$
if i$="" then goto waitforstartkey
if i$="h" then gosub help
if i$ <> "h" and i$ <> "" then RETURN
RETURN

INTRO:
for i = 0 to 999 
read c:
get i$: if i$ <> "" then return
poke 1024+i,c  
next i
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 85, 73, 32, 32, 32, 32, 32, 32, 32, 32, 32, 71, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 74, 75, 32, 32, 32, 32, 32,233,223, 32, 32, 93, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,233,105, 95,223, 32, 71, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,233,105, 78, 77, 95,223,208, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,233,105, 78, 85, 73, 77, 95,234, 32, 32, 32, 85, 73, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 85, 73, 32, 32, 32,236, 32, 32, 74, 75, 32, 32,251, 32, 32, 85, 85, 73, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 85, 32, 73, 85, 73, 32, 97,112,110, 32, 32,112,110,225, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 97,109,125, 32, 32,109,125,225, 32,104, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,104, 92, 32, 97,112,110, 79, 80,112,110,225,104,102,104, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,102,102,102, 92, 97,109,125,116,103,109,125,225,102,102,102,102, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,102,102, 32, 32,104,104,104,104,160,120,104,104,104,104, 32,102,102, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,104,104,104,104,104,248,120,104,104,104,104,104, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,104,104,104,104,104,104,104,120,160,104,104,104,104,104,104, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32,160,120, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32,112,114, 73, 32, 32, 85, 73, 32, 93, 85, 73, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 93, 93, 93, 93, 72, 66, 32, 85, 93,107, 75, 85, 73, 32, 93, 93, 85, 73, 93, 72, 85, 73, 85, 73, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 93, 32, 93, 74, 75, 93, 32, 74,125, 74, 75, 66, 32, 32,107,115, 93, 93, 93, 72, 74, 73,107, 75, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 93, 93, 74, 75, 74, 75, 74, 75, 74, 75, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32
data 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32

rem colour data
for i = 0 to 999: 
read c:
poke 55296+i,c
get i$: if i$ <> "" then return 
next i
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 15, 15, 14, 14, 14, 14, 14, 14, 14, 14, 14, 10, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 15, 15, 14, 14, 14, 14, 14, 15, 12, 14, 14,  8, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 15, 15, 12, 12, 14,  2, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 15, 15, 15, 12, 12, 12, 12, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 15, 15, 15, 15, 12, 12, 12, 12, 14, 14, 14,  1, 15, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14,  1, 15, 14, 14, 14, 15, 14, 14, 12, 11, 14, 14, 11, 14, 14,  1,  1, 15, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14,  1, 14, 15,  1, 15, 14, 15, 15, 12, 14, 14, 15, 12, 11, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 15, 12, 11, 14, 14, 12, 11, 11, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 13,  5, 14, 12, 15, 12, 12, 11, 15, 12, 11, 11, 14,  5, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 13,  5,  5,  5, 12, 10,  2, 11, 11, 10,  2, 11, 11, 11, 14,  5, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 13,  5, 14, 14, 14,  5,  5, 14, 10, 10, 14,  5,  5, 14, 14, 14,  5, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14,  5,  5,  5, 14,  8,  8, 14,  5,  5,  5, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14,  5,  5,  5,  5, 14,  2,  2, 14,  5,  5,  5,  5, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14,  2,  2, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14,  1,  1,  1, 14, 14,  1,  1, 14,  1,  1,  1, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 10, 10, 10, 10, 10, 10, 14, 10, 10, 10, 10, 10,  1, 14,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14,  2, 14,  2,  2,  2,  2, 14, 10, 10, 10, 10, 10, 14, 14, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
data 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 1

gosub waitkey
RETURN

gameover:
gosub clrscr
POKE 53281,6 : POKE 53280,14
print "Goodbye!"
print ""
print "memory free",fre(0)
print ""


