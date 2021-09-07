module PaletizerSpec (main, spec) where

import qualified Data.Vector as V
import Linear.Metric
import Linear.V3
import Linear.Vector
import Test.Hspec

import Image
import Paletizer

approxColor :: Double -> Color -> Color -> Bool
approxColor e c1 c2 = norm (c1 ^-^ c2) < e

approxColors :: Double -> [Color] -> [Color] -> Bool
approxColors e cs1 cs2 = all (==True) $ zipWith (approxColor e) cs1 cs2

main :: IO ()
main = hspec spec

spec :: Spec
spec = do

    return ()

    {-
    describe "initCentroids" $ do

        it "1" $ approxColors 0.01 (V.toList $ initCentroids 2) 
            [V3 0.25 0.25 0.25, V3 0.75 0.75 0.75]

        it "2" $ approxColors 0.01 (V.toList $ initCentroids 3) 
            [V3 0.167 0.167 0.167, V3 0.5 0.5 0.5, V3 0.833 0.833 0.833]
    -}


