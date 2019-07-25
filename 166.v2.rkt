;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 166.v2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct work [employee rate hours])
; a (piece of) Work is a structure:
; (make-work String Number Number)
; interpretation (make-work n r h) comibines the name
; with the pay rate r and the number of hours h

; Low (short for List of works) is one of:
; - '()
; - (cons Work Low)
; interpretation an instance of Low represents the
; hours worked for a number of employees

; Low -> List-of-numbers
; computes weekly wages for the given records
(check-expect (wage*.v2 '()) '())
(check-expect (wage*.v2 (cons (make-work "Robby" 11.95 39) '())) (cons (* 11.95 39) '()))
(define (wage*.v2 an-low)
  (cond
    [(empty? an-low) '()]
    [(cons? an-low)
     (cons (wage.v2 (first an-low))
           (wage*.v2 (rest an-low)))]))

; Work -> Number
; computes wage for given work record
(check-expect (wage.v2 (make-work "Robby" 11.95 39)) (* 11.95 39))
(define (wage.v2 w)
  (* (work-hours w) (work-rate w)))