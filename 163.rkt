;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |163|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; a List-of-f is one of:
; - '()
; - (cons Number List-of-f)


; a List-of-c is one of:
; - '()
; - (cons Number List-of-c)


; List-of-f -> List-of-c
; converts fahrenheit to Celsius
(check-expect (convertFC '()) '())
(check-expect (convertFC (cons 104 '())) (cons 40 '()))
(check-expect (convertFC (cons 95 (cons 104 '()))) (cons 35 (cons 40 '())))
(check-within (convertFC (cons 100 (cons 95 (cons 104 '())))) (cons 37.7778 (cons 35 (cons 40 '()))) 0.1)
(define (convertFC l)
  (cond
    [(empty? l) '()]
    [else (cons (* (- (first l) 32) 5/9) (convertFC (rest l)))]))