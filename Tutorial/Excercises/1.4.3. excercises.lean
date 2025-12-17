-- https://lean-lang.org/functional_programming_in_lean/Getting-to-Know-Lean/Structures/#structure-exercises

-- Define a structure named RectangularPrism that contains the height, width, and depth of a rectangular prism, each as a Float.

structure RectangularPrism where
  height : Float
  width : Float
  depth : Float

-- Define a function named volume : RectangularPrism → Float that computes the volume of a rectangular prism

def volume (R: RectangularPrism) : Float := R.height * R.width * R.height

def rec : RectangularPrism := {height := 2, width := 3, depth := 4}

#eval volume rec

-- Define a structure named Segment that represents a line segment by its endpoints, and define a function length : Segment → Float that computes the length of a line segment. Segment should have at most two fields.

structure Segment where
  x : Float
  y : Float

def length (s: Segment) : Float := (s.x^2 + s.y^2)^(1/2)

def seg : Segment := {x := 4, y := 3}

#eval length seg


-- Which names are introduced by the declaration of RectangularPrism?

-- Answer: height, width, and depth, all of Float type

-- Which names are introduced by the following declarations of Hamster and Book? What are their types?

structure Hamster where
  name : String
  fluffy : Bool
structure Book where
  makeBook ::
  title : String
  author : String
  price : Float

-- Answer: name, title and author as String, fluffy as a Bool, price as Float, and makeBook is the name of the constructor
