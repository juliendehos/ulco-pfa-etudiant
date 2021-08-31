module CodegenSpec (main, spec) where

import Test.Hspec

import Codegen
import Syntax

main :: IO ()
main = hspec spec

spec :: Spec
spec = do

    return ()

    {-
    describe "toLisp" $ do
        it "1" $ toLisp (Atom 42) `shouldBe` "42"
        it "2" $ toLisp (List [Atom 13, Atom 37]) `shouldBe` "(13 37)"
        it "3" $ toLisp (List [Atom 1, List [Atom 2, Atom 3]]) `shouldBe` "(1 (2 3))"

    describe "toJson" $ do
        it "1" $ toJson (Atom 42) `shouldBe` "42"
        it "2" $ toJson (List [Atom 13, Atom 37]) `shouldBe` "[13,37]"
        it "3" $ toJson (List [Atom 1, List [Atom 2, Atom 3]]) `shouldBe` "[1,[2,3]]"
    -}

