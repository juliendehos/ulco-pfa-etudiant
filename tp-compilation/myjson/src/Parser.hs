module Parser where

import Data.Char
import Text.ParserCombinators.ReadP

import Syntax

parseJson :: String -> Either String Value
parseJson input = case runParser valueP input of
    Right (v1, _) -> Right v1
    Left err -> Left err

runParser :: ReadP a -> String -> Either String (a, String)
runParser parser input = case readP_to_S parser input of
    [] -> Left "no parse"
    xs -> Right $ last xs

stringP :: ReadP String
stringP = pfail         -- TODO

numberP :: ReadP Int
numberP = pfail         -- TODO

valueP :: ReadP Value
valueP = pfail         -- TODO

memberP :: ReadP Member
memberP = pfail         -- TODO

membersP :: ReadP [Member]
membersP = pfail         -- TODO

objectP :: ReadP Object
objectP = pfail         -- TODO

