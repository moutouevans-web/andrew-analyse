"""Provider interface only. Do not implement a provider until licensing is approved."""
from typing import Protocol, Any


class FootballDataProvider(Protocol):
    provider_id: str

    def fixtures(self, competition_id: str, start_date: str, end_date: str) -> list[dict[str, Any]]:
        """Return normalized fixture records with source references and timestamps."""
        ...

    def odds(self, event_id: str, market_keys: list[str]) -> list[dict[str, Any]]:
        """Return quotes with bookmaker, decimal price, capture time and settlement rules."""
        ...

    def team_statistics(self, event_id: str) -> dict[str, Any]:
        """Return available pre-match statistics and missing-data indicators."""
        ...
