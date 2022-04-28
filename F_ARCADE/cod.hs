line :: (Num a, Enum a) => a -> [a]
line n = [firstElement..lastElement]
    where
        firstElement = 1 + sum [1..n-1]
        lastElement = sum [1..n]

triangle :: (Eq a, Num a, Enum a) => a -> [[a]]
triangle 0 = []
triangle n = triangle (n-1) ++ [line n]