;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |171|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/batch-io)

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

(read-file "ttt.txt")
(read-lines "ttt.txt")
(read-words "ttt.txt")
(read-words/line "ttt.txt")



