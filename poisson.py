"""Small Poisson utilities for baseline goal models; not a production model by themselves."""
from math import exp, factorial


def poisson_pmf(k: int, rate: float) -> float:
    if k < 0 or int(k) != k:
        raise ValueError("k must be a non-negative integer")
    if rate < 0:
        raise ValueError("rate must be non-negative")
    if rate == 0:
        return 1.0 if k == 0 else 0.0
    return exp(-rate) * rate**k / factorial(k)


def total_goals_over_probability(rate_home: float, rate_away: float, line: float) -> float:
    """Probability of total goals strictly greater than a whole-number line (e.g. 2.5)."""
    if rate_home < 0 or rate_away < 0:
        raise ValueError("Rates must be non-negative")
    if line < 0:
        raise ValueError("Line must be non-negative")
    rate = rate_home + rate_away
    # For a half line, over 2.5 means 3+ goals; floor(line) is the largest losing total.
    max_losing_total = int(line // 1)
    cdf = sum(poisson_pmf(k, rate) for k in range(max_losing_total + 1))
    return min(1.0, max(0.0, 1.0 - cdf))
