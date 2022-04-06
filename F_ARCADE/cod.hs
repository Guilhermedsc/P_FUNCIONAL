interior :: [a] -> [a]
interior xs =  take ((length xs) - 2) (drop 1 xs)