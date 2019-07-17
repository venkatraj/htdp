;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.15|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; represent weather and a particular day in boolean
; Boolean Boolean -> Boolean
; determines true or false based on whether it is sunny day or friday
(define (==> sunny friday)
  (or (not sunny) friday))

(check-expect (==> #true #false) #false)
(check-expect (==> #false #false) #true)
(check-expect (==> #false #true) #true)
(check-expect (==> #true #true) #true)