--gerar o n primeiros termos da sequencia de fibonacci
vetFib :: Int -> [Int]
vetFib 0 = []
vetFib 1 = [0]
vetFib 2 = [0,1]
vetFib n = (vetFib (n-1)) ++ [last (vetFib (n-1)) + last (vetFib (n-2))]
    
main :: IO ()
main = do
    print $ vetFib 2 == [0,1]
    print $ vetFib 6 == [0,1,1,2,3,5]
    print $ vetFib 9 == [0,1,1,2,3,5,8,13,21]