;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |172|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; a List-of-string is one of:
; - '()
; - (cons String List-of-string)
; interpretation a list item represents
; a line in the text file

; a LLS (short for List-of-list-of-string) is one of:
; - '()
; - (cons List-of-string LLS)
; interpretation a list item represents a line
; which is also a list, items in the inner list represents the words


(define line0 (cons "hello" (cons "world" '())))
(define line1 '())
 
(define lls0 '())
(define lls1 (cons line0 (cons line1 '())))

; LLS -> String
; converts list of lines to string
(check-expect (collapse lls0) "")
(check-expect (collapse lls1) "hello world")
(define (collapse lls)
  (cond
    [(empty? lls) ""]
    [(cons? lls) (string-append (ls->string (first lls)) (collapse (rest lls)))]))

; List-of-string -> String
; converts a list of string into string
(check-expect (ls->string line0) "hello world \n")
(check-expect (ls->string line1) "\n")
(define (ls->string ls)
  (cond
    [(empty? ls) "\n"]
    [(cons? ls) (string-append (first ls) " " (ls->string (rest ls)))]))