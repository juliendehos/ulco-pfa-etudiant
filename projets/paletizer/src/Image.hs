module Image where

import Data.Vector
import Linear.V3

type Color = V3 Double

data Image = Image
    { _witdh :: Int
    , _height :: Int
    , _pixels :: Vector Color
    }

