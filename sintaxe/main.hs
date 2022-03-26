a :: Double
a = 3 + 1 * 2 / 4

d :: [Char]
d = "isso é uma " ++ "string muito grande"  --tentar colocar acentos na linguagem haskell

e :: [Char]
e = ['G', 'u', 'i', 'l', 'h', 'e', 'r', 'm', 'e']

f :: Char
f = e !! 0

g :: [Integer]
g = [1, 2, 3, 4]

h :: [Integer]
h = [1..4]

i :: [Char]
i = ['A'..'Z']

j :: [Integer]
j = [4, 6..10]

k :: [Integer]
k = [9, 6..1]

l :: [Integer]
l = [1..]   --só vai criar até onde precisar

m :: [Integer]
m = [1, 3..7] ++ [9..15]

n :: [Integer]
n = 0:m     --pushfront no começo da lista

{- 
head [1..9] -> 1 -> primeiro elemento da lista
last [1..9] -> 9 -> ultimo elemento da lista
tail [1..9] -> [2, 3, 4, 5, 6, 7, 8, 9] -> lista sem o primeiro elemento
take 3 [1..9] -> [1, 2, 3] -> pega os 3 primeiros elementos
drop 3 [1..9] -> [4, 5, 6, 7, 8, 9] -> retorna tudo o que não são os 3 primeiros elementos

elem 5 [1..9] -> True -> verifica se o elemento está na lista
null [] -> True -> verifica se a lista está vazia
legth [1..9] -> 9 -> verifica o tamanho da lista
replicate 3(repetição) 5(elemento) -> [5, 5, 5] -> cria uma lista com o elemento repetido
reverse [1..9] -> [9, 8, 7, 6, 5, 4, 3, 2, 1] -> inverte a lista

g = splitAt 3 [1..9] -> ([1, 2, 3], [4, 5, 6, 7, 8, 9]) -> divide a lista em duas partes
fst g -> [1, 2, 3] -> primeira parte da lista
snd g -> [4, 5, 6, 7, 8, 9] -> segunda parte da lista

concat [1, 2, 3] [4, 5, 6] -> [1, 2, 3, 4, 5, 6] -> junta duas listas

sum [1, 2, 3] -> 6 -> soma todos os elementos da lista
maximum [1, 2, 3] -> 3 -> retorna o maior elemento da lista
minimum [1, 2, 3] -> 1 -> retorna o menor elemento da lista
-}

{- 
[x*2 | x <- [1..5]] -> [2, 4, 6, 8, 10] -> multiplica cada elemento por 2

[x*2 | x <- [1..9], x > 5] -> [12, 14, 16, 18, 20] -> multiplica cada elemento por 2 e soma os elementos que são maiores que 5
-}