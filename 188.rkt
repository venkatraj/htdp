;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |188|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct email [from date message])
; An Email Message is a structure: 
;   (make-email String Number String)
; interpretation (make-email f d m) represents text m 
; sent by f, d seconds after the beginning of time 

; an Loe (short for List of emails) is one of:
; - '()
; - (cons Email Loe)


; Loe -> Loe
; sorts list of email by date
(check-expect (sort>email '()) '())
(check-expect (sort>email (list
                           (make-email "Buddha" 123 "desire is root cause")
                           (make-email "JK" 321 "choiceless awareness")))
                          (list
                           (make-email "JK" 321 "choiceless awareness")
                           (make-email "Buddha" 123 "desire is root cause")))
(check-expect (sort>email (list                           
                           (make-email "JK" 321 "choiceless awareness")
                           (make-email "Buddha" 123 "desire is root cause")))
                          (list
                           (make-email "JK" 321 "choiceless awareness")
                           (make-email "Buddha" 123 "desire is root cause")))
(check-expect (sort>email (list                           
                           (make-email "Buddha" 123 "desire is root cause")
                           (make-email "SriBagavath" 999 "whatever comes ons it own, goes on its own")
                           (make-email "JK" 321 "choiceless awareness")))
                          (list
                           (make-email "SriBagavath" 999 "whatever comes ons it own, goes on its own")
                           (make-email "JK" 321 "choiceless awareness")
                           (make-email "Buddha" 123 "desire is root cause")))
(define (sort>email loe)
  (cond
    [(empty? loe) '()]
    [else (insert-email (first loe) (sort>email (rest loe)))]))


; Email Loe -> Loe
; Inserts Email at corrected position at sorted email list
(check-expect (insert-email
               (make-email "SriBagavath" 999 "whatever comes ons it own, goes on its own")
               '())
              (list
               (make-email "SriBagavath" 999 "whatever comes ons it own, goes on its own")))

(check-expect (insert-email
               (make-email "SriBagavath" 999 "whatever comes ons it own, goes on its own")
               (list (make-email "Buddha" 123 "desire is root cause")))
              (list
               (make-email "SriBagavath" 999 "whatever comes ons it own, goes on its own")
               (make-email "Buddha" 123 "desire is root cause")))
(define (insert-email e l)
  (cond
    [(empty? l) (cons e '())]
    [else (if (>= (email-date e) (email-date (first l)))
              (cons e l)
              (cons (first l) (insert-email e (rest l))))]))