def hello := "world"

#eval hello

#eval "Hello, " ++ hello ++ "!"
#eval String.length hello

def even (n : Int) : Bool :=
  n % 2 == 0

#eval 42.6 + 0.4

#eval String.append "Hello, " "Lean!"

#eval String.append "great " (String.append "oak " "tree")

#eval String.append (String.append "A" "B") "C"
