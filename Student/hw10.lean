/-! Homework: Due Tuesday before class: Formalize the
following logical arguments. Hint: use the variable
command to introduce assumed types and such, as we did
in class. Use #check to express the informal propositions
that follow in the formal logic of Lean.
-/

/-!
## 1. Every dog likes some cat.
for every dog, there exists a cat that satisfies that the dog likes the cat.
-/

namespace dog_cat_1
variable
  (Dog : Type)
  (Cat : Type)

  (doggy : Dog) -- doggy is a dog
  (kitty : Cat) -- kitty is a cat

  (Likes : Dog → Cat → Prop)

  (every_dog_likes_some_cat : ∀ (dog : Dog), ∃ (cat : Cat), Likes dog cat)

#check every_dog_likes_some_cat doggy
end dog_cat_1



/-!
## 2. If any dog, d, likes any dog, g, and that dog, g, likes any dog, w, then d likes w
for any dogs d, g, and w: if d likes g and g likes w, then d likes w.
-/

namespace dog_cat_2
variable
  (Dog : Type)
  (Likes : Dog → Dog → Prop)

  (d : Dog)
  (g : Dog)
  (w : Dog)

  (dog_likes_transitive : ∀ (d1 d2 d3: Dog), (Likes d1 d2) ∧ (Likes d2 d3) → Likes d1 d3)

#check dog_likes_transitive d g w
end dog_cat_2



/-!
## 3. If any cat, c, likes any cat, d, then d also likes c.
for any cats c and d: if c likes d then d likes c.
-/

namespace dog_cat_3
variable
  (Cat : Type)
  (Likes : Cat → Cat → Prop)

  (c : Cat)
  (d : Cat)

  (cat_likes_converse : ∀ (c1 c2 : Cat), Likes c1 c2 → Likes c2 c1)

#check cat_likes_converse c d
end dog_cat_3



/-!
## 4. Every cat, c, likes itself.
-/

namespace dog_cat_4

variable
  (Cat : Type)
  (Likes : Cat → Cat → Prop)

  (c : Cat)

  (cat_likes_itslef : ∀ (c1 : Cat), Likes c1 c1)

#check cat_likes_itslef c
end dog_cat_4



/-!
## 5. If every cat likes every other cat, and c and d are cats, then c likes d.
if cats like all other cats and c is a cat and d is a cat, likes c d
-/

namespace dog_cat_5
variable
  (Cat : Type)
  (Likes : Cat → Cat → Prop)

  (c : Cat)
  (d : Cat)

  (cats_like_eachother : (∀ (c1 c2 : Cat), Likes c1 c2))
  (cat_likes_another : (∀ (c1 c2 : Cat), Likes c1 c2) → (∀ (kit kat : Cat), Likes kit kat))

#check cat_likes_another cats_like_eachother c d

/-!
## 6. Finally, give a formal proof in Lean of the proposition in problem #5.
-/

#check Likes c d
end dog_cat_5
