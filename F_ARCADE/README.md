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
- [14. Algoritmos CHATOS!](https://github.com/Guilhermedsc/P_FUNCIONAL/tree/main/F_ARCADE#14-novas)


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

{- 
[1,2,3] [4,5]
1:[2,3] [4,5]
1:2:[3] [4,5]
1:2:3[] [4,5]

[1,2,3,4,5] 
-}
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
soma_n1_n2 :: [Integer] -> Integer
soma_n1_n2 = sum . reverse . take 2 . reverse

vetFib :: (Eq a, Num a) => a -> [Integer]
vetFib 0 = []
vetFib 1 = [0]
vetFib 2 = [0,1]
vetFib n = 
    let p = vetFib (n - 1)
    in p ++ [soma_n1_n2 p]
````

- @034 ordenada
```haskell
````

- @033 inserir - inserir ordenado
```haskell
````

- @035 qsort
```haskell
````

- @036 merge - recursão
```haskell
````


## 14. Novas
- @507 Carro em Haskell
```haskell
````

- @078 Armário - Either, Map
```haskell
import Data.Either
import Data.Map
import qualified Data.Map as Map
data Estado = Alugado | Livre deriving (Show, Eq)
type Codigo = String
type Armario = (Estado, Codigo)
type Armarios = Map.Map Int (Estado, Codigo)

-- consulta : dado o número de um armário, retorna se ele está alugado ou não
-- retorna Nothing se o armário não existir
consulta :: Int -> Armarios -> Maybe Estado
consulta indice armarios
  | not exist = Nothing -- se o armário não existir, retorna Nothing
  | otherwise = Just (fst (armarios ! indice)) -- se o armário existir, retorna o estado do armário no indice indicado
  where
    exist = member indice armarios -- verifica se o armário existe

-- dado o número do armário, retorna Right armário ou Left "Armario nao existe"
pegarArmario :: Int -> Armarios -> Either String Armario
pegarArmario indice armarios
  | not exist = Left $ "Armario " ++ show indice ++ " nao existe" -- se o armário não existir, retorna Left "Armario indice nao existe"
  | otherwise = Right (armarios ! indice) -- se o armário existir, retorna Right o armário no indice indicado
  where
    exist = member indice armarios -- verifica se o armário existe

-- consultar: dado o número de um armário retorna "Right código"
-- Se não existir, retorna "Left Armario não existe", se já estiver alugado retorna "Left ja esta ocupado"
-- Utilize a função pegarArmario para obter o armário e verificar se ele existe
-- Não reescreva a mesma mensagem de erro, utilize a invocação do pegarArmário
pegarCodigo :: Int -> Armarios -> Either String Codigo
pegarCodigo indice armarios
  | isLeft armario = Left $ fromLeft "" armario -- se o armário não existir, retorna Left "Armario indice nao existe"
  | otherwise -- caso contrario
    =
    if ocupado
      then Left ("Armario " ++ show indice ++ " ja esta ocupado") -- se estiver ocupado retorna Left "Armario indice ja esta ocupado"
      else Right (snd $ fromRight (Alugado, "") armario) -- se não estiver ocupado, retorna Right o código do armário
  where
    armario = pegarArmario indice armarios -- pega o armário
    ocupado = Alugado == fst (fromRight (Alugado, "") armario) -- verifica se está ocupado

-- aluguel - se o armário existir e estiver desocupado, o estado do armário no mapa é alterado para alugado
-- reaproveite a função pegarCodigo para obter a chave atual e os erros de "não existe" e "está ocupado"
aluguel :: Int -> Armarios -> Either String Armarios
aluguel indice armarios
  | isRight codigo = Right $ insert indice (Alugado, fromRight "" codigo) armarios -- se o armário existir e estiver desocupado, o estado do armário no mapa é alterado para alugado
  | otherwise = Left $ fromLeft "" codigo -- se o armário não existir ou estiver ocupado, retorna Left (mensagem de erro de pegarCodigo)
  where
    codigo = pegarCodigo indice armarios -- pega o código do armário no indice indicado

-- para devolver um armário é necessário que ele exista, que esteja alugado e que o código esteja correto
-- utilize a função pegar armário para verificar a existência.
-- Se o armário não estiver alugado ou se o código estiver incorreto avise utilizando o Left.
devolucao :: Int -> Codigo -> Armarios -> Either String Armarios
devolucao indice codigo armarios
  | isLeft armario = Left $ fromLeft "" armario -- se o armário não existir, retorna Left "Armario indice nao existe"
  | otherwise -- caso contrario
    =
    if armario == Right (Alugado, codigo)
      then Right $ insert indice (Livre, codigo) armarios -- se o armário estiver alugado e o código estiver correto, modifica o estado do armario para Livre
      else
        if Livre == fst armarioR
          then Left $ "Armario " ++ show indice ++ " nao esta ocupado" -- se o estado for Livre, retorna Left "Armario indice nao esta ocupado"
          else Left "Codigo incorreto" -- se o código estiver incorreto, retorna Left "Codigo incorreto"
  where
    armario = pegarArmario indice armarios -- pega o armário no indice indicado
    armarioR = fromRight (Alugado, "") armario -- pega o armário Right no indice indicado

lockers :: Armarios
lockers =
  Map.fromList
    [ (100, (Alugado, "ZD39I")),
      (101, (Livre, "JAH3I")),
      (109, (Alugado, "893JJ")),
      (110, (Alugado, "99292"))
    ]

main :: IO ()
main = do
  let armarios0 = lockers
  print $ "01 " ++ show armarios0
  print $ "02 " ++ show (consulta 100 armarios0)
  print $ "03 " ++ show (consulta 101 armarios0)
  print $ "04 " ++ show (consulta 200 armarios0)
  print $ "05 " ++ show (pegarCodigo 100 armarios0)
  print $ "06 " ++ show (pegarCodigo 101 armarios0)
  print $ "07 " ++ show (pegarCodigo 200 armarios0)
  print $ "08 " ++ show (aluguel 100 armarios0)
  print $ "09 " ++ show (consulta 101 armarios0)
  let armarios1 = fromRight armarios0 $ aluguel 101 armarios0
  print $ "10 " ++ show (consulta 101 armarios1)
  print $ "11 " ++ show (fromLeft "" $ devolucao 103 "IQSA9" armarios1)
  print $ "12 " ++ show (fromLeft "" $ devolucao 101 "ZD39I" armarios1)
  let armarios2 = fromRight armarios1 $ devolucao 110 "99292" armarios1
  print $ "13 " ++ show (consulta 110 armarios2)
  print $ "14 " ++ show armarios2

{--
"01 fromList [(100,(Alugado,\"ZD39I\")),(101,(Livre,\"JAH3I\")),(109,(Alugado,\"893JJ\")),(110,(Alugado,\"99292\"))]"
"02 Just Alugado"
"03 Just Livre"
"04 Nothing"
"05 Left \"Armario 100 ja esta ocupado\""
"06 Right \"JAH3I\""
"07 Left \"Armario 200 nao existe\""
"08 Left \"Armario 100 ja esta ocupado\""
"09 Just Livre"
"10 Just Alugado"
"11 \"Armario 103 nao existe\""
"12 \"Codigo incorreto\""
"13 Just Livre"
"14 fromList [(100,(Alugado,\"ZD39I\")),(101,(Alugado,\"JAH3I\")),(109,(Alugado,\"893JJ\")),(110,(Livre,\"99292\"))]"
--}
````