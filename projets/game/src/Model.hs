module Model where

import qualified Network.WebSockets as WS

import Game
import Net

data Model = Model
    { _net :: Net WS.Connection
    , _game :: Game
    }

newModel :: Model
newModel = Model newNet newGame

addInModel :: WS.Connection -> Model -> (Model, Int)
addInModel conn (Model net0 game0) =
    let (net1, i) = addConn conn net0
        game1 = addPlayer i game0
    in (Model net1 game1, i)

removeInModel :: Int -> Model -> Model
removeInModel iConn (Model net0 game0) =
    let net1 = removeConn iConn net0
        game1 = removePlayer iConn game0
    in Model net1 game1

updateModel :: String -> Int -> Model -> Model
updateModel msg iConn m = m { _game = g1 }
    where g1 = updatePlayer msg iConn (_game m)

