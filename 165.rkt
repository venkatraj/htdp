;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |165|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; List-of-string -> List-of-strings
; replaces occurances of "robot" with "r2d2"
(check-expect (subst-robot '()) '())
(check-expect (subst-robot (cons "robot" '())) (cons "r2d2" '()))
(check-expect (subst-robot (cons "thor" (cons "robot" '()))) (cons "thor" (cons "r2d2" '())))
(define (subst-robot l)
  (cond
    [(empty? l) '()]
    [(string=? "robot" (first l)) (cons "r2d2" (subst-robot (rest l)))]
    [else (cons (first l) (subst-robot (rest l)))]))


; String String List-of-string -> List-of-strings
; replaces occurances of old with new
(check-expect (substitute "ironman" "robot" '()) '())
(check-expect (substitute "ironman" "robot" (cons "ironman" '())) (cons "robot" '()))
(check-expect (substitute "ironman" "robot" (cons "ironman" (cons "thor" (cons "ironman" '())))) (cons "robot" (cons "thor" (cons "robot" '()))))
(define (substitute old new l)
  (cond
    [(empty? l) '()]
    [(string=? old (first l)) (cons new (substitute old new (rest l)))]
    [else (cons (first l) (substitute old new (rest l)))]))