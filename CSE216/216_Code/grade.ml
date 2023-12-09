type grade = A | B | C | D | F

let to_num (g : grade) : float = match g with
        A -> 4.0
        | B -> 3.0
        | C -> 2.0 
        | D -> 1.0
        | F -> 0.0

let a = to_num A

let() = Printf.printf "%f" a
