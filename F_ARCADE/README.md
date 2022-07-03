# EXERCICIOS

## Tópicos

- [03. Aquecimento](https://github.com/Guilhermedsc/P_FUNCIONAL/tree/main/F_ARCADE#03-aquecimento)
- [04. Operações básicas](https://github.com/Guilhermedsc/P_FUNCIONAL/tree/main/F_ARCADE#04-opera%C3%A7%C3%B5es-b%C3%A1sicas)
- [05. Recursão](https://github.com/Guilhermedsc/P_FUNCIONAL/tree/main/F_ARCADE#05-recurs%C3%A3o)
- [06. Data.List && Prelude](https://github.com/Guilhermedsc/P_FUNCIONAL/tree/main/F_ARCADE#06-datalist--prelude)
- [07. Zip e Fold](https://github.com/Guilhermedsc/P_FUNCIONAL/tree/main/F_ARCADE#07-zip-e-fold)
- [08. Maybe](https://github.com/Guilhermedsc/P_FUNCIONAL/tree/main/F_ARCADE#08-maybe)
- [10. Strings](https://github.com/Guilhermedsc/P_FUNCIONAL/tree/main/F_ARCADE#10-strings)
- [11. Math](https://github.com/Guilhermedsc/P_FUNCIONAL/tree/main/F_ARCADE#11-math)
- [12. Infinite lists](https://github.com/Guilhermedsc/P_FUNCIONAL/tree/main/F_ARCADE#12-infinite)
- [13. Ordenação](https://github.com/Guilhermedsc/P_FUNCIONAL/tree/main/F_ARCADE#13-ordena%C3%A7%C3%A3o)
- [14. Novas](https://github.com/Guilhermedsc/P_FUNCIONAL/tree/main/F_ARCADE#14-novas)


## 03. Aquecimento

- @004 countNeg
```haskell
countNeg :: (Ord a, Num p, Num a) => [a] -> p
countNeg [] = 0
countNeg (x:xs) = if x < 0 then 1 + countNeg xs else countNeg xs
```

- @005 final
```haskell
final :: Int -> [a] -> [a]
final x xs = reverse $ take x $ reverse xs
```

- @002 contarIguais - Contar quantos de 3 valores são iguais
```haskell
iguais :: (Eq a, Num p) => a -> a -> a -> p
iguais a b c
    | a == b && b == c = 3
    | a == b || b == c || a == c = 2
    | otherwise = 0
```

- @006 interior - miolo da lista
```haskell
interior :: [a] -> [a]
interior xs =  take ((length xs) - 2) (drop 1 xs)
```

- @008 gangorra
```haskell
gangorra :: (Num a, Num p, Ord a) => a -> a -> a -> a -> p
gangorra p1 c1 p2 c2
    | p1 * c1 == p2 * c2 = 0
    | p1 * c1 < p2 * c2 = 1
    | otherwise = -1
```

- @010 min2
```haskell
min2 :: Ord a => a -> a -> a
min2 x y = min x y
```

- @011 min3
```haskell
min3 :: Ord a => a -> a -> a -> a
min3 x y z = min z (min x y)
```

- @000 soma2
```haskell
soma2 :: Num a => a -> a -> a
soma2 x y = x + y
```


## 04. Operações básicas

- @014 @ !!
```haskell
at :: [a] -> Int -> a
at xs 0 = head xs
at (x : xs) ind = if ind < 0 then at xs (ind + length (xs)) else at xs (ind - 1)
```

- @015 @ elem
```haskell
pertence :: (Foldable t, Eq a) => a -> t a -> Bool
pertence x xs = elem x xs
```

- @016 @ length
```haskell
total [] = 0
total (x:xs) = 1 + total xs
```

- @017 @ maximum
```haskell
maior :: [Int] -> Int
maior [] = 0
maior [x] = x
maior (x:xs) = if x > (maior xs) then x else (maior xs)
```

- @023 @ init
```haskell
primeiros :: [a] -> [a]
primeiros xs = reverse $ tail $ reverse xs
```

- @028 @ splitAt
```haskell
divide :: [a] -> Int -> ([a], [a])
divide xs x = splitAt x xs
```

- @047 @ partition
```haskell
splitints :: Integral a => [a] -> ([a], [a])
splitints u = ([x | x<-u, odd x], [x | x<-u, even x])
```

- @007 somaImpares
```haskell
somaImpares :: Integral a => [a] -> a
somaImpares xs = sum $ filter (\x -> (x `mod` 2 /= 0)) xs
```

- @001 max3
```haskell
max3 :: Ord a => a -> a -> a -> a
max3 x y z = max (max x y) z
```

- @012 fatorial
```haskell
fatorial n = product [2..n]
```

- @030 uniao
```haskell
uniao :: Ord a => [a] -> [a] -> [a]
uniao [] [] =[]
uniao [] (x:xs) =(x:xs)
uniao (x:xs) [] =(x:xs)
uniao (x:xs)(y:ys)
    | x<y = x:uniao xs (y:ys)
    | x==y = x: uniao xs ys
    | otherwise = y: uniao (x:xs) ys

uniao' :: [a] -> [a] -> [a]
uniao' [] y = y
uniao' (x:xs) a@(y:ys) = if (pertence x a) then uniao' xs a else x:uniao' xs a
pertence :: a -> [a] -> Bool
pertence = error "not implemented"
```

- @031 intersec - intercessão entre listas
```haskell
intersec :: Eq a => [a] -> [a] -> [a]
intersec  [] y  = []
intersec  y  [] = []
intersec (x:xs) l2
    | elem x l2 = x:intersec  xs l2
    | otherwise = intersec  xs l2
```

- @009 sublist
```haskell
sublist x y xs
    | y < 0 = sublist (mod (length xs + x) (length xs)) (length new + 1) new
    | x < 0 = drop (length xs + x) (take y xs)
    | otherwise = drop x $ take y xs
    where new = take (length xs + y) xs

{- tentar ajeitar o error depois -}
```

- @051 paridade
```haskell
cont :: Num p => [Bool] -> p
cont [] = 0
cont (x:xs) =  if x then 1 + cont xs else cont xs

paridade :: [Bool] -> Bool
paridade xs = if (cont xs) `mod` 2 /= 0 then True else False
```

- @054 swap - trocando dois elementos de uma lista
```haskell
```

- @063 euler1 - soma dos múltiplos de 3 e 5
```haskell
euler1 :: Integral a => a -> a
euler1 n = sum [x | x <- [1..n-1], (x `mod` 3 == 0 || x `mod` 5 == 0)]
```


## 05. Recursão

- @013 fibonacci
```haskell
fib :: (Eq a, Num a, Num p) => a -> p
fib 0 = 0
fib 1 = 1
fib a = fib (a-1) + fib (a-2)
```

- @018 frequencia
```haskell
frequencia :: Eq a => a -> [a] -> Int
frequencia y ys = length (filter (== y) ys)
```

- @019 unico
```haskell
unico :: Eq a => a -> [a] -> Bool
unico y ys = if length (filter (== y) ys) == 1 then True else False 
```

- @020 maioresQue
```haskell
maioresQue :: Ord a => a -> [a] -> [a]
maioresQue y ys = filter (> y) ys
```

- @021 concatena
```haskell
concatena :: [a] -> [a] -> [a]
concatena [] ys = ys
concatena (x:xs) ys = x: concatena xs ys
```

- @026 alter
```haskell
alter :: Int -> [Int]
alter 0 = []
alter 1 = [1, -1]
alter n = alter (n-1) ++ [n, -n]
```

- @027 reverso
```haskell
reverso :: [a] -> [a]
reverso [] = []
reverso [x] = [x]
reverso (x:xs) = reverso xs ++ [x]
```

- @025 menores
```haskell

```

- @070 remover o maior elemento
```haskell
maior :: (Num p, Ord p) => [p] -> p
maior [] = 0
maior (x:xs) = max x (maior xs)

removerMaior :: (Ord a, Num a) => [a] -> [a]
removerMaior xs = filter (< maior xs) xs
```

- @029 intercal - intercalar duas listas
```haskell
intercal :: [a] -> [a] -> [a]
intercal xs [] = xs
intercal [] ys = ys
intercal (x:xs) (y:ys) = x: y: intercal xs ys
```

- @032 sequencia
```haskell
sequencia 0 _ = []
sequencia n m = m:(sequencia (n-1) (m+1))
```

- @037 rotEsq
```haskell
rotEsq :: (Eq t, Num t) => t -> [a] -> [a]
rotEsq 0 ys = ys
rotEsq n ys = (rotEsq (n-1) ((tail ys) ++ [head ys]))
```

- @038 rotDir
```haskell
rotDir :: (Eq t, Num t) => t -> [a] -> [a]
rotDir 0 ys = ys
rotDir n ys = (rotDir (n-1) (([last ys] ++ (reverse $ tail $ reverse ys))))
```

- @048 quadperf
```haskell
quadperf :: (Num a, Enum a, Eq a) => a -> Bool
quadperf n = elem 1 [1 | x <- [1..n], (x*x) == n]
```

- @053 deletee - remover primeira ocorrência
```haskell
deletee :: Eq t => t -> [t] -> [t]
deletee n [] = []
deletee n (x:xs) = if n == x then xs else x:(deletee n xs)
```

- @059 listacc - lista acumulativa
```haskell
listacc :: Num a => [a] -> [a]
listacc [] = []
listacc xs = listacc (init xs)++[sum xs]
```

- @061 line - linhas de um triângulo aritmético
```haskell
line :: (Num a, Enum a) => a -> [a]
line n = [firstElement..lastElement]
    where
        firstElement = 1 + sum [1..n-1]
        lastElement = sum [1..n]
```

- @062 triangle - triângulo aritmético
```haskell
line :: (Num a, Enum a) => a -> [a]
line n = [firstElement..lastElement]
    where
        firstElement = 1 + sum [1..n-1]
        lastElement = sum [1..n]

triangle :: (Eq a, Num a, Enum a) => a -> [[a]]
triangle 0 = []
triangle n = triangle (n-1) ++ [line n]
```


## 06. Data.List && Prelude

- @071 @ map
```haskell
mymap :: (a -> b) -> [a] -> [b]
mymap = map
````

- @073 @ filter
```haskell
myfilter :: (a -> Bool) -> [a] -> [a]
myfilter _ [] = []
myfilter x [a] = [a | x a]
myfilter x (y : ys) = if x y then y : myfilter x ys else myfilter x ys
````

- @022 @ tails - Data.List.tails
```haskell
mytails :: [a] -> [[a]]
mytails [] = [[]]
mytails a = a : mytails (tail a)
````

- @024 @ nub - Data.List.nub
```haskell
mynub :: [Int] -> [Int]
mynub = foldl (\xs y -> if y `notElem` xs then xs ++ [y] else xs) []
````


## 07. Zip e Fold

- @064 produtoEscalar - utilizando a função zip
```haskell
produtoEscalar :: Num a => [a] -> [a] -> a
produtoEscalar a b = sum [x * y | (x, y) <- zip a b]
````

- @065 indices - busca posições do elemento
```haskell
indices :: (Num a1, Enum a1, Eq a2) => a2 -> [a2] -> [a1]
indices a b = [snd x | x <- zip b [0 ..], fst x == a]
````

- @067 @ concatMap - Data.List.concatMap
```haskell
concatmap :: Foldable t => ([a1] -> a2 -> [a1]) -> t a2 -> [a1]
concatmap fn xs = foldl fn [] xs
````

- @043 ehPrimo
```haskell
ehPrimo :: Integral a => a -> Bool
ehPrimo a = foldl myfunc True [2 .. a - 1]
  where
    myfunc x y = x && a `mod` y /= 0
````

- @077 vigenere
```haskell
````

- @049 base - mudança de base
```haskell
restos :: Integral a => a -> a -> [a]
restos 0 b = []
restos a b = (a `mod` b) : restos (a `div` b) b

base :: Int -> Int -> [Char]
base a b = foldl (\x y -> (text !! y) : x) [] $ restos a b
  where
    text = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
````

- @083 fraction reduce
```haskell
reduce :: Integral b => (b, b) -> (b, b)
reduce (a, b) = (a `div` mdcAB, b `div` mdcAB)
  where
    mdcAB = mdc a b

mdc :: Integral t => t -> t -> t
mdc a 0 = a
mdc a b = mdc b (a `mod` b)
````


## 08. Maybe
- @069 @ elemIndex - Data.List
```haskell
myelemIndex :: (Num a1, Enum a1, Eq a2) => a2 -> [a2] -> Maybe a1
myelemIndex a b = if not (null elem) then head elem else Nothing
  where
    elem = [Just c | (c, d) <- zip [0 ..] b, d == a]
````

- @081 somaMaybe
```haskell
import Data.Maybe

somaMaybe :: Maybe Int -> Maybe Int -> Maybe Int
somaMaybe Nothing Nothing = Nothing
somaMaybe (Just x) Nothing = Just x
somaMaybe Nothing (Just y) = Just y
somaMaybe (Just x) (Just y) = Just (x + y)
````

- @082 filterMaybe
```haskell
````


## 10. Strings
- @039 upper
```haskell
import Data.Char

upper :: [Char] -> [Char]
upper cs = [toUpper c | c<-cs]
````

- @040 titulo
```haskell
import Data.Char

process :: [Char] -> [Char]
process (x:[]) = []
process (x:xs) = (if x == ' ' then toUpper(y) else toLower(y)) : process (xs)
       where y = head xs

titulo :: [Char] -> [Char]
titulo xs = process (' ':xs)
````

- @041 selec - apenas as chaves selecionadas
```haskell
selec :: [a] -> [Int] -> [a]
selec u p = [(u !! y) | y<-p]
````

- @042 isPalind - verificar palíndromo
```haskell
isPalind :: Eq a => [a] -> Bool
isPalind xs = xs == reverse xs
````


## 11. Math
- @044 sdig - soma dos dígitos
```haskell
sdig :: Integral p => p -> p
sdig 0 = 0
sdig x = (x `mod` 10) + (sdig (x `div` 10))
````

- @052 rev - inverter inteiro
```haskell
rev :: Show a => a -> Int
rev n = read string :: Int
    where
        string = reverse $ show n
````

- @049 base - mudança de base
```haskell
````


## 12. Infinite
- @072 @ repeat
```haskell
myrepeat x = x:myrepeat x
````

- @074 @ replicate
```haskell
myreplicate n x = if n > 0 then x : myreplicate (n-1) x else []
````

- @076 geradores
```haskell
````

- @075 expoentes - Contar quantas vezes um número divide o outro
```haskell
````

- @058 factors - fatores de um número
```haskell
````

- @080 decompor
```haskell
````

- @049 base - mudança de base
```haskell
````


## 13. Ordenação
- @046 compac
```haskell
````

- @003 vetFib
```haskell
vetFib :: Int -> [Int]
vetFib 0 = []
vetFib 1 = [0]
vetFib 2 = [0,1]
vetFib n = (vetFib (n-1)) ++ [last (vetFib (n-1)) + last (vetFib (n-2))]
````

- @034 ordenada
```haskell
ordenada :: Ord a => [a] -> Bool
ordenada xs = if (length xs) == 1 then True else if (head xs) > (head (tail xs)) then False else ordenada (tail xs)
````

- @033 inserir - inserir ordenado
```haskell
inserir :: Ord t => t -> [t] -> [t]
inserir x [] = [x]
inserir x (h:t) = if x < h then x:h:t else h:inserir x t
````

- @035 qsort
```haskell
qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort [y | y <- xs, y <= x] ++ [x] ++ qsort [y | y <- xs, y > x]
````

- @036 merge - recursão
```haskell
merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys)
    | x < y = x : merge xs (y:ys)
    | otherwise = y : merge (x:xs) ys
````


## 14. Novas
- [@507 Carro em Haskell](carro.hs)

- [@078 Armário - Either, Map](armario.hs)
