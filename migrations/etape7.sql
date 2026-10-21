CREATE TABLE historique_prix (
    id SERIAL PRIMARY KEY,
    id_article INTEGER NOT NULL REFERENCES articles(id),
    prix INTEGER NOT NULL,
    date DATE NOT NULL
);

INSERT INTO historique_prix (id_article, prix, date)
SELECT id, prix, DATE '2026-01-01'
FROM articles;

INSERT INTO historique_prix (id_article, prix, date)
VALUES (1, 1500, DATE '2026-10-15');

UPDATE articles
SET prix = 1500
WHERE id = 1;

ALTER TABLE detail_vente ADD COLUMN prix_unitaire INTEGER;

-- pour savoir le prix de l article au moment de la vente , car si avant telle date ca peut etre 1200 ar apres telle date 1500 donc voila
UPDATE detail_vente dv
SET prix_unitaire = (
    SELECT hp.prix
    FROM historique_prix hp
    JOIN vente v ON v.id = dv.id_vente
    WHERE hp.id_article = dv.id_article
      AND hp.date <= v.date_vente::DATE
    ORDER BY hp.date DESC
    LIMIT 1
);

ALTER TABLE detail_vente ALTER COLUMN prix_unitaire SET NOT NULL;

-- REPONSES PIEGES
-- Non, ce n'est pas une violation de la 3FN, car le prix unitaire depend de la vente et de l'article au moment de la vente. 
-- C'est une redondance volontaire pour conserver le prix historique et eviter que le montant d'une ancienne vente change