{-# LANGUAGE OverloadedStrings #-}

import qualified Data.Text as T
import qualified Network.WebSockets as WS

import Control.Concurrent.STM
import Control.Exception (finally)
import Control.Monad (forever)

import ServerModel
import Net

main :: IO ()
main = do
    model <- newTVarIO newModel
    WS.runServer "0.0.0.0" 9000 (serverApp model)

serverApp :: TVar ServerModel -> WS.PendingConnection -> IO ()
serverApp var pc = do
    conn <- WS.acceptRequest pc
    iConn <- atomically $ do
        model <- readTVar var
        let (model', iConn) = addInModel conn model
        writeTVar var model'
        return iConn
    putStrLn "client connected"
    WS.withPingThread conn 30 (return ())
        (finally (handleConn var iConn conn) (handleQuit var iConn))

handleConn :: TVar ServerModel -> Int -> WS.Connection -> IO ()
handleConn var iConn conn = forever $ do
    msg <- T.unpack . WS.fromDataMessage <$> WS.receiveDataMessage conn
    model <- atomically $ modifyAndReturn var (updateModel msg iConn)
    broadcastGame model

broadcastGame :: ServerModel -> IO ()
broadcastGame model = do
    let msg = T.pack $ show $ _game model
    mapInNet (`WS.sendTextData` msg) (_net model)

handleQuit :: TVar ServerModel -> Int -> IO ()
handleQuit var iConn = do
    atomically $ modifyTVar' var (removeInModel iConn)
    putStrLn "client disconnected"

modifyAndReturn :: TVar a -> (a -> a) -> STM a
modifyAndReturn var f = do
    x <- readTVar var
    let y = f x
    writeTVar var y
    return y

