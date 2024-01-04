{-
-- EPITECH PROJECT, 2024
-- cpppool02
-- File description:
-- Source
-}

myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem comp (e:arr) | comp == e = True
                    | otherwise = myElem comp arr
