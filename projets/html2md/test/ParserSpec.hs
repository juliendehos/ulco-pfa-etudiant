module ParserSpec (main, spec) where

import Test.Hspec

import Parser
import Syntax

main :: IO ()
main = hspec spec

spec :: Spec
spec = do

    -- TODO
    return ()

{-

    describe "startTagP" $ do
        it "1" $ runParser (startTagP "img" (Just "src")) 
            "<img src=\"foobar.png\">" `shouldBe` 
            Right ("foobar.png", "")
        it "2" $ runParser (startTagP "a" (Just "href")) 
            "<a href=\"www.haskell.org\">" `shouldBe` 
            Right ("www.haskell.org", "")
        it "3" $ runParser (startTagP "strong" Nothing) "<strong>"
            `shouldBe` Right ("", "")

    describe "endTagP" $ do
        it "1" $ runParser (endTagP "img") "</img>" `shouldBe` Right ((), "")

    describe "inlineP" $ do
        it "1" $ runParser inlineP "<b></b>" `shouldBe` Right (Strong [], "")
        it "2" $ runParser inlineP "<i></i>" `shouldBe` Right (Emph [], "")
        it "3" $ runParser inlineP "<b><i></i></b>" `shouldBe` 
            Right (Strong [Emph []], "")
        it "4" $ runParser inlineP "<i>foo <b>bar</b></i>" `shouldBe` 
            Right (Emph [Str "foo ", Strong [Str "bar"]], "")
        it "5" $ runParser inlineP "<img src=\"foo.png\">bar</img>" `shouldBe` 
            Right (Image "foo.png" "bar", "")
        it "6" $ runParser inlineP 
            "<a href=\"www.haskell.org\">foo<b>bar</b></a>" `shouldBe` 
            Right (Link "www.haskell.org" [Str "foo", Strong [Str "bar"]], "")
        it "7" $ runParser inlineP " " `shouldBe` Right (Str " ", "")

    describe "headerP" $ do
        it "1" $ runParser headerP "<h1> </h1>" `shouldBe` Right (Header 1 [Str " "], "")
        it "2" $ runParser headerP "<h2>foo</h2>" `shouldBe` Right (Header 2 [Str "foo"], "")
        it "3" $ runParser headerP "<h2>foo <b>bar</b></h2>" `shouldBe` Right (Header 2 [Str "foo ", Strong [Str "bar"]], "")

    describe "blockP" $ do
        it "1" $ runParser blockP "<div><h1> </h1></div>" `shouldBe` Right (Div [Header 1 [Str " "]], "")
        it "2" $ runParser blockP "<div><h1>foo</h1><h2>bar</h2></div>" `shouldBe` 
            Right (Div [Header 1 [Str "foo"], Header 2 [Str "bar"]], "")
        it "3" $ runParser blockP "<div><h1>foo</h1><div><p>blou</p></div><h2>bar</h2></div>" `shouldBe` 
            Right (Div [Header 1 [Str "foo"], Div [Para [Str "blou"]], Header 2 [Str "bar"]], "")

-}

