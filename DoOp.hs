{-
-- EPITECH PROJECT, 2024
-- cpppool02
-- File description:
-- Source
-}

module Main where

import Data.Char (digitToInt, isDigit)
import Data.Foldable (foldlM)
import System.Environment (getArgs)
import Control.Monad (join)
import System.Exit (exitWith, ExitCode(ExitFailure))

myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem comp (e:arr) | comp == e = True
                    | otherwise = myElem comp arr

safeDiv :: Int -> Int -> Maybe Int
safeDiv _ 0 = Nothing
safeDiv x y = Just $ div x y

safeMod :: Int -> Int -> Maybe Int
safeMod _ 0 = Nothing
safeMod x y = Just $ mod x y

safeNth :: [a] -> Int -> Maybe a
safeNth [] _ = Nothing
safeNth (e:_) 0 = Just e
safeNth (e:arr) n = safeNth arr (n - 1)

safeSucc :: Maybe Int -> Maybe Int
safeSucc = fmap (+ 1)

myLookup :: Eq a => a -> [(a, b)] -> Maybe b
myLookup _ []  = Nothing
myLookup n ((i, e):arr) | n == i = Just e
                        | otherwise = myLookup n arr

maybeDo :: (a -> b -> c) -> Maybe a -> Maybe b -> Maybe c
maybeDo f a b = do
    a <- a
    b <- b
    Just $ f a b

readInt :: [Char] -> Maybe Int
readInt [] = Nothing
readInt ('-':arr) = readInt arr >>= Just . (* (-1))
readInt arr = foldlM
    (\v e -> if isDigit e then Just $ v * 10 + digitToInt e else Nothing) 0 arr

getLineLength :: IO Int
getLineLength = length <$> getLine

printAndGetLength :: String -> IO Int
printAndGetLength s = putStrLn s >> return (length s)

printBox :: Int -> IO ()
printBox 1 = putStrLn "++"
printBox n | n <= 0 = return ()
           | otherwise = putStr $ e ++ concat (replicate (n - 2) m) ++ e
           where e = "+" ++ r '-' ++ "+\n"
                 m = "|" ++ r ' ' ++ "|\n"
                 r = replicate (n * 2 - 2)

concatLines :: Int -> IO String
concatLines n = foldlM (\v _ -> (v ++) <$> getLine) "" [1..n]

getInt :: IO (Maybe Int)
getInt = readInt <$> getLine

main :: IO ()
main = getArgs >>= exit . solve
    where exit Nothing = exitWith (ExitFailure 84)
          exit (Just x) = print x
          solve [x, "+", y] = maybeDo (+) (readInt x) (readInt y)
          solve [x, "-", y] = maybeDo (-) (readInt x) (readInt y)
          solve [x, "*", y] = maybeDo (*) (readInt x) (readInt y)
          solve [x, "/", y] = join $ maybeDo safeDiv (readInt x) (readInt y)
          solve [x, "%", y] = join $ maybeDo safeMod (readInt x) (readInt y)
