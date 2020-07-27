(defn merge-list [left right op]
  (cond (empty? left) right
        (empty? right) left
        :else
           (let [fl (first left)
                 fr (first right)]
             (if (op fl fr)
               (cons fl (merge-list (rest left) right op))
               (cons fr (merge-list left (rest right) op))))))
 
(defn merge-sort 
  ([data]
     (merge-sort data <))
  ([data op]
    (if (< (count data) 2)
      data
      (let [middle (/ (count data) 2)
            split (split-at middle data)
            left (first split)
            right (second split)
            result (merge-list (merge-sort left op) (merge-sort right op) op)]
        result))))

(println (merge-sort [5,9,1,3,4,6,6,3,2]))