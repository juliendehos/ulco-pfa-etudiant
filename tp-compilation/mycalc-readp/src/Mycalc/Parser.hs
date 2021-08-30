module Mycalc.Parser where

import Control.Applicative ((<|>))
import Control.Monad (when)
import Data.Char
import Text.ParserCombinators.ReadP

import Mycalc.Syntax

parseExpr :: String -> Either String Expr
parseExpr input = do
    let res1 = readP_to_S additiveP input
    when (null res1) $ Left "no parse"
    case last res1 of
        (res2, "") -> Right res2
        (_, str) -> Left $ "cannot parse \"" <> str <> "\""

numberP :: ReadP Expr
numberP = do
    let digitsP = many1 (satisfy isDigit)
    s <- char '-' <|> return ' '
    x <- digitsP
    y <- (char '.' *> digitsP) <|> return "0"
    return $ EVal $ read $ [s] ++ x ++ "." ++ y

infixP :: Char -> (a -> a -> a) -> ReadP (a -> a -> a)
infixP x op = op <$ char x

additiveP :: ReadP Expr
additiveP = chainl1 parensP (infixP '+' EAdd <|> infixP '-' ESub)

-- TODO multitiveP :: ReadP Expr

-- TODO powerP :: ReadP Expr

parensP :: ReadP Expr
parensP 
    =   (skipSpaces *> char '(' *> skipSpaces *> additiveP <* skipSpaces <* char ')' <* skipSpaces)
    <|> skipSpaces *> numberP <* skipSpaces

