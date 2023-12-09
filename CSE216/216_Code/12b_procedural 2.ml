(* Lecture 12b: Procedural Abstractions in OCaml *)

(* Nilakantha Series: a decent method of computing pi quickly & precisely
  pi ~= 3 + 4/(2*3*4) - 4/(4*5*6) + 4/(6*7*8) - 4/(8*9*10) + ...
*)

(* Pseudocode
  guess = 3
  Loop
    If guess is good then return guess
else guess = guess + next_item   
*)

(* code v0.1 -> v0.2 
   let rec pi_iter guess =  // find a good enough result based on current guess, old guess, and epsilon
    if good_enough guess then guess
    else pi_iter guess + next_item

    let rec pi_iter guess old_guess tol // tol is the tolerance, or epsilon
      if abs(guess - old_guess) < tol then guess // memorize old_guess by storing it as a function parameter
      else pi_iter guess + next_item guess tol // guess += pi_iter(next_item(guess, tol))
*)

(* code v0.2 -> v0.3; continue refining by defining next_item
   let rec pi_iter guess old_guess x sign tol // sign can be inferred by current position x
      if abs(guess - old_guess) < tol then guess
      else pi_iter [guess + sign * 4 / (x(x+1)(x+2))] guess (x+2) sign * (-1) tol 
      // term inside brackets is next_item, guess becomes old guess
*) 

(* Refined final version with let-binding to declare good_enough and term as local functions: *)
let rec pi_iter guess old_guess x sign tol =
      let good_enough guess old_guess tol =
        (abs_float (guess -. old_guess)) <= tol (* default abs is int -> int; use abs_float *) in
      let term x sign =
          sign *. 4. /. (x *. (x +. 1.) *. (x +. 2.)) in

  if good_enough guess old_guess tol
    then guess
      else pi_iter (guess +. (term x sign)) guess (x +. 2.) (-. sign) tol 
              (* guess += (next_term * sign), old_guess = guess, x += 2, sign *= -1, and tol remains the same *)

let pi tol = 
  pi_iter 3. 0. 2. 1. tol

let _ = pi 1e-10

let area_circle r = 
  let pi = 3.14 in
  let square = r * r in
  
  pi *. float_of_int square

let _ = area_circle 2
let double x = 2 * x
let quad x = 
  double (double x)
let square x = x * x
let fourth x =
  square (square x)

let _ = quad 2
let _ = fourth 2

(* Analagous to lambda calculus *)
let twice f x = f (f x)

let quad2 x = twice double x
let fourth2 x = twice square x

let _ = quad2 2
let _ = fourth2 2

let supershy x = twice sin x

let rec pack (lst: 'a list) : 'a list = 
  let insert (h: 'a) (t: 'a list) : 'a list =
    if h = List.hd t then h::t in

    match lst with 
    [] -> [[]]
    | h::t -> insert h (pack t)



