magic=85
nb=int(input("Entrer le nombre magic : ")) 
while nb != magic :
    if nb>magic:
        print("C'est plus")
        nb=int(input("Entrer le nombre magic : "))
    elif nb<magic:
        print("C'est moins")
        nb=int(input("Entrer le nombre magic : ")) 

print("Bravo vous avez trouver le nombre magic")
    