(* Lecture 11b *)

(* 

1. If expressions are just matches. 
    The compiler can actually replace if expressions with match expressions.
      if e0 then e1 else e2 
        becomes
      match e0 with true -> e1 | false -> e2
        because
      type bool = true | false

      Equivalent to the ' condition ? (statement to be executed if true) : (statement to be executed if false) ' syntax in other
        imperative languages.

2. Option is a built in datatype.
    type 'a option = None | Some of 'a (* Useful when a NULL value has to be returned *)
      - None and Some are constructors
      - 'a means "any type"

    let string_of_intopt(x: int option) = 
      match x with
        None -> ""
        Some(i) -> string_of_int(i)

    Example: a = max(lst), print(a+1); lst = []. This would cause a NPE in runtime.
            But, in OCaml, encapsulating a inside an Option constructor gives us the option to return a None value instead,
                diverting the NPE problem entirely.
            For instance, if lst is an empty list, OCaml will return a result of None.
            Doing so, the compiler will know that a None type carries no data at all, and therefore, will not even attempt to execute traverse the list
            to compute a = max(lst) and print(a+1), as lst will have to carry some data in the first place for such operations to be valid.
            This way, OCaml interdicts and blocks off any entry points that cause exceptions in runtime before even going into runtime.
            All of this happens at compile time.

            Other imperative languages can only figure this out at runtime.

3. List is another built-in datatype.

    type 'a list = Nil | Cons of 'a * 'a list

    let rec append (xs: 'a list) (ys: 'a list) = 
        match xs with 
        [] -> ys
        | x::xs' -> x :: (append xs' ys)

    OCaml uses [], ::, @ instead as syntactic sugar for Nil, Cons, and append
    
*)

let rec max_lst (lst: int list) : int option =
  match lst with 
  [] -> None
  | h::t -> 
      match max_lst t with
        None -> Some h
        | Some a -> Some (max a h)

let lst = []

(*

4. Let expressions are pattern matches.
The syntax on the LHS of = in a let expression is really a pattern: let p = e
    - (Variables are just one kind of pattern)

Implies it's possible to do this let [x1; x2] = lst; [x1; x2] is a pattern that an "object" must have to be considered an instance of lst

*)

(*

5. Function arguments are patterns
A function argument can also be a pattern
    - Match against the argument in a function call: 
          let f p = e
Examples:
*)

let sum_triple (x, y, z) = x + y + z

(* 
'a: generic type, aka alpha; can be used instead of explicit parameter type declarations
similar to generics in Java and templates in C++.
In C++ auto a = ... is used to infer the type of a automatically.
Meanwhile, in Java, automatic type inference is not allowed.
OCaml actively uses and encourages type inference by default.
*)
let rec len (xs: 'a list) =
    match xs with 
    [] -> 0
    | _::xs' -> 1 + len xs'

(* Example: type 'a t = C1 [of t1] | C2 [of t2] | ... | Cn of [tn]
   type 'a option = None | Some of a
*)

