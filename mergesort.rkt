#lang racket

;https://learningtogetolder.wordpress.com/2013/06/14/merge-sort-in-racket/

(define (merge-lists xs ys)
  (cond
    ;if xs is empty, return ys
    [(null? xs) ys]
    ;if ys is empty, return xs
    [(null? ys) xs]
    ;if the head of list "xs" is bigger than head of list "ys"
    [(< (car xs) (car ys))
     ;cons head xs to (recurse)
     (cons (car xs) (merge-lists (cdr xs) ys))]
    [#t
     ;cons head ys to (recurse)
     (cons (car ys) (merge-lists xs (cdr ys)))]))

(define (merge-sort xs)
  (cond
    [(or (null? xs) (null? (cdr xs))) xs]
    [(null? (cddr xs))
     (merge-lists (list (car xs)) (cdr xs))]
    [#t
     (let ([x (ceiling (/ (length xs) 2))])
       (merge-lists (merge-sort (take xs x))
                    (merge-sort (drop xs x))))]))

(merge-sort (list 5 9 1 3 4 6 6 3 2))
