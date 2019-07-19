;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |59|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A TrafficLight is one of the following Strings:
; – "red"
; – "green"
; – "yellow"
; interpretation the three strings represent the three 
; possible states that a traffic light may assume

; constants
(define RADIUS 10)
(define SPACE (rectangle 10 10 "solid" "white"))
(define WIDTH 100)
(require 2htdp/image)
(require 2htdp/universe)

(define HEIGHT 30)
(define BG (empty-scene WIDTH HEIGHT))

; TrafficLight -> Image
; renders a bulb in off state
(check-expect (bulb-off "red") (circle RADIUS "outline" "red"))
(define (bulb-off color)
  (circle RADIUS "outline" color))

; TrafficLight -> Image
; renders a bulb in on state
(check-expect (bulb-on "yellow") (circle RADIUS "solid" "yellow"))
(define (bulb-on color)
  (circle RADIUS "solid" color))

; TrafficLight -> TrafficLight
; yields next state, given current state cs
(check-expect (tl-next "red") "green")
(check-expect (tl-next "yellow") "red")
(check-expect (tl-next "green") "yellow")
(define (tl-next cs)
  (cond
    [(string=? cs "red") "green"]
    [(string=? cs "yellow") "red"]
    [(string=? cs "green") "yellow"]))


; TrafficLight -> Image
; renders traffic light with current state cs
(check-expect (tl-render "red") (beside (bulb-on "red") SPACE (bulb-off "yellow") SPACE (bulb-off "green")))
(check-expect (tl-render "yellow") (beside (bulb-off "red") SPACE (bulb-on "yellow") SPACE (bulb-off "green")))
(check-expect (tl-render "green") (beside (bulb-off "red") SPACE (bulb-off "yellow") SPACE (bulb-on "green")))
(define (tl-render cs)
  (cond
    [(string=? cs "red") (beside (bulb-on cs) SPACE (bulb-off "yellow") SPACE (bulb-off "green"))]
    [(string=? cs "yellow") (beside (bulb-off "red") SPACE (bulb-on "yellow") SPACE (bulb-off "green"))]
    [(string=? cs "green") (beside (bulb-off "red") SPACE (bulb-off "yellow") SPACE (bulb-on "green"))]))
  

; TrafficLight -> TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next 1]))

(traffic-light-simulation "red")