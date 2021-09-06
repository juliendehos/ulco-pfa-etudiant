module CodegenSpec (main, spec) where

import Test.Hspec

import Codegen
import Syntax

main :: IO ()
main = hspec spec

spec :: Spec
spec = do

    -- TODO
    return ()

{-

    describe "toMd Inline" $ do
        it "1" $ toMd (Str "foo bar") `shouldBe` "foo bar"
        it "2" $ toMd (Strong [Str "foo", Str "bar"]) `shouldBe` "**foobar**"
        it "3" $ toMd (Emph [Str "foo", Str "bar"]) `shouldBe` "*foobar*"
        it "4" $ toMd (Link "www.haskell.org" [Str "haskell"]) `shouldBe` 
            "[haskell](www.haskell.org)"
        it "5" $ toMd (Image "foobar.png" "Foobar") `shouldBe` 
            "![Foobar](foobar.png)"

    describe "toMd Block" $ do
        it "1" $ toMd (Para [Str "foo bar"]) `shouldBe` "foo bar\n\n"
        it "2" $ toMd (Header 3 [Str "foo bar"]) `shouldBe` "### foo bar\n\n"
        it "3" $ toMd (Div [Para [Str "foo"]]) `shouldBe` "foo\n\n"
        it "4" $ toMd (Div [Header 1 [Str "bar"], Para [Str "foo"]]) `shouldBe`
            "# bar\n\nfoo\n\n"

    describe "toHtml Inline" $ do
        it "1" $ toHtml (Str "foo bar") `shouldBe` "foo bar"
        it "2" $ toHtml (Strong [Str "foo", Str "bar"]) `shouldBe` "<b>foobar</b>"
        it "3" $ toHtml (Emph [Str "foo", Str "bar"]) `shouldBe` "<i>foobar</i>"
        it "4" $ toHtml (Link "www.haskell.org" [Str "haskell"]) `shouldBe` 
            "<a href=\"www.haskell.org\">haskell</a>"
        it "5" $ toHtml (Image "foobar.png" "Foobar") `shouldBe` 
            "<img src=\"foobar.png\">Foobar</img>"

    describe "toHtml Block" $ do
        it "1" $ toHtml (Para [Str "foo bar"]) `shouldBe` "<p>\nfoo bar\n</p>\n"
        it "2" $ toHtml (Header 3 [Str "foo bar"]) `shouldBe` "<h3>foo bar</h3>\n"
        it "3" $ toHtml (Div [Para [Str "foo"]]) `shouldBe`
            "<div>\n<p>\nfoo\n</p>\n</div>\n"
        it "4" $ toHtml (Div [Header 1 [Str "bar"], Para [Str "foo"]]) `shouldBe`
            "<div>\n<h1>bar</h1>\n<p>\nfoo\n</p>\n</div>\n"

-}

