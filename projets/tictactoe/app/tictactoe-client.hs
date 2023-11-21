
import Control.Monad (forever)
import Data.ByteString.Lazy qualified as L
import Network.WebSockets qualified as WS
-- import System.IO
-- import Text.Read
-- import Tictactoe.Fmt
import Tictactoe.Protocol

main :: IO ()
main = do
    let port = 9000
    WS.runClient "0.0.0.0" port "" handleConn

-- TODO handleConn
handleConn :: WS.Connection -> IO ()
handleConn conn = forever $ do
    dataMessage <- WS.fromDataMessage <$> WS.receiveDataMessage conn
    case (decode dataMessage :: Maybe ServerMsg) of
        Just srvMsg -> printMsg dataMessage srvMsg
        Nothing -> case (decode dataMessage :: Maybe ClientMsg) of
            Just cltMsg -> printMsg dataMessage cltMsg
            Nothing -> putStrLn "unknown message"

printMsg :: Show a => L.ByteString -> a -> IO ()
printMsg dm msg = do
    putStr "\njson: "
    L.putStr dm
    putStr "\nhaskell: "
    print msg
    
