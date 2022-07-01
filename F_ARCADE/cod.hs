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