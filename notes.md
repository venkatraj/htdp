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
17:28


### The Arithmetic of Booleans
### Mixing It Up with Booleans
### Predicates: Know Thy Data

## Functions and Programs
### Functions
### Computing
### Composing Functions
### Global Constants
### Programs

## How to Design Programs
### Designing Functions
1. Express how you wish to represent information as data
`; We use numbers to represent Temparature`
2. Write down a signature, a statement of purpose and a function header
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
Translate the data definitions into an outline of the function.
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

### On Testing
Find a way to make the testing automatic. When we follow `Systematic Program Design`, it automatically becomes `Test Drive Development` as we need to write `function examples` which is just tests of functions

### Designing World Programs
### Virtual Pet Worlds

## Intervals, Enumerations and Itemizations
### Programming with Conditionals
### Computing Conditionally
### Enumerations
### Intervals
### Itemizations
### Designing with Itemizations
### Finite State Worlds

## Adding Structure
### From Positions to posn Structures
### Computing with posns
### Programming with posn
### Defining Structure Types
### Computing with Structures
### Programming with Structures
### The Universe of Data
### Designing with Structures
### Structure in the World
### A Graphical Editor
### More Virtual Pets

## Itemizations and Structures
### Designing with Itemizations, Again
### Mixing Up Worlds
### Input Errors
### Checking the World
### Equality Predicates

## Summary