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
print "the furnace room"
q$ = rv$+" 1"+ro$+". back to the cellar, " + bl$ + rv$+" 2"+ro$+". go up" 
gosub askplayer
if left$(a$,1)="1" then goto cellar

servicehatch:
gosub newscreen
print "small service hatch"
q$ = "go back down "+rv$+"y"+ro$+"es or "+rv$+"n"+ro$+"o" 
gosub askplayer
if left$(a$,1)<>"y" then goto servicehatch
goto cellar

rem success
rem fail
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
print "goodbye!"
