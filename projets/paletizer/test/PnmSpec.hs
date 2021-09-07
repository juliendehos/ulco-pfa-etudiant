module PnmSpec (main, spec) where

import Test.Hspec

import Pnm

approx :: Double -> Double -> Double -> Bool
approx e x y = abs (x-y) < e

main :: IO ()
main = hspec spec

spec :: Spec
spec = do

    return ()

    {-
    describe "word2double" $ do
        it "1" $ approx 0.01 (word2double 0) 0
        it "2" $ approx 0.05 (word2double 128) 0.5
        it "3" $ approx 0.01 (word2double 255) 1

    describe "double2word" $ do
        it "1" $ double2word 0 `shouldBe` 0
        it "2" $ double2word 0.5 `shouldBe` 128
        it "3" $ double2word 1 `shouldBe`  255
        it "4" $ double2word (-1) `shouldBe` 0
        it "5" $ double2word 2 `shouldBe` 255
    -}

