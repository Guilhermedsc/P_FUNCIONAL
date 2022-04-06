at :: [a] -> Int -> a
at xs 0 = head xs
at (x : xs) ind = if ind < 0 then at xs (ind + length (xs)) else at xs (ind - 1)

{- teste -}
main :: IO ()
main = do
    print $ at [2,7,3,9] 2  --3
    print $ at [2,7,3,9] 0  --2
    print $ at [2,7,3,9] (-1)   --9
    print $ at [2,7,3,9] (-2)   --3