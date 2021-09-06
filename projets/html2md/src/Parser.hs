module Parser where

import Control.Applicative ((<|>))
import Data.Char
import Text.ParserCombinators.ReadP

import Syntax

runParser :: ReadP a -> String -> Either String (a, String)
runParser parser input = case readP_to_S parser input of
    [] -> Left "no parse"
    xs -> Right $ last xs

parseBlocks :: String -> Either String [Block]
parseBlocks input = case runParser blocksP input of
    Right (v1, _) -> Right v1
    Left err -> Left err

blocksP :: ReadP [Block]
blocksP = return []

-- TODO headerP :: ReadP Block

-- TODO endTagP :: String -> ReadP ()

-- TODO startTagP :: String -> Maybe String -> ReadP String

-- TODO inlinesP :: ReadP [Inline]

-- TODO inlineP :: ReadP Inline

