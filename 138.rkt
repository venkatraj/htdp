;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |138|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; a List-of-amounts is one of:
; - '()
; - (cons PositiveNumber List-of-amounts)
(define l (cons 10
                (cons 15
                      (cons 25
                            (cons 100 '())))))


; List-of-amounts -> PositiveNumber
; calculates sum of amounts
(check-expect (sum '()) 0)
(check-expect (sum (cons 10 '())) 10)
(check-expect (sum (cons 10 (cons 20 (cons 30 '())))) 60)
(define (sum aloa)
  (cond
    [(empty? aloa) 0]
    [(cons? aloa)
     (+ (first aloa) (sum (rest aloa)))]))