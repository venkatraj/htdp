;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |235|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; a Los (short for List of strings) is one of:
; - '()
; - (cons String Los)

; String Los -> Boolean
; finds whether given s is in l
(check-expect (contains? "Cat" (list "Amebo" "Bear" "Cat" "Dog" "Elephant")) #true)
(check-expect (contains? "Fox" (list "Amebo" "Bear" "Cat" "Dog" "Elephant")) #false)
(define (contains? s l)
  (cond
    [(empty? l) #false]
    [else (or (string=? (first l) s) (contains? s (rest l)))]))

; Los -> Boolean
; find whether 'atom' is in list or not
(check-expect (contains-atom? (list "Amebo" "Bear" "Cat" "atom" "Dog" "Elephant")) #true)
(check-expect (contains-atom? (list "Amebo" "Bear" "Cat" "Dog" "Elephant")) #false)
(define (contains-atom? l)
  (contains? "atom" l))

; Los -> Boolean
; find whether 'basic' is in list or not
(check-expect (contains-basic? (list "Amebo" "Bear" "Cat" "basic" "Dog" "Elephant")) #true)
(check-expect (contains-basic? (list "Amebo" "Bear" "Cat" "Dog" "Elephant")) #false)
(define (contains-basic? l)
  (contains? "basic" l))

; Los -> Boolean
; find whether 'zoo' is in list or not
(check-expect (contains-zoo? (list "Amebo" "Bear" "Cat" "zoo" "Dog" "Elephant")) #true)
(check-expect (contains-zoo? (list "Amebo" "Bear" "Cat" "Dog" "Elephant")) #false)
(define (contains-zoo? l)
  (contains? "zoo" l))