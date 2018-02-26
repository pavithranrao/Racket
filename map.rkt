#lang racket

(define (map fn xs)
  (cond
    [(empty? xs) null]
    [else (cons
      (fn (first xs)) (map fn (rest xs)))]))


(define (add1 x)
  (+ x 1))

(define list '(1 2 3 4 5))
(define ans (map  add1 list))
ans
