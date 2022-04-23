maior :: (Num p, Ord p) => [p] -> p
maior [] = 0
maior (x:xs) = max x (maior xs)

removerMaior :: (Ord a, Num a) => [a] -> [a]
removerMaior xs = filter (< maior xs) xs