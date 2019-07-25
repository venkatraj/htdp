;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |186|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; List-of-numbers -> List-of-numbers
; sorts alon in desecding order
;(check-expect (sort> '()) '())
;(check-expect (sort> (list 3 2 1)) (list 3 2 1))
;(check-expect (sort> (list 1 2 3)) (list 3 2 1))
;(check-expect (sort> (list 12 20 -5)) (list 20 12 -5))
(define (sort> alon)
  (cond
    [(empty? alon) '()]
    [(cons? alon) (insert (first alon) (sort> (rest alon)))]))


; Number List-of-numbers -> List-of-numbers
; inserts n in correct position of sorted alon
(check-expect (insert 3 '()) (list 3))
(check-expect (insert 6 (list 5)) (list 6 5))
(check-expect (insert 4 (list 5)) (list 5 4))
(check-expect (insert 12 (list 20 -5)) (list 20 12 -5))
(check-expect (insert 3 (list 5 4 2)) (list 5 4 3 2))
(define (insert n alon)
  (cond
    [(empty? alon) (list n)]
    [else (if (>= n (first alon)) (cons n alon) (cons (first alon) (insert n (rest alon))))]))