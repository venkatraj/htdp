;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.20|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String Number -> String
; deletes character in given string at specified position
(define (string-delete str i)
  (if (> i (string-length str))
      (error "Invalid Input")
      (string-append (substring str 0 i) (substring str (add1 i)))))

(check-expect (string-delete "hello world!" 11) "hello world")
(check-expect (string-delete "venkat raj" 6) "venkatraj")
(check-error (string-delete "" 4) "Invalid Input")