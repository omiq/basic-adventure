PRINT CHR$(147):ti$="000000"
for a = 0 to 255:?ABS((A AND 128)=128);:?ABS((A AND 64)=64);:?ABS((A AND 32)=32);:?ABS((A AND 16)=16);:?ABS((A AND 8)=8);:?ABS((A AND 4)=4);:?ABS((A AND 2)=2);:?ABS((A AND 1)=1):next
print "time:"ti/60