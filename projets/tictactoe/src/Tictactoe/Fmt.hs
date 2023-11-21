
-- | Formatage texte.
module Tictactoe.Fmt 
    ( fmtGame
    , fmtPlayer
    ) where

import Data.Vector qualified as V
import Tictactoe.Game

-- | Formate un joueur.
fmtPlayer :: Player -> String
fmtPlayer PlayerX = "X"
fmtPlayer PlayerO = "O"

-- | Formate un jeu.
fmtGame :: Game -> String
fmtGame g = header <> board <> status
    where
        header = "\n " <> concatMap (\j -> " " <> show j) [0..2::Int]
        board = V.ifoldl' f "" (_board g)
        f acc k x = 
            let (i,j) = k2ij k
                prefix = if j==0 then "\n" <> show i else "" 
            in acc <> prefix <> " " <> fmtCell x
        status = "\n" <> fmtStatus (_status g)

-------------------------------------------------------------------------------
-- internal
-------------------------------------------------------------------------------

fmtCell :: Cell -> String
fmtCell CellE = "."
fmtCell CellO = "O"
fmtCell CellX = "X"

fmtStatus :: Status -> String
fmtStatus StatusPlayX = "X is playing"
fmtStatus StatusPlayO = "O is playing"
fmtStatus StatusWinX = "X won"
fmtStatus StatusWinO = "O won"
fmtStatus StatusTie = "It's a tie"

