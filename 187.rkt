;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |187|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct gp [name score])
; A GamePlayer is a structure: 
;    (make-gp String Number)
; interpretation (make-gp p s) represents player p who 
; scored a maximum of s points

; Logp -> Logp
; sorts List of game players in decending order
(check-expect (sortgp> '()) '())
(check-expect (sortgp> (list (make-gp "Venkat" 55) (make-gp "Raj" 75))) (list (make-gp "Raj" 75) (make-gp "Venkat" 55)))
(check-expect (sortgp> (list (make-gp "Hari" 95) (make-gp "Raj" 75))) (list (make-gp "Hari" 95) (make-gp "Raj" 75)))
(check-expect (sortgp> (list (make-gp "Raj" 75) (make-gp "Venkat" 55) (make-gp "Hari" 95))) (list (make-gp "Hari" 95) (make-gp "Raj" 75) (make-gp "Venkat" 55)))
(define (sortgp> logp)
  (cond
    [(empty? logp) '()]
    [else (insertgp (first logp) (sortgp> (rest logp)))]))

; GamePlayer Logp -> Logp
; inserts gp at correct position sorted logp
(check-expect (insertgp (make-gp "Venkat" 55) '()) (list (make-gp "Venkat" 55)))
(check-expect (insertgp (make-gp "Venkat" 55) (list (make-gp "Raj" 75))) (list (make-gp "Raj" 75) (make-gp "Venkat" 55)))
(check-expect (insertgp (make-gp "Raj" 75) (list (make-gp "Venkat" 55))) (list (make-gp "Raj" 75) (make-gp "Venkat" 55)))
(check-expect (insertgp (make-gp "Raj" 75) (list (make-gp "Hari" 95) (make-gp "Venkat" 55))) (list (make-gp "Hari" 95) (make-gp "Raj" 75) (make-gp "Venkat" 55)))
(define (insertgp gp l)
  (cond
    [(empty? l) (list gp)]
    [else (if (>= (gp-score gp) (gp-score (first l)))
              (cons gp l)
              (cons (first l) (insertgp gp (rest l))))]))