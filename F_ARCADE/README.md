# EXERCICIOS

## 03. Aquecimento

- @004 countNeg
```Haskell

```

- @005 final
```hs
```

- @002 contarIguais - Contar quantos de 3 valores são iguais
```hs
```

- @006 interior - miolo da lista
- @008 gangorra
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
```