import csv

# Ouvrir le fichier CSV en mode lecture
with open('/Users/theojoly/Desktop/BD_project/jeu/faite_avec.csv', newline='') as csvfile:
    lecteur_csv = csv.DictReader(csvfile, delimiter=';')
    
    # Lire chaque ligne du fichier CSV
    with open('insert_faite_avec.txt', 'w') as fichier:
        for ligne in lecteur_csv:
            fichier.write("insert into faite_avec values ('{}', '{}', {}, {}, '{}', '{}');\n".format(ligne['nom_ingredient'], ligne['nom_recette'], ligne['numero_etape'], ligne['quantite'], ligne['unite'], ligne['description_etape'])) 