module GameSpec (main, spec) where

import qualified Data.Vector as V
import Test.Hspec

import Game

main :: IO ()
main = hspec spec

spec :: Spec
spec = do

    describe "ij2k" $ do
        it "1" $ ij2k (0,0) `shouldBe` 0
        it "2" $ ij2k (1,0) `shouldBe` 8
        it "3" $ ij2k (0,1) `shouldBe` 1
        it "3" $ ij2k (2,4) `shouldBe` 20

    describe "k2ij" $ do
        it "1" $ k2ij 0 `shouldBe` (0,0)
        it "2" $ k2ij 8 `shouldBe` (1,0)
        it "3" $ k2ij 1 `shouldBe` (0,1)
        it "3" $ k2ij 20 `shouldBe` (2,4) 

{-
    describe "newGame" $ do
        let g0 = newGame PlayerR
        it "1" $ _currentPlayer g0`shouldBe` PlayerR
        it "2" $ _firstPlayer g0`shouldBe` PlayerR
        it "3" $ _status g0`shouldBe` PlayR
        it "4" $ V.length (_moves g0)`shouldBe` 22
        it "5" $ V.toList (_board g0)`shouldBe` 
            [CellR, CellR, CellR, CellR, CellR, CellR, CellR, CellR
            ,CellR, CellR, CellR, CellR, CellR, CellR, CellR, CellR
            ,CellE, CellE, CellE, CellE, CellE, CellE, CellE, CellE
            ,CellE, CellE, CellE, CellE, CellE, CellE, CellE, CellE
            ,CellE, CellE, CellE, CellE, CellE, CellE, CellE, CellE
            ,CellE, CellE, CellE, CellE, CellE, CellE, CellE, CellE
            ,CellB, CellB, CellB, CellB, CellB, CellB, CellB, CellB
            ,CellB, CellB, CellB, CellB, CellB, CellB, CellB, CellB
            ]

    describe "playMove 1" $ do
        let g0 = newGame PlayerR
        let g1 = nextGame g0
        it "1" $ _currentPlayer g1`shouldBe` PlayerB
        it "2" $ _firstPlayer g1`shouldBe` PlayerB
        it "3" $ _status g1`shouldBe` PlayB
        it "4" $ V.length (_moves g1)`shouldBe` 22
        it "5" $ V.toList (_board g1)`shouldBe` 
            [CellR, CellR, CellR, CellR, CellR, CellR, CellR, CellR
            ,CellR, CellR, CellR, CellR, CellR, CellR, CellR, CellR
            ,CellE, CellE, CellE, CellE, CellE, CellE, CellE, CellE
            ,CellE, CellE, CellE, CellE, CellE, CellE, CellE, CellE
            ,CellE, CellE, CellE, CellE, CellE, CellE, CellE, CellE
            ,CellE, CellE, CellE, CellE, CellE, CellE, CellE, CellE
            ,CellB, CellB, CellB, CellB, CellB, CellB, CellB, CellB
            ,CellB, CellB, CellB, CellB, CellB, CellB, CellB, CellB
            ]

    describe "playMove 2" $ do
        let g0 = newGame PlayerR
        let g1 = playMove ((1,1),(2,2)) g0
        it "1" $ _currentPlayer g1`shouldBe` PlayerB
        it "2" $ _firstPlayer g1`shouldBe` PlayerR
        it "3" $ _status g1`shouldBe` PlayB
        it "4" $ V.length (_moves g1)`shouldBe` 22
        it "5" $ V.toList (_board g1)`shouldBe` 
            [CellR, CellR, CellR, CellR, CellR, CellR, CellR, CellR
            ,CellR, CellE, CellR, CellR, CellR, CellR, CellR, CellR
            ,CellE, CellE, CellR, CellE, CellE, CellE, CellE, CellE
            ,CellE, CellE, CellE, CellE, CellE, CellE, CellE, CellE
            ,CellE, CellE, CellE, CellE, CellE, CellE, CellE, CellE
            ,CellE, CellE, CellE, CellE, CellE, CellE, CellE, CellE
            ,CellB, CellB, CellB, CellB, CellB, CellB, CellB, CellB
            ,CellB, CellB, CellB, CellB, CellB, CellB, CellB, CellB
            ]

    describe "playMove 3" $ do
        let g0 = newGame PlayerR
        let moves = [((1,1),(2,2)), ((6,0),(5,0))
                    ,((2,2),(3,3)), ((5,0),(4,0))
                    ,((3,3),(4,4)), ((4,0),(3,1))
                    ,((4,4),(5,5)), ((6,1),(5,0))
                    ,((5,5),(6,4)), ((3,1),(2,0))
                    ,((6,4),(7,5))
                    ]
        let g1 = foldr playMove g0 (reverse moves)
        it "1" $ _currentPlayer g1`shouldBe` PlayerR
        it "2" $ _firstPlayer g1`shouldBe` PlayerR
        it "3" $ _status g1`shouldBe` WinR
        it "4" $ V.length (_moves g1)`shouldBe` 0
        it "5" $ V.toList (_board g1)`shouldBe` 
            [CellR, CellR, CellR, CellR, CellR, CellR, CellR, CellR
            ,CellR, CellE, CellR, CellR, CellR, CellR, CellR, CellR
            ,CellB, CellE, CellE, CellE, CellE, CellE, CellE, CellE
            ,CellE, CellE, CellE, CellE, CellE, CellE, CellE, CellE
            ,CellE, CellE, CellE, CellE, CellE, CellE, CellE, CellE
            ,CellB, CellE, CellE, CellE, CellE, CellE, CellE, CellE
            ,CellE, CellE, CellB, CellB, CellE, CellB, CellB, CellB
            ,CellB, CellB, CellB, CellB, CellB, CellR, CellB, CellB
            ]
-}

