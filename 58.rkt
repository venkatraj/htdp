;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |58|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; constants
(define ESSENTIAL 1000)
(define LUXURY 10000)

; A Price range is one of:
; - 0 to 1000
; - 1000 to 10000
; - 10000 and above
; interpretation a number represents price

; Price -> Number
; calculates sales tax for give Price
(check-expect (sales-tax 0) 0)
(check-expect (sales-tax 100) 100)
(check-expect (sales-tax 1000) (* 0.05 1000))
(check-expect (sales-tax 5432) (* 0.05 5432))
(check-expect (sales-tax 10000) (* 0.08 10000))
(check-expect (sales-tax 12395) (* 0.08 12395))
(define (sales-tax p)
  (cond
    [(and (<= 0 p) (< p 1000)) p]
    [(and (<= 1000 p) (< p 10000)) (* 0.05 p)]
    [(<= 10000 p) (* 0.08 p)]))