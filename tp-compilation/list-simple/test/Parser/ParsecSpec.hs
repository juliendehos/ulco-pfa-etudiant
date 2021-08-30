module Parser.ParsecSpec (main, spec) where

import Test.Hspec

import Parser.Parsec
import Syntax

main :: IO ()
main = hspec spec

spec :: Spec
spec = do

    describe "itemP" $ do
        it "01" $ runParser itemP "01" `shouldBe` Right ('0', "1")
        it "empty" $ runParser itemP "" `shouldBe` Left "no input"

    describe "digitP" $ do
        it "0" $ runParser digitP "0" `shouldBe` Right (0, "")
        it "42" $ runParser digitP "42" `shouldBe` Right (4, "2")
        it "4.2" $ runParser digitP "4.2" `shouldBe` Right (4, ".2")
        it "empty" $ runParser digitP "" `shouldBe` Left "no input"

{-

    describe "charP" $ do
        it "01" $ runParser (charP '0') "01" `shouldBe` Right ('0', "1")
        it "10" $ runParser (charP '0') "10" `shouldBe` Left "no parse"

    describe "thenP" $ do
        it "012" $ runParser (charP '0' `thenP` charP '1') "012" `shouldBe` Right ('1', "2")
        it "102" $ runParser (charP '0' `thenP` charP '1') "102" `shouldBe` Left "no parse"

    describe "digitListP" $ do
        it "0" $ runParser digitListP "0" `shouldBe` Right ([0], "")
        it "4 2" $ runParser digitListP "4 2" `shouldBe` Right ([4,2], "")
        it "4.2" $ runParser digitListP "4.2" `shouldBe` Right ([4], ".2")
        it "empty" $ runParser digitListP "" `shouldBe` Right ([], "")

    describe "listP" $ do
        it "0" $ runParser listP "0" `shouldBe` Left "no parse"
        it "(2)" $ runParser listP "(2)" `shouldBe` Right (List [2], "")
        it "(3 7)" $ runParser listP "(3 7)" `shouldBe` Right (List [3, 7], "")
        it "()" $ runParser listP "()" `shouldBe` Right (List [], "")
        it "empty" $ runParser listP "" `shouldBe` Left "no input"

-}

