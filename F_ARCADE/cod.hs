concatena :: [a] -> [a] -> [a]
concatena [] ys = ys
concatena (x:xs) ys = x: concatena xs ys