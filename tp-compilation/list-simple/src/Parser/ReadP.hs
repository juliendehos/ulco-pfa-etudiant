
module Parser.ReadP where

import Control.Applicative ((<|>))
import Data.Char
import Text.ParserCombinators.ReadP

import Syntax

-------------------------------------------------------------------------------
-- main types & functions
-------------------------------------------------------------------------------

parseList :: String -> Either String List
parseList input = case runParser listP input of
    Right (v1, _) -> Right v1
    Left err -> Left err

runParser :: ReadP a -> String -> Either String (a, String)
runParser parser input = case readP_to_S parser input of
    [] -> Left "no parse"
    xs -> Right $ last xs

-------------------------------------------------------------------------------
-- parsing primitives
-------------------------------------------------------------------------------

digitP :: ReadP Int
digitP = do
    x <- satisfy isDigit
    return $ digitToInt x

digitListP :: ReadP [Int]
digitListP = alt1 <|> alt2 <|> alt3
    where
        alt1 = do
            x <- digitP
            _ <- char ' '
            xs <- digitListP
            return (x:xs)
        alt2 = do
            x <- digitP
            return [x]
        alt3 = return []

listP :: ReadP List
listP = pfail   -- TODO

