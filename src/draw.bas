a=0: dim by(7): print chr$(147)
lb$=chr$(154): wt$=chr$(5): rem light blue, white
yl$=chr$(158): cy$=chr$(159): rem yellow and cyan
rv$=chr$(18): ro$=chr$(146): bl$=chr$(13) + chr$(187) + chr$(32): rem reverse on and off to make listing the code easier
px$ = rv$+wt$+chr$(207) : sp$=rv$+lb$+chr$(207)
for r=0 to 7
read a 
gosub drawrow
NEXT
end



drawrow:
by(0) = ABS((A AND 128)=128)
by(1) = ABS((A AND 64)=64)
by(2) = ABS((A AND 32)=32)
by(3) = ABS((A AND 16)=16)
by(4) = ABS((A AND 8)=8)
by(5) = ABS((A AND 4)=4)
by(6) = ABS((A AND 2)=2)
by(7) = ABS((A AND 1)=1)

for b=0 to 7
if by(b)=1 then print px$;
if by(b)=0 then print sp$;
next
print ""
RETURN

data 092,087,233,089,057,030,020,054
