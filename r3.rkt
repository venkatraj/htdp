;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname r3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct r3 [x y z])
; a R3 is a structure:
; (make-r3 Number Number Number)
; data examples:
(define obj1 (make-r3 1 2 13))
(define obj2 (make-r3 -1 0 3))

; R3 -> Number
; calculates distance of objects in a 3 dimensional space to the origin
(check-within (distance-to-0 obj1) (sqrt (+ (sqr 1) (sqr 2) (sqr 13))) 0.1)
(check-within (distance-to-0 obj2) (sqrt (+ (sqr -1) (sqr 0) (sqr 3))) 0.1)
(define (distance-to-0 obj)
  (sqrt
   (+ (sqr (r3-x obj))
      (sqr (r3-y obj))
      (sqr (r3-z obj)))))

