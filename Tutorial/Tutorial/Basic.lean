def hello := "world"

#eval hello

#eval "Hello, " ++ hello ++ "!"
#eval String.length hello

def even (n : Int) : Bool :=
  n % 2 == 0

#eval 42.6 + 0.4

#eval String.append hello  "Lean!"

#eval String.append "great " (String.append "oak " "tree")

#eval String.append (String.append "A" "B") "C"

def odd (n : Int) : Bool :=
  not (even n)

def add (n : Int) (m : Int) : Int :=
  n + m

def joinStringsWith (s1 s2 s3  : String) : String :=
  String.append s2 (String.append s1 s3)

#eval joinStringsWith ", " "one" "and another"

def volumeOfCuboid (l w h : Nat) : Nat :=
  l * w * h

#eval volumeOfCuboid 2 3 4

def Str : Type := String

abbrev naturalnum : Type := Nat

def three : naturalnum := 3

#eval three * 4

structure Point where
  x : Float
  y : Float

def origin : Point :=
  { x := 0.0, y := 0.0 }

def pointA : Point :=
  { x := 1.5, y := 2.5 }

def distanceFromPoints (p : Point) (q : Point) : Float :=
  Float.sqrt ((q.x - p.x) ^ 2 + (q.y - p.y) ^ 2)

def vectoradd (p : Point) (q : Point) : Point :=
  { x := p.x + q.x, y := p.y + q.y }

#eval distanceFromPoints pointA (vectoradd { x := 1.0, y := 2.0 } { x := 3.0, y := 4.0 })
