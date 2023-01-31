""""--------------Tri a bubble-----------------"""

table=[6,2,5,3,1,51,25,85,65,8,9,25,6,2,11,22,0]

t=table[0]
for j in range(len(table)):
    for i in range(len(table)-1):
        if  (table[i+1]) < t :
            table[i]=table[i+1]
            table[i+1]=t
            t=table[i+1]
        else:t=table[i+1]
    
    t=table[0]
for i in range(len(table)):    
    print(table[i])
