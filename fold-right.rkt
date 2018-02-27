#lang racket

(define (fold-right init fn xs)
  (cond
    [(empty? xs) init]
    [else
        (fold-right (fn init (last xs)) fn (all-but-last xs))]))

(define (all-but-last xs)
  (cond
    [(empty? (rest xs)) empty]
    [else (cons (first xs) (all-but-last (rest xs)))]))

(define (add x y)
  (+ x y))

(define list '(1 2 3 4 5))

(define ans (fold-right 0 add list))
ans
