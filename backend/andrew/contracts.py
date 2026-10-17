"""Provider-neutral contracts. Keep raw source payloads outside model inputs where possible."""
from dataclasses import dataclass
from datetime import datetime
from enum import StrEnum
from typing import Optional


class MarketFamily(StrEnum):
    RESULT_1X2 = "result_1x2"
    DOUBLE_CHANCE = "double_chance"
    GOALS_TOTAL = "goals_total"
    TEAM_GOALS = "team_goals"
    EXACT_SCORE = "exact_score"
    CORNERS_TOTAL = "corners_total"
    TEAM_CORNERS = "team_corners"
    CARDS_TOTAL = "cards_total"
    TEAM_CARDS = "team_cards"
    SHOTS_TOTAL = "shots_total"
    SHOTS_ON_TARGET = "shots_on_target"
    PLAYER_SCORER = "player_scorer"
    GOAL_TIMING = "goal_timing"
    COMBINED = "combined"


@dataclass(frozen=True)
class OddsQuote:
    event_id: str
    market_key: str
    selection_key: str
    decimal_odds: float
    bookmaker: str
    captured_at: datetime
    source_id: str
    rules_version: str

    def __post_init__(self) -> None:
        if self.decimal_odds <= 1:
            raise ValueError("Decimal odds must be greater than 1.0")
        if not self.event_id or not self.market_key or not self.selection_key:
            raise ValueError("Event, market and selection identifiers are required")
        if not self.bookmaker or not self.source_id or not self.rules_version:
            raise ValueError("Bookmaker, source and settlement rules are required")


@dataclass(frozen=True)
class ProbabilityEstimate:
    event_id: str
    market_key: str
    selection_key: str
    probability: float
    model_version: str
    generated_at: datetime
    calibrated: bool
    data_sources: tuple[str, ...]
    uncertainty_half_width: Optional[float] = None

    def __post_init__(self) -> None:
        if not 0 <= self.probability <= 1:
            raise ValueError("Probability must be between 0 and 1")
        if not self.model_version:
            raise ValueError("Model version is required")
        if not self.data_sources:
            raise ValueError("At least one data source must be recorded")
        if self.uncertainty_half_width is not None and not 0 <= self.uncertainty_half_width <= 1:
            raise ValueError("Uncertainty half-width must be between 0 and 1")


@dataclass(frozen=True)
class ValueAssessment:
    fair_odds: float
    expected_roi: float
    eligible_for_value_label: bool
    reason: str
