import Data.List

-- g1
a1 :: [Integer]
a1 = gerador 0
    where gerador n 
            | n > 0 = [n] ++ gerador (n * (-1))
            | otherwise = [n] ++ gerador (n * (-1) + 1)

c1 :: [Integer]
c1 = concat $ unfoldr fn 0
    where fn n = if n == 0
                    then Just ([0], n + 1)
                    else Just ([n] ++ [n * (-1)], n +1)

-- g 2
a2 :: [Integer]
a2 = gerador 1
    where 
        gerador n
            | odd n = [n] ++ gerador (n + 1)
            | otherwise = [n * (-1)] ++ gerador (n + 1)

c2 :: [Integer]
c2 = unfoldr fn 1
    where fn n = if odd n
                    then Just (n, n + 1)
                    else Just (n * (-1), n + 1)

-- g3
a3 :: [Integer]
a3 = gerador 0
    where gerador n = [2^n] ++ gerador (n + 1)

c3 :: [Integer]
c3 = unfoldr fn 1
    where fn n = if n < 0
            then Nothing 
            else Just (n, n*2)

d3 :: [Integer]
d3 = iterate (*2) 1

-- g 4
a4 :: Integral a => a -> [a]
a4 n
    | n == 1 = [1]
    | otherwise = [n] ++ a4 (div n 2)

c4 :: Integral b => b -> [b]
c4 n = unfoldr fn n
    where fn n = if n == 0 
            then Nothing 
            else Just (n, div n 2)