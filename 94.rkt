;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |94|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; constants
(define tank (rectangle 30 15 "solid" "green"))
(define missile (triangle 10 "solid" "orange"))
(define ufo (overlay/align "center" "center"
                           (ellipse 50 10 "solid" "red")
                           (ellipse 10 20 "solid" "red")))
(define WIDTH 500)
(define HEIGHT 300)
(define BG (empty-scene WIDTH HEIGHT))
(define TANK-WIDTH (image-width tank))
(define TANK-BG (place-image/align tank
                               0 HEIGHT "left" "bottom"
                               BG))
(define MISSILE-TANK-BG (place-image/align missile
                                           (/ TANK-WIDTH 2) 250 "center" "bottom"
                                           TANK-BG))

(define UFO-MISSILE-TANK-BG (place-image/align ufo
                   0 0 "left" "top"
                   MISSILE-TANK-BG))

(define gs1 (place-image/align ufo
                               0 0 "left" "top"
                               (place-image/align missile
                                                  (/ TANK-WIDTH 2) 250 "center" "bottom"
                                                  (place-image/align tank
                                                                     0 HEIGHT "left" "bottom"
                                                                     BG))))                                   

(define gs2 (place-image/align ufo
                               20 40 "left" "top"
                               (place-image/align missile
                                                  (+ (/ TANK-WIDTH 2) 50) 250 "center" "bottom"
                                                  (place-image/align tank
                                                                     50 HEIGHT "left" "bottom"
                                                                     BG))))                  