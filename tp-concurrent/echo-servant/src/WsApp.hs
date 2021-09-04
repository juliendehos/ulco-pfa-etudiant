
module WsApp (wsApp) where

import qualified Data.Text as T
import qualified Network.WebSockets as WS

import Control.Concurrent
import Control.Monad (forever)
import Network.Wai (Application)
import Network.Wai.Handler.WebSockets (websocketsOr)

import Model

wsApp :: MVar Model -> Application -> Application
wsApp var = websocketsOr WS.defaultConnectionOptions (serverApp var)

serverApp :: MVar Model -> WS.PendingConnection -> IO ()
serverApp var pc = do
    conn <- WS.acceptRequest pc
    WS.withPingThread conn 30 (return ()) (handleConn var conn)

handleConn :: MVar Model -> WS.Connection -> IO ()
handleConn var conn = return ()
    -- TODO
