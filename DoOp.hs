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

safeDiv :: Int -> Int -> Maybe Int
safeDiv _ 0 = Nothing
safeDiv x y = Just $ div x y

safeNth :: [a] -> Int -> Maybe a
safeNth [] _ = Nothing
safeNth (e:_) 0 = Just e
safeNth (e:arr) n = safeNth arr (n - 1)
