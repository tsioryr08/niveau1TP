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