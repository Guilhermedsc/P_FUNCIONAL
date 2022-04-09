# EXERCICIOS

## Tópicos

- [03. Aquecimento](https://github.com/Guilhermedsc/P_FUNCIONAL/tree/main/F_ARCADE#03-aquecimento)
- [04. Operações básicas](https://github.com/Guilhermedsc/P_FUNCIONAL/tree/main/F_ARCADE#04-opera%C3%A7%C3%B5es-b%C3%A1sicas)
- [05. Recursão]()
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
fatorial 0 = 1
fatorial n = n * fatorial (n - 1)
```

- @030 uniao
```haskell
```

- @031 intersec - intercessão entre listas
```haskell
```

- @009 sublist
```haskell
```

- @051 paridade
```haskell
```

- @054 swap - trocando dois elementos de uma lista
```haskell
```

- @063 euler1 - soma dos múltiplos de 3 e 5
```haskell
```