#!/usr/bin/env python3
w=3840
h=2160
basetwo=[2**x for x in range(0,10) ]
byte=w*h*4*2
mbyte=byte/1024/1024+2

r=list(filter(lambda x: x > mbyte, basetwo))[0]
print(r)
