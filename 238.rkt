;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |238|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; F Nelon -> Number
; find number that satisfies F
(define (find F l)
  (cond
    [(empty? (rest l)) (first l)]
    [else (if (F (first l) (find F (rest l)))
              (first l)
              (find F (rest l)))]))

; Nelon -> Number
; determines the smallest 
; number on l
(check-expect (inf-1 (list 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1)) 1)
(check-expect (inf-1 (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20)) 1)
(define (inf-1 l)
  (find < l))

; Nelon -> Number
; determines the largest 
; number on l
(check-expect (sup-1 (list 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6)) 25)
(check-expect (sup-1 (list 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25)) 25)
(define (sup-1 l)
  (find > l))
     min(