#lang racket

(define (fold-left init fn xs)
  (cond
    [(empty? xs) init]
    [else
        (fold-left (fn init (first xs)) fn (rest xs))]))

(define (add x y)
  (+ x y))

(define list '(1 2 3 4 5))

(define ans (fold-left 0 add list))
ans
