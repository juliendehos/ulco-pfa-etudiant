
module Codegen where

import Data.List

import Syntax

toHaskell :: List -> String
toHaskell (List xs) = "[" ++ intercalate "," (map show xs)  ++ "]"

toLisp :: List -> String
toLisp (List xs) = "(" ++ unwords (map show xs)  ++ ")"

