module SyntaxSpec (main, spec) where

import Test.Hspec

import Syntax

main :: IO ()
main = hspec spec

spec :: Spec
spec = do

    -- Value

    describe "ValueTrue" $ do
        it "1" $ ValueTrue `shouldBe` ValueTrue
        it "2" $ show ValueTrue `shouldBe` "ValueTrue"

    describe "ValueFalse" $ do 
        it "1" $ ValueFalse `shouldBe` ValueFalse
        it "2" $ show ValueFalse `shouldBe` "ValueFalse"

    describe "ValueNull" $ do 
        it "1" $ ValueNull `shouldBe` ValueNull
        it "2" $ show ValueNull `shouldBe` "ValueNull"

    describe "ValueNumber" $ do 
        it "1" $ ValueNumber 42 `shouldBe` ValueNumber 42
        it "2" $ show (ValueNumber 42) `shouldBe` "ValueNumber 42"

    describe "ValueString" $ do 
        it "1" $ ValueString "foobar" `shouldBe` ValueString "foobar"
        it "2" $ show (ValueString "foobar") `shouldBe` "ValueString \"foobar\""

    describe "ValueObject" $ do 
        it "1" $ ValueObject (Object [Member "foo" ValueNull]) `shouldBe`
                     ValueObject (Object [Member "foo" ValueNull])
        it "2" $ ValueObject (Object [Member "foo" ValueNull, Member "bar" (ValueNumber 42)])
                    `shouldBe`
                    ValueObject (Object [Member "foo" ValueNull, Member "bar" (ValueNumber 42)])

    -- Object

    describe "Object" $ do 
        it "1" $ Object [Member "foo" ValueNull] `shouldBe`
                    Object [Member "foo" ValueNull]
        it "2" $ Object [Member "foo" ValueNull, Member "bar" (ValueNumber 42)]
                    `shouldBe`
                    Object [Member "foo" ValueNull, Member "bar" (ValueNumber 42)]

    -- Member

    describe "Member" $ do 
        it "1" $ Member "foo" ValueNull `shouldBe` Member "foo" ValueNull
        it "2" $ show (Member "foo" ValueNull) `shouldBe` "Member \"foo\" ValueNull"


