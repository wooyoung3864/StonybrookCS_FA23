let rec is_sorted (lst: int list) : bool = 
        match lst with
        [] | [_] -> true
        |[x; y] -> (x <= y) 
        | h::t -> (h <= List.hd t) && is_sorted(t)

let print_bool (b: bool) : unit =
  match b with
        true -> Printf.printf "true\n"
        | false -> Printf.printf "false\n"

let insert_sorted: ((n: int) : (lst: int list)) : int list =
        match lst with
        [] -> [n]
        | [x] -> if(n >= x) then [x; n] else [n; x]
        | h::t -> 

let _ = print_bool(is_sorted [4; 3; 3])


