

let rec mergesort list =
    match list with
        | [] -> []
        | [x] -> [x]
        | _ -> let (subList1, subList2) = List.splitAt (List.length list / 2) list
                in merge (mergesort subList1) (mergesort subList2)

