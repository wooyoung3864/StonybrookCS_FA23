(* Guideline

Homework for week 09. Due: 11:59 pm on Thursday, November 2nd, 2023. 
 
Fill in all the  'failwith "Not Implemented" ' parts of this file, "09.ml", and then submit it on Brightspace. 


Special grading criteria:

- If your code does not compile, you will receive a grade of 0 for that exercise.

So, it is essential to check your code with Ocaml. 

*)

(* Comment for Professor Fu- All of my code was written with the following precondition in mind: 
 *                              0 <= h <= 24; 0 <= m <= 60; 0 <= s <= 60.                              
 *                              Any inputs that exceed this range will cause undefined behavior that I intentionally did not 
 *                              account for. I could've thrown an exception with failwith "Invalid input," but then you said it 
 *                               was fine to leave it as it is. Thank you for the clarification! - Wooyoung *)

(* Exercise 1. Points = 20.

Write a function, `seconds_since_midnight`, of type int -> int -> int -> int, which returns the number of seconds elapsed since midnight. 

*)

let seconds_since_midnight h m s = (h * 3600) + (m * 60) + s

(* In the following, we define a type, `time`, which holds the hour, minute, and second as separate values. Do not change this type. *)
type time = {hour: int; minute:int; second:int}

(* Exercise 2 Points = 20.

Write a function `seconds_since_midnight2` of type time -> int.
*)

let seconds_since_midnight2 t = 
  let { hour = h; minute = m; second = s } = t
  in (h * 3600) + (m * 60) + s


(* Exercise 3. Points = 20.

Write a function `seconds_to_time`, of type int -> time, which takes the seconds elapsed since midnight as its argument and returns the corresponding time.
*)

let seconds_to_time sec = 
  { hour = sec / 3600; minute = (sec mod 3600) / 60; second = (sec mod 3600) mod 60 }

(* Exercise 4. Points = 20.

Write a function `time_diff `, of type  time -> time -> int,  which calculates the number of seconds that have elapsed between `t1` and `t2`:
*)

let time_diff t1 t2 =
  	let s1 = seconds_since_midnight2 t1 in
  	let s2 = seconds_since_midnight2 t2 in
  	if(s1 > s2) then (s1 - s2) else (s2 - s1) 


(* Exercise 5. Points = 20.

Write a function `tick`, of type time -> time, which increments `t` by one second and returns the new time:
*)

let tick t =
  	let { hour = h; minute = m; second = s } = t in
  		if(h == 23 && m == 59 && s == 59) then { hour = 0; minute = 0; second = 0 }
  		else if(m == 59 && s == 59) then { hour = h+1; minute = 0; second = 0 }
  		else if(s == 59) then { hour = h; minute = m+1; second = 0 }
  		else { hour = h; minute = m; second = s+1 }

(*
### Exercise 6. Points = 20

Write a function `all_positive`, of type int list -> bool, which returns `true` if all the integers in the input list are positive.

*)
let rec all_positive (lst: int list) : bool = 
        match lst with
        [] -> true
        | [h] -> if(h <= 0) then false else true
        | h::t -> if(h <= 0) then false else all_positive(t)
        

let _ = Printf.printf "%d\n\n" (seconds_since_midnight 21 22 59) (* Test case for Exercise 1 *)
let t = seconds_since_midnight2 {hour = 13; minute = 54; second = 29} (* Test case for Exercise 2 *)
let _ = Printf.printf "%d\n\n" t
let t1 = seconds_to_time 50069
let t2 = seconds_to_time 76979
let _ = let {hour = h; minute = m; second = s} = t1 in Printf.printf "%02d:%02d:%02d\n\n" h m s (* Test case for Exercise 3*)
let _ = Printf.printf "%d\n\n" (time_diff t1 t2) (* Test case for Exercise 4 *)

(* Test cases for Exercise 5 *)
let t3 = tick {hour = 23; minute = 59; second = 59} (* h == 23 && m == 59 && s == 59 *)
let t4 = tick {hour = 22; minute = 59; second = 59} (* m == 59 && s == 59 *)
let t5 = tick {hour = 09; minute = 24; second = 59} (* s == 59 *)
let t6 = tick {hour = 23; minute = 59; second = 58}

let _ = let {hour = h; minute = m; second = s} = t3 in Printf.printf "%02d:%02d:%02d\n" h m s
let _ = let {hour = h; minute = m; second = s} = t4 in Printf.printf "%02d:%02d:%02d\n" h m s
let _ = let {hour = h; minute = m; second = s} = t5 in Printf.printf "%02d:%02d:%02d\n" h m s
let _ = let {hour = h; minute = m; second = s} = t6 in Printf.printf "%02d:%02d:%02d\n\n" h m s

(*Test cases for Exercise 6 *)
let l1 = [1; 2; 3; 4; 5; 6; 7; 8; 9; 322; 0xFFFF] (* All positive values; should return true *)
let l2 = [0; 1; 2; 3; 4; 5] (* Zero at the beginning; false *)
let l3 = [1; 2; -6; 3; 3; 5] (* -6 in the middle; false *)
let l4 = [-6; 4; 5; 2] (* -6 at the beginning; false *)
let l5 = [1; 2; 3; 5; -9] (* -9 at the end; false *)
let l6 = [1; 2; 3; 4; 0; 6; 5; 9] (* 0 in the middle; false *)
let l7 = [-34; -49; -2333; -95] (* all negative; false *)
let l8 = [] 

let print_bool (b: bool) : unit =
        if(b == true) then Printf.printf "true\n"
        else Printf.printf "false\n"

let _ = print_bool (all_positive l1)
let _ = print_bool (all_positive l2)
let _ = print_bool (all_positive l3)
let _ = print_bool (all_positive l4)
let _ = print_bool (all_positive l5)
let _ = print_bool (all_positive l6)
let _ = print_bool (all_positive l7)
let _ = print_bool (all_positive l8)

let () = assert (seconds_to_time 86400 = {hour = 0; minute = 0; second = 0})