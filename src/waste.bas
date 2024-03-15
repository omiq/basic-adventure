0 rem petcat -w2 -f -o waste.prg -- waste.bas
10 s=(peek(52)-peek(50))*256+(peek(51)-peek(49))
20 a$="initial string"
30 for i=1 to 1000
40 a$="change the string to a long line of characters"+str$(i)
50 print".";
60 next i
70 e=(peek(52)-peek(50))*256+(peek(51)-peek(49))
80 print"start: ";s;" end: ";e
90 print" used: "; s-e