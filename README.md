# Andrew Analyse — fondation du moteur de valeur football

Cette fondation est un **squelette de développement et de tests**, pas un service de pronostics prêt pour la production. Elle ne se connecte à aucun fournisseur réel et n'inclut aucune donnée propriétaire.

## Objectif
Estimer des probabilités pré-match, les comparer aux cotes décimales et n'indiquer une valeur potentielle que si les données, la fraîcheur des cotes et la validation du modèle sont suffisantes.

## Contenu
- `backend/andrew/`: calculs de probabilité et contrats de données indépendants du fournisseur.
- `tests/`: tests unitaires reproductibles sans réseau.
- `docs/DATA_LICENSES.md`: registre à remplir avant l'intégration d'une source.
- `docs/MODEL_VALIDATION.md`: protocole de validation chronologique.
- `.env.example`: configuration sans secret.
- Aucun appel réseau et aucune clé API réelle.

## Démarrer
Python 3.11+ recommandé.

```bash
python -m venv .venv
# Linux/macOS
source .venv/bin/activate
# Windows PowerShell
# .venv\Scripts\Activate.ps1
pip install -e ".[dev]"
pytest
```

## Principes non négociables
1. Conserver l'heure et la source de chaque cote et chaque donnée.
2. Enregistrer chaque prédiction avant le coup d'envoi avec la version du modèle.
3. Séparer entraînement, validation et test dans l'ordre chronologique.
4. Ne jamais appeler « valeur » un pari si la probabilité n'est pas validée, si la cote est périmée ou si la provenance manque.
5. Les marchés combinés doivent utiliser une probabilité conjointe, pas le produit naïf de probabilités dépendantes.
6. Vérifier les droits d'utilisation, de conservation, d'entraînement et de redistribution avant toute intégration fournisseur.
7. Aucun pari automatique, aucun gain garanti.

## Étape suivante
Comparer les fournisseurs et leurs licences, puis implémenter un adaptateur spécifique uniquement après validation écrite des conditions pertinentes.
