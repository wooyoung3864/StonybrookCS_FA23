(* 2. [1, 2, 3] -> 1 + 4 + 9 = 14 *)
(*  (((a+1)+2)+3) *)

let sum_of_squares (lst: int list) : int = 
  List.fold_left (fun acc x -> acc + x * x) 0 lst

let test1 = sum_of_squares [2; 3; 4; 5]
let() = assert (test1 = 54)

(* 3. Create a function that calculates the weighted average of a list of grades, where each grade is paired with its corresponding weight.
      For example, calculate_weighted_average [(90.0, 0.3); (80.0, 0.4); (70.0, 0.3)] should return the weighted average: (90.0 * 0.3) + (80.0 * 0.4) + (70.0 * 0.3) / (0.3 + 0.4 + 0.3).
 *)

 type grade = float * float
 let calculate_weighted_average (g: grade list) : float =
    let sum_weight = List.fold_left (fun acc x -> acc +. snd x) 0.0 g in
      List.fold_left (fun acc x -> acc +. (fst x *. snd x) /. sum_weight) 0.0 g

let g = [(90.0, 0.3); (80.0, 0.4); (70.0, 0.3)]

let _ = calculate_weighted_average g

(* 
   4. Folding is so general, that we can write many list function in terms of List.fold_left or
      List.fold_right. Fill in the todo below.
*)

let length (l: 'a list) = List.fold_left (fun acc _ -> acc + 1) 0 l
let length2 (l: 'a list) = List.fold_right (fun acc _ -> acc + 1) l 0
let rev l = List.fold_left (fun acc c -> c :: acc) [] l
let map f l = List.fold_right (fun x acc -> (f x)::acc) l []
let _ = map (fun x -> x * x) [1; 2; 3; 4; 5; 6; 7; 8; 9]

let map2 f l = 
  let l = List.fold_left (fun acc x -> x::acc) [] l in
    List.fold_left (fun acc x -> (f x)::acc) [] l
let _ = map2 (fun x -> x * x) [1; 2; 3; 4; 5; 6; 7; 8; 9]

let filter f l = 
List.fold_right (fun x acc -> if f x then x::acc else acc) l []
let _ = filter (fun x -> (x mod 2) = 1) [1; 2; 3; 4; 5; 6; 7]

let filter2 f l = List.fold_left (fun x acc -> if f x then acc::x else x) [] l
  let _ = filter (fun x -> (x mod 2) = 1) [1; 2; 3; 4; 5; 6; 7]

let apply_twice f x = f (f x)
let _ = apply_twice (fun x -> 2 * x) 5

let rec count_elements (lst: 'a list) (e: 'a) : int =
  match lst with
  [] -> 0
  | h::t -> let count = (count_elements t e) in if e = h then (count + 1) else count

let _ = count_elements [1; 2; 3; 4; 4; 4; 5] 4

let rec length3 l = List.fold_right (fun x acc -> acc + 1) l 0
let _ = length3 [1; 2; 3; 4];;

let rec length4 l = List.fold_left (fun acc x -> acc + 1) 0 l
let _ = length4 [1; 2; 3; 4]

let rec append x y = List.fold_right (fun x acc -> x::acc) x y
let _ = append [1; 2] [3; 4]

let rec append2 x y = List.fold_left (fun acc y -> y::acc) y (List.rev x)
let _ = append2 [1; 2] [3; 4]

let pack list =
  let rec aux current acc = function
    | [] -> []    (* Can only be reached if original list is empty *)
    | [x] -> (x :: current) :: acc
    | a :: (b :: _ as t) ->
       if a = b then aux (a :: current) acc t
       else aux [] ((a :: current) :: acc) t  in
  List.rev (aux [] [] list);;

(* List.fold_left: ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a *)
(* List.fold_right: ('a -> 'b -> 'b) -> 'a -> 'b *)

(* 
    let twice f x = f(f x)
    ('a -> 'a) -> 'a -> 'a

    let compose f g x = f (g x)
    ('a -> 'b) -> ('c -> 'a) -> ('c -> 'b)
*)

