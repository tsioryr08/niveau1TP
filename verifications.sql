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

-- verification etape4
SELECT v.id, COALESCE(c.nom, 'Client de passage') as nom_client
FROM vente v LEFT JOIN clients c ON v.id_client=c.id;

-- verification etape5
SELECT
    ve.id,
    ve.nom,
    ve.prenom,
    COUNT(DISTINCT v.id) AS nombre_ventes,
    COALESCE(SUM(a.prix * dv.quantite), 0) AS chiffre_affaires
FROM vendeur ve
LEFT JOIN vente v ON v.id_vendeur = ve.id
LEFT JOIN detail_vente dv ON dv.id_vente = v.id
LEFT JOIN articles a ON a.id = dv.id_article
GROUP BY ve.id, ve.nom, ve.prenom;