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

inductive Petnames (a : Type) (b : Type): Type where
  | dogname : a -> Petnames a b
  | catname : b -> Petnames a b


def animalname : List (Petnames String String) := [Petnames.dogname "Bob", Petnames.dogname "Cat", Petnames.catname "Dog"]

#eval animalname
