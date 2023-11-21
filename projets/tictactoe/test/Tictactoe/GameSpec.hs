
module Tictactoe.GameSpec (main, spec) where

import Test.Hspec
import Tictactoe.Game

main :: IO ()
main = hspec spec

playMoves :: Game -> [(Int, Int)] -> Game
playMoves = foldl $ \acc (i, j)-> play i j acc

gameXbeganXwon, gameObeganXwon, gameXwonLastMove, gameXbeganTie :: Game
gameXbeganXwon = playMoves newGameX [(0,0), (0,1), (1,1), (0,2), (2,2)]
gameObeganXwon = playMoves newGameO [(2,0), (0,0), (0,1), (1,1), (0,2), (2,2)]
gameXwonLastMove = playMoves newGameX [(1,1), (0,0), (2,2), (2,0), (1,0), (0,1), (0,2), (2,1), (1,2)]
gameXbeganTie = playMoves newGameX [(0,0), (1,1), (2,2), (0,2), (2,0), (1,0), (0,1), (2,1), (1,2)]

gameX01, gameO01 :: Game
gameX01 = play 0 1 newGameX
gameO01 = play 0 1 newGameO

spec :: Spec
spec = do

    describe "reset" $ do
        it "reset newGameX" $ reset newGameX `shouldBe` newGameO
        it "reset newGameO" $ reset newGameO `shouldBe` newGameX
        it "reset gameXbeganXwon" $ reset gameXbeganXwon `shouldBe` newGameO
        it "reset gameObeganXwon" $ reset gameObeganXwon `shouldBe` newGameX
        it "reset gameXwonLastMove" $ reset gameXwonLastMove `shouldBe` newGameO
        it "reset gameXbeganTie" $ reset gameXbeganTie `shouldBe` newGameO

    describe "isRunning" $ do
        it "isRunning newGameX" $ isRunning newGameX `shouldBe` True
        it "isRunning newGameO" $ isRunning newGameO `shouldBe` True
        it "isRunning gameXbeganXwon" $ isRunning gameXbeganXwon `shouldBe` False
        it "isRunning gameObeganXwon" $ isRunning gameObeganXwon `shouldBe` False
        it "isRunning gameXwonLastMove" $ isRunning gameXwonLastMove `shouldBe` False
        it "isRunning gameXbeganTie" $ isRunning gameXbeganTie `shouldBe` False

    describe "play, status" $ do
        it "play 0 1 newGameX" $ _status gameX01 `shouldBe` StatusPlayO
        it "play 0 1 newGameO" $ _status gameO01 `shouldBe` StatusPlayX
        it "x begins, x wins" $ _status gameXbeganXwon `shouldBe` StatusWinX
        it "o begins, x win" $ _status gameObeganXwon `shouldBe` StatusWinX
        it "x wins (last move)" $ _status gameXwonLastMove `shouldBe` StatusWinX
        it "tie" $ _status gameXbeganTie `shouldBe` StatusTie

    describe "play, nbMoves" $ do
        it "play 0 1 newGameX" $ _nbMoves gameX01 `shouldBe` 1
        it "play 0 1 newGameO" $ _nbMoves gameO01 `shouldBe` 1
        it "x begins, x wins" $ _nbMoves gameXbeganXwon `shouldBe` 5
        it "o begins, x win" $ _nbMoves gameObeganXwon `shouldBe` 6
        it "x wins (last move)" $ _nbMoves gameXwonLastMove `shouldBe` 9
        it "tie" $ _nbMoves gameXbeganTie `shouldBe` 9
        it "play 0 1 gameX01" $ _nbMoves (play 0 1 gameX01) `shouldBe` 1
        it "play 0 1 gameO01" $ _nbMoves (play 0 1 gameO01) `shouldBe` 1

