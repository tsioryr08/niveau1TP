CREATE TABLE clients(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    telephone VARCHAR(15) NOT NULL
);

ALTER TABLE vente ADD COLUMN id_client INTEGER REFERENCES clients(id);

-- REPONSES PIEGES
-- Non id_client accepte NULL car on peut avoir des clients de passage
-- J'ai utilise la jointure LEFT JOIN car elle conserve toutes les ventes meme celles sans client associe, comme 
-- notre cas ici 