main = print(sum(map (\x -> if x `mod` 3 == 0 || x `mod` 5 == 0 then x else 0) [1, 2..999 ])) 
