-- Write a function to find the last entry in a list. It should return an Option.

def lastentry {a : Type} (list : List a) : Option a :=
  match list with
  | [] => none
  | List.cons y ys  =>
    match lastentry ys with
    | none => y
    | some z => some z


#eval lastentry [1,2,3,8,4]

-- Write a function that finds the first entry in a list that satisfies a given predicate. Start the definition with def List.findFirst? {α : Type} (xs : List α) (predicate : α → Bool) : Option α := ….

def List.findFirst? {α : Type} (xs : List α) (predicate : α → Bool) : Option α :=
  match xs with
  | [] => none
  | List.cons y ys =>
    match predicate y with
    | false => findFirst? ys predicate
    | true => some y

-- Testing findfirst? with isEven and isVowel predicates

def isEven (n : Int) : Bool :=
  match n/2 with
  | 0 => false
  | (m : Int) => true


def isVowel (s : String) : Bool :=
  match s with
  | "a" => true
  | "e" => true
  | "i" => true
  | "o" => true
  | "u" => true
  | "y" => true
  | _ => false

#eval List.findFirst? [1,2,3,8,4] isEven

#eval List.findFirst? ["b","c","d","e"] isVowel

-- Write a function Prod.switch that switches the two fields in a pair for each other. Start the definition with def Prod.switch {α β : Type} (pair : α × β) : β × α := ….

def Prod.switch {α β : Type} (pair : α × β) : β × α :=
  match pair with
  | {fst := a, snd := b} => {fst := b, snd := a}


-- Rewrite the PetName example to use a custom datatype and compare it to the version that uses Sum.

-- def Petname : Type := Prod (List String) (List String)

-- def animals : Petname := (["Spot","Cat","Rex","Bob"], ["Dog","Snow"])

inductive Petnames: Type where
  | dogname : String -> Petnames
  | catname : String -> Petnames


def animalname : List Petnames := [Petnames.dogname "Bob", Petnames.dogname "Cat", Petnames.catname "Dog"]


-- Write a function zip that combines two lists into a list of pairs. The resulting list should be as long as the shortest input list. Start the definition with def zip {α β : Type} (xs : List α) (ys : List β) : List (α × β) := ….

def zip {α β : Type} (xs : List α) (ys : List β) : List (α × β) :=
  match xs with
  | [] => []
  | List.cons x' xs' =>
    match ys with
    | [] => []
    | List.cons y' ys' => List.cons (x', y') (zip xs' ys')

def l1 : List String := ["Spot","Cat","Rex","Bob"]

def l2 : List String := ["Snow","Dog"]

#eval zip l1 l2

-- Write a polymorphic function take that returns the first nn entries in a list, where nn is a Nat. If the list contains fewer than nn entries, then the resulting list should be the entire input list. #eval take 3 ["bolete", "oyster"] should yield ["bolete", "oyster"], and #eval take 1 ["bolete", "oyster"] should yield ["bolete"].

def First_n_Entries {a} (n : Nat) (xs : List a) : List a :=
  match n with
  | 0 => []
  | Nat.succ m =>
    match xs with
    | [] => []
    | List.cons x' xs' => List.cons x' (First_n_Entries m xs')

#eval First_n_Entries 4 l1

-- Using the analogy between types and arithmetic, write a function that distributes products over sums. In other words, it should have type α × (β ⊕ γ) → (α × β) ⊕ (α × γ).

def distributivity {α β γ} (a : α × (β ⊕ γ)) : (α × β) ⊕ (α × γ) :=
  match a with
  | (x, p) =>
    match p with
    | Sum.inl, Sum.inr => Sum.inl (x, y), Sum.inr (x, z)
