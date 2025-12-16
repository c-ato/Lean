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

structure complex where
  re : Float
  im : Float

def complexadd (a b : complex) : complex :=
  { re := a.re + b.re, im := a.im + b.im }

def complexmul (a b : complex) : complex :=
  { re := a.re * b.re - a.im * b.im,
    im := a.re * b.im + a.im * b.re }

def complexconj (a : complex) : complex :=
  { re := a.re, im := -a.im }

def complexabs (a : complex) : Float :=
  Float.sqrt (a.re ^ 2 + a.im ^ 2)

def complexdiv (a b : complex) : complex :=
  let denom := b.re ^ 2 + b.im ^ 2
  { re := (a.re * b.re + a.im * b.im) / denom,
    im := (a.im * b.re - a.re * b.im) / denom }

def complexarg (a : complex) : Float :=
  Float.atan2 a.im a.re

structure polarcomplex where
  r := Float, theta := Float

def toPolar (a : complex) : polarcomplex :=
  { r := complexabs a,
    theta := complexarg a }

def toCartesian (p : polarcomplex) : complex :=
  { re := p.r * Float.cos p.theta,
    im := p.r * Float.sin p.theta }

#check complex.mk (toCartesian { r := 1.0, theta := 1.0 })
