"""Transparent decimal-odds value calculations with conservative abstention."""
from datetime import datetime, timezone
from .contracts import OddsQuote, ProbabilityEstimate, ValueAssessment


def fair_odds(probability: float) -> float:
    if not 0 < probability <= 1:
        raise ValueError("Probability must be > 0 and <= 1")
    return 1.0 / probability


def expected_roi(probability: float, decimal_odds: float) -> float:
    """Expected net return per unit stake, before any additional costs."""
    if not 0 <= probability <= 1:
        raise ValueError("Probability must be between 0 and 1")
    if decimal_odds <= 1:
        raise ValueError("Decimal odds must be greater than 1")
    return probability * decimal_odds - 1.0


def assess_value(
    estimate: ProbabilityEstimate,
    quote: OddsQuote,
    *,
    now: datetime | None = None,
    max_quote_age_seconds: int = 900,
    min_expected_roi: float = 0.03,
    min_edge_after_uncertainty: float = 0.01,
) -> ValueAssessment:
    """Do not mark value when inputs are stale, uncalibrated, or not traceable."""
    if estimate.event_id != quote.event_id or estimate.market_key != quote.market_key:
        return ValueAssessment(fair_odds(estimate.probability) if estimate.probability else float("inf"),
                               expected_roi(estimate.probability, quote.decimal_odds), False,
                               "Prediction and quote identifiers do not match")
    if quote.source_id not in estimate.data_sources:
        return ValueAssessment(fair_odds(estimate.probability) if estimate.probability else float("inf"),
                               expected_roi(estimate.probability, quote.decimal_odds), False,
                               "Quote source is not recorded in prediction provenance")
    if not estimate.calibrated:
        return ValueAssessment(fair_odds(estimate.probability) if estimate.probability else float("inf"),
                               expected_roi(estimate.probability, quote.decimal_odds), False,
                               "Model probability is not marked as calibrated")
    now = now or datetime.now(timezone.utc)
    age = (now - quote.captured_at).total_seconds()
    if age < 0 or age > max_quote_age_seconds:
        return ValueAssessment(fair_odds(estimate.probability) if estimate.probability else float("inf"),
                               expected_roi(estimate.probability, quote.decimal_odds), False,
                               "Quote is stale or has a future timestamp")
    uncertainty = estimate.uncertainty_half_width or 0.0
    conservative_probability = max(0.0, estimate.probability - uncertainty)
    conservative_roi = expected_roi(conservative_probability, quote.decimal_odds)
    edge = estimate.probability - (1 / quote.decimal_odds)
    eligible = (
        conservative_roi >= min_expected_roi
        and edge - uncertainty >= min_edge_after_uncertainty
    )
    reason = "Potential value: validate with historical and out-of-sample results" if eligible else \
             "No demonstrated value after uncertainty and thresholds"
    return ValueAssessment(fair_odds(estimate.probability), expected_roi(estimate.probability, quote.decimal_odds),
                           eligible, reason)
