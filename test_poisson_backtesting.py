import pytest
from andrew.poisson import poisson_pmf, total_goals_over_probability
from andrew.backtesting import brier_score, log_loss, roi_per_unit


def test_poisson_distribution_sanity():
    assert poisson_pmf(0, 0) == 1
    assert poisson_pmf(1, 0) == 0
    assert sum(poisson_pmf(k, 2.5) for k in range(30)) == pytest.approx(1, abs=1e-8)


def test_over_2_5_probability_sanity():
    p = total_goals_over_probability(1.4, 1.1, 2.5)
    assert 0 < p < 1


def test_metrics():
    assert brier_score([.8, .2], [1, 0]) == pytest.approx(.04)
    assert log_loss([.8, .2], [1, 0]) > 0
    assert roi_per_unit([.5, .5], [2, 2], [1, 0]) == pytest.approx(0)


def test_invalid_inputs_rejected():
    with pytest.raises(ValueError):
        poisson_pmf(-1, 1)
    with pytest.raises(ValueError):
        brier_score([], [])
