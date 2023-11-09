/-!
# Curry-Howard Correspondence
-/

/-!
## Empty ==> False
-/

#check Empty

-- inductive Empty : Type

inductive Chaos : Type

def from_empty (e : Empty) : Chaos := nomatch e

#check False
-- inductive False : Prop

def from_false {P : Prop} (p : False) : P := False.elim p

def from_false_true_is_false (p : False) : True = False := False.elim p

-- no introduction rule



/-!
## Unit ==> True
-/

#check Unit
-- inductive PUnit : Sort u where
-- | unit : PUnit

#check True
-- inductive True : Prop where
-- | intro : True

#check True.intro
-- no elimination rule

def proof_of_true : True := True.intro
def false_implies_true : False \to True := \lambda f => _ true.intro

/-!
Prod ==> And
-/

#check Prod

/-
structure Prod (\alpha : Type u) (\beta : Type v) where
    fst : \alpha
    snd : \beta
-/

#check And
/-
structure And (a b : Prop) : Prop where
    intro ::
    left : a
    right : b
-/


inductive Birds_chirping : Prop
| ye
| oop

inductive Sky_blue : Prop
| yep

#check (And Birds_chirping Sky_blue)

theorem  both_and : (And Birds_chirping Sky_blue) := And.intro Birds_chirping.boo Sky_blue.yep

/-!
Proof irrelevence
-/

namespace cs2120f23
indcutive Bool : Type
| true
| false_implies_true

theorem proof_equal : Birds_chirping.boo = Birds_chirping.yep := by trivial


-- In Prop all proofs are equivalent
-- Choice of values in Prop can't influence computations

/-!
Sum ==> Or
-/

#check Sum

/-! 
inductinve Sum (\alpha : Type u) (\beta : Type v) where
    | inl (val : \lapha) : Sum \alpha \beta
    | inr (val : \beta) : Sum \alpha \beta
-/

#check Or
/-!
inductive Or (a b : Prop) : Prop where
    | inl (val : a) : Or a b
    | inr (val : b) : Or a b

theorem one_or_other : Or Birds_chirping Sky_blue := Or.inl Birds_chirping.yep
theorem one_or_other' : Or Birds_chirping Sky_blue := Or.inr Sky_blue.yep

example : Or Birds_chirping (0=1) := Or.inl Birds_chirping.yep
example : (0=1) \or (1=2) := _


theorem or_comm {P Q : Prop} : P \or Q \to Q \or P :=
\lambda d =>
    match d with
    | Or.inl p => Or.inr p
    | Or.inr q => Or.inl q

/-!
Not (no)
-/

def no (\alpha : Type) := \alpha

#check Not
-- Not P is to defined to be P \to False

example : no Chaos := \lambda (c :: Chaos) => nomatch c

indcutive Raining : Prop

example : \not Raining := \lambda (r : Raining) => nomatch r