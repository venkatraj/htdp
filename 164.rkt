;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |164|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; List-of-usd -> List-of-euros
; converts usd to euro
(check-expect (convert-euro '()) '())
(check-within (convert-euro (cons 1 '())) (cons 0.88 '()) 0.1)
(check-within (convert-euro (cons 55 (cons 1 '()))) (cons 48.4 (cons 0.88 '())) 0.1)
(define (convert-euro l)
  (cond
    [(empty? l) '()]
    [else (cons (* 0.88 (first l)) (convert-euro (rest l)))]))

; List-of-usd -> List-of-euros
; converts usd to euro
(check-expect (convert-euro* 0.88 '()) '())
(check-within (convert-euro* 0.88 (cons 1 '())) (cons 0.88 '()) 0.1)
(check-within (convert-euro* 0.88 (cons 55 (cons 1 '()))) (cons 48.4 (cons 0.88 '())) 0.1)
(define (convert-euro* er l)
  (cond
    [(empty? l) '()]
    [else (cons (* er (first l)) (convert-euro* er (rest l)))]))