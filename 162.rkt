;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |162|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define WAGE 14)

; List-of-numbers -> List-of-numbers
; calculates weekly wages for all employees weekly working hours
(check-expect (wage* '()) '())
(check-expect (wage* (cons 2 (cons 4 '()))) (cons 28 (cons 56 '())))
(check-error (wage* (cons 2 (cons 400 '()))) "Do not cheat")
(define (wage* whrs)
  (cond
    [(empty? whrs) '()]
    [(> (first whrs) 100) (error "Do not cheat")]
    [else (cons (* WAGE (first whrs)) (wage* (rest whrs)))]))