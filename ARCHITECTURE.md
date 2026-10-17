# Architecture proposée

## Backend
- Contrats normalisés indépendants du fournisseur.
- Adaptateurs fournisseur interchangeables.
- Stockage immuable des payloads bruts uniquement si la licence l'autorise ; sinon conserver les champs nécessaires et les références/source IDs autorisés.
- Tables logiques : competitions, teams, events, statistics, odds_quotes, predictions, settlements, provider_licences, model_versions.
- Services séparés : ingestion, validation de données, modèles, calibrage, value assessment, backtesting, API.
- Clés fournisseurs exclusivement côté serveur.

## Application mobile Flutter
L'application ne calcule pas la vérité des cotes à partir de données inventées. Elle affiche les résultats du backend avec source, horodatage, marché, probabilité, cote observée, cote juste, incertitude et raison d'abstention.

## Marchés
Le contrat de marché doit stocker l'identifiant, la ligne, les sélections, les règles de règlement, la source, la période de validité et le statut de disponibilité. Les marchés non couverts par les données du fournisseur doivent apparaître comme indisponibles, pas être extrapolés silencieusement.
