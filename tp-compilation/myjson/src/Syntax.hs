module Syntax where

data Value
    = ValueObject Object
    | ValueString String
    | ValueNumber Int
    | ValueTrue
    | ValueFalse
    | ValueNull
    deriving (Eq, Show)

newtype Object
    = Object [Member]
    deriving (Eq, Show)

data Member
    = Member String Value
    deriving (Eq, Show)

