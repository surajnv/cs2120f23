import Mathlib.Data.Set.Basic

/-!
# Final Exam: Part 2

Here you can show that you've got what we covered in class,
up to and including set theory. The focus is on set theory,
as it encompassess the underlying logic as well. A hint: You
will want to review the existential quantifier and proofs of
existentially quantified propositions.

## Problem #1:

Use set comprehension notation in Lean to define *odds*
as the set of odd numbers, by way of a membership predicate
for this set.
-/

-- Here
def odds : Set ℕ := { n : ℕ | n % 2 = 1}

/-!
## Problem #2:

Use set comprehension and other set notations in Lean to
define the set, *perfect_squares*, of natural numbers, n,
such that each n is the square of some natural number, m.
For example, 36 is a perfect square because it is the square
of another number, namely m = 6.
-/

-- Here
def perfect_squares : Set ℕ := { n : ℕ | ∃ (m : ℕ), m*m = n}

/-!
## Problem #3:

Use set comprehension notation to define the set, odd_perfects,
to be the intersection of the odds and the perfect squares.
-/

-- Here
-- def odd_perfects : Set Nat := { n : Nat | n ∈ odds ∧ n ∈ perfect_squares}
def odd_perfects := odds ∩ perfect_squares

/-!
## Problem #4:

Formally state and prove the proposition that 9 ∈ odd_perfects.
Hint: A proof within a proof.
-/

-- Here

def nine_in_odd_perfects : 9 ∈ odd_perfects := ⟨ rfl , ⟨3, rfl⟩⟩
