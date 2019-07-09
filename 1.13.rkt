;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.13|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String -> 1String
; extract first character from given string, if not empty
(define (string-first str)
  (if (string=? str "")
      ""
      (string-ith str 0)))

(check-expect (string-first "hello") "h")
(check-expect (string-first "") "")
(check-expect (string-first "world") "w")