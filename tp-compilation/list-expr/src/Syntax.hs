module Syntax where

data Expr
    = Atom Int
    | List [Expr]
    deriving (Eq, Show)

