
import qualified Data.Text as T
import qualified Network.WebSockets as WS

import Control.Monad (when)

main :: IO ()
main = WS.runClient "0.0.0.0" 3000 "" handleConn

handleConn :: WS.Connection -> IO ()
handleConn conn = return ()
    -- TODO
