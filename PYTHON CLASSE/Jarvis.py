


""""--------------Tri par selection-----------------"""

""""--------------Tri par insertion-----------------"""
"""
table[23,1,10,5,3]
temp=table[0]
nb=len(table)
for j in range(nb):
    for i in range(len(table)-1):
        if  (table[i+1]) < t :
            
            table[i]=table[i+1]
            table[i+1]=t

            t=table[i+1]
        else:t=table[i+1]
    t=table[0]
for i in range(len(table)):    
    print(table[i])
"""
""""--------------Tri par fusion-----------------"""
""""
def fusion(L1,L2):
    n1 = len(L1)
    n2 = len(L2)
    L12 = [0]*(n1+n2)
    i1 = 0
    i2 = 0
    i = 0
    while i1<n1 and i2<n2:
        if L1[i1] < L2[i2]:
            L12[i] = L1[i1]
            i1 += 1
        else:
            L12[i] = L2[i2]
            i2 += 1
        i += 1
    while i1<n1:
    	L12[i] = L1[i1]
        i1 += 1
    	i += 1
    while i2<n2:
    	L12[i] = L2[i2]
    	i2 += 1
    	i += 1 
    return L12
"""""
"""
class Stack:
    
    # Definir le constructeur 
    def __init__(self):
        self.list = [] 
        
    # Definir la fonction push    
    def push(self, item):
        self.list.append(item)
# instanciation        
s = Stack()
item=input("Entrer un nouvel element :")       
s.push(item)



from Stack import Stack

def convert_base_2(number):
    s = Stack()
    while number != 0:
        s.Push(number % 2)
        number = number // 2
    
    size = s.Size()

    while size > 0:
        print(s.Pop(), end="")
        size -= 1

def convert_base_8(number):
    s = Stack()
    while number != 0:
        s.Push(number % 8)
        number = number // 8
    
    size = s.Size()

    while size > 0:
        print(s.Pop(), end="")
        size -= 1
       
 """
"""
print(len(list(range(2,1000,2))))
"""

class File:

	def __init__(self):
		self.valeurs = []

	def enfiler(self, valeur):
		self.valeurs.append(valeur)

	def defiler(self):
		if self.valeurs:
			return self.valeurs.pop(0)

	def estVide(self):
		return self.valeurs == []

	def longueur(self):
		return len(self.valeurs)


	def __str__(self):
		ch = "\nEtat de la file:\n"
		for x in self.valeurs:
			ch +=  str(x) + " "
		return ch



q = File()
q.enfiler(9)
q.enfiler(2)
q.enfiler(5)

print(q)

q.defiler()
q.enfiler(7)

print("La file est-elle vide: ", q.estVide())

print(q)
print("Longueur de la file:", q.longueur)