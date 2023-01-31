from math import sqrt
class Atom:
    def __init__ (self,x,y,z):
        self.x=x
        self.y=y
        self.z=z
    def calculdistance(self,B):
        return sqrt((self.x-B.x)**2+(self.y-B.y)**2+(self.z-B.z)**2) 
    
A= Atom(1,2,3)
B= Atom(4,5,6)
print( A.calculdistance(B))