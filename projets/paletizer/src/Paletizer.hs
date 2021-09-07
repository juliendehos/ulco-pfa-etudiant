{-# LANGUAGE TupleSections #-}

module Paletizer where

import qualified Data.Vector as V
import Linear.Affine
import Linear.V3
import Linear.Vector

import Image

type Centroids = V.Vector Color

type LabeledColor = (Int, Color)

data LabeledImage = LabeledImage
    { _witdh :: Int
    , _height :: Int
    , _labeledPixels :: V.Vector LabeledColor
    }

-- initCentroids :: Int -> Centroids
-- initLabeledImage :: Centroids -> Image -> LabeledImage
-- paletize :: Int -> Image -> (Image, Int)
-- tonemap :: Centroids -> LabeledImage -> Image
-- ...

