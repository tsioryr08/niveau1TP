CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(50) NOT NULL
);

INSERT INTO categories (libelle) VALUES
('Cahiers'),
('Ecriture'),
('Geometrie'),
('Manuels scolaires'),
('Bagagerie'),
('Articles divers');

ALTER TABLE articles ADD COLUMN id_categorie INTEGER ;
ALTER TABLE articles ADD CONSTRAINT fk_articles_categories FOREIGN KEY (id_categorie) REFERENCES categories(id);

UPDATE articles
SET id_categorie = CASE
    WHEN libelle IN ('Cahier 100 pages', 'Cahier 200 pages')
        THEN (SELECT id FROM categories WHERE libelle = 'Cahiers')

    WHEN libelle IN ('Stylo a bille bleu', 'Crayon a papier')
        THEN (SELECT id FROM categories WHERE libelle = 'Ecriture')

    WHEN libelle = 'Regle 30 cm'
        THEN (SELECT id FROM categories WHERE libelle = 'Geometrie')

    WHEN libelle = 'Manuel Mathematiques CM2'
        THEN (SELECT id FROM categories WHERE libelle = 'Manuels scolaires')

    WHEN libelle = 'Cartable'
        THEN (SELECT id FROM categories WHERE libelle = 'Bagagerie')

    ELSE (SELECT id FROM categories WHERE libelle = 'Articles divers')
END;


-- REPONSES PIEGES
-- On pourrait ajouter une colonne rayon VARCHAR(50) dans la table articles, 
-- mais cela entraînerait une repetition des noms de rayons et risquerait de creer des incoherences