CREATE TABLE vente(
    id SERIAL PRIMARY KEY,
    date_vente TIMESTAMP NOT NULL,
    desc_vente VARCHAR(100) NOT NULL
);

CREATE TABLE detail_vente (
    id SERIAL PRIMARY KEY,  
    id_vente INTEGER NOT NULL,
    id_article INTEGER NOT NULL,
    quantite INTEGER NOT NULL,
    FOREIGN KEY (id_vente) REFERENCES vente(id),
    FOREIGN KEY (id_article) REFERENCES articles(id)
);

-- REPONSES PIEGEES 
-- J ai place la quantite dans la table detail_vente chaque article vendu 
-- peut avoir une quantite differente dans chaque vente
-- Parce que DATE est un type de donnees SQL. Il vaut mieux utiliser date_vente pour 
-- eviter les confusions et rendre le code plus clair