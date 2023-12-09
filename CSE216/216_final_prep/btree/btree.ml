type 'a btree = 
        Empty
        | Node of 'a * 'a btree * 'a btree

let mytree = Node (1, Node (2, Empty, Empty), Node (3, Node (4, Empty, Empty), Empty))
let mytree2 = Node (1, Node(1, Node(1, Empty, Empty), Node(1, Empty, Empty)), Node(1, Empty, Node(1, Empty, Node(1, Empty, Empty))))

let rec height tr = 
        match tr with
        Empty -> 0
        | Node(_, left, right) -> 1 + max (height left) (height right)

let rec is_balanced tr =
        match tr with
        Empty -> true
        | Node(_, left, right) ->
                let diff = abs(height left - height right) in
                if diff > 1 then false
                else is_balanced left && is_balanced right

let()  = Printf.printf "%d\n" (height mytree)
let()  = Printf.printf "%d\n" (height mytree2)

let _ = is_balanced mytree
let _ = is_balanced mytree2
