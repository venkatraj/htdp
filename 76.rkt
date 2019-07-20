;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |76|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Movie is (make-movie String String Number)
(define-struct movie [title producer year])

; a Person is (make-person String String String Number)
(define-struct person [name hair eyes phone])

; a Pet is (make-pet String Number)
(define-struct pet [name number])

; a CD is (make-CD String String Number)
(define-struct CD [artist title price])

; a Sweater is (make-sweater String Number String)
(define-struct sweater [material size producer])
