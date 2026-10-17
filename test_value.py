from datetime import datetime, timezone, timedelta
import pytest
from andrew.contracts import OddsQuote, ProbabilityEstimate
from andrew.value import fair_odds, expected_roi, assess_value


def fixture(calibrated=True, probability=.60, uncertainty=.01):
    now = datetime.now(timezone.utc)
    quote = OddsQuote("m1", "goals_over_2_5", "yes", 2.0, "book-a", now, "provider-a", "rules-v1")
    estimate = ProbabilityEstimate("m1", "goals_over_2_5", "yes", probability, "model-v1", now,
                                   calibrated, ("provider-a",), uncertainty)
    return now, quote, estimate


def test_fair_odds_and_roi():
    assert fair_odds(.5) == 2
    assert round(expected_roi(.55, 2), 8) == .1


def test_value_can_be_eligible_when_calibrated_and_fresh():
    now, quote, estimate = fixture()
    result = assess_value(estimate, quote, now=now)
    assert result.eligible_for_value_label
    assert result.expected_roi == pytest.approx(.2)


def test_uncalibrated_model_cannot_claim_value():
    now, quote, estimate = fixture(calibrated=False)
    result = assess_value(estimate, quote, now=now)
    assert not result.eligible_for_value_label
    assert "not marked as calibrated" in result.reason


def test_stale_quote_cannot_claim_value():
    now, quote, estimate = fixture()
    old_quote = OddsQuote(quote.event_id, quote.market_key, quote.selection_key, quote.decimal_odds,
                          quote.bookmaker, now - timedelta(hours=2), quote.source_id, quote.rules_version)
    result = assess_value(estimate, old_quote, now=now)
    assert not result.eligible_for_value_label


def test_mismatched_event_cannot_claim_value():
    now, quote, estimate = fixture()
    wrong = ProbabilityEstimate("m2", estimate.market_key, estimate.selection_key, .6,
                                "model-v1", now, True, ("provider-a",), .01)
    assert not assess_value(wrong, quote, now=now).eligible_for_value_label
