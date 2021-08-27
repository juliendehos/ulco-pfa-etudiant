{-# LANGUAGE OverloadedStrings #-}

module Music where

import Data.Text.Lazy (Text)

-------------------------------------------------------------------------------
-- type
-------------------------------------------------------------------------------

data Music = Music 
    { _title :: Text 
    , _artist :: Text 
    , _year :: Int 
    } deriving (Show)

-------------------------------------------------------------------------------
-- some data
-------------------------------------------------------------------------------

findFromBand :: Text -> [Music]
findFromBand artist = filter (\music -> artist == _artist music) myMusics

myMusics :: [Music]
myMusics = 
    [ Music "Paranoid android" "Radiohead" 1997
    , Music "Just" "Radiohead" 1995
    , Music "Take the power back" "Rage against the machine" 1991
    , Music "How I could just kill a man" "Rage against the machine" 2000
    , Music "La porte bonheur" "Ibrahim Maalouf" 2014
    ]

