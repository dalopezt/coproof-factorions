import Definitions

theorem upper_bound (n : ℕ) (hn : 10 ^ 7 ≤ n) : digitFactorialSum n < n := by
  sorry

-- Sub-goal 2: Exhaustive finite check — the only fixed points of digitFactorialSum below 10^7
-- are 1, 2, 145, and 40585.
