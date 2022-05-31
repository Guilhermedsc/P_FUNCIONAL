import Data.List
import Data.Maybe

neib :: [a] -> Int -> Int -> [a]
neib xs index lim = drop lower . take upper $ xs
    where lower = max 0 (index - lim)
          upper = min (length xs) (index + lim + 1)
          
exists :: Eq a => a -> [a] -> Bool
exists y xs = isJust $ elemIndex y xs

dig2char :: (Eq a, Num a, Enum a) => a -> Char
dig2char dig = fromJust $ lookup dig $ zip [0..] "0123456789"

fit :: (String, Int) ->  Int -> Int -> Bool
fit (xs, lim) index value = not . exists (dig2char value) $ neib xs index lim

getHoles :: String -> [Int]
getHoles xs = [i | (c, i) <- zip xs [0..], c == '.']

set :: String -> Int -> Char -> String
set xs index v = take index xs ++ [v] ++ drop (index + 1) xs

solve :: (String, Int) -> [Int] -> Int -> Maybe String
solve (xs, lim) holes hindex = ...

mainSolver :: String -> Int -> String
mainSolver xs lim = ...

main :: IO ()
main = do
    xs <- getLine
    lim <- readLn :: IO Int
    putStrLn $ mainSolver xs lim