let rec divide (input: int * int) : (int * int) = 
  let (a, b) = input in
        if a < b then (0, a)
        else 
          let (quotient, remainder) = divide(a-b, b) in
          (quotient + 1, remainder)


