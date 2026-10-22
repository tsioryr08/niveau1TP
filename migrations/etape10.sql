CREATE TABLE fournisseur (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    ville VARCHAR(100) NOT NULL
);

CREATE TABLE achat (
    id SERIAL PRIMARY KEY,
    date_achat DATE NOT NULL,
    id_fournisseur INTEGER NOT NULL REFERENCES fournisseur(id)
);

CREATE TABLE detail_achat (
    id_achat INTEGER NOT NULL REFERENCES achat(id),
    id_article INTEGER NOT NULL REFERENCES articles(id),
    quantite INTEGER NOT NULL,
    prix_unitaire INTEGER NOT NULL,
    PRIMARY KEY (id_achat, id_article)
);

INSERT INTO fournisseur (nom, ville)
VALUES
('Grossiste Behoririka', 'Behoririka'),
('Importateur Toamasina', 'Toamasina');

-- test achat
INSERT INTO achat (date_achat, id_fournisseur)
VALUES
(CURRENT_DATE - 10, 1),
(CURRENT_DATE - 5, 2);
--tests
-- Achat 1 : grossiste de Behoririka
INSERT INTO detail_achat (id_achat, id_article, quantite, prix_unitaire)
VALUES
(1, 1, 100, 900),
(1, 2, 100, 1600);

-- Achat 2 : importateur de Toamasina
INSERT INTO detail_achat (id_achat, id_article, quantite, prix_unitaire)
VALUES
(2, 1, 200, 850),
(2, 2, 100, 1700);

-- REPONSES PIEGES
-- Non une table fournisseur_article seule ne suffit pas, car le prix d'achat change d'une commande à l'autre : 
--on perd l'historique des achats, les dates et les quantites. La bonne cle primaire de DETAIL_ACHAT est composee de (#id_achat, #id_article)