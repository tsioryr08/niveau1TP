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

-- verification etape6
SELECT
    v.id AS id_vente,
    t.montant_du,
    COALESCE(p.montant_paye, 0) AS montant_paye,
    t.montant_du - COALESCE(p.montant_paye, 0) AS reste_a_payer
FROM vente v

JOIN (
    SELECT
        dv.id_vente,
        SUM(dv.quantite * a.prix) AS montant_du
    FROM detail_vente dv
    JOIN articles a ON dv.id_article = a.id
    GROUP BY dv.id_vente
) t ON v.id = t.id_vente

LEFT JOIN (
    SELECT
        id_vente,
        SUM(montant) AS montant_paye
    FROM paiement
    GROUP BY id_vente
) p ON v.id = p.id_vente

WHERE t.montant_du > COALESCE(p.montant_paye, 0)

ORDER BY v.id;