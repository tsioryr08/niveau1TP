INSERT INTO articles (libelle, prix, id_categorie)
VALUES ('Pack Ecolier', 8000, 3);

CREATE TABLE composition_pack (
    id_pack INTEGER NOT NULL REFERENCES articles(id),
    id_article INTEGER NOT NULL REFERENCES articles(id),
    quantite INTEGER NOT NULL,
    PRIMARY KEY (id_pack, id_article),
    CHECK (id_pack <> id_article)
);

INSERT INTO composition_pack (id_pack, id_article, quantite)
VALUES
(8, 1, 5),
(8, 3, 2),
(8, 5, 1);

-- REPONSES PIEGES
-- on ne cree pas une table pack separee parce qu'un pack est 
-- deja un article(comme dans l'enonce): on peut donc le stocker dans articles
-- Il faudrait une contrainte CHECK (id_pack <> id_article) comme celle-ci
-- afin de pouvoir empecher un pack de se contenir lui meme