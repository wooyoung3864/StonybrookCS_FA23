type point = Point2D of int * int

let double (p: point) : point =
        match p with
                Point2D (x, y) -> Point2D (2*x, 2*y)

let add (p1: point) (p2: point) : point =
        match p1, p2 with
                Point2D (x1, y1), Point2D (x2, y2) -> Point2D (x1+y1, x2+y2)

let repr (p: point) : string = 
        match p with
                Point2D(x, y) -> "<" ^ string_of_int(x) ^ ", " ^ string_of_int(y) ^ ">"


let p1 = Point2D (2, 3)
let p2 = Point2D (3, 4)

let _ = Printf.printf "%s\n" (repr p2)
let _ = Printf.printf "%s\n" (repr (double p1))
let _ = Printf.printf "%s\n" (repr (add p1 p2))
