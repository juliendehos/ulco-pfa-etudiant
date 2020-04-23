{-# LANGUAGE OverloadedStrings #-}

import qualified Data.Text as T

data Person = Person
    { firstname    :: T.Text
    , lastname     :: T.Text
    , birthyear    :: Int
    } deriving (Show)

persons :: [Person]
persons =
    [ Person "John" "Doe" 1970
    , Person "Haskell" "Curry" 1900
    ]

