;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.14|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String -> 1String
; extract last character from given string, if not empty
(define (string-last str)
  (if (string=? str "")
      ""
      (string-ith str (sub1 (string-length str)))))

(check-expect (string-last "hello") "o")
(check-expect (string-last "") "")
(check-expect (string-last "world") "d")