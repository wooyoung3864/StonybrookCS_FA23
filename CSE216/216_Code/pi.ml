let abs x = 
        if x >= 0 then x
        else -x

let rec power x n =
        if (x = 0. && n = 0) then failwith "undefined"
        else if n = 0 then 1.
        else if n < 0 then 1. /. (x *. power x ( (abs n) -1 ) )
        else x *. power x (n-1)

let rec pi n =
        if n = 0 then 4.
        else 4. *. (power (-1.) n) /. float_of_int(2 * n + 1) +. pi(n - 1)

let test() = print_float (pi 1000)

let _ = test()

let rec epsilon_pi guess guess' sign x epsilon =
        let good_enough = (abs_float(guess -. guess') <= epsilon) in 
        let term = guess +. (sign) *. 4. /. (x *. (x *. 1.) *. (x *. 2.)) in
        let incr_x = x +. 2. in
        let flip_sign = -. sign in
        
        if good_enough then guess
        else epsilon_pi term guess flip_sign incr_x epsilon

let() = Printf.printf "%f" (epsilon_pi 3. 0. 1. 2. 1e-10)