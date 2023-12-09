let rec move n src dst aux =
        if n = 1 then Printf.printf "Move from %s to %s\n" src dst
        else if n > 1 then
                begin
                        move (n-1) src aux dst;
                        move (1) src dst aux;
                        move (n-1) aux dst src;
                end
        else failwith "Not implemented yet"

let test() = move 3 "A" "C" "B"

let _ = test();
