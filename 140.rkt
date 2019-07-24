;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |140|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; a List-of-booleans is one of:
; - '()
; - (cons Boolean '())


; List-of-Booleans -> Boolean
; finds out whether all booleans are #true or not
(check-expect (all-true '()) #true)
(check-expect (all-true (cons #true '())) #true)
(check-expect (all-true (cons #false (cons #true '()))) #false)
(check-expect (all-true (cons #true (cons #true '()))) #true)
(define (all-true l)
  (cond
    [(empty? l) #true]
    [(cons? l) (and (boolean=? (first l) #true) (all-true (rest l)))]))


; List-of-booleans -> Booleans
; finds out whether a single #true is in a list or not
(check-expect (one-true '()) #false)
(check-expect (one-true (cons #true '())) #true)
(check-expect (one-true (cons #false '())) #false)
(check-expect (one-true (cons #true (cons #false '()))) #true)
(check-expect (one-true (cons #false (cons #false '()))) #false)
(check-expect (one-true (cons #true (cons #true '()))) #true)
(define (one-true l)
  (cond
    [(empty? l) #false]
    [(cons? l) (or (boolean=? (first l) #true) (one-true (rest l)))]))