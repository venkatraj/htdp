;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.19|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String Number => String
; inserts "_" in given string at specified position
(define (string-insert str i)
  (if (> i (string-length str))
      (error "Invalid Input")
      (string-append (substring str 0 i)  "_" (substring str i))))

(check-expect (string-insert "hello" 2) "he_llo")
(check-expect (string-insert "drracket" 2) "dr_racket")
(check-expect (string-insert "racketrocks" 6) "racket_rocks")
(check-error (string-insert "" 2) "Invalid Input")