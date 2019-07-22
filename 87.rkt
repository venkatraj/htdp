;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |87|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct editor [text index])
; An Editor is a strcutre:
; - (make-editor text index)
; interpretation (make-editor t i) describes an editor
; whose visible text is 't' and cursor it at position 'i'
(define e1 (make-editor "hello world" 6))


; constants
(define WIDTH 200)
(define HEIGHT 25)
(define FONTSIZE 16)
(define FONTCOLOR "black")
(define BG (empty-scene WIDTH HEIGHT))
(define CURSOR (rectangle 2 HEIGHT "solid" "red"))

; Editor -> Editor
; moves cursor to left
(check-expect (move-left e1) (make-editor "hello world" 5))
(check-expect (move-left (make-editor "hello" 0)) (make-editor "hello" 0))
(check-expect (move-left (make-editor "hello" 5)) (make-editor "hello" 4))
(define (move-left e)
  (if (> (editor-index e) 0) (make-editor (editor-text e) (sub1 (editor-index e))) e))


; Editor -> Editor
; move cursor to right
(check-expect (move-right e1) (make-editor "hello world" 7))
(check-expect (move-right (make-editor "hello" 0)) (make-editor "hello" 1))
(check-expect (move-right (make-editor "hello" 5)) (make-editor "hello" 5))
(define (move-right e)
  (if (>= (editor-index e) (string-length (editor-text e))) e (make-editor (editor-text e) (add1 (editor-index e)))))

; Editor 1String -> Editor
; inserts a character
(check-expect (insert-char e1 "a") (make-editor "hello aworld" 7))
(check-expect (insert-char (make-editor "" 0) "a") (make-editor "a" 1))
(define (insert-char e ch)
  (make-editor (string-append (substring (editor-text e) 0 (editor-index e)) ch (substring (editor-text e) (editor-index e))) (add1 (editor-index e))))

; Editor -> Editor
; deletes a character
(check-expect (delete-char e1) (make-editor "helloworld" 5))
(check-expect (delete-char (make-editor "hello" 0)) (make-editor "hello" 0))
(check-expect (delete-char (make-editor "hello" 1)) (make-editor "ello" 0))
(define (delete-char e)
  (if (= (editor-index e) 0)
      e
      (make-editor (string-append (substring (editor-text e)
                                             0
                                             (sub1(editor-index e)))
                                  (substring (editor-text e) (editor-index e)))
                   (sub1 (editor-index e)))))

; Editor KeyEvent -> Editor
; handles on-key event
(define (edit e ke)
  (cond
    [(string=? ke "left") (move-left e)]
    [(string=? ke "right") (move-right e)]
    [(string=? ke "\b") (delete-char e)]
    [(or (string=? ke "\t") (string=? ke "\r")) e]
    [(= (string-length ke) 1) (insert-char e ke)]
    [else e]))


; Editor -> Image
; renders editor
(define (render e)
  (overlay/align "left" "top"
                 (beside (text (substring (editor-text e) 0 (editor-index e)) FONTSIZE FONTCOLOR)
                         CURSOR
                         (text (substring (editor-text e) (editor-index e)) FONTSIZE FONTCOLOR))
                 BG))


; run
(define (run intial_text)
  (big-bang (make-editor intial_text (string-length intial_text))
    [to-draw render]
    [on-key edit]))

(run "hello")
