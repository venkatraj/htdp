(define (reward s)
  (cond
    [(<= 0 s 10) "Brone"]
    [(and (< 10 s) (<= s 20)) "Silver"]
    [(<= 20 s) "Gold"]))

(reward 8)
(reward 18)
(reward 23)