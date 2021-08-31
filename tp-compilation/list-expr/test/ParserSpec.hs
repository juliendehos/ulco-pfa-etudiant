module ParserSpec (main, spec) where

import Test.Hspec

import Parser
import Syntax

main :: IO ()
main = hspec spec

spec :: Spec
spec = do

    return ()

    {-
    describe "intP" $ do
        it "0" $ runParser intP "0" `shouldBe` Right (0, "")
        it "42" $ runParser intP "42" `shouldBe` Right (42, "")
        it "4.2" $ runParser intP "4.2" `shouldBe` Right (4, ".2")

    describe "atomP" $ do
        it "0" $ runParser atomP "0" `shouldBe` Right (Atom 0, "")
        it "42" $ runParser atomP "42" `shouldBe` Right (Atom 42, "")
        it "4.2" $ runParser atomP "4.2" `shouldBe` Right (Atom 4, ".2")

    describe "listP" $ do
        it "0" $ runParser listP "0" `shouldBe` Left "no parse"
        it "(42)" $ runParser listP "(42)" `shouldBe` Right (List [Atom 42], "")
        it "(13 37)" $ runParser listP "(13 37)" `shouldBe` 
            Right (List [Atom 13, Atom 37], "")
        it "(42 (13 37))" $ runParser listP "(42 (13 37))" `shouldBe` 
            Right (List [Atom 42, List [Atom 13, Atom 37]], "")
        it "()" $ runParser listP "()" `shouldBe` Right (List [], "")

    describe "parseExpr" $ do
        it "((13   37)42 )" $ parseExpr "((13   37)42 )" `shouldBe`
            Right (List [List [Atom 13,Atom 37],Atom 42])
        it " (1 2 3 ())" $ parseExpr " (1 2 3 ())" `shouldBe`
            Right (List [Atom 1,Atom 2,Atom 3,List []])

    -}

