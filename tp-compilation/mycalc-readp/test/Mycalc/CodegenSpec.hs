module Mycalc.CodegenSpec (main, spec) where

import Test.Hspec

import Mycalc.Codegen
import Mycalc.Syntax

main :: IO ()
main = hspec spec

spec :: Spec
spec = do

    describe "eval EVal" $ do
        it "1" $ eval (EVal 0) `shouldBe` 0
        it "2" $ eval (EVal 42) `shouldBe` 42

    describe "eval EAdd" $ do
        it "1" $ eval (EAdd (EVal 0) (EVal 0)) `shouldBe` 0
        it "2" $ eval (EAdd (EVal 42) (EVal 0)) `shouldBe` 42
        it "3" $ eval (EAdd (EVal 0) (EVal 42)) `shouldBe` 42
        it "4" $ eval (EAdd (EVal 20) (EVal 22)) `shouldBe` 42
        it "5" $ eval (EAdd (EAdd (EVal 9) (EVal 11)) (EVal 22)) `shouldBe` 42

    describe "toLisp EAdd" $ do
        it "1" $ toLisp (EAdd (EVal 0) (EVal 0)) `shouldBe` "(+ 0.0 0.0)"
        it "2" $ toLisp (EAdd (EVal 42) (EVal 0)) `shouldBe` "(+ 42.0 0.0)"
        it "3" $ toLisp (EAdd (EVal 0) (EVal 42)) `shouldBe` "(+ 0.0 42.0)"
        it "4" $ toLisp (EAdd (EVal 20) (EVal 22)) `shouldBe` "(+ 20.0 22.0)"
        it "5" $ toLisp (EAdd (EAdd (EVal 9) (EVal 11)) (EVal 22)) `shouldBe` "(+ (+ 9.0 11.0) 22.0)"

