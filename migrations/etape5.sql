CREATE TABLE caisse (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(20) NOT NULL
);

CREATE TABLE vendeur(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(20) NOT NULL,
    prenom VARCHAR(50) NOT NULL
);

ALTER TABLE vente ADD COLUMN id_caisse INTEGER REFERENCES caisse(id);
ALTER TABLE vente ADD COLUMN id_vendeur INTEGER NOT NULL REFERENCES vendeur(id);

INSERT INTO vendeur(nom,prenom) VALUES
('Mamy','Andria'),
('Voahangy','Rabe');

INSERT INTO caisse(nom) VALUES
('Entree'),
('Rayon manuels');

-- REPONSES PIEGES
-- Une vente represente un achat effectue par un client
-- Une caisse represente le point d’encaissement ou la vente est enregistree
-- Le rattachement au vendeur est obligatoire pour savoir qui a realise chaque vente, 
-- tandis que le rattachement a la caisse est facultatif, car une commande passee par telephone ne passe par aucune caisse