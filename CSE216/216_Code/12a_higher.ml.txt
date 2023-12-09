(* Map basics *)

let _ = List.map (fun x -> x+1) [12; 3; 4]
let _ = List.map (string_of_int) [12; 3; 4]

let rec map f xs = 
    match xs with
      [] -> []
      | x::xs' -> (f x)::(map f xs')

let _ = map (fun x -> x ^ "World") ["Hello "; "Juice "]

let is_even x = (x mod 2 = 0)
let lst = map is_even [1; 2; 3; 4]

let rec square_list (lst: int list) : int list = 
    match lst with
    [] -> []
    | h::t -> (h * h)::square_list(t)

let square x  = x * x

let lst = square_list [1; 2; 3; 4]
let lst2 = map square [5; 6; 7; 8]
let lst3 = List.map (square) [7; 8; 9; 10]

(* Filter *)

let rec filter f xs = 
  match xs with
    [] -> []
    | x::xs' -> if f x 
                then x::(filter f xs')
                else filter f xs' (* exclude head if !f x *)

let _ = List.filter (fun x -> x mod 2 = 0) [3; 4; 5; 6]
let _ = List.filter (fun x -> x > 10) [3; 4; 5; 6; -9]

let rec positive_list lst = 
  match lst with
  [] -> []
  | h::t -> if (h > 0) then h::positive_list(t) else positive_list(t)

let _ = positive_list [1; 2; -3; 4]

let positive_list2 = List.filter (fun x-> x > 0)
let _ = positive_list2 [1; 2; -3; 4]

(*Iterators*)

(*
- just like Iterators iterating over an Iterable in Java
- separate recursive traversal from data processing; same iterator can be used for processing different data 
- leads to modular and maintainable code
- iterators can change, omit, or combine data
*)

(* Folding *)

(*
v1.0
  folding [1; 2; 3] with (+) becomes 1 + 2 + 3 -> 6
  edge case: list could have 0 or 1 element, so we need an initial value   

v2.0: initial value = 0
  folding [1; 2; 3] with (+) becomes 0 + 1 + 2 + 3 -> 6
  fold [] (+) -> 0

  fold [1; 2; 3; 4] (*) -> 1 * 2 * 3 * 4 == 4! -> 24

*)


  Implementation details
  
  left-folding: iterate left-to-right
  right-folding: iterate right-to-left

  fold [1; 2; 3] (+)
    left-fold: ((0+1)+2)+3
    right-fold: 1+(2+(3+0))

  Not all operators (i.e., subtraction, division, exponentiation) are associative, therefore we need right-folding sometimes
*)

let rec fold_left f acc xs = (* function f, initial accumulator acc, list xs *)
    match xs with
      [] -> acc (* initial value acc *)
      | x::xs' -> fold_left f (f acc x) xs' (* apply f to new acc; acc' = f acc b 
                                                example: (*) 3 = 3 * b *)*)

(*
  fold_left f acc [a; b; c]
  computes f (f (f acc a) b) c   
*)

(*
  The folding operation is known as scan or reduce in other functional langugaes.
  Google organizes large-scale parallel data computations with Map-Reduce   
*)

(*
  Other functions can be derived from fold:
    let rev xs = fold_left (fun xs x -> x::xs) [] xs
    let length xs = fold_left (fun a _ -> a+1) 0 xs
    let map f xs = fold_right
      (fun x a -> (f x)::a) xs []
    let filter f xs = fold_right
      (fun x a -> if f x then x::a else a) xs []   
*)

(* Exercise
  List.fold_left (fun xs x -> x::xs) [] [1; 2; 3; 4]
     [] eats 1 -> 1::[] = [1]
     [1] eats 2 -> 2::[1] = [2; 1]
     [2;1] eats 3 -> 3::[2;1] -> [3; 2; 1]
     [3; 2; 1] eats 4 -> 4::[3; 2; 1] = [4; 3; 2; 1]
*)

(* Exercise
  List.fold_left (fun a _ -> a+1) 0 [1; 2; 3; 4] // catches an element and performs a++ to compute lst.length
    0 eats 1 -> 0 + 1 = 1
    1 eats 2 -> 1 + 1 = 2
    2 eats 3 -> 2 + 1 = 3
    3 eats 4 -> 3 + 1 = 4
    ...
    (a ∈ lst) eats n -> n + 1 = n++ // type or value of element doesn't matter; 
                                    // discards elements and just increments a by 1 until all elements are exhausted
*)