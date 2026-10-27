
import os
from datetime import date

import requests
from fastapi import FastAPI, HTTPException, Query

app = FastAPI(title="Andrew Analyse API")

API_URL = "https://v3.football.api-sports.io"


@app.get("/")
def accueil():
    return {"application": "Andrew Analyse", "statut": "serveur prêt"}


@app.get("/matchs")
def obtenir_matchs(jour: date = Query(default=None)):
    api_key = os.getenv("API_FOOTBALL_KEY")

    if not api_key:
        raise HTTPException(
            status_code=500,
            detail="La clé API n'est pas configurée sur le serveur."
        )

    date_matchs = jour or date.today()

    try:
        reponse = requests.get(
            f"{API_URL}/fixtures",
            headers={"x-apisports-key": api_key},
            params={"date": date_matchs.isoformat()},
            timeout=20,
        )
        reponse.raise_for_status()
        donnees = reponse.json()

        if donnees.get("errors"):
            raise HTTPException(
                status_code=502,
                detail="Le fournisseur de données a signalé une erreur."
            )

        return {
            "date": date_matchs.isoformat(),
            "nombre_matchs": donnees.get("results", 0),
            "matchs": donnees.get("response", []),
        }

    except requests.RequestException:
        raise HTTPException(
            status_code=502,
            detail="Impossible de récupérer les matchs."
        )
