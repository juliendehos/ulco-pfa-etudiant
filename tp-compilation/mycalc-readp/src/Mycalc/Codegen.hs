module Mycalc.Codegen where

import Mycalc.Syntax

eval :: Expr -> Double
eval (EVal x) = x
eval (EAdd e1 e2) = eval e1 + eval e2
eval (ESub e1 e2) = eval e1 - eval e2

toLisp :: Expr -> String
toLisp (EVal x) = show x
toLisp (EAdd e1 e2) = "(+ " ++ toLisp e1 ++ " " ++ toLisp e2 ++ ")"
toLisp (ESub e1 e2) = "(- " ++ toLisp e1 ++ " " ++ toLisp e2 ++ ")"

