{-# LANGUAGE OverloadedStrings #-}

import qualified Data.Text.IO as T
import qualified Network.WebSockets as WS

import Control.Concurrent (forkIO)
import Control.Monad (forever)

type World = ()

main :: IO ()
main = WS.runClient "0.0.0.0" 9000 "" $ \conn -> do
    _ <- forkIO $ handleInput conn
    handleConn conn

handleConn :: WS.Connection -> IO ()
handleConn conn = forever $ do
    msgFromSrv <- WS.receiveDataMessage conn
    T.putStrLn $ WS.fromDataMessage msgFromSrv

handleInput :: WS.Connection -> IO ()
handleInput conn = forever $ do
    msg <- T.getLine
    WS.sendTextData conn msg

