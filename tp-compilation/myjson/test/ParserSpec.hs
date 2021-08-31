module ParserSpec (main, spec) where

import Data.Either
import Test.Hspec

import Parser
import Syntax

main :: IO ()
main = hspec spec

spec :: Spec
spec = do

    return ()

{-

    -- stringP :: Parser String

    describe "stringP" $ do
        it "1" $ runParser stringP "\"foo42bar\"" `shouldBe` Right ("foo42bar", "")
        it "2" $ runParser stringP "\"foo\"bar" `shouldBe` Right ("foo", "bar")
        it "3" $ isLeft $ runParser stringP "\"foo<42bar"

    -- numberP :: Parser Int

    describe "numberP" $ do
        it "1" $ runParser numberP "42" `shouldBe` Right (42, "")
        it "2" $ runParser numberP "-42" `shouldBe` Right (-42, "")

    -- memberP

    describe "memberP" $ do
        it "1" $ runParser memberP "\"foo\":42" `shouldBe`
                    Right (Member "foo" (ValueNumber 42), "")
        it "2" $ runParser memberP "\"foo\":\"bar\"" `shouldBe`
                    Right (Member "foo" (ValueString "bar"), "")
    -- membersP

    describe "membersP" $ do
        it "1" $ runParser membersP "\"foo\":42" `shouldBe`
                    Right ([Member "foo" (ValueNumber 42)], "")
        it "2" $ runParser membersP "" `shouldBe`
                    Right ([], "")
        it "3" $ runParser membersP "\"foo\":42,\"bar\":true" `shouldBe`
                    Right ([Member "foo" (ValueNumber 42), Member "bar" ValueTrue], "")

    -- objectP

    describe "objectP" $ do
        it "1" $ runParser objectP "{\"foo\":42}" `shouldBe`
                    Right (Object [Member "foo" (ValueNumber 42)], "")
        it "2" $ runParser objectP "{}" `shouldBe`
                    Right (Object [], "")
        it "3" $ runParser objectP "{\"foo\":42,\"bar\":true}" `shouldBe`
                    Right (Object [Member "foo" (ValueNumber 42), Member "bar" ValueTrue], "")

    -- Value

    describe "valueP" $ do
        it "1" $ runParser valueP "\"foo\"" `shouldBe`
                    Right (ValueString "foo", "")

    describe "parseJson ValueNull" $ 
        it "1" $ parseJson "null" `shouldBe` Right ValueNull

    describe "parseJson ValueTrue" $ 
        it "1" $ parseJson "true" `shouldBe` Right ValueTrue

    describe "parseJson ValueFalse" $ 
        it "1" $ parseJson "false" `shouldBe` Right ValueFalse

    describe "parseJson ValueNumber" $ 
        it "1" $ parseJson "42" `shouldBe` Right (ValueNumber 42)

    describe "parseJson ValueString" $ do
        it "1" $ parseJson "\"foo\"" `shouldBe` Right (ValueString "foo")

    describe "parseJson ValueObject" $ do
        it "1" $ parseJson "{\"foo\":42}" `shouldBe`
                    Right (ValueObject $ Object [Member "foo" (ValueNumber 42)])
        it "2" $ parseJson "{}" `shouldBe`
                    Right (ValueObject $ Object [])
        it "3" $ parseJson "{\"foo\":-42,\"bar\":true}" `shouldBe`
                    Right (ValueObject $ Object [Member "foo" (ValueNumber (-42)), Member "bar" ValueTrue])

-}

