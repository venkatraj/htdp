;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |65|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct movie [title producer year])
; constructor
(define m1 (make-movie "Spartacus" "Edward Lewis" 1960))

; selectors
(movie-title m1)
(movie-producer m1)
(movie-year m1)

; predicate
(movie? m1)

(define-struct person [name hair eyes phone])

;constructor
(define p1 (make-person "Anamika" "Black" "Brown" 123456))

;selector
(person-name p1)
(person-hair p1)
(person-eyes p1)
(person-phone p1)

;predicate
(person? p1)


(define-struct pet [name number])

; constructor
(define pet1 (make-pet "Scooby" 2))

; selectors
(pet-name pet1)
(pet-number pet1)

;predicate
(pet? pet1)


(define-struct CD [artist title price])

; constructor
(define cd1 (make-CD "Ilayaraja" "Thiruvasagam" 499))

; selectors
(CD-artist cd1)
(CD-title cd1)
(CD-price cd1)

; predicate
(CD? cd1)


(define-struct sweater [material size producer])

; constructor
(define s1 (make-sweater "wool" "XL" "myself"))

; selectors
(sweater-material s1)
(sweater-size s1)
(sweater-producer s1)

; predicate
(sweater? s1)