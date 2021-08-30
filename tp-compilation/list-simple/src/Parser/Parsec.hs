{-# LANGUAGE LambdaCase #-}

module Parser.Parsec where

import Data.Char

import Syntax

-------------------------------------------------------------------------------
-- main types & functions
-------------------------------------------------------------------------------

type Result v = Either String (v, String)

newtype Parser v = Parser { runParser :: String -> Result v }

itemP :: Parser Char 
itemP = Parser $ \case 
    (x:xs) -> Right (x, xs)
    [] -> Left "no input"

parseList :: String -> Either String List
parseList input = case runParser listP input of
    Right (v1, _) -> Right v1
    Left err -> Left err

-------------------------------------------------------------------------------
-- parsing primitives
-------------------------------------------------------------------------------

satisfyP :: (Char -> Bool) -> Parser Char
satisfyP f = Parser $ \s0 -> case runParser itemP s0 of
    Right (v1, s1) -> if f v1 then Right (v1, s1) else Left "no parse"
    Left err -> Left err

charP :: Char -> Parser Char
charP c = Parser $ const $ Left "TODO"

thenP :: Parser a -> Parser b -> Parser b
thenP p1 p2 = Parser $ \s0 -> case runParser p1 s0 of
    Right (_, s1) -> runParser p2 s1
    Left err -> Left err

digitP :: Parser Int
digitP = Parser $ \s0 -> case runParser (satisfyP isDigit) s0 of
    Right (v1, s1) -> Right (digitToInt v1, s1)
    Left err -> Left err

digitListP :: Parser [Int]
digitListP = Parser alt1
    where
        alt1 s0 = case runParser digitP s0 of
             Right (v1, s1) -> case runParser (charP ' ' `thenP` digitListP) s1 of 
                Right (v2, s2) -> Right (v1:v2, s2)
                Left _ -> alt2 s0
             _ -> alt2 s0
        alt2 s0 = case runParser digitP s0 of
            Right (v1, s1) -> Right ([v1], s1)
            Left _ -> alt3 s0
        alt3 s0 = Right ([], s0)

listP :: Parser List
listP = Parser $ const $ Left "TODO"

