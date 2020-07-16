let divide l =
  let rec _divide l acc mid = match l with
      [] -> (List.rev acc, l)
    | l when mid <= 0 -> (List.rev acc, l)
    | e::l -> _divide l (e::acc) (mid-1)
  in
  _divide l [] ((List.length l) / 2) ;;

let rec merge l1 l2 = match (l1, l2) with
    (l, []) | ([], l) -> l
  | (e1::l1, e2::l2) ->
      if e1 > e2
      then e2 :: (merge (e1::l1) l2)
      else e1 :: (merge l1 (e2::l2)) ;;

let rec mergesort = function
    [] -> []
  | [e1] -> [e1]
  | [e1;e2] -> if e1 > e2 then [e2;e1] else [e1;e2]
  | l -> let l1, l2 = divide l in merge (mergesort l1) (mergesort l2) ;;

List.iter (fun e -> print_int e; print_string " ") (mergesort [5;9;1;3;4;6;6;3;2]) ;
print_newline () ;;
