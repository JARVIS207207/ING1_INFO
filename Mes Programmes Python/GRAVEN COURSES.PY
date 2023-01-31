#les conditions ternaires
#texte= ("la condition est vrai"," la condition est fausse ")[la condition]
# cond=1000
# texte= ("la condition est vrai"," la condition est fausse ")[999<1000]
# print(texte)

import statistics

oneline_players=["Graven","Ananas"," Clemyax"]
#----On affiche les element de la liste
print(oneline_players)

#----On affiche la premiere valeur de la liste
print(oneline_players[0])

#----Pour afficher la dernere valeur on fait
print(oneline_players[len(oneline_players)-1])

#----Pour modifier la liste Graven --> Jarvis et modifier a partiir d'un indice prescis
oneline_players[0]="Jarvis"
print(oneline_players)
#la liste devient --> ['Jarvis', 'Ananas', ' Clemyax']

oneline_players[2:4]=["A1","A2"]
print(oneline_players)
#la liste devient --> ['Jarvis', 'Ananas', 'A1', 'A2']

#----Pour ajouter la fin de la liste
oneline_players.append("A3")
print(oneline_players)
#la liste devient --> ['Jarvis', 'Ananas', 'A1', 'A2', 'A3'] 
# Pour etendre la liste et en mettre plusieurs
#oneline_players.extend(:"B1","B2")

#--- Pour suprimer un element 
oneline_players.pop(1)
print(oneline_players)
#on peut auusi faire > del oneline_players[1] 
#la liste devient --> ['Jarvis', 'A1', 'A2', 'A3']

#pour vider une listye de son contenu
oneline_players.clear()
print(oneline_players)
#la liste devient -->  []

#On import d'abords le module statistics en debut de programme
#>import statistics 
table=[6,2,5,3,1,51,25,85,65,8,9,25,6,2,11,22,0]
#Pour le calcul de la moyenne on use la fonction mean()
moyenne= statistics.mean(table)
print("la moyenne est {} :".format(moyenne))