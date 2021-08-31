module Parser where

import Control.Applicative ((<|>))
import Data.Char
import Text.ParserCombinators.ReadP

import Syntax

parseExpr :: String -> Either String Expr
parseExpr input = Left "TODO"

