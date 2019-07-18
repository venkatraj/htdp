;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ufo) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A WorldState falls into one of three intervals: 
; – between 0 and CLOSE
; – between CLOSE and HEIGHT
; – below HEIGHT
; interpretation number of pixels between the top and the UFO
 
(define WIDTH 300) ; distances in terms of pixels 
(define HEIGHT 100)
(define CLOSE (/ HEIGHT 3))
(define MTSCN (empty-scene WIDTH HEIGHT))
(define UFO (overlay (circle 10 "solid" "green") (ellipse 45 8 "solid" "green")))
 
; WorldState -> WorldState
(define (main y0)
  (big-bang y0
     [on-tick nxt]
     [to-draw render]))
 
; WorldState -> WorldState
; computes next location of UFO 
(check-expect (nxt 11) 14)
(define (nxt y)
  (+ y 3))
 
; WorldState -> Image
; places UFO at given height into the center of MTSCN
(check-expect (render 11) (above (place-image UFO 50 11 MTSCN)
                                 (text "descending" 12 "red")))
(define (render y)
  (above (place-image UFO 50 y MTSCN)
         (text (status y) 12 "red")))

; A Status is one of:
; - "descending"
; - "closing in"
; - "landed"
; WorldState -> Status
; produces status line text
(check-expect (status 11) "descending")
(check-expect (status 33.3) "descending")
(check-expect (status 34) "closing in")
(check-expect (status 101) "landed")
(define (status y)
  (cond
    [(<= y CLOSE) "descending"]
    [(<= CLOSE y HEIGHT) "closing in"]
    [else "landed"]))

