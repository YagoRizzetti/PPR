consigna1 :: Integer -> Integer -> Integer
consigna1 x n 
	| n > 0 = x + 1
	| n < 0 = x - 1
	| otherwise = 0

consigna2 :: [Integer] -> Integer -> [Integer]
consigna2 [] n = []
consigna2 (x:xs) n = consigna1 x n : consigna2 xs n

factorial :: Integer -> Integer
factorial n 
	| n == 0 = 1
	| otherwise = n * factorial(n - 1)


consigna3 :: Integer -> Integer -> Float
consigna3 x n 
	| n == 0 = 1
	| otherwise = var + (consigna3 x (n-1))
	where
	var = fromIntegral(x^n) / fromIntegral((factorial n))

seno :: Float -> Integer -> Float
seno x n 
	| n == 0 = 1
	| otherwise = var1 * var2 + (seno x (n - 1))
	where
	var1 = fromIntegral((-1)^n) / fromIntegral(factorial var3)
	var2 = x^var3
	var3 = 2*n + 1

consigna4 :: Float -> Float
consigna4 x = if x >= 0 && x <= 6.284 then seno x 10 else fromIntegral((-2)) 

consigna5 :: [Float] -> [Float]
consigna5 [] = []
consigna5 (x:xs) = consgina4 x : consigna5 xs
	

consigna6 :: Integer -> Integer -> (Integer,Integer)
consigna6 x n = if n == 0 then (0,0) else (x , (consigna1 x n))    