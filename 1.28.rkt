;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.28|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define people 120)
(define base-price 5.0)
(define percent-change (/ 15 0.1))
(define cost-per-head 1.5)
(define (attendees ticket-price)
  (- people (* percent-change (- ticket-price base-price))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (* cost-per-head (attendees ticket-price)))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(check-expect (profit 2.0) 285)
(check-expect (profit 3.0) 630)
(check-expect (profit 3.5) 690)
(check-expect (profit 4.0) 675)
(check-expect (profit 5.0) 420)