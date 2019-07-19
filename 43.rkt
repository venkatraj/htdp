;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |43|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
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

(define CAR
  (underlay/xy CAR-BODY
              7 15
              BOTH-WHEELS))

(define CAR-Y (image-height CAR))

(define tree
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))

(define BACKGROUND
  (place-image tree
               10 40
               (empty-scene WIDTH-OF-WORLD 50)))


; A WorldState is a Number
; interpretation the number of pixels between
; the left border of the scene and the car

; wish list

; WorldState -> Image
; places the image of the car x pixels from
; the left margin of the BACKGROUND image
(define (render car-x)
  (place-image/align CAR
                     car-x CAR-Y "right" "top"
                     BACKGROUND))

(check-expect (render 50) (place-image/align CAR 50 CAR-Y "right" "top" BACKGROUND))
(check-expect (render 100) (place-image/align CAR 100 CAR-Y "right" "top" BACKGROUND))
(check-expect (render 150) (place-image/align CAR 150 CAR-Y "right" "top" BACKGROUND))
(check-expect (render 200) (place-image/align CAR 200 CAR-Y "right" "top" BACKGROUND))


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
    [on-mouse mouse-event-handler]
    [stop-when end?]
    [to-draw render]))

; keystroke-handler
; WorldState Number Number String -> WorldState
; places the car at m-x
; if the given me is "button-down"
; given: 21 10 20 "enter"
; wanted: 21
; given: 42 10 20 "button-down"
; wanted: 10
; given: 42 10 20 "move"
; wanted: 42
(define (mouse-event-handler car-x m-x m-y me)
  (if (string=? me "button-down")
      m-x
      car-x))

(check-expect (mouse-event-handler 21 10 20 "enter") 21)
(check-expect (mouse-event-handler 42 10 20 "button-down") 10)
(check-expect (mouse-event-handler 42 10 20 "move") 42)

; WorldState -> Boolean
; decides whether car's x position has reached scene end
(define (end? car-x)
  (if (>= car-x WIDTH-OF-WORLD)
      #true
      #false))
