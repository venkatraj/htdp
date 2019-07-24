;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |149|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; N String -> List-of-strings 
; creates a list of n copies of s
 
(check-expect (copier 0 "hello") '())
(check-expect (copier 2 "hello")
              (cons "hello" (cons "hello" '())))
 
(define (copier n s)
  (cond
    [(zero? n) '()]
    [(positive? n) (cons s (copier (sub1 n) s))]))

(define (copier1 n s)
  (cond
    [(zero? n) '()]
    [else (cons s (copier (sub1 n) s))]))

; (copier 0.1 "x")
; if we give above input, then all cond results in false.
; because since 0.1 is not zero, first clause results in false
; because it is positive, which results in (cons "x"
; but to complete the list we need '()
; since (sub1 n) will result in -0.9 subsequently call will not result in '()
; so we get error message

; (copier1 0.1 "x")
; since it always execute else clause, there won't be any end of list
; resulting it out of memory error message
