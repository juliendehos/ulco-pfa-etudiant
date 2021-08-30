module Mycalc.Syntax where

data Expr
    = EVal Double
    | EAdd Expr Expr
    | ESub Expr Expr
    deriving (Eq, Show)

