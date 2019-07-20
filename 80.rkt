;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |80|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct movie [title director year])
; data definition goes here

; Movie -> Boolean
; determines whether given movie is a blockbuster or not
; here goes function examples
(define (blockbuster? m)
  (... (movie-title m) ... (movie-director m) ... (movie-year m) ... ))


(define-struct pet [name number])
; data definition goes here

; Pet -> H
; calculates happiness of a Pet
; here goes function examples
(define (calc-happiness p)
  (... (pet-name p) ... (pet-number p) ...))

(define-struct CD [artist title price])
; data definition goes here

; CD -> Number
; calculates royalty amount
; here goes function examples
(define (calc-royalty cd1)
  (... (CD-artist cd1) ... (CD-title cd1) ... (CD-price cd1) ...))

(define-struct sweater [material size color])
; data definition goes here

; Sweater -> Number
; calculates given Sweater price
; here goes function examples
(define (calc-price s1)
  (... (sweater-material s1) ... (sweater-size s1) ... (sweater-color s1) ...))