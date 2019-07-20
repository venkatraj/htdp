;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |81|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; a Time (PointsInTime) is (make-point-in-time Number Number Number)
(define-struct time [hours minutes seconds])
; data examples
(define t1 (make-time 12 30 2))


; Time -> Number
; calculates no. of seconds passed since midnight
(check-expect (time->seconds t1) 45002)
(define (time->seconds t)
  (+ (* (time-hours t1) 60 60)
     (* (time-minutes t1) 60)
     (time-seconds t1)))
