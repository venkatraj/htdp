;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |47|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Happiness is a number

; constants
(define WORLD-WIDTH 100)
(define WORLD-HEIGHT 300)
(define MAX-HAPPINESS 100)
(define MIN-HAPPINESS 0)
(define BACKGROUND
  (empty-scene WORLD-WIDTH WORLD-HEIGHT))


; Happiness -> Image
; displays happiness gauge
(define (gauge h)
  (rectangle (- WORLD-WIDTH 2) (- (* h 3) 2) "solid" "red"))

; Happiness -> Image
; displays scene
(define (render h)
  (place-image/align (gauge h)
                     1 (- (- WORLD-HEIGHT 1) (image-height (gauge h))) "left" "top"
                     BACKGROUND))

; Happiness -> Happiness
; decreases happiness by -0.1 for every clock tick
(define (tock h)
  (if (<= h 0) 0 (- h 0.1)))

; Happiness -> Happiness
; calculates happiness based on key press
(define (key-h h key)
  (cond
    [(string=? key "down") (+ h (* h 1/5))]
    [(string=? key "up") (+ h (* h 1/3))]))

(define gauge-prog
  (big-bang MAX-HAPPINESS
    [to-draw render]
    [on-key key-h]
    [on-tick tock]))

gauge-prog