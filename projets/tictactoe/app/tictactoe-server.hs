{-# LANGUAGE OverloadedStrings #-}

import Control.Concurrent.STM
import Control.Exception (finally)
-- import Control.Monad (forever)
import Data.Map.Strict as M
import Network.WebSockets qualified as WS
import Tictactoe.Fmt
import Tictactoe.Game
import Tictactoe.Protocol

data Model = Model
    { _game :: Game
    , _clients :: Map Player WS.Connection
    }

main :: IO ()
main = do
    let port = 9000
    modelVar <- newTVarIO (Model newGameO empty)
    putStrLn $ "listening on port " ++ show port ++ "..."
    WS.runServer "0.0.0.0" port (serverApp modelVar)

-- TODO serverApp
serverApp :: TVar Model -> WS.PendingConnection -> IO ()
serverApp var pc = do
    conn <- WS.acceptRequest pc
    atomically $ tryRegisterConnection conn var
    let player = PlayerX
    WS.withPingThread conn 30 (return ()) 
        (finally (handleConn conn var player) (handleQuit var player))

-- TODO handleConn
handleConn :: WS.Connection -> TVar Model -> Player -> IO ()
handleConn conn var player = do
    Model game _clients <- atomically $ readTVar var
    WS.sendTextData conn (encode $ Accept player)
    WS.sendTextData conn (encode NewGame)
    WS.sendTextData conn (encode $ AskMove game)
    WS.sendTextData conn (encode $ Result game)
    WS.sendTextData conn (encode $ SendMove 0 1)    -- pour tester (SendMove doit être envoyé par le client)

-- TODO handleQuit
handleQuit :: TVar Model -> Player -> IO ()
handleQuit var player = do
    atomically $ do
        Model game clients <- readTVar var
        let game' = reset game
            clients' = M.delete player clients
        writeTVar var (Model game' clients')
    putStrLn $ fmtPlayer player ++ " has left" 

-- TODO tryRegisterConnection
tryRegisterConnection :: WS.Connection -> TVar Model -> STM ()
tryRegisterConnection conn var = do
    Model game clients <- readTVar var
    let clients' = insert PlayerX conn clients
    writeTVar var (Model game clients') 

-- TODO ...


