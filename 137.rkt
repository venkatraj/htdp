;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |137|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; A List-of-names is one of:
; - '()
; - (cons String List-of-Names)
; interpretation list of contacts


; List-of-names -> Boolean
; find whether 'Flatt' is in contact list
(check-expect (contains-flatt? '()) #false)
(check-expect (contains-flatt? (cons "Fabrice" '())) #false)
(check-expect (contains-flatt? (cons "Flatt" '())) #true)
(check-expect (contains-flatt? (cons "Fabrice" (cons "Flatt" '()))) #true)
(define (contains-flatt? alon)
  (cond
    [(empty? alon) #false]
    [(cons? alon)
     (or (string=? (first alon) "Flatt")
         (contains-flatt? (rest alon)))]))

(contains-flatt? (cons "Fagan"
  (cons "Findler"
    (cons "Fisler"
      (cons "Flanagan"
        (cons "Flatt"
          (cons "Felleisen"
            (cons "Friedman" '()))))))))

; A List-of-strings is one of:
; - '()
; - (cons String List-of-strings)
; interpretation list of strings

; List-of-strings -> Number
; counts no. of strings in given list
(check-expect (how-many '()) 0)
(check-expect (how-many (cons "a" '())) 1)
(check-expect (how-many (cons "b" (cons "a" '()))) 2)
(define (how-many alos)
  (cond
    [(empty? alos) 0]
    [(cons? alos) (+ (how-many (rest alos)) 1)]))

; Both 'contains-flatt?' and 'how-many' has a self-referencial data definition
; Both definition has 2 clauses, so function body has 'cond' with 2 clauses
; Only difference is type of 'combinator' while former uses 'or' latter uses '+'