let replace (str: char list) (operand: char) (operator: char) : char list = 
        let rec replace_helper str =
                match str with
                [] -> []
                | x::t -> if x = operand then operator::t else x::replace_helper(t) 
        in replace_helper str
