module Parser.Recursive2Spec (main, spec) where

import Test.Hspec

import Parser.Recursive2
import Syntax

main :: IO ()
main = hspec spec

spec :: Spec
spec = do

    describe "digitF" $ do
        it "0" $ digitF "0" `shouldBe` Right (0, "")
        it "42" $ digitF "42" `shouldBe` Right (4, "2")
        it "4.2" $ digitF "4.2" `shouldBe` Right (4, ".2")
        it "empty" $ digitF "" `shouldBe` Left "no input"

{-

    describe "thenF" $ do
        it "012" $ (charF '0' `thenF` charF '1') "012" `shouldBe` Right ('1', "2")
        it "102" $ (charF '0' `thenF` charF '1') "102" `shouldBe` Left "no parse"

    describe "charF" $ do
        it "01" $ charF '0' "01" `shouldBe` Right ('0', "1")
        it "10" $ charF '0' "10" `shouldBe` Left "no parse"

    describe "digitListF" $ do
        it "0" $ digitListF "0" `shouldBe` Right ([0], "")
        it "4 2" $ digitListF "4 2" `shouldBe` Right ([4,2], "")
        it "4.2" $ digitListF "4.2" `shouldBe` Right ([4], ".2")
        it "empty" $ digitListF "" `shouldBe` Right ([], "")

    describe "listF" $ do
        it "0" $ listF "0" `shouldBe` Left "no parse"
        it "(2)" $ listF "(2)" `shouldBe` Right (List [2], "")
        it "(3 7)" $ listF "(3 7)" `shouldBe` Right (List [3, 7], "")
        it "()" $ listF "()" `shouldBe` Right (List [], "")
        it "empty" $ listF "" `shouldBe` Left "no input"

-}

