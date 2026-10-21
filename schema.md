# Papeterie de Hanta — Niveau 1

### 1. CATEGORIES (nouveau a l'etape 2)

CATEGORIES(**id**, libelle)

### 2. ARTICLES (modifie a l'etape 2)

ARTICLES(**id**, libelle, prix, #id_categorie)

### 3. CLIENTS (nouveau a l'etape 4)

CLIENTS(**id**, nom, prenom, telephone)

### 4. CAISSE (nouveau a l'etape 5)

CAISSE(**id**, nom)

### 5. VENDEUR (nouveau a l'etape 5)

VENDEUR(**id**, nom, prenom)

### 6. VENTE (nouveau a l'etape 3, modifie aux etapes 4 et 5)

VENTE(**id**, date_vente, desc_vente, #id_client?, #id_caisse?, #id_vendeur)

### 7. DETAIL_VENTE (nouveau a l'etape 3)

DETAIL_VENTE(**id**, #id_vente, #id_article, quantite)

# Papeterie de Hanta — Niveau 2

### 1. CATEGORIES (inchangé)

CATEGORIES(**id**, libelle)

### 2. ARTICLES (inchangé dans sa structure ; pack ajouté à l'étape 9)

ARTICLES(**id**, libelle, prix, #id_categorie)

### 3. CLIENTS (inchangé)

CLIENTS(**id**, nom, prenom, telephone)

### 4. CAISSE (inchangé)

CAISSE(**id**, nom)

### 5. VENDEUR (inchangé)

VENDEUR(**id**, nom, prenom)

### 6. VENTE (inchangé)

VENTE(**id**, date_vente, desc_vente, #id_client?, #id_caisse?, #id_vendeur)

### 7. DETAIL_VENTE (modifié à l'étape 7)

DETAIL_VENTE(**id**, #id_vente, #id_article, quantite, prix_unitaire)

### 8. HISTORIQUE_PRIX (nouveau à l'étape 7)

HISTORIQUE_PRIX(**id**, #id_article, prix, date)

### 9. NIVEAU_SCOLAIRE (nouveau à l'étape 8)

NIVEAU_SCOLAIRE(**id**, nom)

### 10. LISTE_FOURNITURE (nouveau à l'étape 8)

LISTE_FOURNITURE(**#id_niveau, #id_article**, quantite)

### 11. COMPOSITION_PACK (nouveau à l'étape 9)

COMPOSITION_PACK(**#id_pack, #id_article**, quantite)

Contrainte : CHECK (id_pack <> id_article)