let _ = ["Hello"; "World"]
let _ = [[1]; [1]]
let _ = (1, "bar")
let _ = [(1, 2, "foo"); (3, 4, "bar")]
let f x y z = x + y + z
let f2 = f 1 2
let _ = f2 3

let f x  = x *. 3.14
let f (x, y) = x + y
let f x y = if y then x else x
let f x y z = if x then y else y
let rec f x = if (x = 0) then 1 else 1 + f(x-1)

let rec lucas n = 
  if n = 0 then 2
  else if n = 1 then 1
  else lucas(n-1) + lucas(n-2)

let rec rev (lst: 'a list) : 'a list =
  match lst with
  [] -> []
  | [x] -> [x]
  | a::b::t -> rev(t) @ [b; a]
let _ = rev [5; 6; 7]
let() = assert(rev [5; 6; 7] = [7; 6; 5])

let rec last (lst: 'a list) : 'a option =
  match lst with
  [] -> None
  | [x] -> Some x
  | h::t -> last (t)
let lst = [1; 2; 5; 7]
let _ = last lst
let() = assert(last lst = Some 7)

let rec compress (lst: 'a list) : 'a list = 
  match lst with
  [] -> []
  | [x] -> [x]
  | x::y::t -> if x = y then compress(y::t) else x::compress(y::t)

let lst2 = ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"]
let lst2_comp = compress lst2
let() = assert(lst2_comp = ["a"; "b"; "c"; "a"; "d"; "e"])

let length l = List.fold_right (fun _ acc -> acc + 1) l 0
let length_lst = length lst
let() = assert(length_lst = 4)

let filter f l = List.fold_right (fun x acc -> if f x then x::acc else acc) l []
let filter_l = filter (fun x -> x mod 2 = 1) lst
let() = assert (filter_l = [1; 5; 7])
