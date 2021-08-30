module Parser.Recursive2 where

import Data.Char

import Syntax

-------------------------------------------------------------------------------
-- main types & functions
-------------------------------------------------------------------------------

type Result v = Either String (v, String)

type ParseFunc v = String -> Result v

itemF :: ParseFunc Char
itemF "" = Left "no input"
itemF (x:xs) = Right (x, xs)

parseList :: String -> Either String List
parseList input = case listF input of
    Right (v1, _) -> Right v1
    Left err -> Left err

-------------------------------------------------------------------------------
-- parsing primitives
-------------------------------------------------------------------------------

satisfyF :: (Char -> Bool) -> ParseFunc Char
satisfyF f s0 = case itemF s0 of 
    Right (v1, s1) -> if f v1 then Right (v1, s1) else Left "no parse"
    Left err -> Left err

charF :: Char -> ParseFunc Char
charF _c = const $ Left "TODO"

thenF :: ParseFunc a -> ParseFunc b -> ParseFunc b
thenF p1 p2 s0 = case p1 s0 of
    Right (_, s1) -> p2 s1
    Left err -> Left err

digitF :: ParseFunc Int
digitF s0 = case satisfyF isDigit s0 of
    Right (v1, s1) -> Right (digitToInt v1, s1)
    Left err -> Left err

digitListF :: ParseFunc [Int]
digitListF = alt1
    where
        alt1 s0 = case digitF s0 of
             Right (v1, s1) -> case (charF ' ' `thenF` digitListF) s1 of 
                Right (v2, s2) -> Right (v1:v2, s2)
                Left _ -> alt2 s0
             _ -> alt2 s0
        alt2 s0 = case digitF s0 of
            Right (v1, s1) -> Right ([v1], s1)
            Left _ -> alt3 s0
        alt3 s0 = Right ([], s0)

listF :: ParseFunc List
listF _s0 = Left "TODO"

