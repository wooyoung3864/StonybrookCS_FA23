let rec compress (lst: 'a list) : 'a list = 
  match lst with
  [] -> []
  | h::t -> let c = compress t in match t with
    [] -> [h]
    | hh::tt -> if(h =hh) then c else h::c

let rec compress2 (lst: 'a list) : 'a list = 
    match lst with 
      [] | [_] -> lst
      | x::(y::t) ->  if(x = y) then compress2 (y::t) else x::compress2 (y::t)

(* 
   Syntax: match e with p1 -> e1 | p2 -> e2 | ... | pn -> en
   Evaluation: 
      - Evaluate e to a value v
      - If pi is the first pattern to match v, then evaluate ei to value vi and return vi
          Note: pattern itself is NOT evaluated
      - Pattern matches value if it "looks like" the value
          - Pattern Ci(x1, ... , xn) matches value Ci(v1, ... , vn)
          - Wildcard pattern _ (i.e., underscore) matches any value
      - Lazy evaluation; only the relevant pn -> en is evaluated at runtime, only when it is needed
*)

(*
   Enhanced pattern Syntax:
    - Easy-to-read nested patterns can replace hard-to-read, nested match expressions
  
  Nested pattern matching:
    match (w, z) with (2, 3), 4 ---> w = (2, 3), z = 4
    match ((r, s), t) with (2, 3), 4 ---> r = 2, s = 2, t =3

  Examples:
    - Pattern a::b::c::d matches all lists with >= 3 elements
    - Pattern a::b::c::[] matches all lists with >= 3 elements
    - Pattern ( (a, b), (c, d) )  :: e matches all non-empty lists of pairs of pairs
*)

(*
  Example: zip 3 lists
*)
  let rec zip3 lists = 
      match lists with
      ([], [], []) -> [] (* ('a list * 'b list * 'c list) -> ('a * 'b *'c) list *)
      | (h1::t1, h2::t2, h3::t3) -> (h1, h2, h3)::zip3(t1, t2, t3)
      | _ -> raise (Failure "List length mismatch")

  let rec unzip3 lists =
      match lists with
      [] -> ([], [], [])
      | (a,b,c)::t -> let (lst1, lst2, lst3) = unzip3(t) in (a::lst1, b::lst2, c::lst3)

(*
OCaml concepts
- Let binding
- Recursion (let rec fun _ = match _ with base case -> base | recursive case -> fun _ )
    - Sum: let type mbti = ENFP | CUTE | ...
    - Record: let type time = {hour = int; minute = int; second = int}
- Pattern matching
- Types (sums, records, options, constructors)
- Lists
- Generic types ('a, 'b, 'c, etc)   
*)

(*
   Pattern Matching Rules
   Given a pattern p and a value v, decide 
      - Does pattern match value?
      - If so, what variable bindings are introduced?

   - If p is a variable x, the match succeeds and x is bound to v
   - If p is _, the match succeeds and no bindings are introduced
   - If p is a constant c, the match succeeds if v is c. No bindings are introduced.
   - If p is C, the match succeeds if v is c. No bindings are introduced.
   - If p is C p1, the match succeeds if v is C v1 (i.e., the same constructor) and p1 matches v1. The bindings are the bindings from the sub-match.
   - If p is (p1, ... , pn), and v is (v1, ... , vn), the match succeeds if p1 matches v1, and ..., and pn matches vn.
      The bindings are the union of all bindings from the sub-matches.
        - The pattern (x1, ... , xn) matches the tuple value (v1, ... , vn)
   - IF p is { f1 = p1, ... , fn = pn }, the match succeeds if p1 matches v1, and ..., and pn matches vn. The bindings are the union of all bindings from the sub-matches.
        - (and fields can be reordered)
        - The pattern {f1=x1; ... ; fn=xn} matches the record value {f1=v1; ... ; fn=vn}
*)

(* Exercise
  Using pattern matching, write three functions, one for each of the following properties. 
  Your functions should return true if the input list has the property and false otherwise.
   the list’s first element is hello
   the list has exactly two or four elements, do not use the length function
   the first two elements of the list are equal  
 
*) 

let match_first_hello lst =
    match lst with
    "hello"::t -> true 
    | _ -> false

let match_two_four lst = 
    match lst with
    [_; _] | [_; _; _; _] -> true 
    | _ -> false

  let match_first_two_equal lst = 
    match lst with
    [] | [_] -> true
    | x::y::t -> if x = y then true else false
