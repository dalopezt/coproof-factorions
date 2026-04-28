import «upper_bound».«main»
import «finite_check».«main»
import «solutions_are_fixpoints».«main»
import Definitions
-- Sub-goal 1: For n with at least 8 decimal digits (n ≥ 10^7), digitFactorialSum n < n.
-- Proof sketch: n ≥ 10^(k-1) while digitFactorialSum n ≤ k · 9! = 362880k,
-- and 362880k < 10^(k-1) for all k ≥ 8.




theorem root : {n : ℕ | digitFactorialSum n = n} = {1, 2, 145, 40585} := by
  ext n
  simp only [Set.mem_setOf_eq, Set.mem_insert_iff, Set.mem_singleton_iff]
  constructor
  · intro hn
    rcases lt_or_le n (10 ^ 7) with hlt | hge
    · -- n is small: appeal to the finite check
      have hmem : n ∈ {n : ℕ | n < 10 ^ 7 ∧ digitFactorialSum n = n} := ⟨hlt, hn⟩
      rw [finite_check] at hmem
      simpa [Set.mem_insert_iff, Set.mem_singleton_iff] using hmem
    · -- n is large: upper_bound gives a strict inequality, contradicting hn
      exact absurd hn (ne_of_lt (upper_bound n hge))
  · intro hmem
    -- Convert the disjunctive membership back to Set membership
    have hmem' : n ∈ ({1, 2, 145, 40585} : Set ℕ) := by
      simp only [Set.mem_insert_iff, Set.mem_singleton_iff]
      exact hmem
    exact solutions_are_fixpoints n hmem'
