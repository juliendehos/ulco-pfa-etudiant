{-# LANGUAGE StrictData #-}

module Game where

import qualified Data.Vector as V

nI, nJ :: Int
nI = 8
nJ = 8

data Player = PlayerR | PlayerB
    deriving (Eq, Show)

data Status = PlayR | PlayB | WinR | WinB
    deriving (Eq, Show)

data Cell = CellE | CellR | CellB
    deriving (Eq, Show)

type Board = V.Vector Cell

type Ix2 = (Int, Int)

type Move = (Ix2, Ix2)

data Game = Game
    { _firstPlayer :: Player
    , _currentPlayer :: Player
    , _status :: Status
    , _board :: Board
    , _moves :: V.Vector Move
    }

ij2k :: Ix2 -> Int
ij2k (i, j) = i*nJ + j

k2ij :: Int -> Ix2
k2ij k = (div k nJ, mod k nJ)

-- newGame :: Player -> Game
newGame _ = Game PlayerR PlayerR PlayR V.empty V.empty  -- TODO

-- nextGame :: Game -> Game
-- playMove :: Move -> Game -> Game
-- ...


