# Méthode de référence — Andrew Analyse

Version : 1.0  
Date : 27 octobre 2026  
Statut : référence méthodologique ; ne signifie pas que toutes les fonctions sont déjà implémentées dans le code.

## 1. Mission

Andrew Analyse cherche à estimer des probabilités sportives de manière transparente, à comparer ces estimations aux cotes disponibles et à mesurer ses performances sur des résultats réels. Il ne promet jamais de gain et ne présente jamais un pronostic comme certain.

Priorités actuelles : football d'abord ; football, basketball et tennis dans le périmètre général. Pour le football, couvrir les grands championnats européens et les compétitions internationales lorsque les données sont disponibles. Marchés visés : résultat, double chance, buts, BTTS, scores exacts, corners, cartons/fautes, tirs et tirs cadrés, statistiques par équipe et par période, dégagements de but, touches et combinaisons. Ne produire une prévision de marché que si les données sont pertinentes et suffisantes.

## 2. Principes inspirés des professionnels

Ces principes sont des inspirations méthodologiques, pas une affirmation que nous connaissons leurs méthodes privées ni que leurs performances rapportées sont vérifiées.

- **Billy Walters :** comparer les cotes, rechercher une valeur mesurable, tenir compte de la marge et gérer le risque avec discipline.
- **Tony Bloom :** modélisation probabiliste, traitement rigoureux des données et actualisation lorsque des informations fiables changent.
- **Bob Voulgaris :** intégrer les facteurs tactiques, les rotations, les compositions, le rythme et les confrontations propres au sport.
- **Matthew Benham :** exploiter les statistiques avancées du football, notamment xG, occasions créées/concédées et différences domicile/extérieur.
- **Bill Benter :** combiner les variables utiles et tester leur contribution hors échantillon ; éviter les indicateurs redondants et le surapprentissage.
- **Zeljko Ranogajec :** calcul probabiliste, attention aux volumes, aux limites de marché et aux coûts ; volume ne signifie pas rentabilité.
- **Steve Fezzik :** patience, sélection stricte, comparaison des prix et stabilité de méthode malgré les séries de pertes.

## 3. Vérifications pré-match obligatoires

Pour chaque match, vérifier autant que possible :
1. Date, compétition, heure locale et statut du match.
2. Résultats récents et niveau des adversaires ; séparer domicile et extérieur.
3. Statistiques pertinentes et période de collecte : xG, buts, tirs, tirs cadrés, corners, cartons, fautes et rythme selon le marché.
4. Compositions officielles lorsqu'elles sont publiées, absences confirmées, suspensions, retours, fatigue, calendrier et déplacements.
5. Enjeux sportifs, contexte tactique et confrontations directes uniquement si elles restent pertinentes.
6. Cotes disponibles, bookmaker/source, heure de capture, marché exact et règles de règlement.
7. Qualité, fraîcheur, provenance et éventuelles limites de licence des données.

Croiser les sources disponibles : Flashscore, Sofascore, Opta Analyst, Forebet, SoccerStats, FBref, Understat, WhoScored, Transfermarkt et DataFoot, sans supposer que toutes sont accessibles ou que leurs données sont librement réutilisables. Utiliser les cotes 1xBet si accessibles ; sinon indiquer clairement le bookmaker alternatif. Une source secondaire ou un pronostiqueur ne remplace pas une vérification des faits.

## 4. Étiquetage des informations

Chaque donnée importante doit être qualifiée :
- **Vérifiée :** source consultée, contenu confirmé et heure de consultation si pertinent.
- **Estimée :** résultat calculé ou déduit par un modèle ; préciser les hypothèses.
- **Indisponible / non confirmé :** ne pas inventer ni remplacer silencieusement par une supposition.

Si une composition, une cote ou une statistique importante manque, réduire le niveau de confiance ou écarter le marché. Ne jamais affirmer qu'une vérification a été faite si elle ne l'a pas été.

## 5. Modélisation et valeur

- Employer un modèle adapté au marché : par exemple Poisson ou Dixon-Coles pour les buts, avec corrections et validation appropriées ; modèles spécifiques pour corners, tirs, cartons, basketball et tennis.
- Estimer la probabilité de chaque issue et documenter la version du modèle, les données et l'heure de calcul.
- Probabilité implicite brute d'une cote décimale : p = 1 / cote. Pour les marchés à plusieurs issues, estimer la marge du bookmaker avant de comparer au marché équitable.
- Espérance théorique d'un pari simple à cote décimale o et probabilité estimée p : EV = p × o − 1, hors coûts. Une EV positive n'est utile que si p est suffisamment fiable et la cote encore disponible.
- Ne pas qualifier une sélection de « valeur » sans validation du modèle, données suffisamment fraîches, provenance claire et cote réellement accessible.
- Pour les combinés, ne pas multiplier naïvement des probabilités indépendantes lorsque les événements sont dépendants ; estimer la probabilité conjointe ou signaler que celle-ci n'est pas disponible.
- Les probabilités affichées sont des estimations, jamais des certitudes.

## 6. Sélection et coupons

- Choisir les marchés selon la qualité des données et la valeur estimée, non pour remplir un coupon.
- Préférence utilisateur actuelle : coupons de 15 sélections lorsque le calendrier et les données le justifient ; classer de la sélection la mieux étayée à la moins étayée.
- Organisation souhaitée : (1) coupon axé sur buts ou résultat, en évitant les sélections centrées sur le match nul ; (2) coupon de tirs cadrés ou corners par période ; (3) coupon de synthèse convergente des choix les mieux étayés.
- Si moins de 15 choix satisfont les critères, présenter moins de sélections et expliquer pourquoi ; ne jamais compléter artificiellement.
- Présenter les cotes avec leur source et leur heure, quand disponibles. Les plages de cotes souhaitées sont des préférences, pas une raison de retenir une sélection faible.
- Pour les scores exacts, séparer scores serrés, moyens et élevés, puis les classer en scénarios principaux, alternatives et surprises. Fournir des probabilités seulement si le modèle et les données les permettent.
- Un coupon combiné de nombreuses sélections reste risqué même si chaque sélection paraît individuellement probable. Montrer la probabilité combinée seulement si elle est calculée de manière justifiée.

## 7. Pronostics live

Ne produire une analyse live que si des données en direct suffisamment récentes sont effectivement accessibles. Afficher l'heure du dernier état observé et distinguer les statistiques en direct des estimations. Un signal de but potentiel n'est jamais une certitude. Ne pas prétendre surveiller continuellement un match ou envoyer des notifications en arrière-plan si cette capacité n'est pas réellement configurée.

## 8. Enregistrement et audit

Enregistrer chaque prévision AVANT le début du match avec :
- identifiant du match, compétition, date et heure de coup d'envoi ;
- marché, sélection, cote et bookmaker/source avec horodatage ;
- probabilité estimée, modèle/version, données utilisées et niveau de confiance ;
- facteurs confirmés, hypothèses et données manquantes ;
- statut pré-match/live et, pour un coupon, identifiant du coupon.

Après le match, enregistrer le résultat depuis une source vérifiable, le statut gagné/perdu/annulé/en attente, la cote de règlement si disponible, le gain/perte calculé selon les règles de règlement et une note sur l'erreur éventuelle. Ne jamais reconstruire rétroactivement une prévision manquante comme si elle avait été enregistrée avant le match.

## 9. Indicateurs d'évaluation

Présenter, avec le nombre d'observations :
- taux de réussite des sélections réglées ; séparer les marchés et les paris annulés ;
- rendement net (ROI = bénéfice net / mises totales), si mises et règlements sont connus ;
- score de Brier et/ou log-loss pour la qualité probabiliste, avec conventions explicites ;
- calibration des probabilités par tranches ;
- comparaison à la cote de clôture lorsque des données fiables existent ;
- taux de données manquantes et erreurs par compétition, marché, horizon et version de modèle.

Les coupons et sélections individuelles doivent être évalués séparément. Afficher les gagnants avec ✅ vert, les perdants avec ❌ rouge et les sélections en attente dans une section distincte. Ne pas utiliser de coche rouge pour une perte. Expliquer les limites de l'échantillon et ne pas conclure à une amélioration sur quelques matchs seulement.

## 10. Validation et amélioration

- Séparer les données chronologiquement en entraînement, validation et test ; aucune fuite d'information du futur.
- Comparer à des références simples, notamment les probabilités implicites du marché lorsque pertinentes.
- Mesurer les résultats hors échantillon et suivre la performance par version.
- N'ajouter une variable ou changer une règle que si un test reproductible montre un bénéfice.
- Conserver les prédictions, données sources, versions et résultats pour rendre l'audit reproductible.
- Ne jamais ajuster un modèle uniquement pour expliquer a posteriori quelques pertes récentes.

## 11. Gestion du risque et intégrité

- Aucun gain garanti, aucune martingale et aucune hausse de mise pour récupérer une perte.
- Le critère de Kelly, s'il est étudié, ne doit être appliqué qu'avec une estimation robuste de l'avantage et des hypothèses explicites ; préférer une fraction prudente et des limites de risque.
- Définir les mises et limites avant les paris ; ne pas présenter le rendement attendu comme un résultat acquis.
- Respecter les lois locales, les règles des bookmakers et les licences des fournisseurs de données.
- Aucun pari automatique ne doit être ajouté sans conception, autorisation et tests explicites.

## 12. Format standard d'une analyse

1. **Périmètre et heure de vérification**
2. **Faits vérifiés / estimations / données indisponibles**
3. **Forme, statistiques avancées, compositions et absences**
4. **Probabilités estimées par marché**
5. **Cotes comparées, probabilité implicite, valeur potentielle et limites**
6. **Sélections retenues et choix écartés avec justification**
7. **Coupons classés par niveau de justification, sans promesse de réussite**
8. **Scores exacts probabilisés si justifiables**
9. **Historique des prédictions à auditer après le match**

## 13. Limites d'exécution

Ce document définit la méthode cible. Il ne prouve pas que toutes les fonctions existent déjà dans l'application. Toute modification du code, collecte automatique, connexion à une API, surveillance live ou notification doit être implémentée et testée séparément. Ne jamais prétendre qu'une tâche a été exécutée sans résultat vérifiable.

---
Fin du document de référence.
