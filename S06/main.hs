import Data.List
import Data.Maybe

-- retorna o subvetor incluindo o elemento posição índice e lim elementos a esquerda e a direita
neib :: [a] -> Int -> Int -> [a]
neib xs index lim = ...

-- verifica se o valor existe no vetor
exists :: Eq a => a -> [a] -> Bool
exists y xs = ...

-- converte de digito para char
dig2char :: (Eq a, Num a, Enum a) => a -> Char
dig2char dig = ...

-- verifica se esse valor pode ser inserido nesse índice
fit :: (String, Int) ->  Int -> Int -> Bool
fit (xs, lim) index value = ...

-- pega as posições de todos os .
getHoles :: String -> [Int]
getHoles xs = ...

-- insere esse valor nesse index e retorna o novo vetor resultante
set :: String -> Int -> Int -> String
set xs index value = ...

-- tenta resolver o problema para essa posição
-- se é possível resolver, retorna Just resposta, senão Nothing
-- problema (xs, lim)
-- holes: lista de posições a serem preenchidas
-- hindex: posicao atual no vetor de holes
solve :: (String, Int) -> [Int] -> Int -> Maybe String
solve (xs, lim) holes hindex = ...

-- prepara a entrada para a função recursiva de resolução
mainSolver :: String -> Int -> String
mainSolver xs lim = ...

main :: IO ()
main = do
    xs <- getLine
    lim <- readLn :: IO Int
    putStrLn $ mainSolver xs lim