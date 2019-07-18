;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |34|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; We presetns strings with String
; String -> 1String
; Extracts first character from given non-empty string str
(check-expect (string-first "Venkat") "V")
(check-expect (string-first "Python") "P")
(check-expect (string-first "") "")
(define (string-first str)
  (if (string=? str "")
      ""
      (string-ith str 0)))
