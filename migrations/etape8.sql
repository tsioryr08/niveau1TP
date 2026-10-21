CREATE TABLE niveau_scolaire (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(10) NOT NULL
);

INSERT INTO niveau_scolaire (nom)
VALUES
('CP'),
('CE1'),
('CM2'),
('6e');

CREATE TABLE liste_fourniture (
    id_niveau INTEGER NOT NULL REFERENCES niveau_scolaire(id),
    id_article INTEGER NOT NULL REFERENCES articles(id),
    quantite INTEGER NOT NULL,
    PRIMARY KEY (id_niveau, id_article)
);


INSERT INTO liste_fourniture (id_niveau, id_article, quantite)
VALUES
(1, 1, 6),
(1, 4, 4),
(1, 3, 2);


INSERT INTO liste_fourniture (id_niveau, id_article, quantite)
VALUES
(3, 1, 4),
(3, 2, 2),
(3, 3, 4),
(3, 5, 1),
(3, 6, 1);

--REPONSES PIEGES
-- Une liste varchar(500) n est pas acceptable parce que ça ne respecte pas la 1FN : plusieurs informations 
-- sont stockees dans une seule colonne, ce qui complique les calculs et la gestion des articles