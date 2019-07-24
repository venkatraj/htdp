;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |143|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; a List-of-temperatures in one of:
; - '()
; - (cons CTemperature List-of-temperatures)

; a CTemperature is a Number greater than -272


; List-of-temperatures -> Number
; calculates average temperature
(check-expect (average '()) 0)
(check-expect (average (cons 10 (cons 20 '()))) 15)
(check-expect (average (cons 50 (cons 80 (cons 110 '())))) 80)
(define (average l)
  (cond
    [(empty? l) 0]
    [(cons? l) (/ (sum l) (how-many l))]))

; List-of-temperatures -> Number
; counts the temperatures on the given list
(check-expect (how-many '()) 0)
(check-expect (how-many (cons 25 '())) 1)
(check-expect (how-many (cons 35 (cons -25 '()))) 2)
(define (how-many alot)
  (cond
    [(empty? alot) 0]
    [(cons? alot) (+ (how-many (rest alot)) 1)]))

; List-of-temperature -> Number
; calculates sum of amounts
(check-expect (sum '()) 0)
(check-expect (sum (cons 10 '())) 10)
(check-expect (sum (cons 10 (cons 20 (cons 30 '())))) 60)
(define (sum alot)
  (cond
    [(empty? alot) 0]
    [(cons? alot)
     (+ (first alot) (sum (rest alot)))]))

; List-of-Temparature -> NumberOrError
; gives average temparature or error message wen list is empty
(check-error (checked-average '()) "can't find average for empty lists")
(check-expect (checked-average (cons 10 '())) 10)
(check-expect (checked-average (cons 10 (cons 20 (cons 30 '())))) 20)
(define (checked-average l)
  (cond
    [(empty?  l) (error "can't find average for empty lists")]
    [(cons? l) (average l)]))