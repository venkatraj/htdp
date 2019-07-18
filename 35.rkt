;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |35|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; We represent strings with String
; String -> 1String
; Extracts the last character from given string str
(check-expect (string-last "Venkat") "t")
(check-expect (string-last "Python") "n")
(check-expect (string-last "") "")
(define (string-last str)
  (if (string=? str "")
      ""
      (string-ith str (- (string-length str) 1))))