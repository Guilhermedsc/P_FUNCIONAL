sublist x y xs
    | y < 0 = sublist (mod (length xs + x) (length xs)) (length new + 1) new
    | x < 0 = drop (length xs + x) (take y xs)
    | otherwise = drop x $ take y xs
    where new = take (length xs + y) xs

{- tentar ajeitar o error depois -}