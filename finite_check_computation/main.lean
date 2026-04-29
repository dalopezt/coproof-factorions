import Definitions

/--
Computation-backed certificate for node `finite_check_computation`.
Program artifact: finite_check_computation/computation.py
Evidence artifact: finite_check_computation/evidence.json
Evidence hash: fed6af63216a0d80
Target: {"expected": [1, 2, 145, 40585], "limit": 10000000}
-/
axiom finite_check_computation : {n : ℕ | n < 10 ^ 7 ∧ digitFactorialSum n = n} = {1, 2, 145, 40585}
