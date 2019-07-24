;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |151|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; N M -> Number
; computes (* n m) without using *
 
(check-expect (multiply 3 4) (* 3 4))
 
(define (multiply n m)
  (cond
    [(zero? n) 0]
    [(positive? n) (+ m (multiply (sub1 n) m))]))