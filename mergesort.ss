(define (merge xs ys)
  (cond ((null? xs) ys)
	((null? ys) xs)
	((< (car xs) (car ys))
	 (cons (car xs) (merge (cdr xs) ys)))
	(else
	 (cons (car ys) (merge xs (cdr ys))))))

(define (merge-sort xs)
  (let ((n (fx/ (length xs) 2)))
    (if (< n 1) xs
	(merge (merge-sort (list-head xs n))
	       (merge-sort (list-tail xs n))))))

(display (merge-sort '(5 9 1 3 4 6 6 3 2))) (newline)
