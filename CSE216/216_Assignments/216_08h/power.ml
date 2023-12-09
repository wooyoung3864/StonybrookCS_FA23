(* CSE 216_07h, Wooyoung Jung 114744214 
 * 1. My solution for Problem 1 comprises the functions power and abs as shown below. 
 * 2. -4.75633848692e_05
 * 3. true *)

let rec power x n =
        if (x = 0. && n > 0) then 0.
        else if (x = 0. && n <= 0) then failwith "undefined"
        else if n = 0 then 1.
        else if n < 0 then 1. /. (x *. power x ( (abs n) -1 ) )
        else x *. power x (n-1)

let abs n =
        if n >= 0 then n
        else -n

let f1 = power (-27.6) (-3)
let f2 = ((-27.6) ** (-3.))

let() = print_float f1
let() = Printf.printf "\n%f\n" f2
let _ = assert (f1 = f2)
