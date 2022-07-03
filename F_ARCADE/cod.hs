--recebe duas listas ordenadas e retorna uma lista ordenada com os elementos de ambas
merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
    | x < y = x : merge xs (y:ys)
    | otherwise = y : merge (x:xs) ys
    
main :: IO ()
main = do
    print $ merge [1,3] [7,7,9] == [1,3,7,7,9]
    print $ merge [7,7,9] [1,3] == [1,3,7,7,9]
    print $ merge [1,3,5] [4,4,6,7] == [1,3,4,4,5,6,7]
    print $ merge [4,4,5,6,7] [1,3] == [1,3,4,4,5,6,7]