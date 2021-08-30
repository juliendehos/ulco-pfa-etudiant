module CodegenSpec (main, spec) where

import Test.Hspec

import Codegen
import Syntax

main :: IO ()
main = hspec spec

spec :: Spec
spec = do

    describe "toLisp" $ do
        it "1" $ toLisp (List []) `shouldBe` "()"
        it "2" $ toLisp (List [3, 7]) `shouldBe` "(3 7)"

    describe "toHaskell" $ do
        it "1" $ toHaskell (List []) `shouldBe` "[]"
        it "2" $ toHaskell (List [3, 7]) `shouldBe` "[3,7]"

