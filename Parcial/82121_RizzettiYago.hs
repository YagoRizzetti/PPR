{-1) Realizar una función que reciba la cantidad de mascotas llevadas de paseo y retorne la descripción de dicho paseo, tal como se especifica en la tabla 1. 
En el caso de que la cantidad de mascotas llevadas no se encuentre especificada en la tabla 1, la función deberá retornar un mensaje “paseo no registrado”.-}

funcion1 :: Int -> String
funcion1 n
          | (n == 1) = "Paseo Exlusivo"
          | (n == 2) = "Paseo de a Dos"
          | (n == 3) = "Pase Triple"
          | (n == 4) = "Paseo de a Dos Pares"
          | (n == 5) = "Paseo Quintuple"
          | otherwise = "Paseo No Registrado" 

{-2) Realizar una función que reciba 3 parámetros: una lista de duraciones de diferentes paseos, 
un valor entero correspondiente al mínimo de un rango de tiempo, y un valor entero correspondiente 
al máximo de un rango de tiempo, y como resultado genere una nueva lista con aquellas duraciones de paseos que no pertenezcan al 
rango determinado por en mínimo y máximo recibos por parámetros, incluyendo ambos extremos.-}

funcion2 :: [Integer] -> Integer -> Integer -> [Integer]
funcion2 [] _ _ = []
funcion2 (x:xs) i s = if x < i || x > s 
                    then x : funcion2 xs i s 
                    else funcion2 xs i s

{-3) Realizar una función que reciba 2 parámetros: una lista de duraciones de diferentes paseos y un valor entero 
correspondiente a un máximo de referencia, y como resultado devuelva la cantidad de duraciones de paseos realizados que 
figuren en la lista que sean menores o iguales al valor máximo de referencia recibido como parámetro. 
Para resolver este punto debe definir una función recursiva.-}

funcion3 :: [Integer] -> Integer -> Integer
funcion3 [] _ = 0
funcion3 (x:xs) n = if x <= n 
                    then 1 + (funcion3 xs n)
                    else funcion3 xs n 


