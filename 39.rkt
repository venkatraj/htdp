;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |39|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; constants
(define WIDTH-OF-WORLD 200)
(define WHEEL-RADIUS 5)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))

(define SPACE
  (rectangle WHEEL-DISTANCE WHEEL-RADIUS "solid" "white"))

(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))

(define CAR-TOP
  (rectangle (* WHEEL-RADIUS 3) WHEEL-RADIUS "solid" "red"))

(define CAR-CABIN
  (rectangle (* WHEEL-RADIUS 12) (* WHEEL-RADIUS 3) "solid" "red"))

(define CAR-BODY
  (above CAR-TOP
         CAR-CABIN))

(define CAR-Y 35)
(define CAR
  (underlay/xy CAR-BODY
              7 15
              BOTH-WHEELS))

(define BACKGROUND
  (empty-scene WIDTH-OF-WORLD 50))


; A WorldState is a Number
; interpretation the number of pixels between
; the left border of the scene and the car

; wish list

; WorldState -> Image
; places the image of the car x pixels from
; the left margin of the BACKGROUND image
(define (render car-x)
  (place-image CAR car-x CAR-Y BACKGROUND))

; WorldState -> WorldState
; increases x by 3 to move car to the right
; given: 10 expect: 13
; given: 33 expect: 36
(define (clock-tick-handler car-x)
  (+ car-x 3))

(check-expect (clock-tick-handler 10) 13)
(check-expect (clock-tick-handler 33) 36)

; WorldState -> WorldState
; lanches the program from some initial state
(define (main car-x)
  (big-bang car-x
    [on-tick clock-tick-handler]
    [to-draw render]))

; keystroke-handler
; mouse-event-handler
; end?


