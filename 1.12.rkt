;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.12|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; We use Number to represent cube's side length and volume
; Number -> Number (Side Length -> Volume)
; Calculates volume of a cube
(define (cvolume side-len)
  (* side-len side-len side-len))

; We use Number to represent cube's side length and surface area
; Number -> Number (Side Length -> Surface area)
; Calculates surface area of a cube
(define (csurface side-len)
  (* 6 (* side-len side-len)))

(check-expect (cvolume 10) 1000)
(check-expect (csurface 10) 600)