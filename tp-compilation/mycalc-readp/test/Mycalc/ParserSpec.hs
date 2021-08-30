module Mycalc.ParserSpec (main, spec) where

import Test.Hspec
import Text.ParserCombinators.ReadP

import Mycalc.Parser
import Mycalc.Syntax

runParser :: ReadP a -> String -> Either String (a, String)
runParser parser input = do
    case readP_to_S parser input of
        [] -> Left "no parse"
        xs -> Right $ last xs

main :: IO ()
main = hspec spec

spec :: Spec
spec = do

    ---------------------------------------------------------------------------
    -- numberP :: Parser Int
    ---------------------------------------------------------------------------

    describe "numberP" $ do
        it "1" $ runParser numberP "0" `shouldBe` Right (EVal 0, "")
        it "2" $ runParser numberP "42" `shouldBe` Right (EVal 42, "")
        it "3" $ runParser numberP "42foo" `shouldBe` Right (EVal 42, "foo")
        it "4" $ runParser numberP "foo42" `shouldBe` Left "no parse"
        -- TODO negative, floating

    ---------------------------------------------------------------------------
    -- multitiveP :: Parser Expr
    ---------------------------------------------------------------------------

    {-
    describe "multitiveP" $ do
        it "1" $ runParser multitiveP "20*22" `shouldBe` 
            Right (EMul (EVal 20) (EVal 22), "")
        it "2" $ runParser multitiveP "20*22*2" `shouldBe` 
            Right (EMul (EMul (EVal 20.0) (EVal 22.0)) (EVal 2.0),"")
        it "3" $ runParser multitiveP "20*foo" `shouldBe` 
            Right (EVal 20, "*foo")
        it "4" $ runParser multitiveP "foo*20" `shouldBe` 
            Left "no parse"
    -}

    ---------------------------------------------------------------------------
    -- additiveP :: Parser Expr
    ---------------------------------------------------------------------------

    describe "additiveP" $ do
        it "1" $ runParser additiveP "20+22" `shouldBe` 
            Right (EAdd (EVal 20) (EVal 22), "")
        it "2" $ runParser additiveP "20+22+2" `shouldBe`
            Right (EAdd (EAdd (EVal 20.0) (EVal 22.0)) (EVal 2.0),"")
        {-
        it "3" $ runParser additiveP "20*22" `shouldBe`
            Right (EMul (EVal 20) (EVal 22), "")
        it "4" $ runParser additiveP "20*10+12" `shouldBe`
            Right (EAdd (EMul (EVal 20) (EVal 10)) (EVal 12), "")
        it "5" $ runParser additiveP "20+10*12" `shouldBe`
            Right (EAdd (EVal 20) (EMul (EVal 10) (EVal 12)), "")
        -}

    ---------------------------------------------------------------------------
    -- parseExpr :: String -> Either String Expr
    ---------------------------------------------------------------------------

    describe "EVal" $ do
        it "1" $ parseExpr "0" `shouldBe` Right (EVal 0)
        it "2" $ parseExpr "42" `shouldBe` Right (EVal 42)

    describe "EAdd" $ do
        it "1" $ parseExpr "20+22" `shouldBe`
                    Right (EAdd (EVal 20) (EVal 22))
        it "2" $ parseExpr "20+10+12" `shouldBe`
                    Right (EAdd (EAdd (EVal 20.0) (EVal 10.0)) (EVal 12.0))

    {-
    describe "EMul" $ do
        it "1" $ parseExpr "20*22" `shouldBe`
                    Right (EMul (EVal 20) (EVal 22))
        it "2" $ parseExpr "20*10+12" `shouldBe`
                    Right (EAdd (EMul (EVal 20) (EVal 10)) (EVal 12))
        it "3" $ parseExpr "20+10*12" `shouldBe`
                    Right (EAdd (EVal 20) (EMul (EVal 10) (EVal 12)))
    -}

    describe "runParser" $ do

        it "1+2-3+4" $ runParser additiveP "1+2-3+4" `shouldBe`
            Right (EAdd (ESub (EAdd (EVal 1.0) (EVal 2.0)) (EVal 3.0)) (EVal 4.0),"")

        it "1+3" $ runParser additiveP "1+3" `shouldBe`
            Right (EAdd (EVal 1.0) (EVal 3.0),"")

        it "2.3" $ runParser additiveP "2.3" `shouldBe`
            Right (EVal 2.3, "")

        it "-2.3" $ runParser additiveP "-2.3" `shouldBe`
            Right (EVal (-2.3), "")

        it "3--2.3" $ runParser additiveP "3--2.3" `shouldBe`
            Right (ESub (EVal 3.0) (EVal (-2.3)),"")

        it "3 - -2.3" $ runParser additiveP "3 - -2.3" `shouldBe`
            Right (ESub (EVal 3.0) (EVal (-2.3)),"")

        it "3.3" $ runParser additiveP "3.3" `shouldBe`
            Right (EVal 3.3,"")

        it "-3.3" $ runParser additiveP "-3.3" `shouldBe`
            Right (EVal (-3.3),"")

        {-
        it "1 + 2 * 3" $ runParser additiveP "1 + 2 * 3" `shouldBe`
            Right (EAdd (EVal 1.0) (EMul (EVal 2.0) (EVal 3.0)),"")

        it "1+2*3" $ runParser additiveP "1+2*3" `shouldBe`
            Right (EAdd (EVal 1.0) (EMul (EVal 2.0) (EVal 3.0)),"")

        it "3^2" $ runParser additiveP "3^2" `shouldBe`
            Right (EPow (EVal 3.0) (EVal 2.0), "")

        it "2^3*2" $ runParser additiveP "2^3*2" `shouldBe`
            Right (EMul (EPow (EVal 2.0) (EVal 3.0)) (EVal 2.0),"")

        it "2*2^3" $ runParser additiveP "2*2^3" `shouldBe`
            Right (EMul (EVal 2.0) (EPow (EVal 2.0) (EVal 3.0)),"")

        it "2^3^2" $ runParser additiveP "2^3^2" `shouldBe`
            Right (EPow (EVal 2.0) (EPow (EVal 3.0) (EVal 2.0)),"")

        it "1 + (2 + 3) * 4" $ runParser additiveP "1 + (2 + 3) * 4" `shouldBe`
            Right (EAdd (EVal 1.0) (EMul (EAdd (EVal 2.0) (EVal 3.0)) (EVal 4.0)),"")

        it "( 1 + (2 + 3) * 4 )* 2" $ runParser additiveP "( 1 + (2 + 3) * 4 )* 2" `shouldBe`
            Right (EMul (EAdd (EVal 1.0) (EMul (EAdd (EVal 2.0) (EVal 3.0)) (EVal 4.0))) (EVal 2.0),"")

        it "16/4/2" $ runParser additiveP "16/4/2" `shouldBe`
            Right (EDiv (EDiv (EVal 16.0) (EVal 4.0)) (EVal 2.0),"")
        -}

