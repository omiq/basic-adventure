titles:
rem show titles
gosub newscreen
print "      escape the house of horror!"
print "           an adventure by"
print "      chris garrett aged 49 3/4"
rem instructions
print ""
print "you'll be given a sequence of scenarios and asked what you want to do."
print ""
print "enter your selection as prompted, or by using the highlighted"
print "letter, followed by the return key"
print ""
print "for example ..."
q$ = "start the game, "+rv$+"y"+ro$+"es or "+rv$+"n"+ro$+"o"
gosub askplayer
if left$(a$,1)<>"y" then goto titles

rem first scene
cellar:
gosub newscreen
print "you are in a cold, dark cellar. the only light is what little filters"
print "through the cracks in the boarded up"
print "windows. north is a secure door,"
print "there is an open door to the south."
print "you are carrying a book of matches."
q$ = rv$+" 1"+ro$+". examine secure door, " + bl$ + rv$+" 2"+ro$+". go south" 
gosub askplayer
if left$(a$,1)<>"1" then goto furnaceroom

securedoor:
gosub newscreen
print "the door is heavy, metal, and massive."
print "it reminds you of a bank vault and"
print "clearly you're not getting out this way!"
q$ = "go back "+rv$+"y"+ro$+"es or "+rv$+"n"+ro$+"o" 
gosub askplayer
if left$(a$,1)<>"y" then goto securedoor
goto cellar

furnaceroom:
gosub newscreen
print "the furnace room is a partitioned"
print "off space built with drywall to"
print "simply contain the furnace and"
print "electrical panel. you can smell"
print "gas ..."
print ""
print "above you is a small hatch."

q$ = rv$+" 1"+ro$+". back to the cellar, " + bl$ + rv$+" 2"+ro$+". go up"
q$ = q$ + bl$ + rv$+" 3"+ro$+". light match"
gosub askplayer
if left$(a$,1)="1" then goto cellar
if left$(a$,1)<>"1" and left$(a$,1)<>"2" and left$(a$,1)<>"3" then goto furnaceroom
if left$(a$,1)="3" then goto fail

servicehatch:
gosub newscreen
print "you are in a small space directly"
print "above the furnace that you"
print "assume must be a service hatch."
print "on one wall seems to be an exhaust vent"
print "which is letting in a tiny amount of"
print "light and cold air"
q$ = "go back "+rv$+"d"+ro$+"own or e"+rv$+"x"+ro$+"amine the vent" 
gosub askplayer
if left$(a$,1)="d" then goto furnaceroom
if left$(a$,1)<>"d" and left$(a$,1)<>"x" then goto servicehatch

vent:
gosub newscreen
print "the vent cover is flimsy and loose."
print "you think it would not take much to"
print "remove it!"
q$ = "go "+rv$+"b"+ro$+"ack or "+rv$+"h"+ro$+"it vent" 
gosub askplayer
if left$(a$,1)="b" then goto servicehatch
if left$(a$,1)<>"b" and left$(a$,1)<>"h" then goto servicehatch

success:
rem success condition
gosub newscreen
print "the vent screen comes loose and you"
print "attract the attention of a passer-by"
print "the police are called and soon you"
print "will be free!"
goto FIN

fail:
rem fail
gosub newscreen
print "boom!"
print ""
print "the last thing you are aware of is"
print "a bright flash and a searing heat"
print ""
print "unfortunately you have blown up"
print "the house with you inside it!"
print ""
goto FIN

newscreen:
q$="": a$="": rem reset variables to blank
rv$=chr$(18): ro$=chr$(146): bl$=chr$(13) + chr$(187) + chr$(32): rem reverse on and off to make listing the code easier
print chr$(5): print chr$(147): print chr$(19);: rem clear screen, white text
RETURN

askplayer:
print ""
print "what do you want to do: " + bl$ + q$;
input a$
RETURN

fin:
print ""
print ""
print "goodbye!"
