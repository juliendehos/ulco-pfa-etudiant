
module Game where

data Player = Player
    { _x :: Float
    , _y :: Float
    } 

newtype Game = Game { _player :: Player }

data Move = MoveUp | MoveDown | MoveLeft | MoveRight

newGame :: Game
newGame = Game (Player 0 0)

moveStep :: Float
moveStep = 10

-- TODO
playMove :: Move -> Game -> Game
playMove move game = game

