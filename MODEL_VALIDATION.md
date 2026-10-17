# Protocole de validation du moteur

## 1. Horodatage et prévention des fuites
Chaque prédiction est créée avant le coup d'envoi et stocke `generated_at`, `model_version`, les identifiants de sources et l'heure de capture des cotes. N'utiliser aucune composition officielle, statistique ou cote publiée après l'heure de prédiction.

## 2. Découpage temporel
- Entraînement : saisons les plus anciennes.
- Validation : période suivante, utilisée pour le réglage/calibrage.
- Test final : période la plus récente, gardée intacte.
- En production, évaluation glissante/walk-forward.
Aucun partage aléatoire qui mélange le passé et le futur.

## 3. Marchés indépendants
Valider séparément :
- 1X2 et double chance.
- Totaux de buts et buts par équipe.
- Score exact.
- Corners, cartons, tirs et tirs cadrés.
- Marchés joueurs et timing de but seulement si la source et les règles de règlement sont fiables.
- Combinaisons par probabilité conjointe calibrée. Ne pas multiplier les probabilités marginales sauf indépendance démontrée.

## 4. Métriques
- Brier score et log-loss pour les probabilités.
- Courbes de calibration par tranche de probabilité et par compétition.
- ROI net avec règlement exact des marchés et marge réelle.
- Intervalles de confiance bootstrap par match/journée lorsque pertinent.
- Closing-line value lorsque la cote de clôture et les mêmes règles de marché sont disponibles.
- Taille d'échantillon, couverture et taux de données manquantes.

## 5. Publication d'une « valeur potentielle »
Ne publier que si :
- probabilité validée sur données hors échantillon ;
- cote récente et provenance complète ;
- règles de règlement identifiées ;
- avantage reste positif après incertitude et seuil minimal ;
- couverture et taille d'échantillon sont affichées.
Sinon, s'abstenir.

## 6. Limites
Un ROI historique positif n'assure pas le futur. Ne pas optimiser les seuils sur le test final. Conserver toutes les prédictions, y compris les pertes, sans réécriture a posteriori.
