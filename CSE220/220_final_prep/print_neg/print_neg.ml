let rec print_neg lst =
  	match lst with
  	[] -> ()
  	| x::t -> if x < 0 then begin
  		Printf.printf "%d\n" x;
  		print_neg t;
  		end
  		else print_neg t
