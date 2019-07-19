;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |61|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)
(require 2htdp/universe)

; constants
(define RADIUS 10)
(define SPACE (rectangle 10 10 "solid" "white"))
(define WIDTH 100)
(define HEIGHT 30)
(define RED "red")
(define GREEN "green")
(define YELLOW "yellow")
(define BG (empty-scene WIDTH HEIGHT))


; An S-TrafficLight is one of:
; – RED interpretation the traffic light shows red
; – GREEN interpretation the traffic light shows green
; – YELLOW interpretation the traffic light shows yellow


; S-TrafficLight -> Image
; renders a bulb in off state
(check-expect (bulb-off RED) (circle RADIUS "outline" "red"))
(define (bulb-off color)
  (circle RADIUS "outline" color))

; S-TrafficLight -> Image
; renders a bulb in on state
(check-expect (bulb-on YELLOW) (circle RADIUS "solid" "yellow"))
(define (bulb-on color)
  (circle RADIUS "solid" color))

; S-TrafficLight -> S-TrafficLight
; yields next state, given current state cs
(check-expect (tl-next RED) "green")
(check-expect (tl-next YELLOW) "red")
(check-expect (tl-next GREEN) "yellow")
(define (tl-next cs)
  (cond
    [(string=? cs RED) GREEN]
    [(string=? cs YELLOW) RED]
    [(string=? cs GREEN) YELLOW]))


; S-TrafficLight -> Image
; renders traffic light with current state cs
(check-expect (tl-render RED) (beside (bulb-on RED) SPACE (bulb-off YELLOW) SPACE (bulb-off GREEN)))
(check-expect (tl-render YELLOW) (beside (bulb-off RED) SPACE (bulb-on YELLOW) SPACE (bulb-off GREEN)))
(check-expect (tl-render GREEN) (beside (bulb-off RED) SPACE (bulb-off YELLOW) SPACE (bulb-on GREEN)))
(define (tl-render cs)
  (cond
    [(string=? cs RED) (beside (bulb-on cs) SPACE (bulb-off YELLOW) SPACE (bulb-off GREEN))]
    [(string=? cs YELLOW) (beside (bulb-off RED) SPACE (bulb-on cs) SPACE (bulb-off GREEN))]
    [(string=? cs GREEN) (beside (bulb-off RED) SPACE (bulb-off YELLOW) SPACE (bulb-on cs))]))
  

; S-TrafficLight -> S-TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next 1]))
4019
(traffic-light-simulation RED)