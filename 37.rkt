;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |37|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; We represent strings with String
; String -> String
; Removes first character from given string str and returns the rest
; given: "Venkat" produces: "enkat"
; given: "Python" produces: "ython"
; given: "" produces: an error
(define (string-rest str)
  (if (string=? str "")
      (error "Empty string given")
      (substring str 1)))

(check-expect (string-rest "Venkat") "enkat")
(check-expect (string-rest "Python") "ython")
(check-error (string-rest "") "Empty string given")
