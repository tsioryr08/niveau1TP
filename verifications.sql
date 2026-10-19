-- verification etape1
SELECT libelle, prix FROM articles ORDER BY prix DESC;

-- verification etape2
SELECT c.libelle as categorie,COUNT(a.id) as nombre_articles 
FROM categories c LEFT JOIN articles a ON c.id=a.id_categorie GROUP BY c.id,c.libelle
ORDER BY c.libelle;