(* slice an array into a subarray by the given index range:
*       slice [1; 2; 3; 4] 1 3 -> [2; 3] *)

let rec slice_helper lst a b count =
match lst with
        [] -> [] 
        | h::t -> if (count >= a && count < b) then h::slice_helper t a b (count+1)
                  else slice_helper t a b (count+1)

let slice lst a b =
        slice_helper lst a b 0

let () =
let result = slice [1; 2; 3; 4] 1 6 in
  List.iter (Printf.printf "%d ") result
