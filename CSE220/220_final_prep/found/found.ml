
let rec found lst y = 
        match lst with
        [] -> Printf.printf "NOT FOUND :-(\n" 
        | x::t ->
           if x = y then Printf.printf "FOUND.\n"
           else found t y

let() = found [1; 2; 3; 4; 5] 2
let() = found [1; 2; 3; 4; 5] 6
