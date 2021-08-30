module Mycalc.SyntaxSpec (main, spec) where

import Test.Hspec

import Mycalc.Syntax

main :: IO ()
main = hspec spec

spec :: Spec
spec = 
    describe "Expr" $ do
        it "1" $ EVal 0 `shouldBe` EVal 0
        it "2" $ EAdd (EVal 1) (EVal 2) `shouldBe` EAdd (EVal 1) (EVal 2)

