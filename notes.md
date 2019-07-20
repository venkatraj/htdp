# Preface
## Systematic Program Design
1. From Problem Analysis to Data Definitions. In this step we identify how a real world information can be represented in choosen programming language as data.

2. Signature, Purpose Statement, Header. In this step, we clarify what our program consumes and produces. This is called signature. Purpose statement states what this program is going to do. Header is just a stub

3. Functional Examples. This illustrates what is given to function and what is expected as output.

4. Function Template. Outline of function

5. Function Definition. The actual code

6. Testing. We can use functional examples as data to test our written function.

## DrRacket and the Teaching Languages
This book uses DrRacket as development environment which has 2 parts. One is for definitions and one is for interactions. It takes advantage of Racket programming language, but uses its own teaching languages such as Beginner Student Languges, or BSL and other *SL languages. The reason for these decision is that a beginner program don't have to distract himself with language specific things and environments. Just using pre algebra knowledge, students can go on to learn how to program and transferrable skills

## Skills that Transfer
By practing to design programs we acquire the following skills
- Analysis
- Precision
- Description
- Focus
- Attention to details
- Refining Design
The skills are necessary for every professional and so by design programs, we learn these skills and apply it wherever it is required.

## This Book and Its Parts
Table of Content for this book

## The Differences
Difference between first and second editions

# Prologue: How to Program
Introduction for using DrRacket

## Arthmetic and Arithmetic
Programming is to write down arthmetic expressions. With BSL, arithmetic is not limited to numbers, but can also do with strings, booleans and images.
```
"hello world" ;"hello world"
(string-append "hello" "world") ;"helloworld"
(string-append "hello" " " "world") ;"hello world"
(+ (string-length "hello world") 20) ;31
(number->string 42) ;"42"
(string->number "42") ;42
(string->number "hello world") ;#false
(and #true #true)   ;#true
(and #true #false)  ;#false
(or #true #false)   ;#true
(or #false #false)  ;#false
(not #false)        ;#true
(> 10 9)     ; #true
(< -1 0)     ; #true
(= 42 9)     ; #false
(>= 10 10)   ; #true
(<= -1 0)    ; #true
(string=? "design" "tinker")  ; #false
```
## Inputs and Outputs
Teaches how to write functions
`(define (FunctionName InputName) BodyExpression)`
**Function Definition**
`(define (y x) (* x x))`
**Function Application**
`(y 5) ; 25`

## Many Ways to Compute
Teaches `cond` construct
```
(cond
  [ConditionExpression1 ResultExpression1]
  [ConditionExpression2 ResultExpression2]
  ...
  [ConditionExpression1N ResultExpressionN]
  )
```
## One Program, Many Definitions
Teaches how to define constants
**constant definition**
```
(define Name Expression)
(define HEIGHT 60)
```

## One More Definition
## You Are a Programmer Now
Encourages that I'm a programmer now
## Not!
Tells the difference between knowing the constructs of a language and becoming a programmer

# Fixed-Size Data
## Arithmetic
Every programming language has two parts. Data and Operations on data. BSL comes with atomic data such as Numbers, Strings, Booleans and Images. Also provides primitive or pre defined operations on these atomic data
It is programmers job to use this and write a program

### The Arithmetic of Numbers
BSL provides variety of arthmetic operations on Numbers such as +, -, *, /, abs, add1, ceiling, denominator, exact->inexact, expt, floor, gcd, log, max, numerator, quotient, random, remainder, sqr and tan and many more

### The Arithmetic of Strings
Many believe that computing is all about bits and bytes. However for a programmer and program, it is all about representing real world information as data. Data comes in all types and shapes. One such thing is 'Strings'. Actually it is sequence of characters which is called `1String` in BSL

### Mixing It Up
So far, basic operations consumes one data type and produces the same type. But most of the programming is consuming some data type and producing other data types.
```
; String -> Number
(string-length "hello world")

; String -> 1String
(string-ith "hello" 1)

; Number -> String
(number->string 42)

(+ (string-length "hello world") 20)
```
### The Arithmetic of Images
With `2htdp/image` library we can create basic images
```
(circle 10 "solid" "green")
(ellipse 20 40 "outline" "red")
(line 20 40 "blue") ; 0,0 to 20,40
(line 40 0 "blue") ; 0,0 to 40,0 straightline
(rectangle 100 40 "solid" "orange")
(text "Banner" 36 "indigo")
(triangle 25 "outline" "grey")
; And many more shapes
(image-width (circle 10 "solid" "green)) ; 20
(image-height (rectangle 100 40 "solid" "orange")) ; 40
```

Like every image editing software BSL images also has an implicit *anchor point* Using it, BSL composes two images into one. For example `overlay` places all images on top of each other using center as anchor point.
Available anchor points are `left, middle, right, top, bottom` using these we can mention 9 points
```
; operations that use anchor points
(overlay (circle 10 "solid" "red")
        (rectangle 100 50 "solid" "black"))

; shifts rectangle (2nd image) to right and down, negative numbers shifts left and up
(overlay/xy cirle x y rectangle) 

; aligns two images using 9 pre defined anchor points
(overlay/align "right"
                 "bottom"
                 (square 25 "solid" "red")
                 (rectangle 100 50 "solid" "blue"))
```
There are more operations available and 3 more important one for animations are `empty-scene, place-image and scene+line`

### The Arithmetic of Booleans
Two values `#true and #false`
Three operations `and or not`

### Mixing It Up with Booleans
We use booleans mostly with conditional calculations. `if` is an expression that helps with conditional calculations
```
(define x 2)
(if (= x 0) 0 (/ 1 x))
```
Apart from `=` comparision primitive, there are host of others available in BSL such as `< <= > >=, string=?, string<=? string>=?`

### Predicates: Know Thy Data
When using variable, it often leads to error when wrongly assuming data in the variable as one type other than original. For example, using string in addition
```
(define generic "hello")
(+ 10 generic)
; +: expects a number as 2nd argument, given "hello"
```
To confirm the actual data type, we use predicates such as `number?, string?, boolean? and image?`
There are other predicates available such as `integer?, rational? complex? exact? and inexact?` among others

## Functions and Programs
### Functions
Programs are functions. Just like algebric functions, programs consumes inputs and produces outputs. We can reuse functions with different inputs to produce corresponding output

There are *constant definitions* and *function definition*. 
A function definition has a *function header*, *parameters* and *body* 
```
(define (FunctionName Param1, Param2 ... Param3)
  BodyExpressions)
```
We put function definitions at work with *function application*
### Computing
Computing happens by replacing body expression variables with argument values and as per laws of arthmetic

### Composing Functions
A program rarely consists of a single function definition. Typically, programs consist of a *main* definition and several other functions and turns the result of one function application into the input for another. In analogy to algebra, we call this way of defining functions *composition*, and we call these additional functions *auxiliary functions* or *helper* functions.
Simple Rule: **Define one function per task**

### Global Constants
We can define global constant as
`(define constantName Value)`
The name of a constant is a *global variable* while the definition is called a *constant definition*.

Rule: **For every constant mentioned in a problem statement, introduce one constant definition.**

### Programs
There are 2 kinds of programs
1. Batch Program which consume all inputs and produces output. It may contain main and auxillary functions
2. Interactive Program aka event driven program such as a web application or a video player

## How to Design Programs
Mostly we read a problem statement and stare at it until we get an idea on how to solve it. Then we start to tinkering the code until it works. This is called "garage programming"

Software engineers first look at the problem and filter the unnecessary details. Then comes to an idea that what are the informations that need to be represent as data, and what will be the output. Then they write code that produces them. Then they check whether their solution actually works. This is called **programming product**

In other words, a good programs should come with a short write up that explains what it does, what it consumes and what it produces. Also some assurance that it actually works (test cases)

### Designing Functions
1. Express how you wish to represent information as data. This is called *data definitions*
```
; We use Number to represent Temparature
; interpretation represents Celsius degress
```
*Temparature* is a class (data collection) consists of all *Number*s
2. Write down a *signature*, a *purpose statement* and a *function header* (also called *stub*)
  * `A function signature` is a comment that what your function consumes and produces
```
  ; Number -> Number (Signature)
  ; computes the area of a square with side len (Number) (Statement of purpose)
  (define (area-of-square len) 0) ;header
```
3. Functional Examples
```
; given: 2 expect: 4
; given: 7 expect: 49
```
4. Function Template
The next step is to take *inventory*, to understand what are the givens and what we need to compute. Translate the data definitions into an outline of the function.
```
(define (area-of-square len)
  (...len...))
```
5. Function Definition (code it!)
```
; Number => Number
; computes the area of a square with side len
; given: 2 expect: 4
; given: 7 expect: 49
(define (area-of-square len)
  (sqr len))

; Another example
; Number String Image -> Image
; adds s to img, y pixels from top, 10 pixels to the left
; given: 
;    5 for y, 
;    "hello" for s, and
;    (empty-scene 100 100) for img
; expected: 
;    (place-image (text "hello" 10 "red") 10 5 ...)
;    where ... is (empty-scene 100 100)
(define (add-image y s img)
  (place-image (text s 10 "red") 10 y img))
```
6. Testing
```
> (area-of-square 2)
4
> (area-of-square 7)
49
```

### Finger Excercises: Functions
Exercise 34. Design the function string-first, which extracts the first character from a non-empty string. Don’t worry about empty strings.

### Domain Knowledge
There are `two forms` of domain knowledge.
1. You may need external domain knowledge such as maths, biology, civil engineering, etc to solve given problem. Since a programmer can't know it all, you may need to speak to domain expert.
2. Knowledge of available library functions in the choosen programming language.

### From Functions to Programs
Often to solve problems, we need more than one function.
That include global constants, auxillary functions, etc

When you realize you need more than one function to solve problem, you'll create a `wish list` with needed functions. That wish list consist of three things
1. Meaningful name of a function
2. A signature
3. A purpose statement

Then start defining a function from the *wish list*

### On Testing
Find a way to make the testing automatic. When we follow `Systematic Program Design`, it automatically becomes `Test Drive Development` as we need to write `function examples` which is just tests of functions. This kind of test is called *unit testing* as we test an unit (function)

### Designing World Programs
*Wish List* for designing World programs
```
; WorldState: data that represents the state of the world (cw)
 
; WorldState -> Image
; when needed, big-bang obtains the image of the current 
; state of the world by evaluating (render cw) 
(define (render ws) ...)
 
; WorldState -> WorldState
; for each tick of the clock, big-bang obtains the next 
; state of the world from (clock-tick-handler cw) 
(define (clock-tick-handler cw) ...)
 
; WorldState String -> WorldState 
; for each keystroke, big-bang obtains the next state 
; from (keystroke-handler cw ke); ke represents the key
(define (keystroke-handler cw ke) ...)
 
; WorldState Number Number String -> WorldState 
; for each mouse gesture, big-bang obtains the next state
; from (mouse-event-handler cw x y me) where x and y are
; the coordinates of the event and me is its description 
(define (mouse-event-handler cw x y me) ...)
 
; WorldState -> Boolean
; after each event, big-bang evaluates (end? cw) 
(define (end? cw) ...)
```
### Virtual Pet Worlds

## Intervals, Enumerations and Itemizations
For many problems, basic data types such as Numbers, Strings, Booleans and Images are not sufficient. Programmer need to built new data type upon this basic types. Enumeration, Intervals and Itemization are such three data types.

A Enumeration is a list of every single piece of information that belongs to it
A Interval is a range of data
Itemization is a mix of Enumeration and Interval

### Programming with Conditionals
Explains use of `cond` constructor and its clauses. Also explains `else` clause. More like switch statement in many languages with default case. Also explains the difference between if and cond

### Computing Conditionally
Practical examples of using `cond`

### Enumerations
A enumeration is a subset of other data type. For example `MouseEvt` is not all possible strings, but just subset of 6 strings
```
; A MouseEvt is one of these Strings:
; – "button-down"
; – "button-up"
; – "drag"
; – "move"
; – "enter"
; – "leave"

; A TrafficLight is one of the following Strings:
; – "red"
; – "green"
; – "yellow"
; interpretation the three strings represent the three 
; possible states that a traffic light may assume 
```
A function that uses enumeration naturally distinguish between different cases.

It is possible that an enumeration is a set of other enumerations
```
; A 1String is one of: 
; – "q"
; – "w"
; – "e"
; – "r"
; ...
; – "\t"
; – "\r"
; – "\b"

; A KeyEvent is one of: 
; – 1String
; – "left"
; – "right"
; – "up"
; – ...
```
Here enumeration `KeyEvent` uses another enumeration `1String` and String

### Intervals
A interval is a set of numbers with bounderies. If the bounderies are inclusive in the set, then it is called `closed`, if not it is `open`
[3,5] is a closed interval which has 3,4 and 5 in it
(3,5] is a right closed interval which has 4 and 5 in it
[3,5) is a left closed interval which has 3 and 4 in it
(3,5) is a open interval which has 4 in it

### Itemizations
*Itemization* is combination of already defined data classes with each other and with individual piece of data
```
; An NorF is one of: 
; – #false
; – a Number
```
`NorF` is an itemization and is combination of `Number` a large data set with individual piece of data `#false`. Similarly, 
```
; An LR (short for launching rocket) is one of:
; – "resting"
; – NonnegativeNumber
; interpretation "resting" represents a grounded rocket
; a number denotes the height of a rocket in flight
```
`LR` is an itemization and is combination of individual piece of data `resting(String)` with interval `NonnegativeNumber`

### Designing with Itemizations
Designing of functions must exploit the organization of the data definition, specifically when data definitions contains enumeration, interval and itemization.

**Example**
*Sample Problem* The state of Tax Land has created a three-stage sales tax to cope with its budget deficit. Inexpensive items, those costing less than $1,000, are not taxed. Luxury items, with a price of more than $10,000, are taxed at the rate of eight percent (8.00%). Everything in between comes with a five percent (5.00%) markup.

1. Step One: Data Definition
```
; A Price falls into one of three intervals: 
; — 0 through 1000
; — 1000 through 10000
; — 10000 and above.
; interpretation the price of an item
```
2. Step Two: Signature, Purpose Statement and Header (just as before)
```
; Price -> Number
; computes the amount of tax charged for p
(define (sales-tax p) 0)
```
3. Step Three: Functional Examples
Since data definition has `intervals(ranges)` We should pick our sample data at the boundaries and others. Such as `0, 537, 1000, 1282, 10000, and 12017.`
```
(check-expect (sales-tax 537) 0)
(check-expect (sales-tax 1000) (* 0.05 1000))
(check-expect (sales-tax 12017) (* 0.08 12017))
```
Writing down how to calculate in test cases help in defining functions
4. Step Four: Function Template
This should contain `cond` expressions which mirrors the organization of sub-classes in data definition
```
(define (sales-tax p)
  (cond
    [(and (<= 0 p) (< p 1000)) ...]
    [(and (<= 1000 p) (< p 10000)) ...]
    [(>= p 10000) ...]))
```
5. Step Five: Complete function definition
```
(define (sales-tax p)
  (cond
    [(and (<= 0 p) (< p 1000)) 0]
    [(and (<= 1000 p) (< p 10000)) (* 0.05 p)]
    [(>= p 10000) (* 0.08 p)]))
```
When writing single `cond clause` we shouldn't worry about other range of input as it will taken care by other clauses
6. Step Six: Testing


### Finite State Worlds
When there is finite number of states in a program such as traficc light state transition diagram, Computer scientists call such diagrams *finite state machines* (FSM), also known as *finite state automata* (FSA). Despite their simplicity, FSMs/FSAs play an important role in computer science.

There are two examples
1. Traffic Light - which has three state transitions (red, yellow, green)
2. Automatic Door - which has locked, closed, open states

## Adding Structure
Traffic Light, Door Simulation and all other world programs so far we have seen keeps track of single data.

However, in real world, we need to keep track of multiple data in one name. For example, a bouncing ball which needs to hold two data (moving direction and position). A contact info which hold name, nick name, home no. work no. mobile, etc

Such data are called compound data. In BSL, it is structure type definition

### From Positions to posn Structures
A position in world canvas has two values, x-coordinate and y-coordinate.

A `posn` structure combines two numbers in to single value
```
(make-posn 3 4)
; we can also give a name to a `posn`
(define one-posn (make-posn 3 4))
```

### Computing with posns
It is just reading a graph and find out caresian point x and y values.
```
(define p (make-posn 31 26))
(posn-x p) ; => 31
(posn-y p) ; => 26
```

### Programming with posn
```
; computes the distance of ap to the origin
(check-expect (distance-to-0 (make-posn 0 5)) 5)
(check-expect (distance-to-0 (make-posn 7 0)) 7)
(check-expect (distance-to-0 (make-posn 3 4)) 5)
(check-expect (distance-to-0 (make-posn 8 6)) 10)
(check-expect (distance-to-0 (make-posn 5 12)) 13)
(define (distance-to-0 ap)
  (sqrt
   (+ (sqr (posn-x ap))
      (sqr (posn-y ap)))))

(distance-to-0 (make-posn 3 4))
(distance-to-0 (make-posn 6 (* 2 4)))
(+ (distance-to-0 (make-posn 12 5)) 10)
```

### Defining Structure Types
A *structure type definition* is another form of definition, distinct from constant and function definitions.
`(define-struct posn [x y])`
`(define-struct StructureName [FiledName1, FieldName2 ... FieldNameN])`

A structure type definition actually defines functions
1. *constructor* which creates *structure instances*
2. *selector* which retrieves field values
3. *structure predicate* which confirms whether a value belongs this structure or not
```
(define-struct posn [x y])
; creates these three functions

; constructor
(make-posn x y)

; selectors
(posn-x p)
(posn-y p)

;predicate
(posn? p)
```

Since structures are values, it  can also have nested structure
Here is an example:
```
(define-struct centry [name home office cell])
 
(define-struct phone [area number])
 
(make-centry "Shriram Fisler"
             (make-phone 207 "363-2421")
             (make-phone 101 "776-1099")
             (make-phone 208 "112-9981"))
```


### Computing with Structures
The general laws are same as computing with `posn` structure
```
(define-struct ball [location velocity])
(ball-location (make-ball l0 v0))
== l0

(ball-velocity (make-ball l0 v0))
== v0

(define-struct vel [deltax deltay])

(vel-deltax (make-vel dx0 dy0))
== dx0

(vel-deltay (make-vel dx0 dy0))
== dy0
```
### Programming with Structures
### The Universe of Data
A universe of data is huge. For example Number data type can be anything from 0 to Infinity and its negative couter parts.

Similarly user defined data can be any combination of built in data even the wrong ones. That meas that a `Posn` can be any combination of 2 numbers, but also we can use strings such as `(make-posn "hello" "world")` and BSL wouldn't complain.

So it is necessary to write `data examples` along with `data definition` such as
```
(define-struct dog [owner name age happiness])
; a Dog is a structure:
;   (make-dog Person String PositiveInteger H)
; data examples:
(make-dog (make-person "Nagahariharan" "V" #true) "Scooby" 3 99)
(make-dog (make-person "Narthana" "N" #false) "Gowri" 1 55)
```

### Designing with Structures
When a problem calls for the representation of pieces of information, we need structure.

When defining structure data, we give a name to it and describe which kind of data goes to what field. While doing so, we use only names of built-in data collections or already defined ones

### Structure in the World
We have seen that a structure is used to hold "pieces of information"

When we say "piece" it does not necessarily mean a atomic data. It may well hold another structure.

Consider a space invading game. Where UFOs comes down vertically as well as horizondally. This means that we need x and y to represent a UFO postion.

Where as a tank that suppose to shoot down UFO only moves horizontally, so it hold only one value, the x-axis point. However, it may hold additional information such as ammunition stock, etc which also need a structure

So resulting SpaceGame is a strcuture consisting of additional, nested structures


### A Graphical Editor
### More Virtual Pets

## Itemizations and Structures
### Designing with Itemizations, Again
### Mixing Up Worlds
### Input Errors
### Checking the World
### Equality Predicates

## Summary