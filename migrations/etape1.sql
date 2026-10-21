CREATE DATABASE papeterie;
USE papeterie;

CREATE TABLE articles(
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(90) NOT NULL,
    prix INTEGER 
);

INSERT INTO articles(libelle, prix) VALUES
('Cahier 100 pages', 1200),
('Cahier 200 pages', 2000),
('Stylo a bille bleu', 500),
('Crayon a papier', 300),
('Regle a 30 cm', 800),
('Manuel mathematiques CM2', 15000),
('Cartable', 35000);


REPONSES PIEGES 
-- J'ai choisi un type INTEGER pour le prix car il est enonce dans le tp
-- que les prix sont des entiers. Et puis , pour l'identifiant, j'ai choisi 
-- l'id car il est unique et qu'il est plus facile de l'utiliser pour les jointures.