# EXERCICIOS

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

```

- @010 min2
- @011 min3
- @000 soma2

# 04. Operações básicas

- @504 Biblioteca de Listas

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