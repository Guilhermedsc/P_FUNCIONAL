quadperf :: (Num a, Enum a, Eq a) => a -> Bool
quadperf n = elem 1 [1 | x <- [1..n], (x*x) == n]