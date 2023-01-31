-- SQL GROUP BY
-- La commande GROUP BY est utilisée en SQL pour grouper plusieurs résultats et utiliser une fonction de totaux sur un groupe de résultat. Sur une table qui contient toutes les ventes d’un magasin, il est par exemple possible de liste regrouper les ventes par clients identiques et d’obtenir le coût total des achats pour chaque client.

-- Syntaxe d’utilisation de GROUP BY
-- De façon générale, la commande GROUP BY s’utilise de la façon suivante

-- SELECT colonne1, fonction(colonne2)
-- FROM table
-- GROUP BY colonne1
-- A noter : cette commande doit toujours s’utiliser après la commande WHERE et avant la commande HAVING.