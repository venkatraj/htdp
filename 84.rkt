;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |84|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editor String String)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with 
; the cursor displayed between s and t
(define e1 (make-editor "hello " "world"))


; constants
(define WIDTH 200)
(define HEIGHT 20)
(define FONTSIZE 16)
(define FONTCOLOR "black")
(define CURSOR (rectangle 1 20 "solid" "red"))
(define BG (empty-scene WIDTH HEIGHT))


; Editor -> Image
; produces world scene
(check-expect (render e1) (overlay/align "left" "center"
               (beside (text (editor-pre e1) FONTSIZE FONTCOLOR)
                       CURSOR
                       (text (editor-post e1) FONTSIZE FONTCOLOR))
               BG))
(define (render e)
  (overlay/align "left" "center"
                 (beside (text (editor-pre e) FONTSIZE FONTCOLOR)
                         CURSOR
                         (text (editor-post e) FONTSIZE FONTCOLOR))
                 BG))

; Editor KeyEvent -> Editor
; manipulates the text in editor based on key event
(check-expect (edit (make-editor "hello " "world") "a") (make-editor "hello a" "world"))
; more test
(define (edit ed ke)
  (cond
    [(string=? ke "left") (move-left ed)]
    [(string=? ke "right") (move-right ed)]
    [(and (= (string-length ke) 1) (string=? ke "\b")) (del-char ed)]
    [(and (= (string-length ke) 1) (or (string=? ke "\t") (string=? ke "\r"))) ed]
    [(= (string-length ke) 1) (add-char ed ke)]
    [else ed]))

; Editor 1String -> Editor
; adds given character to Editor
(check-expect (add-char (make-editor "hello " "world") "a") (make-editor "hello a" "world"))
(define (add-char ed ch)
  (make-editor (string-append (editor-pre ed) ch)
               (editor-post ed)))

; Editor -> Editor
(check-expect (del-char (make-editor "hell" " world")) (make-editor "hel" " world"))
(define (del-char ed)
  (make-editor (string-remove-last (editor-pre ed))
               (editor-post ed)))

; String -> String
; remove last character from string
(check-expect (string-remove-last "hello") "hell")
(define (string-remove-last str)
  (if (> (string-length str) 0)
      (substring str 0 (sub1 (string-length str)))
      str))

; Editor -> Editor
; moves cursor to left
(check-expect (move-left (make-editor "hello " "world")) (make-editor "hello" " world"))
(check-expect (move-left (make-editor "venkat" "raj")) (make-editor "venka" "traj"))
(define (move-left ed)
  (make-editor
   (string-remove-last (editor-pre ed))
   (string-append (string-last (editor-pre ed)) (editor-post ed))))

; String -> 1String
; removes last character and returns
(check-expect (string-last "world") "d")
(check-expect (string-last "big bang") "g")
(define (string-last str)
  (if (> (string-length str) 0)
      (substring str (sub1 (string-length str)))
      str))

; Editor -> Editor
; moves cursor to the right
(check-expect (move-right (make-editor "" "empty")) (make-editor "e" "mpty"))
(check-expect (move-right (make-editor "hello " "world")) (make-editor "hello w" "orld"))
(check-expect (move-right (make-editor "venkat" "raj")) (make-editor "venkatr" "aj"))
(define (move-right ed)
  (make-editor (string-append (editor-pre ed) (string-first (editor-post ed)))
               (string-remove-first (editor-post ed))))

; String -> 1String
; returns first character from a string
(check-expect (string-first "hello") "h")
(check-expect (string-first "racket") "r")
(define (string-first str)
  (if (> (string-length str) 0)
      (substring str 0 1)
      str))

; String -> String
; removes first character
(check-expect (string-remove-first "") "")
(check-expect (string-remove-first "hello") "ello")
(check-expect (string-remove-first "racket") "acket")
(define (string-remove-first str)
  (if (> (string-length str) 0)
      (substring str 1)
      str))
