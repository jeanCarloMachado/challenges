
fib 1 counter = 1 0
fib 2 counter = 2 (counter+1)
fib n counter = (fib(n-1) + fib(n-2)) (if n `mod` 2 == 0 then counter+1 else counter)

-- main = print (map (\x -> fib x) [1,2..100])

-- fib 32 0

main = print 66
