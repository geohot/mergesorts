//f sharp merge sort

let rec merge list1 list2 =
    match (list1, list2) with
        | (_, []) -> list1
        | ([], _) -> list2
        | (_, _) ->
            if list1.Head <= list2.Head then
                list1.Head :: merge list1.Tail list2
            else
                list2.Head :: merge list2.Tail list1


let rec mergesort list =
    match list with
        | [] -> []
        | [x] -> [x]
        | _ -> let (subList1, subList2) = List.splitAt (List.length list / 2) list
                in merge (mergesort subList1) (mergesort subList2)

let unsorted = [5;9;1;3;4;6;6;3;2]
printfn "%A" (mergesort unsorted)
