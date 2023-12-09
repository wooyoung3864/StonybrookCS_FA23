type 'a binary_tree = 
    Empty
    | Node of 'a * 'a binary_tree * 'a binary_tree 
    (* Each Node contains a value of type 'a, and two other binary trees of type 'a 
       Branch into each subtree to traverse the entire tree *)

let rec get_height (tree : 'a binary_tree) : int = 
  match tree with
    Empty -> 0
    | Node(_, left, right) -> 1 + max (get_height left) (get_height right)

let rec mirror (tree : 'a binary_tree) : 'a binary_tree = 
    match tree with
    Empty -> Empty
    | Node(a, left, right) -> Node(a ,right, left) (*TODO*)


let my_tree = Node (2, Node (1, Empty, Empty), Node (3, Empty, Empty))
let () = assert ((get_height my_tree) = 2)
let _ = Printf.printf "Height of tree: %d\n" (get_height my_tree)

let rec drop (n: int) (lst:'a list) : 'a list = 
  if n <= 0  then lst else
    match lst with
      [] -> []
      | h::t -> if n = 1 then t else drop (n-1) t

let () = assert (drop 2 [4; 5; 6] = [6])
let () = assert (drop 9 [4; 5; 6] = [])

type edge = (string * string * int)
type graph = edge list

let rec min_weight (graph: graph) : int = 
    match graph with 
    [] -> 0
    | [(_,_,a)] -> a
    | (_,_,a)::(_,_,b)::t -> min (min a b) (min_weight t)

