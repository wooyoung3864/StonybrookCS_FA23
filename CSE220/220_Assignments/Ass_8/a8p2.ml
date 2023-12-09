let rec num_occurrences (lst: int list) (num: int) : int =
  match lst with
    [] -> 0
    | [x] -> if x = num then 1 else 0
    | x::t -> if x = num then 1 + num_occurrences t num else num_occurrences t num
      
let num_occurrences2 lst num = List.fold_right (fun x acc -> if x = num then acc + 1 else acc) lst 0

