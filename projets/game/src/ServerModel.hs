module ServerModel where

import qualified Network.WebSockets as WS

import Game
import Net

data ServerModel = ServerModel
    { _net :: Net WS.Connection
    , _game :: Game
    }

newModel :: ServerModel
newModel = ServerModel newNet newGame

addInModel :: WS.Connection -> ServerModel -> (ServerModel, Int)
addInModel conn (ServerModel net0 game0) =
    let (net1, i) = addConn conn net0
        game1 = addPlayer i game0
    in (ServerModel net1 game1, i)

removeInModel :: Int -> ServerModel -> ServerModel
removeInModel iConn (ServerModel net0 game0) =
    let net1 = removeConn iConn net0
        game1 = removePlayer iConn game0
    in ServerModel net1 game1

updateModel :: String -> Int -> ServerModel -> ServerModel
updateModel msg iConn m = m { _game = g1 }
    where g1 = updatePlayer msg iConn (_game m)

