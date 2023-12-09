let rec fib (n: int) : int = 
  if n < 0 then failwith "Invalid input."
  else if n = 0 then 0
  else if n <= 1 then 1 
  else fib(n-1) + fib(n-2)

let rec square_list (lst: int list) : int list = 
  match lst with 
  [] -> [] 
  | h::t -> (h*h)::square_list(t)

let rec compress (lst: 'a list) : 'a list = 
  match lst with
  [] -> []
  | [x] -> [x]
  | x::y::t -> if x = y then compress(y::t) else x::compress(y::t)