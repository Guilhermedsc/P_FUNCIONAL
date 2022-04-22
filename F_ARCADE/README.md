# EXERCICIOS

## Tópicos

- [03. Aquecimento](https://github.com/Guilhermedsc/P_FUNCIONAL/tree/main/F_ARCADE#03-aquecimento)
- [04. Operações básicas](https://github.com/Guilhermedsc/P_FUNCIONAL/tree/main/F_ARCADE#04-opera%C3%A7%C3%B5es-b%C3%A1sicas)
- [05. Recursão](https://github.com/Guilhermedsc/P_FUNCIONAL/tree/main/F_ARCADE#05-recurs%C3%A3o)
- [06. Data.List && Prelude]()
- [07. Maybe]()
- [07. Zip e Fold]()
- [10. Strings]()
- [11. Math]()
- [12. Infinite lists]()
- [13. Ordenação]()
- [14. Algoritmos CHATOS!]()
- [15. Novas]()

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

# 04. Operações básicas

- @014 @ !!
```haskell
at :: [a] -> Int -> a
at xs 0 = head xs
at (x : xs) ind = if ind < 0 then at xs (ind + length (xs)) else at xs (ind - 1)

main :: IO ()
main = do
    print $ at [2,7,3,9] 2  --3
    print $ at [2,7,3,9] 0  --2
    print $ at [2,7,3,9] (-1)   --9
    print $ at [2,7,3,9] (-2)   --3
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

# 05. Recursão

- @013 fibonacci
```haskell
fib :: (Eq a, Num a, Num p) => a -> p
fib 0 = 0
fib 1 = 1
fib a = fib (a-1) + fib (a-2)
```

- @018 frequencia
```haskell

```

- @019 unico
```haskell

```

- @020 maioresQue
```haskell

```

- @021 concatena
```haskell

```

- @026 alter
```haskell

```

- @027 reverso
```haskell

```

- @025 menores
```haskell

```

- @070 remover o maior elemento
```haskell

```

- @029 intercal - intercalar duas listas
```haskell

```

- @032 sequencia
```haskell

```

- @037 rotEsq
```haskell

```

- @038 rotDir
```haskell

```

- @048 quadperf
```haskell

```

- @053 deletee - remover primeira ocorrência
```haskell

```

- @059 listacc - lista acumulativa
```haskell

```

- @061 line - linhas de um triângulo aritmético
```haskell

```

- @062 triangle - triângulo aritmético
```haskell

```