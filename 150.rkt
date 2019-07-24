;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |150|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; N -> Number
; computes (+ n pi) without using +
 
(check-within (add-to-pi 3) (+ 3 pi) 0.001)
 
(define (add-to-pi n)
  (cond
    [(zero? n) pi]
    [(positive? n) (add1 (add-to-pi (sub1 n)))]))


; N M -> Number
; computes (+ n m) without using +
 
(check-within (add-it 3 4) (+ 3 4) 7)
 (check-within (add-it 2 20) (+ 2 20) 22)
(define (add-it n m)
  (cond
    [(zero? n) m]
    [(positive? n) (add1 (add-it (sub1 n) m))]))