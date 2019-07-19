;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |68|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; nested representation
(define-struct vel [deltax deltay])
(define-struct ball [posn vel])
(define ball1
  (make-ball (make-posn 30 40) (make-vel -10 5)))

; flat representation
(define-struct ballf [x y deltax deltay])

(define ball2 (make-ballf 30 40 -10 5))