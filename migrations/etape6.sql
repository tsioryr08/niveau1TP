CREATE TABLE mode_paiement (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(30) NOT NULL
);

INSERT INTO mode_paiement (libelle) VALUES
('Especes'),
('MVola'),
('Orange Money'),
('Cheque');

-- pour verifier les tests
INSERT INTO vente (date_vente, desc_vente, id_vendeur)
VALUES
(CURRENT_TIMESTAMP, 'Vente 1', 1),
(CURRENT_TIMESTAMP, 'Vente 2', 1),
(CURRENT_TIMESTAMP, 'Vente 3', 2);

INSERT INTO detail_vente (id_vente, id_article, quantite)
VALUES
(1, 1, 10),
(2, 2, 10),
(3, 6, 2);

CREATE TABLE paiement (
    id SERIAL PRIMARY KEY,
    id_vente INTEGER NOT NULL REFERENCES vente(id),
    id_mode_paiement INTEGER NOT NULL REFERENCES mode_paiement(id),
    montant INTEGER NOT NULL
);
INSERT INTO paiement (id_vente, id_mode_paiement, montant) VALUES
(1, 1, 7000),
(2, 2, 10000),
(2, 1, 5000),
(3, 4, 20000);

-- REPONSES PIEGES
-- La colonne montant_paye ne suffit pas, car une vente peut avoir 
-- plusieurs paiements avec des montants et des modes differents

-- La table de reference mode_paiement est preferable, car elle permet de 
-- gerer les modes de paiement separement et d'eviter les valeurs repetees ou incoherentes 