{- >>> gerador1
[0,1,-1,2,-2,3,-3...] -}
gerador1 :: [Integer]
gerador1 = [x | x <- [0..], x `mod` 2 == 0]
