;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |166|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
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

(define-struct paycheck [employee wage])
; a PayCheck is a structure:
; (make-paycheck "Robby" 409.05)
; interpretation (make-paycheck n w) comibines the name
; n with wages 2


; Low -> List-of-numbers
; computes weekly wages for the given records
(check-expect (wage*.v3 '()) '())
(check-expect (wage*.v3 (cons (make-work "Robby" 11.95 39) '())) (cons (make-paycheck "Robby" (* 11.95 39)) '()))
(define (wage*.v3 an-low)
  (cond
    [(empty? an-low) '()]
    [(cons? an-low)
     (cons (wage.v3 (first an-low))
     (wage*.v3 (rest an-low)))]))


; Work -> PayCheck
; computes wage for given work record
(check-expect (wage.v3 (make-work "Robby" 11.95 39)) (make-paycheck "Robby" (* 11.95 39)))
(define (wage.v3 w)
  (make-paycheck (work-employee w) (* (work-hours w) (work-rate w))))