module Syntax where

data Block
    = Para [Inline]
    | Div [Block]
    | Header Int [Inline]
    deriving (Eq, Show)

data Inline
    = Str String
    | Strong [Inline]
    | Emph [Inline]
    | Image String String
    | Link String [Inline] 
    deriving (Eq, Show)

