-- verification etape1
SELECT libelle, prix FROM articles ORDER BY prix DESC;

-- verification etape2
SELECT c.libelle as categorie,COUNT(a.id) as nombre_articles 
FROM categories c LEFT JOIN articles a ON c.id=a.id_categorie GROUP BY c.id,c.libelle
ORDER BY c.libelle;

-- verification etape3
SELECT v.desc_vente as vente , SUM(dv.quantite * a.prix) as montant_total 
FROM vente v JOIN detail_vente dv ON dv.id_vente=v.id
JOIN articles a ON a.id=dv.id_article
GROUP BY v.id
ORDER BY v.id;


