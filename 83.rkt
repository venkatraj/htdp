;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |83|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
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

; main
(define (main e1)
  (big-bang e1
    [to-draw render]))

(main e1)