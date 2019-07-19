;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |62|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)
(require 2htdp/universe)

; constants
(define LOCKED "locked")
(define OPEN "open")
(define CLOSED "closed")
(define WIDTH 400)
(define HEIGHT 100)
(define BG (empty-scene WIDTH HEIGHT))

; A DoorState is one of:
; - LOCKED
; - OPEN
; - CLOSED

; DoorState KeyEvent -> DoorState
; changes door state corresponding to key press
(check-expect (key-h LOCKED "u") CLOSED)
(check-expect (key-h CLOSED " ") OPEN)
(check-expect (key-h CLOSED "l") LOCKED)
(check-expect (key-h CLOSED "a") CLOSED)
(check-expect (key-h LOCKED "c") LOCKED)
(define (key-h ds k)
  (cond
    [(and (string=? ds LOCKED) (string=? k "u")) CLOSED]
    [(and (string=? ds CLOSED) (string=? k " ")) OPEN]
    [(and (string=? ds CLOSED) (string=? k "l")) LOCKED]
    [else ds]))

; DoorState -> DoorState
; closes the door as time passes
(check-expect (tock OPEN) CLOSED)
(check-expect (tock CLOSED) CLOSED)
(check-expect (tock LOCKED) LOCKED)
(define (tock ds)
  (cond
    [(string=? ds OPEN) CLOSED]
    [else ds]))


; DoorState -> Image
; renders door states
(check-expect (render LOCKED) (place-image/align (text LOCKED 40 "red") (/ WIDTH 2) (/ HEIGHT 2) "center" "center" BG))
(check-expect (render OPEN) (place-image/align (text OPEN 40 "red") (/ WIDTH 2) (/ HEIGHT 2) "center" "center" BG))
(check-expect (render CLOSED) (place-image/align (text CLOSED 40 "red") (/ WIDTH 2) (/ HEIGHT 2) "center" "center" BG))
(define (render ds)
  (place-image/align (text ds 40 "red") (/ WIDTH 2) (/ HEIGHT 2) "center" "center" BG))


; DoorState Program
(define (door-simulation initial-state)
  (big-bang initial-state
    [on-tick tock 3]
    [to-draw render]
    [on-key key-h]))

(door-simulation LOCKED)