module Main where
import Data.Monoid ((<>))
import Data.Maybe (fromMaybe, listToMaybe, maybe)
import System.Environment (getArgs)

fizzbuzz i = fromMaybe (show i) $ mappend ["fizz" | i `rem` 3 == 0] <>
                                          ["buzz" | i `rem` 5 == 0]
                                          ["buzz" | i `rem` 7 == 0]

main = do
    upTo <- fmap (maybe 100 read . listToMaybe) getArgs
    mapM_ putStrLn [ fizzbuzz i | i <- [1..upTo] ]
