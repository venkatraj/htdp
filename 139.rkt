;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |139|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; a List-of-numbers is one of:
; - '()
; - (cons Number List-of-numbers)

; List-of-numbres -> Boolean
; finds out whether given list of numbers contains all positive numbers or not
(check-expect (pos? '()) #true)
(check-expect (pos? (cons 10 '())) #true)
(check-expect (pos? (cons -5 '())) #false)
(check-expect (pos? (cons -2 (cons 4 '()))) #false)
(check-expect (pos? (cons 11 (cons 15 '()))) #true)
(define (pos? l)
  (cond
   [(empty? l) #true]
   [(cons? l)
    (and (> (first l) 0) (pos? (rest l)))]))

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

; List-of-amounts or List-of-numbers -> NumberorError
; finds out sum of number if input belongs to List-of-amounts otherwise throws error
(check-expect (checked-sum '()) 0)
(check-expect (checked-sum (cons 10 '())) 10)
(check-error (checked-sum (cons -5 '())) "not a List-of-amounts")
(check-expect (checked-sum (cons 10 (cons 15 '()))) 25)
(check-error (checked-sum (cons -5 (cons 5 '()))) "not a List-of-amounts")
(define (checked-sum l)
  (cond
    [(pos? l) (sum l)]
    [else (error "not a List-of-amounts")]))