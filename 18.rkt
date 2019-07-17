;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.18|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String String -> String
; produces a string by appending given two strings
(define (string-join str1 str2)
  (string-append str1 "_" str2))

(check-expect (string-join "hello" "world") "hello_world")
(check-expect (string-join "venkat" "raj") "venkat_raj")
(check-expect (string-join "" "") "_")