;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |79|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; a Color is one of:
; - "white"
; - "yellow"
; - "orange"
; - "green"
; - "red"
; - "blue"
; - "black"
; data examples: "red","green" and "blue"

; H is a Number between 0 and 100
; interpretation represents a happiness value
; data examples: 0, 100 and 55

(define-struct person [fstname lstname male?])
; a Person is a structure:
;  (make-person String String Boolean)
; data examples:
(make-person "Venkat" "Raj" #true)
(make-person "Kavya" "G" #false)

(define-struct dog [owner name age happiness])
; a Dog is a structure:
;   (make-dog Person String PositiveInteger H)
; data examples:
(make-dog (make-person "Nagahariharan" "V" #true) "Scooby" 3 99)
(make-dog (make-person "Narthana" "N" #false) "Gowri" 1 55)

; a Weapon is one of:
; - #false
; - Posn
; interpretation #false means the missile hasn't
; been fired yet; a Posn means it is in flight
; data examples:
#false
(make-posn 10 20)