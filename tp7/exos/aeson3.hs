{-# LANGUAGE OverloadedStrings #-}

import qualified Data.Text as T

data Person = Person
    { first    :: T.Text
    , last     :: T.Text
    , birth    :: Int
    } deriving (Show)

main :: IO ()
main = do
    let res0 = Person "John" "Doe" 1970
    print res0

