;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |38|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; We represent strings with String
; String -> String
; Removes last character from given string str and returns the rest
; given: "Venkat" produces: "Venka"
; given: "Python" produces: "Pytho"
; given: "" produces: an error
(define (string-remove-last str)
  (if (string=? str "")
      (error "Empty string given")
      (substring str 0 (sub1 (string-length str)))))

(check-expect (string-remove-last "Venkat") "Venka")
(check-expect (string-remove-last "Python") "Pytho")
(check-error (string-remove-last "") "Empty string given")
