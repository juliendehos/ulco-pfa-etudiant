{-# LANGUAGE OverloadedStrings #-}

import qualified Data.Text as T

data Person = Person
    { firstname    :: T.Text
    , lastname     :: T.Text
    , birthyear    :: T.Text
    , speakenglish :: Bool
    } deriving (Show)

main :: IO ()
main = do
    let res0 = Person "John" "Doe" "1970" False
    print res0

