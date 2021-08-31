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

    -- Value

    describe "toJson ValueNull" $ 
        it "1" $ toJson ValueNull `shouldBe` "null"

    describe "toJson ValueTrue" $ 
        it "1" $ toJson ValueTrue `shouldBe` "true"

    describe "toJson ValueFalse" $ 
        it "1" $ toJson ValueFalse `shouldBe` "false"

    describe "toJson ValueNumber" $ do 
        it "1" $ toJson (ValueNumber 42) `shouldBe` "42"
        it "2" $ toJson (ValueNumber 0) `shouldBe` "0"

    describe "toJson ValueString" $ do 
        it "1" $ toJson (ValueString "foo") `shouldBe` "foo"
        it "2" $ toJson (ValueString "") `shouldBe` ""

    describe "toJson ValueObject" $ do 
        it "1" $ toJson (ValueObject (Object [Member "foo" ValueNull]))
                     `shouldBe` "{\"foo\":null}"
        it "2" $ toJson (ValueObject (Object [Member "foo" ValueNull, Member "bar" (ValueNumber 42)]))
                    `shouldBe` "{\"foo\":null,\"bar\":42}"

    -- Object

    describe "toJson Object" $ do 
        it "1" $ toJson (Object [Member "foo" ValueNull])
                    `shouldBe` "{\"foo\":null}"
        it "2" $ toJson (Object [Member "foo" ValueNull, Member "bar" (ValueNumber 42)])
                    `shouldBe` "{\"foo\":null,\"bar\":42}"

    -- Member

    describe "toJson Member" $ do 
        it "1" $ toJson (Member "foo" ValueNull) `shouldBe` "\"foo\":null"
        it "2" $ toJson (Member "bar" (ValueNumber 42)) `shouldBe` "\"bar\":42"

-}

