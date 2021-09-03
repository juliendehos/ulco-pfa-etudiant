
import qualified Data.Text as T
import qualified Network.WebSockets as WS

import Control.Concurrent (threadDelay)
import Control.Exception (finally)
import Control.Monad (forever)
import Data.Time

main :: IO ()
main = do
    t <- utcToZonedTime utc <$> getCurrentTime
    putStrLn $ "TODO " ++ show t
    putStrLn "listening..."
    WS.runServer "0.0.0.0" 9000 serverApp 

serverApp :: WS.PendingConnection -> IO ()
serverApp pc = do
    conn <- WS.acceptRequest pc
    putStrLn "new client"
    finally (handleConn conn) handleQuit

handleConn :: WS.Connection -> IO ()
handleConn conn = WS.sendTextData conn (T.pack "TODO")

handleQuit :: IO ()
handleQuit = putStrLn "client quit"

