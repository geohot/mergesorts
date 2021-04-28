(defun mergesort (list)
    (labels ((merge (f s)
            (cond
                ((null f) s)
                ((null s) f)
                ((< (first f) (first s)) (list* (first f) (merge (rest f) s)))
                ((> (first f) (first s)) (list* (first s) (merge f (rest s))))
                ((= (first f) (first s)) (list* (first f)
                                                (first s) (merge (rest f) (rest s)))))))
        (let ((len (list-length list)))
            (if (<= len 1) list
                (merge (mergesort (subseq list 0 (ceiling len 2)))
                       (mergesort (subseq list (ceiling len 2))))))))

(write(mergesort(list 5 9 1 3 4 6 6 3 2))) (terpri)
