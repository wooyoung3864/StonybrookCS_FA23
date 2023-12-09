(* Guideline

Homework for week 10. Due: 11:59 pm on Thursday, November 9th, 2023. 
 
Fill in all the  'failwith "Not Implemented" ' parts of this file, "09.ml", and then submit it on Brightspace. 


Special grading criteria:

- If your code does not compile, you will receive a grade of 0 for that exercise.

So, it is essential to check your code with Ocaml. 

*) 

(* 
   
Part 1: Syntax 

You will write an evaluator for simple arithmetic expressions.

Use the following type declaration that represents arithmetic expressions.
*)

    type exp =
      | Int of int
      | Add of exp * exp
      | Mul of exp * exp
      

(* Exercise 1 (Points = 20)

Encode the following arithmetic expressions as `exp`s:

1.  10 + 5
2.  (2 + 3) * 5
3.  3 * 0 * 3 * 5

*)

let expression1 = let e1 = Int 10 in let e2 = Int 5 in Add (e1, e2)

let expression2 = let e1 = Add (Int 2, Int 3) in Mul (e1, Int 5)

let expression3 = let e1 = Mul (Int 3, Int 0) in let e2 = Mul (Int 3, Int 5) in Mul (e1, e2)


(* Exercise 2 (Points = 20)
Write the function eval: exp -> int, which reduces expressions to integer values:
*)

let rec eval (e : exp) : int = 
    match e with   
    Int i -> i
    | Add(Int i1, Int i2) -> i1 + i2
    | Mul(Int i1, Int i2) -> i1 * i2
    | Add(exp1, exp2) -> eval(exp1) + eval(exp2)
    | Mul(exp1, exp2) -> eval(exp1) * eval(exp2)


(* Exercise 3 (Points = 20)
Write the function print : exp -> string , which returns a string representing `e`. The string should print arithmetic operators using infix notation and properly parenthesize expressions. Your solution may be similar to the following examples.

print (Add (Int 10, Int 5)) produces "(10 + 5)"
print (Mul (Add (Int 2, Int 3), Int 5)) produces "((2 + 3) * 5)"    
print (Mul ((Mul (Int 3, Int 0)), Mul (Int 3, Int 5))) produces "((3 * 0) * (3 * 5))"
*)

let rec print (e : exp) : string = 
    match e with
    Int i -> string_of_int i
    | Add(exp1, exp2) -> "(" ^ print(exp1) ^ " + " ^ print(exp2) ^ ")"
    | Mul(exp1, exp2) -> "(" ^ print(exp1) ^ " * " ^ print(exp2) ^ ")"


(* Part 2: Recursion*)
(* 
Exercise 4 (Points = 20)
Write the function is_sorted: int list -> bool to determine if the integers in an int lst are in sorted in ascending order.

Important note: The solution provided during the class has a subtal bug unfortunately. So you may not use that code directly. 
*)

let rec is_sorted (lst : int list) : bool = 
    match lst with
    [] | [_] -> true
    | [h; t] -> if (h > t) then false else true
    | h::t -> if (h > List.hd(t)) then false else is_sorted(t)


(* Exercise 5 (Points = 20)
    Write the function insert_sorted: int -> int list -> int list, which inserts an integer into a sorted list and preserves the sort-order. No need to check if the input is sorted. 

*)

let rec insert_sorted (n:int) (lst:int list) : int list = 
    match lst with
    [] -> [n]
    | h::t -> 
        if n <= h then n::h::t
        else h::insert_sorted n t 


(* Exercise 6 (Points = 20)
    Write the insertion_sort: int list->int list function, using `insert_sorted` as a helper.
*)

let rec insertion_sort (lst:int list) : int list = 
    match lst with
    [] -> []
    | h::t -> insert_sorted h (insertion_sort t)

