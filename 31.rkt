;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.31|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/batch-io)

(define (opening fst)
  (string-append "Dear " fst ", "))

(define (closing signature)
  (string-append "Sincerely" "\n" signature "\n"))

(define (body fst lst)
  (string-append "We have discovered that all people with the"
                 "\n"
                 "last name "
                 lst
                 " have won our lottery. So,"
                 "\n"
                 fst
                 ", hurry and pick up your prize."
                 "\n\n"))


(define (letter fst lst signature)
  (string-append (opening fst)
                 (body fst lst)
                 (closing signature)))

(define (main in-fst in-lst in-signature out)
  (write-file out
              (letter (read-file in-fst)
                      (read-file in-lst)
                      (read-file in-signature))))

