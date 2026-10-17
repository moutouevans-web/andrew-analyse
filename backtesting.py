"""Minimal evaluation metrics. These do not replace chronological backtesting."""
from math import log


def brier_score(probabilities: list[float], outcomes: list[int]) -> float:
    if len(probabilities) != len(outcomes) or not probabilities:
        raise ValueError("Non-empty probabilities and outcomes must have equal length")
    if any(not 0 <= p <= 1 for p in probabilities):
        raise ValueError("Probabilities must be in [0, 1]")
    if any(y not in (0, 1) for y in outcomes):
        raise ValueError("Outcomes must be binary 0/1")
    return sum((p - y) ** 2 for p, y in zip(probabilities, outcomes)) / len(outcomes)


def log_loss(probabilities: list[float], outcomes: list[int], epsilon: float = 1e-15) -> float:
    if len(probabilities) != len(outcomes) or not probabilities:
        raise ValueError("Non-empty probabilities and outcomes must have equal length")
    total = 0.0
    for p, y in zip(probabilities, outcomes):
        if y not in (0, 1):
            raise ValueError("Outcomes must be binary 0/1")
        p = min(1 - epsilon, max(epsilon, p))
        total += -(y * log(p) + (1 - y) * log(1 - p))
    return total / len(probabilities)


def roi_per_unit(probabilities: list[float], odds: list[float], outcomes: list[int]) -> float:
    if not (len(probabilities) == len(odds) == len(outcomes)) or not probabilities:
        raise ValueError("Inputs must be non-empty and equal length")
    returns = []
    for p, odd, outcome in zip(probabilities, odds, outcomes):
        if not 0 <= p <= 1 or odd <= 1 or outcome not in (0, 1):
            raise ValueError("Invalid probability, odds, or outcome")
        returns.append(odd - 1 if outcome else -1)
    return sum(returns) / len(returns)
