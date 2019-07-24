;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |134|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A List-of-names is one of:
; - '()
; - (cons String List-of-Names)
; interpretation list of contacts


; String List-of-names -> Boolean
; find whether given contact name is in list
(check-expect (contains? "Arun" '()) #false)
(check-expect (contains? "Baskar" (cons "Fabrice" '())) #false)
(check-expect (contains? "Flatt" (cons "Flatt" '())) #true)
(check-expect (contains? "Flatt" (cons "Fabrice" (cons "Flatt" '()))) #true)
(define (contains? name alon)
  (cond
    [(empty? alon) #false]
    [(string=? (first alon) name) #true]
    [else  (contains? name (rest alon))]))

; To me this version is clear. Because there is no guess work here about how and what 2 combined expressions return

(contains? "Hellboy" (cons "Fagan"
  (cons "Findler"
    (cons "Fisler"
      (cons "Flanagan"
        (cons "Flatt"
          (cons "Felleisen"
            (cons "Friedman" '()))))))))

(contains? "Flanagan" (cons "Fagan"
  (cons "Findler"
    (cons "Fisler"
      (cons "Flanagan"
        (cons "Flatt"
          (cons "Felleisen"
            (cons "Friedman" '()))))))))