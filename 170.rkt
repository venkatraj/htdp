;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |170|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct phone [area switch four])
; a Phone is a structure:
; (make-phone Three Three Four)
; A Three is a Number between 100 and 999
; A Four is a Number between 1000 and 9999

; Lop is one of:
; - '()
; - (cons (make-phone 123 456 7890) Lop)
; interpretation an instance of Lop represents
; a Phone

; Lop -> Lop
; replaces all 713 area code with 281
(check-expect (replace '()) '())
(check-expect (replace (cons (make-phone 123 456 7890) '())) (cons (make-phone 123 456 7890) '()))
(check-expect (replace (cons (make-phone 713 456 7890) '())) (cons (make-phone 281 456 7890) '()))
(check-expect (replace (cons (make-phone 123 456 7890) (cons (make-phone 713 456 7890) '()))) (cons (make-phone 123 456 7890) (cons (make-phone 281 456 7890) '())))
(define (replace a-lop)
  (cond
    [(empty? a-lop) '()]
    [(cons? a-lop)
     (cons (replace-area (first a-lop))
           (replace (rest a-lop)))]))

; Phone -> Phone
; replaces area code if needed
(check-expect (replace-area (make-phone 123 456 7890)) (make-phone 123 456 7890))
(check-expect (replace-area (make-phone 713 456 7890)) (make-phone 281 456 7890))
(define (replace-area p)
  (cond
    [(= (phone-area p) 713) (make-phone 281 (phone-switch p) (phone-four p))]
    [else p]))